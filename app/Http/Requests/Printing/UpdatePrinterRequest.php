<?php

declare(strict_types=1);

namespace App\Http\Requests\Printing;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdatePrinterRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        $drivers = array_keys(config('printing.drivers', []));
        $printerId = $this->route('printer')?->id ?? null;

        return [
            'empresa_id' => ['sometimes', 'exists:empresas,id'],
            'localizacao_id' => ['nullable', 'exists:localizacaos,id'],
            'name' => ['sometimes', 'string', 'max:255'],
            'code' => [
                'sometimes',
                'string',
                'max:100',
                Rule::unique('printers')->ignore($printerId)->where(function ($q) {
                    return $q->where('empresa_id', $this->empresa_id ?? $this->route('printer')->empresa_id)
                        ->where('localizacao_id', $this->localizacao_id ?? $this->route('printer')->localizacao_id);
                }),
            ],
            'driver' => ['sometimes', 'string', Rule::in($drivers)],
            'connection_config' => ['nullable', 'array'],
            'connection_config.endpoint' => ['required_if:driver,http', 'string'],
            'connection_config.method' => ['nullable', 'string'],
            'connection_config.headers' => ['nullable', 'array'],
            'is_default' => ['sometimes', 'boolean'],
            'active' => ['sometimes', 'boolean'],
        ];
    }
}
