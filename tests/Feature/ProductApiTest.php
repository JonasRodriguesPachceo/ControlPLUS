<?php

declare(strict_types=1);

namespace Tests\Feature;

use App\Models\Produto;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Gate;
use Tests\TestCase;

class ProductApiTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();

        Gate::define('viewAny', fn ($user, $model = null) => true);
        Gate::define('view', fn ($user, $model = null) => true);
        Gate::define('create', fn ($user, $model = null) => true);
        Gate::define('update', fn ($user, $model = null) => true);
        Gate::define('delete', fn ($user, $model = null) => true);
    }

    public function test_create_simple_product_via_api(): void
    {
        $user = User::factory()->create();
        $payload = $this->basePayload();

        $response = $this->actingAs($user)->postJson('/api/products', $payload);

        $response->assertStatus(201)
            ->assertJsonPath('data.tracking_type', 'none')
            ->assertJsonPath('data.has_variants', false);

        $this->assertDatabaseHas('produtos', [
            'nome' => $payload['nome'],
            'tracking_type' => 'none',
        ]);
    }

    public function test_create_product_with_variants_via_api(): void
    {
        $user = User::factory()->create();
        $payload = $this->basePayload([
            'tracking_type' => 'variant',
            'has_variants' => true,
            'variants' => [
                [
                    'descricao' => 'Preto 128GB',
                    'valor' => 1000,
                    'sku' => 'IPH15PM-128-BLK',
                    'color' => 'preto',
                    'size' => '128GB',
                ],
                [
                    'descricao' => 'Rosa 256GB',
                    'valor' => 1200,
                    'sku' => 'IPH15PM-256-PNK',
                    'color' => 'rosa',
                    'size' => '256GB',
                ],
            ],
        ]);

        $response = $this->actingAs($user)->postJson('/api/products', $payload);

        $response->assertStatus(201)
            ->assertJsonPath('data.has_variants', true)
            ->assertJsonCount(2, 'data.variants');

        $this->assertDatabaseHas('produto_variacaos', [
            'sku' => 'IPH15PM-128-BLK',
            'color' => 'preto',
        ]);
    }

    public function test_validation_requires_tracking_type(): void
    {
        $user = User::factory()->create();
        $payload = $this->basePayload();
        unset($payload['tracking_type']);

        $response = $this->actingAs($user)->postJson('/api/products', $payload);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['tracking_type']);
    }

    public function test_validation_requires_variants_when_tracking_variant(): void
    {
        $user = User::factory()->create();
        $payload = $this->basePayload([
            'tracking_type' => 'variant',
            'has_variants' => true,
        ]);
        unset($payload['variants']);

        $response = $this->actingAs($user)->postJson('/api/products', $payload);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['variants']);
    }

    public function test_update_product_syncs_variants_via_api(): void
    {
        $user = User::factory()->create();
        $product = Produto::factory()->create([
            'tracking_type' => 'variant',
            'has_variants' => true,
        ]);
        $existingVariant = $product->variacoes()->create([
            'descricao' => 'Preto 128GB',
            'valor' => 1000,
            'sku' => 'IPH15PM-128-BLK',
            'color' => 'preto',
            'size' => '128GB',
        ]);

        $payload = $this->basePayload([
            'tracking_type' => 'variant',
            'has_variants' => true,
            'nome' => 'Produto Atualizado',
            'variants' => [
                [
                    'id' => $existingVariant->id,
                    'descricao' => 'Preto 128GB',
                    'valor' => 1100,
                    'sku' => 'IPH15PM-128-BLK',
                    'color' => 'preto fosco',
                    'size' => '128GB',
                ],
                [
                    'descricao' => 'Azul 512GB',
                    'valor' => 1500,
                    'sku' => 'IPH15PM-512-BLU',
                    'color' => 'azul',
                    'size' => '512GB',
                ],
            ],
        ]);

        $response = $this->actingAs($user)->putJson("/api/products/{$product->id}", $payload);

        $response->assertStatus(200)
            ->assertJsonPath('data.name', 'Produto Atualizado')
            ->assertJsonCount(2, 'data.variants');

        $this->assertDatabaseHas('produto_variacaos', [
            'sku' => 'IPH15PM-128-BLK',
            'color' => 'preto fosco',
        ]);
        $this->assertDatabaseHas('produto_variacaos', [
            'sku' => 'IPH15PM-512-BLU',
        ]);
    }

    private function basePayload(array $overrides = []): array
    {
        $empresa = \App\Models\Empresa::factory()->create();

        return array_merge([
            'empresa_id' => $empresa->id,
            'nome' => 'Produto API',
            'ncm' => '12345678',
            'unidade' => 'UN',
            'valor_unitario' => 100,
            'valor_minimo_venda' => 10,
            'valor_compra' => 50,
            'cfop_estadual' => '5102',
            'cfop_outro_estado' => '6102',
            'cst_csosn' => '101',
            'cst_pis' => '01',
            'cst_cofins' => '01',
            'cst_ipi' => '50',
            'referencia_balanca' => '123',
            'tracking_type' => 'none',
            'has_variants' => false,
            'is_refurbished' => false,
            'variants' => [],
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
        ], $overrides);
    }
}
