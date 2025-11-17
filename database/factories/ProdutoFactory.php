<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\Empresa;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\Produto>
 */
class ProdutoFactory extends Factory
{
    public function definition(): array
    {
        return [
            'empresa_id' => Empresa::factory(),
            'nome' => $this->faker->word(),
            'ncm' => '12345678',
            'unidade' => 'UN',
            'valor_unitario' => 100,
            'valor_minimo_venda' => 10,
            'valor_compra' => 50,
            'cfop_estadual' => '5102',
            'cfop_outro_estado' => '6102',
            'tracking_type' => 'none',
            'has_variants' => false,
            'is_refurbished' => false,
            'texto_ecommerce' => '',
            'texto_delivery' => '',
            'mercado_livre_descricao' => '',
            'woocommerce_descricao' => '',
            'categorias_woocommerce' => '',
            'texto_nuvem_shop' => '',
            'mercado_livre_status' => '',
            'mercado_livre_categoria' => '',
            'mercado_livre_tipo_publicacao' => '',
            'mercado_livre_id' => '',
            'mercado_livre_link' => '',
            'mercado_livre_valor' => 0,
            'mercado_livre_modelo' => '',
            'mercado_livre_youtube' => '',
            'woocommerce_id' => '',
            'woocommerce_slug' => '',
            'woocommerce_link' => '',
            'woocommerce_valor' => 0,
            'woocommerce_type' => '',
            'woocommerce_status' => '',
            'woocommerce_stock_status' => '',
            'hash_ecommerce' => '',
            'hash_delivery' => '',
        ];
    }
}
