<?php

declare(strict_types=1);

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\Empresa>
 */
class EmpresaFactory extends Factory
{
    public function definition(): array
    {
        return [
            'nome' => $this->faker->company(),
            'nome_fantasia' => $this->faker->companySuffix(),
            'cpf_cnpj' => '12345678901234',
            'ambiente' => 1,
            'tributacao' => 'MEI',
            'observacao_padrao_nfe' => 'Observacao NFe',
            'observacao_padrao_nfce' => 'Observacao NFCe',
            'mensagem_aproveitamento_credito' => 'Mensagem credito',
            'status' => 1,
            'perc_ap_cred' => 0,
            'percentual_comissao' => 0,
            'limite_cadastro_empresas' => 0,
            'exclusao_icms_pis_cofins' => 0,
            'receber_com_boleto' => 0,
        ];
    }
}
