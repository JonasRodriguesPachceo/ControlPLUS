<?php

declare(strict_types=1);

namespace App\Http\Requests;

use App\Models\Produto;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use App\Rules\ValidaReferenciaBalanca;

class StoreProductRequest extends FormRequest
{
    public function authorize(): bool
    {
        // Authorization keeps following existing permissions middleware/routes.
        return true;
    }

    public function rules(): array
    {
        return [
            'empresa_id' => ['required', 'exists:empresas,id'],
            'nome' => ['required', 'string', 'max:200'],
            'descricao' => ['nullable', 'string', 'max:255'],
            'descricao_en' => ['nullable', 'string', 'max:255'],
            'descricao_es' => ['nullable', 'string', 'max:255'],
            'unidade' => ['required', 'string'],
            'cst_csosn' => ['required', 'string'],
            'cst_pis' => ['required', 'string'],
            'cst_cofins' => ['required', 'string'],
            'cst_ipi' => ['required', 'string'],
            'valor_unitario' => ['required'],
            'tracking_type' => [
                'required',
                'string',
                Rule::in([
                    Produto::TRACKING_TYPE_NONE,
                    Produto::TRACKING_TYPE_SERIAL,
                    Produto::TRACKING_TYPE_IMEI,
                    Produto::TRACKING_TYPE_VARIANT,
                ]),
            ],
            'has_variants' => [
                'required_if:tracking_type,' . Produto::TRACKING_TYPE_VARIANT,
                'boolean',
            ],
            'is_refurbished' => ['sometimes', 'boolean'],
            'variants' => ['required_if:tracking_type,variant', 'array'],
            'variants.*.sku' => ['nullable', 'string', 'max:191'],
            'variants.*.color' => ['nullable', 'string', 'max:100'],
            'variants.*.size' => ['nullable', 'string', 'max:100'],
            'variants.*.descricao' => ['nullable', 'string', 'max:100'],
            'variants.*.valor' => ['nullable', 'numeric'],
            'referencia_balanca' => [new ValidaReferenciaBalanca($this->empresa_id)],
        ];
    }

    public function withValidator($validator): void
    {
        $validator->after(function ($validator): void {
            $trackingType = $this->input('tracking_type');
            $hasVariants = $this->boolean('has_variants');

            if ($trackingType === Produto::TRACKING_TYPE_VARIANT && !$hasVariants) {
                $validator->errors()->add('has_variants', 'Produtos com grade devem ter has_variants=true.');
            }

            if ($trackingType !== Produto::TRACKING_TYPE_VARIANT && $hasVariants) {
                $validator->errors()->add('tracking_type', 'has_variants só é permitido quando tracking_type for variant.');
            }
        });
    }

    public function messages(): array
    {
        return [
            'nome.required' => 'Campo Obrigatório',
            'descricao.max' => 'Máximo de 255 caracteres',
            'descricao_es.max' => 'Máximo de 255 caracteres',
            'descricao_en.max' => 'Máximo de 255 caracteres',
            'unidade.required' => 'Campo Obrigatório',
            'cst_csosn.required' => 'Campo Obrigatório',
            'cst_pis.required' => 'Campo Obrigatório',
            'cst_cofins.required' => 'Campo Obrigatório',
            'cst_ipi.required' => 'Campo Obrigatório',
            'valor_unitario.required' => 'Campo Obrigatório',
            'tracking_type.required' => 'Selecione o tipo de rastreamento.',
            'tracking_type.in' => 'Tipo de rastreamento inválido.',
            'has_variants.required_if' => 'Informe se o produto possui grade.',
            'has_variants.boolean' => 'has_variants deve ser verdadeiro ou falso.',
            'variants.required_if' => 'Inclua as variantes quando has_variants=true.',
            'variants.array' => 'variants deve ser um array.',
        ];
    }
}
