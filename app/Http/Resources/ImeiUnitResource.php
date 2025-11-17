<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ImeiUnitResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'produto_id' => $this->produto_id,
            'produto_variacao_id' => $this->produto_variacao_id,
            'imei' => $this->imei,
            'serial_number' => $this->serial_number,
            'status' => $this->status,
            'empresa_id' => $this->empresa_id,
            'localizacao_id' => $this->localizacao_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
