<?php

declare(strict_types=1);

namespace App\Contracts\Printing;

use App\Models\Printer;
use App\Models\PrinterSpoolItem;

interface LabelPrinterDriverInterface
{
    public function print(array $labelPayload, ?Printer $printer, PrinterSpoolItem $spoolItem): void;
}
