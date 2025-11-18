<?php

declare(strict_types=1);

namespace App\Services\Labels;

use App\Jobs\ProcessLabelPrintJob;
use App\Models\ImeiUnit;
use App\Models\LabelPrintJob;
use App\Models\LabelPrintJobItem;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;

class LabelPrintQueueService
{
    public function enqueueForImeis(array|Collection $imeiUnits, ?\App\Models\User $user = null): LabelPrintJob
    {
        $collection = $imeiUnits instanceof Collection ? $imeiUnits : ImeiUnit::whereIn('id', $imeiUnits)->get();
        if ($collection->isEmpty()) {
            throw new \InvalidArgumentException('Nenhum IMEI informado para fila de etiqueta.');
        }

        $first = $collection->first();

        $job = DB::transaction(function () use ($collection, $first, $user): LabelPrintJob {
            $job = LabelPrintJob::create([
                'empresa_id' => $first->empresa_id,
                'filial_id' => null,
                'status' => LabelPrintJob::STATUS_PENDING,
                'type' => 'imei_label',
                'requested_by' => $user?->id,
                'requested_at' => now(),
            ]);

            foreach ($collection as $imei) {
                LabelPrintJobItem::create([
                    'label_print_job_id' => $job->id,
                    'imei_unit_id' => $imei->id,
                    'quantity' => 1,
                    'status' => LabelPrintJobItem::STATUS_PENDING,
                ]);
            }

            return $job;
        });

        ProcessLabelPrintJob::dispatch($job);

        return $job;
    }

    public function enqueueSingleLabel(ImeiUnit $imeiUnit, ?\App\Models\User $user = null): LabelPrintJob
    {
        return $this->enqueueForImeis(collect([$imeiUnit]), $user);
    }

    public function markItemProcessing(LabelPrintJobItem $item): void
    {
        $item->update([
            'status' => LabelPrintJobItem::STATUS_PROCESSING,
            'error_message' => null,
        ]);
    }

    public function markItemDone(LabelPrintJobItem $item): void
    {
        $item->update([
            'status' => LabelPrintJobItem::STATUS_DONE,
            'error_message' => null,
        ]);
    }

    public function markItemFailed(LabelPrintJobItem $item, string $errorMessage): void
    {
        $item->update([
            'status' => LabelPrintJobItem::STATUS_FAILED,
            'error_message' => $errorMessage,
        ]);
    }

    public function refreshJobStatus(LabelPrintJob $job): void
    {
        $job->refresh();
        $statuses = $job->items()->pluck('status');

        if ($statuses->every(fn ($s) => $s === LabelPrintJobItem::STATUS_DONE)) {
            $job->update([
                'status' => LabelPrintJob::STATUS_DONE,
                'processed_at' => now(),
                'error_message' => null,
            ]);
            return;
        }

        if ($statuses->contains(LabelPrintJobItem::STATUS_FAILED) && !$statuses->contains(LabelPrintJobItem::STATUS_PENDING) && !$statuses->contains(LabelPrintJobItem::STATUS_PROCESSING)) {
            $job->update([
                'status' => LabelPrintJob::STATUS_FAILED,
                'processed_at' => now(),
            ]);
            return;
        }

        if ($statuses->contains(LabelPrintJobItem::STATUS_PROCESSING) || $statuses->contains(LabelPrintJobItem::STATUS_PENDING)) {
            $job->update([
                'status' => LabelPrintJob::STATUS_PROCESSING,
            ]);
        }
    }

    public function requeueJob(LabelPrintJob $job): LabelPrintJob
    {
        $job->update([
            'status' => LabelPrintJob::STATUS_PENDING,
            'error_message' => null,
            'requested_at' => now(),
            'processed_at' => null,
        ]);

        $job->items()->update([
            'status' => LabelPrintJobItem::STATUS_PENDING,
            'error_message' => null,
        ]);

        ProcessLabelPrintJob::dispatch($job);

        return $job->fresh();
    }
}
