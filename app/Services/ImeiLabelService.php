<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\ImeiUnit;
use Illuminate\Support\Arr;

class ImeiLabelService
{
    /**
     * Gera payload de etiqueta (barcode + QR) para uma unidade IMEI/Série.
     * Não gera imagem; apenas dados para consumo por PDF/impressão em fases futuras.
     */
    public function generateForImeiUnit(ImeiUnit $imeiUnit): array
    {
        $barcodeValue = $this->buildBarcodeValue($imeiUnit);
        $qrValue = $this->buildQrValue($imeiUnit);

        $imeiUnit->fill([
            'label_barcode_value' => $barcodeValue,
            'label_qr_value' => $qrValue,
            'label_version' => $imeiUnit->label_version ?: 1,
            'label_last_generated_at' => now(),
        ])->save();

        return [
            'product_name' => $imeiUnit->produto?->nome,
            'variant' => $imeiUnit->variacao?->descricao,
            'imei' => $imeiUnit->imei,
            'serial_number' => $imeiUnit->serial_number,
            'warehouse_id' => $imeiUnit->warehouse_id,
            'barcode_type' => 'code128',
            'barcode_value' => $barcodeValue,
            'qr_value' => $qrValue,
            'label_version' => $imeiUnit->label_version ?? 1,
        ];
    }

    private function buildBarcodeValue(ImeiUnit $imeiUnit): string
    {
        return sprintf('IMU-%d', $imeiUnit->id);
    }

    private function buildQrValue(ImeiUnit $imeiUnit): string
    {
        return json_encode([
            'imei_unit_id' => $imeiUnit->id,
            'imei' => $imeiUnit->imei,
            'serial_number' => $imeiUnit->serial_number,
            'product_id' => $imeiUnit->produto_id,
            'product_variant_id' => $imeiUnit->produto_variacao_id,
            'company_id' => $imeiUnit->empresa_id,
            'warehouse_id' => $imeiUnit->warehouse_id,
            'url' => rtrim(config('app.url'), '/') . '/imei/' . $imeiUnit->id,
        ]);
    }
}
