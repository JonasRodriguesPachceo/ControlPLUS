<?php

declare(strict_types=1);

namespace App\Http\Requests\Printing;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StorePrinterRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        $drivers = array_keys(config('printing.drivers', []));

        return [
            'empresa_id' => ['required', 'exists:empresas,id'],
            'localizacao_id' => ['nullable', 'exists:localizacaos,id'],
            'name' => ['required', 'string', 'max:255'],
            'code' => [
                'required',
                'string',
                'max:100',
                Rule::unique('printers')->where(function ($q) {
                    return $q->where('empresa_id', $this->empresa_id)
                        ->where('localizacao_id', $this->localizacao_id);
                }),
            ],
            'driver' => ['required', 'string', Rule::in($drivers)],
            'connection_config' => ['nullable', 'array'],
            'connection_config.endpoint' => ['required_if:driver,http', 'string'],
            'connection_config.method' => ['nullable', 'string'],
            'connection_config.headers' => ['nullable', 'array'],
            'is_default' => ['sometimes', 'boolean'],
            'active' => ['sometimes', 'boolean'],
        ];
    }
}
