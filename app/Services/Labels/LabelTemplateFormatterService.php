<?php

declare(strict_types=1);

namespace App\Services\Labels;

use App\Models\ImeiUnit;
use App\Models\LabelTemplate;

class LabelTemplateFormatterService
{
    public function formatForImei(ImeiUnit $imeiUnit, array $baseData, ?LabelTemplate $template = null): array
    {
        $templateConfig = $template?->config ?? [];

        $fields = [
            'title' => $this->resolveField($baseData, $templateConfig['fields']['title'] ?? 'product_name'),
            'subtitle' => $this->resolveField($baseData, $templateConfig['fields']['subtitle'] ?? 'variant'),
            'line_1' => $this->resolveField($baseData, $templateConfig['fields']['line_1'] ?? 'imei'),
            'line_2' => $this->resolveField($baseData, $templateConfig['fields']['line_2'] ?? 'serial_number'),
            'line_3' => $this->resolveField($baseData, $templateConfig['fields']['line_3'] ?? 'warehouse_id'),
        ];

        $barcodeConfig = $templateConfig['barcode'] ?? [];
        $qrcodeConfig = $templateConfig['qrcode'] ?? [];

        return [
            'template_code' => $template?->code ?? 'default',
            'text' => $fields,
            'barcode' => [
                'value' => $this->resolveBarcodeValue($baseData, $barcodeConfig),
                'format' => $barcodeConfig['format'] ?? 'code128',
            ],
            'qrcode' => [
                'value' => $this->resolveQrValue($baseData, $qrcodeConfig),
            ],
            'options' => $templateConfig['options'] ?? [],
        ];
    }

    private function resolveField(array $baseData, ?string $field): ?string
    {
        if (!$field) {
            return null;
        }

        return $baseData[$field] ?? null;
    }

    private function resolveBarcodeValue(array $baseData, array $barcodeConfig): ?string
    {
        $source = $barcodeConfig['source'] ?? 'imei';

        return $baseData[$source] ?? null;
    }

    private function resolveQrValue(array $baseData, array $qrcodeConfig): ?string
    {
        $source = $qrcodeConfig['source'] ?? 'field';
        $field = $qrcodeConfig['field'] ?? 'imei';
        $baseUrl = $qrcodeConfig['base_url'] ?? null;

        $value = $baseData[$field] ?? null;

        if ($source === 'url' && $baseUrl && $value) {
            return rtrim($baseUrl, '/') . '/' . $value;
        }

        return $value;
    }
}
