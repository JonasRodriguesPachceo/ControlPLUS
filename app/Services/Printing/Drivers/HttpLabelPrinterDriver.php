<?php

declare(strict_types=1);

namespace App\Services\Printing\Drivers;

use App\Contracts\Printing\LabelPrinterDriverInterface;
use App\Models\Printer;
use App\Models\PrinterSpoolItem;
use Illuminate\Support\Facades\Http;
use RuntimeException;

class HttpLabelPrinterDriver implements LabelPrinterDriverInterface
{
    public function print(array $labelPayload, ?Printer $printer, PrinterSpoolItem $spoolItem): void
    {
        $endpoint = $printer?->connection_config['endpoint'] ?? null;
        $method = $printer?->connection_config['method'] ?? 'POST';
        $headers = $printer?->connection_config['headers'] ?? [];

        if (!$endpoint) {
            throw new RuntimeException('Endpoint de impressão HTTP não configurado.');
        }

        $request = Http::withHeaders($headers)->timeout(10);

        $response = $request->$method($endpoint, [
            'printer' => [
                'id' => $printer?->id,
                'code' => $printer?->code,
            ],
            'label' => $labelPayload['label'] ?? [],
            'payload' => $labelPayload,
        ]);

        if (!$response->successful()) {
            throw new RuntimeException('Falha ao enviar para serviço de impressão: ' . $response->body());
        }
    }
}
