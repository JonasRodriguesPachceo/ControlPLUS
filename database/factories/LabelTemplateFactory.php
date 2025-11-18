<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\LabelTemplate;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<LabelTemplate>
 */
class LabelTemplateFactory extends Factory
{
    protected $model = LabelTemplate::class;

    public function definition(): array
    {
        return [
            'empresa_id' => null,
            'filial_id' => null,
            'code' => $this->faker->unique()->lexify('TPL???'),
            'name' => $this->faker->words(2, true),
            'type' => 'imei_label',
            'is_default' => false,
            'config' => [],
            'active' => true,
        ];
    }
}
