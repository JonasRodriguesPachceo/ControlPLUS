<?php

declare(strict_types=1);

namespace Tests\Unit\Services\Printing;

use App\Models\LabelPrintJob;
use App\Models\LabelPrintJobItem;
use App\Models\Printer;
use App\Models\PrinterSpoolItem;
use App\Services\Printing\LabelPrintSpoolService;
use App\Services\Printing\LabelPrinterDriverFactory;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Bus;
use Mockery;
use Tests\TestCase;

class LabelPrintSpoolServiceTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
        \DB::statement('PRAGMA foreign_keys=OFF');
    }

    private function makeImeiUnit(): int
    {
        return \App\Models\ImeiUnit::create([
            'produto_id' => 1,
            'empresa_id' => 1,
            'codigo' => 'CODE',
            'tipo' => 'entrada',
            'em_estoque' => true,
        ])->id;
    }

    public function test_queue_from_label_payload_creates_spool_and_dispatches_job(): void
    {
        Bus::fake();

        $printer = Printer::create([
            'name' => 'Default',
            'code' => 'DEF',
            'driver' => 'dummy',
            'is_default' => true,
        ]);

        $job = LabelPrintJob::create([
            'status' => 'pending',
            'type' => 'imei_label',
            'requested_at' => now(),
        ]);

        $item = LabelPrintJobItem::create([
            'label_print_job_id' => $job->id,
            'imei_unit_id' => $this->makeImeiUnit(),
            'status' => 'pending',
            'quantity' => 1,
        ]);

        $factory = Mockery::mock(LabelPrinterDriverFactory::class);
        $factory->shouldReceive('makeForPrinter')->andReturn(new class implements \App\Contracts\Printing\LabelPrinterDriverInterface {
            public function print(array $labelPayload, ?Printer $printer, PrinterSpoolItem $spoolItem): void
            {
            }
        });
        $this->app->instance(LabelPrinterDriverFactory::class, $factory);

        $service = $this->app->make(LabelPrintSpoolService::class);

        $spool = $service->queueFromLabelPayload($item, ['label' => ['foo' => 'bar']]);

        $this->assertDatabaseHas('printer_spool_items', [
            'id' => $spool->id,
            'status' => PrinterSpoolItem::STATUS_QUEUED,
        ]);
    }

    public function test_send_to_printer_updates_status_on_success(): void
    {
        $driver = new class implements \App\Contracts\Printing\LabelPrinterDriverInterface {
            public function print(array $labelPayload, ?Printer $printer, PrinterSpoolItem $spoolItem): void
            {
            }
        };

        $factory = Mockery::mock(LabelPrinterDriverFactory::class);
        $factory->shouldReceive('makeForPrinter')->andReturn($driver);
        $this->app->instance(LabelPrinterDriverFactory::class, $factory);

        $spool = PrinterSpoolItem::create([
            'label_print_job_item_id' => LabelPrintJobItem::create([
                'label_print_job_id' => LabelPrintJob::create([
                    'status' => 'pending',
                    'type' => 'imei_label',
                    'requested_at' => now(),
                ])->id,
                'imei_unit_id' => $this->makeImeiUnit(),
                'quantity' => 1,
            ])->id,
            'status' => PrinterSpoolItem::STATUS_QUEUED,
            'payload' => ['label' => []],
        ]);

        $service = $this->app->make(LabelPrintSpoolService::class);
        $service->sendToPrinter($spool->fresh());

        $this->assertEquals(PrinterSpoolItem::STATUS_PRINTED, $spool->fresh()->status);
    }

    public function test_send_to_printer_handles_failure(): void
    {
        $driver = new class implements \App\Contracts\Printing\LabelPrinterDriverInterface {
            public function print(array $labelPayload, ?Printer $printer, PrinterSpoolItem $spoolItem): void
            {
                throw new \RuntimeException('fail');
            }
        };

        $factory = Mockery::mock(LabelPrinterDriverFactory::class);
        $factory->shouldReceive('makeForPrinter')->andReturn($driver);
        $this->app->instance(LabelPrinterDriverFactory::class, $factory);

        $spool = PrinterSpoolItem::create([
            'label_print_job_item_id' => LabelPrintJobItem::create([
                'label_print_job_id' => LabelPrintJob::create([
                    'status' => 'pending',
                    'type' => 'imei_label',
                    'requested_at' => now(),
                ])->id,
                'imei_unit_id' => $this->makeImeiUnit(),
                'quantity' => 1,
            ])->id,
            'status' => PrinterSpoolItem::STATUS_QUEUED,
            'payload' => ['label' => []],
        ]);

        $service = $this->app->make(LabelPrintSpoolService::class);
        $service->sendToPrinter($spool->fresh());

        $this->assertEquals(PrinterSpoolItem::STATUS_FAILED, $spool->fresh()->status);
    }
}
