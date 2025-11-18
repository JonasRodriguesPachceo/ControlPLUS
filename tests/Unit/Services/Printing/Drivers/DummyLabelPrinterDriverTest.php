<?php

declare(strict_types=1);

namespace Tests\Unit\Services\Printing\Drivers;

use App\Models\PrinterSpoolItem;
use App\Services\Printing\Drivers\DummyLabelPrinterDriver;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Log;
use Tests\TestCase;

class DummyLabelPrinterDriverTest extends TestCase
{
    use RefreshDatabase;

    public function test_dummy_driver_logs_without_exception(): void
    {
        Log::spy();

        $driver = new DummyLabelPrinterDriver();
        $spool = new PrinterSpoolItem(['id' => 1]);

        $driver->print(['label' => []], null, $spool);

        Log::shouldHaveReceived('info')->once();
    }
}
