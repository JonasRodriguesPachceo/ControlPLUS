<?php

declare(strict_types=1);

namespace Tests\Unit\Services\Labels;

use App\Services\Labels\LabelTemplateFormatterService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class LabelTemplateFormatterServiceTest extends TestCase
{
    use RefreshDatabase;

    public function test_format_uses_template_fields(): void
    {
        $formatter = $this->app->make(LabelTemplateFormatterService::class);
        $baseData = [
            'product_name' => 'Produto X',
            'variant' => 'Vermelho',
            'imei' => '123456789',
            'serial_number' => 'SN-1',
        ];

        $template = new \App\Models\LabelTemplate([
            'code' => 'T1',
            'config' => [
                'fields' => [
                    'title' => 'product_name',
                    'line_1' => 'imei',
                    'line_2' => 'serial_number',
                ],
                'barcode' => [
                    'source' => 'imei',
                    'format' => 'code128',
                ],
                'qrcode' => [
                    'source' => 'url',
                    'base_url' => 'https://test/imei',
                    'field' => 'imei',
                ],
            ],
        ]);

        $formatted = $formatter->formatForImei(new \App\Models\ImeiUnit(), $baseData, $template);

        $this->assertSame('Produto X', $formatted['text']['title']);
        $this->assertSame('123456789', $formatted['barcode']['value']);
        $this->assertSame('https://test/imei/123456789', $formatted['qrcode']['value']);
    }

    public function test_format_handles_missing_fields(): void
    {
        $formatter = $this->app->make(LabelTemplateFormatterService::class);
        $baseData = [];

        $formatted = $formatter->formatForImei(new \App\Models\ImeiUnit(), $baseData, null);

        $this->assertNull($formatted['text']['title']);
    }
}
