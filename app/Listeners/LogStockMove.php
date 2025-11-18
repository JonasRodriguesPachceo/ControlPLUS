<?php

declare(strict_types=1);

namespace App\Listeners;

use App\Events\StockMoved;
use Illuminate\Support\Facades\Log;

class LogStockMove
{
    public function handle(StockMoved $event): void
    {
        Log::info('Stock move recorded', [
            'stock_move_id' => $event->stockMove->id,
            'move_type' => $event->stockMove->move_type,
            'empresa_id' => $event->stockMove->empresa_id,
            'warehouse_from_id' => $event->stockMove->warehouse_from_id,
            'warehouse_to_id' => $event->stockMove->warehouse_to_id,
            'source_type' => $event->stockMove->source_type,
            'source_id' => $event->stockMove->source_id,
            'imeis' => $event->imeiUnits->map(fn ($i) => [
                'id' => $i->id,
                'imei' => $i->imei,
                'status' => $i->status,
            ])->values(),
            'user_id' => auth()->id(),
        ]);
    }
}
