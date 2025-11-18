<?php

declare(strict_types=1);

namespace App\Jobs;

use App\Models\LabelPrintJob;
use App\Models\LabelPrintJobItem;
use App\Services\ImeiLabelService;
use App\Services\Labels\LabelPrintQueueService;
use App\Services\Printing\LabelPrintSpoolService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class ProcessLabelPrintJob implements ShouldQueue
{
    use Dispatchable;
    use InteractsWithQueue;
    use Queueable;
    use SerializesModels;

    public function __construct(public LabelPrintJob $labelPrintJob)
    {
        $this->onQueue('printing');
    }

    public function handle(
        ImeiLabelService $labelService,
        LabelPrintQueueService $queueService,
        LabelPrintSpoolService $spoolService
    ): void
    {
        if ($this->labelPrintJob->status === LabelPrintJob::STATUS_PENDING) {
            $this->labelPrintJob->update([
                'status' => LabelPrintJob::STATUS_PROCESSING,
                'processed_at' => now(),
            ]);
        }

        $items = $this->labelPrintJob->items()
            ->where('status', LabelPrintJobItem::STATUS_PENDING)
            ->with('imeiUnit')
            ->get();

        foreach ($items as $item) {
            try {
                $queueService->markItemProcessing($item);
                $imei = $item->imeiUnit()->with(['produto', 'variacao', 'localizacao'])->first();
                $label = $labelService->generateFormattedForImei($imei);

                $payload = [
                    'job_id' => $this->labelPrintJob->id,
                    'item_id' => $item->id,
                    'empresa_id' => $this->labelPrintJob->empresa_id,
                    'filial_id' => $this->labelPrintJob->filial_id,
                    'imei_unit_id' => $imei->id,
                    'label' => $label,
                ];

                $spoolService->queueFromLabelPayload($item, $payload);

                $queueService->markItemDone($item);
            } catch (\Throwable $e) {
                Log::error('Label print item failed', [
                    'job_id' => $this->labelPrintJob->id,
                    'item_id' => $item->id,
                    'error' => $e->getMessage(),
                ]);
                $queueService->markItemFailed($item, $e->getMessage());
            }
        }

        $queueService->refreshJobStatus($this->labelPrintJob);
    }
}
