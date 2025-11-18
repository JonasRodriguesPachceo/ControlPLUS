<?php

declare(strict_types=1);

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreStockEntryRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'empresa_id' => ['required', 'exists:empresas,id'],
            'product_id' => ['required_without:product_variant_id', 'exists:produtos,id'],
            'product_variant_id' => ['required_without:product_id', 'exists:produto_variacaos,id'],
            'warehouse_id' => ['required', 'exists:localizacaos,id'],
            'source_type' => ['nullable', 'string', 'max:80'],
            'source_id' => ['nullable', 'integer'],
            'reference' => ['nullable', 'string', 'max:120'],
            'description' => ['nullable', 'string'],
            'items' => ['required', 'array', 'min:1'],
            'items.*.imei' => ['required_without:items.*.serial_number', 'string', 'max:191'],
            'items.*.serial_number' => ['nullable', 'string', 'max:191'],
            'executed_at' => ['nullable', 'date'],
        ];
    }
}
