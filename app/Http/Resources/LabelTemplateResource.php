<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LabelTemplateResource extends JsonResource
{
    /**
     * @mixin \App\Models\LabelTemplate
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'empresa_id' => $this->empresa_id,
            'filial_id' => $this->filial_id,
            'code' => $this->code,
            'name' => $this->name,
            'type' => $this->type,
            'is_default' => $this->is_default,
            'active' => $this->active,
            'config' => $this->config,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
