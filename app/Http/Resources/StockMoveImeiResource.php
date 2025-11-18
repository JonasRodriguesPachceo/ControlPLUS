<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class StockMoveImeiResource extends JsonResource
{
    /**
     * @mixin \App\Models\StockMoveImei
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'stock_move_id' => $this->stock_move_id,
            'imei_unit_id' => $this->imei_unit_id,
            'quantity' => $this->quantity,
            'previous_status' => $this->previous_status,
            'new_status' => $this->new_status,
            'imei' => $this->imeiUnit->imei ?? null,
            'serial_number' => $this->imeiUnit->serial_number ?? null,
            'status' => $this->imeiUnit->status ?? null,
        ];
    }
}
