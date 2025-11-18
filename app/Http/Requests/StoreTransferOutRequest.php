<?php

declare(strict_types=1);

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreTransferOutRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'empresa_id' => ['required', 'exists:empresas,id'],
            'warehouse_from_id' => ['required', 'exists:localizacaos,id'],
            'warehouse_to_id' => ['required', 'different:warehouse_from_id', 'exists:localizacaos,id'],
            'source_type' => ['nullable', 'string', 'max:80'],
            'source_id' => ['nullable', 'integer'],
            'reference' => ['nullable', 'string', 'max:120'],
            'description' => ['nullable', 'string'],
            'executed_at' => ['nullable', 'date'],
            'imei_unit_ids' => ['required', 'array', 'min:1'],
            'imei_unit_ids.*' => ['integer', 'exists:produto_unicos,id'],
        ];
    }
}
