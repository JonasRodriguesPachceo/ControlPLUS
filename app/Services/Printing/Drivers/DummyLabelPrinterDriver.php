<?php

declare(strict_types=1);

namespace App\Services\Printing\Drivers;

use App\Contracts\Printing\LabelPrinterDriverInterface;
use App\Models\Printer;
use App\Models\PrinterSpoolItem;
use Illuminate\Support\Facades\Log;

class DummyLabelPrinterDriver implements LabelPrinterDriverInterface
{
    public function print(array $labelPayload, ?Printer $printer, PrinterSpoolItem $spoolItem): void
    {
        Log::info('Dummy label print', [
            'spool_item_id' => $spoolItem->id,
            'printer' => $printer?->toArray(),
            'payload' => $labelPayload,
        ]);
    }
}
