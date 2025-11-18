<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class StockMoveResource extends JsonResource
{
    /**
     * @mixin \App\Models\StockMove
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'move_type' => $this->move_type,
            'empresa_id' => $this->empresa_id,
            'warehouse_from_id' => $this->warehouse_from_id,
            'warehouse_to_id' => $this->warehouse_to_id,
            'source_type' => $this->source_type,
            'source_id' => $this->source_id,
            'reference' => $this->reference,
            'description' => $this->description,
            'executed_at' => $this->executed_at,
            'imei_units' => ImeiUnitResource::collection($this->whenLoaded('imeiUnits')),
            'items' => StockMoveImeiResource::collection($this->whenLoaded('items')),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
