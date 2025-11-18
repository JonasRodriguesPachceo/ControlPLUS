<?php

declare(strict_types=1);

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ConfirmSaleWithImeisRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'items' => ['required', 'array', 'min:1'],
            'items.*.sale_item_id' => ['required', 'exists:item_pre_vendas,id'],
            'items.*.imei_unit_ids' => ['required', 'array', 'min:1'],
            'items.*.imei_unit_ids.*' => ['integer', 'exists:produto_unicos,id'],
            'executed_at' => ['nullable', 'date'],
            'reference' => ['nullable', 'string', 'max:120'],
            'description' => ['nullable', 'string'],
        ];
    }
}
