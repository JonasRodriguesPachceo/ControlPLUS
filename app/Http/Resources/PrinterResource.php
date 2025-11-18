<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PrinterResource extends JsonResource
{
    /**
     * @mixin \App\Models\Printer
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'empresa_id' => $this->empresa_id,
            'localizacao_id' => $this->localizacao_id,
            'name' => $this->name,
            'code' => $this->code,
            'driver' => $this->driver,
            'is_default' => $this->is_default,
            'active' => $this->active,
            'connection_config' => $this->connection_config,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
