<?php

declare(strict_types=1);

namespace App\Listeners;

use App\Events\IMEIStatusChanged;
use Illuminate\Support\Facades\Log;

class LogImeiStatusChanged
{
    public function handle(IMEIStatusChanged $event): void
    {
        Log::info('IMEI status changed', [
            'imei_unit_id' => $event->imeiUnit->id,
            'imei' => $event->imeiUnit->imei,
            'old_status' => $event->oldStatus,
            'new_status' => $event->newStatus,
            'meta' => $event->meta,
            'empresa_id' => $event->imeiUnit->empresa_id,
            'warehouse_id' => $event->imeiUnit->warehouse_id,
            'user_id' => auth()->id(),
        ]);
    }
}
