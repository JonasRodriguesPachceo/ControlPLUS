<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->nome,
            'description' => $this->descricao,
            'tracking_type' => $this->tracking_type,
            'has_variants' => (bool) $this->has_variants,
            'is_refurbished' => (bool) $this->is_refurbished,
            'empresa_id' => $this->empresa_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'variants' => ProductVariantResource::collection($this->whenLoaded('variacoes')),
        ];
    }
}
