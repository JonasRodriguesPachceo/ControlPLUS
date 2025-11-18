<?php

declare(strict_types=1);

namespace App\Listeners;

use App\Events\IMEICreated;
use Illuminate\Support\Facades\Log;

class LogImeiCreated
{
    public function handle(IMEICreated $event): void
    {
        $imei = $event->imeiUnit;

        Log::info('IMEI created', [
            'imei_unit_id' => $imei->id,
            'imei' => $imei->imei,
            'serial_number' => $imei->serial_number,
            'produto_id' => $imei->produto_id,
            'produto_variacao_id' => $imei->produto_variacao_id,
            'empresa_id' => $imei->empresa_id,
            'localizacao_id' => $imei->localizacao_id,
            'warehouse_id' => $imei->warehouse_id,
            'origin_type' => $imei->origin_type,
            'origin_id' => $imei->origin_id,
            'user_id' => auth()->id(),
        ]);
    }
}
