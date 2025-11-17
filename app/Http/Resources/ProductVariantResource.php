<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductVariantResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'product_id' => $this->produto_id,
            'sku' => $this->sku,
            'color' => $this->color,
            'size' => $this->size,
            'descricao' => $this->descricao,
            'codigo_barras' => $this->codigo_barras,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
