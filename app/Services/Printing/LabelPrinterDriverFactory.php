<?php

declare(strict_types=1);

namespace App\Services\Printing;

use App\Contracts\Printing\LabelPrinterDriverInterface;
use App\Models\Printer;

class LabelPrinterDriverFactory
{
    public function makeForPrinter(?Printer $printer): LabelPrinterDriverInterface
    {
        $config = config('printing');

        $drivers = $config['drivers'] ?? [];
        $driverName = $printer?->driver ?? $config['default_driver'] ?? 'dummy';
        $driverClass = $drivers[$driverName] ?? $drivers['dummy'] ?? null;

        if (!$driverClass) {
            throw new \RuntimeException('Driver de impressão não configurado.');
        }

        return app($driverClass);
    }
}
