<?php

declare(strict_types=1);

namespace App\Services\Printing;

use App\Jobs\SendPrinterSpoolItemJob;
use App\Models\LabelPrintJobItem;
use App\Models\Printer;
use App\Models\PrinterSpoolItem;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use InvalidArgumentException;

class LabelPrintSpoolService
{
    public function __construct(
        private readonly LabelPrinterDriverFactory $driverFactory,
        private readonly PrinterResolverService $printerResolver
    )
    {
    }

    /**
     * Recebe payload de etiqueta e cria item de spool para envio à impressora padrão.
     * Será reutilizado para reimpressão em fluxos de trade-in/OS futuramente.
     */
    public function queueFromLabelPayload(LabelPrintJobItem $item, array $labelPayload): PrinterSpoolItem
    {
        $printer = $this->resolvePrinter($item);

        $spoolItem = DB::transaction(function () use ($item, $labelPayload, $printer): PrinterSpoolItem {
            $spool = PrinterSpoolItem::create([
                'label_print_job_item_id' => $item->id,
                'printer_id' => $printer?->id,
                'status' => PrinterSpoolItem::STATUS_QUEUED,
                'payload' => $labelPayload,
                'attempts' => 0,
            ]);

            return $spool;
        });

        SendPrinterSpoolItemJob::dispatch($spoolItem);

        return $spoolItem;
    }

    public function sendToPrinter(PrinterSpoolItem $spoolItem): void
    {
        if ($spoolItem->status !== PrinterSpoolItem::STATUS_QUEUED) {
            return;
        }

        $maxAttempts = (int) config('printing.spool.max_attempts', 3);
        if ($spoolItem->attempts >= $maxAttempts) {
            return;
        }

        $lock = Cache::lock("printer_spool_item:{$spoolItem->id}:lock", 10);
        if (! $lock->get()) {
            return;
        }

        $spoolItem->update([
            'status' => PrinterSpoolItem::STATUS_SENDING,
            'last_attempt_at' => now(),
            'attempts' => $spoolItem->attempts + 1,
        ]);

        $driver = $this->driverFactory->makeForPrinter($spoolItem->printer);

        try {
            $driver->print($spoolItem->payload, $spoolItem->printer, $spoolItem);

            $spoolItem->update([
                'status' => PrinterSpoolItem::STATUS_PRINTED,
                'printed_at' => now(),
                'last_error' => null,
            ]);
        } catch (\Throwable $e) {
            $spoolItem->update([
                'status' => PrinterSpoolItem::STATUS_FAILED,
                'last_error' => $e->getMessage(),
            ]);
        }

        optional($lock)->release();
    }

    public function requeueFailed(PrinterSpoolItem $spoolItem): PrinterSpoolItem
    {
        $spoolItem->update([
            'status' => PrinterSpoolItem::STATUS_QUEUED,
            'last_error' => null,
            'attempts' => 0,
            'last_attempt_at' => null,
            'printed_at' => null,
        ]);

        SendPrinterSpoolItemJob::dispatch($spoolItem);

        return $spoolItem->fresh();
    }

    private function resolvePrinter(LabelPrintJobItem $item): ?Printer
    {
        if (!$item->relationLoaded('job')) {
            $item->load('job');
        }

        $empresaId = $item->job->empresa_id ?? null;
        $filialId = $item->job->filial_id ?? null;

        $printer = $this->printerResolver->resolveDefaultLabelPrinter($empresaId, $filialId);

        if (!$printer) {
            throw new InvalidArgumentException('Nenhuma impressora padrão configurada para etiquetas.');
        }

        return $printer;
    }
}
