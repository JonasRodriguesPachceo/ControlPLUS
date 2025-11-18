<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LabelPrintJobResource extends JsonResource
{
    /**
     * @mixin \App\Models\LabelPrintJob
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'type' => $this->type,
            'status' => $this->status,
            'empresa_id' => $this->empresa_id,
            'filial_id' => $this->filial_id,
            'requested_by' => $this->requested_by,
            'requested_at' => $this->requested_at,
            'processed_at' => $this->processed_at,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'items_count' => $this->items_count ?? $this->items?->count(),
            'items_done_count' => $this->items_done_count ?? null,
            'items_failed_count' => $this->items_failed_count ?? null,
            'items' => LabelPrintJobItemResource::collection($this->whenLoaded('items')),
        ];
    }
}
