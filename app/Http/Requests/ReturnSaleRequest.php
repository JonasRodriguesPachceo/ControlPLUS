<?php

declare(strict_types=1);

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ReturnSaleRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'warehouse_id' => ['required', 'exists:localizacaos,id'],
            'items' => ['required', 'array', 'min:1'],
            'items.*.sale_item_id' => ['required', 'exists:item_pre_vendas,id'],
            'items.*.imei_unit_ids' => ['required', 'array', 'min:1'],
            'items.*.imei_unit_ids.*' => ['integer', 'exists:produto_unicos,id'],
            'items.*.return_reason' => ['nullable', 'string'],
            'items.*.to_repair' => ['nullable', 'boolean'],
            'reference' => ['nullable', 'string', 'max:120'],
            'description' => ['nullable', 'string'],
            'executed_at' => ['nullable', 'date'],
        ];
    }
}
