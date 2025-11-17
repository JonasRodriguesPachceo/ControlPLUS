<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\Produto;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\ProdutoVariacao>
 */
class ProdutoVariacaoFactory extends Factory
{
    public function definition(): array
    {
        return [
            'produto_id' => Produto::factory(),
            'descricao' => $this->faker->colorName(),
            'valor' => 120,
            'codigo_barras' => $this->faker->ean13(),
            'referencia' => $this->faker->word(),
            'sku' => $this->faker->unique()->lexify('SKU????'),
            'color' => $this->faker->safeColorName(),
            'size' => $this->faker->randomElement(['128GB', '256GB']),
        ];
    }
}
