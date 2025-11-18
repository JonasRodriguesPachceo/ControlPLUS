<?php

declare(strict_types=1);

namespace Tests\Unit\Services\Printing\Drivers;

use App\Models\Printer;
use App\Models\PrinterSpoolItem;
use App\Services\Printing\Drivers\HttpLabelPrinterDriver;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Http;
use RuntimeException;
use Tests\TestCase;

class HttpLabelPrinterDriverTest extends TestCase
{
    use RefreshDatabase;

    public function test_http_driver_sends_request(): void
    {
        Http::fake([
            '*' => Http::response([], 200),
        ]);

        $driver = new HttpLabelPrinterDriver();
        $printer = new Printer([
            'connection_config' => [
                'endpoint' => 'https://print.test/print',
                'method' => 'post',
            ],
        ]);
        $spool = new PrinterSpoolItem(['id' => 1]);

        $driver->print(['label' => ['a' => 'b']], $printer, $spool);

        Http::assertSentCount(1);
    }

    public function test_http_driver_throws_on_error(): void
    {
        Http::fake([
            '*' => Http::response('err', 500),
        ]);

        $driver = new HttpLabelPrinterDriver();
        $printer = new Printer([
            'connection_config' => [
                'endpoint' => 'https://print.test/print',
                'method' => 'post',
            ],
        ]);
        $spool = new PrinterSpoolItem(['id' => 1]);

        $this->expectException(RuntimeException::class);
        $driver->print(['label' => []], $printer, $spool);
    }
}
