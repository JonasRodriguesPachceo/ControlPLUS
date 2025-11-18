<?php

declare(strict_types=1);

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CancelSaleRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'cancel_all' => ['sometimes', 'boolean'],
            'reason' => ['required', 'string'],
            'warehouse_id' => ['required', 'exists:localizacaos,id'],
            'items' => ['nullable', 'array'],
            'items.*.sale_item_id' => ['required_with:items', 'exists:item_pre_vendas,id'],
            'items.*.imei_unit_ids' => ['required_with:items.*.sale_item_id', 'array', 'min:1'],
            'items.*.imei_unit_ids.*' => ['integer', 'exists:produto_unicos,id'],
            'executed_at' => ['nullable', 'date'],
            'reference' => ['nullable', 'string', 'max:120'],
            'description' => ['nullable', 'string'],
        ];
    }
}
