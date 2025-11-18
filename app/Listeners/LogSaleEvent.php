<?php

declare(strict_types=1);

namespace App\Listeners;

use App\Events\SaleCanceled;
use App\Events\SaleFinalized;
use App\Events\SaleReturned;
use Illuminate\Support\Facades\Log;

class LogSaleEvent
{
    public function handle(SaleFinalized|SaleReturned|SaleCanceled $event): void
    {
        $sale = $event->sale;

        $type = match (true) {
            $event instanceof SaleFinalized => 'finalized',
            $event instanceof SaleReturned => 'returned',
            $event instanceof SaleCanceled => 'canceled',
        };

        Log::info("Sale {$type}", [
            'sale_id' => $sale->id,
            'status' => $sale->status,
            'empresa_id' => $sale->empresa_id ?? null,
            'local_id' => $sale->local_id ?? null,
            'imeis' => $event->imeiUnits->map(fn ($i) => [
                'id' => $i->id,
                'imei' => $i->imei,
                'status' => $i->status,
            ])->values(),
            'user_id' => auth()->id(),
        ]);
    }
}
