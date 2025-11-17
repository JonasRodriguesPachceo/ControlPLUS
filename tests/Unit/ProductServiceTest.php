<?php

declare(strict_types=1);

namespace Tests\Unit;

use App\Models\Produto;
use App\Models\ProdutoVariacao;
use App\Services\ProductService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ProductServiceTest extends TestCase
{
    use RefreshDatabase;

    private ProductService $service;

    protected function setUp(): void
    {
        parent::setUp();
        $this->service = $this->app->make(ProductService::class);
    }

    public function test_create_product_without_variants_sets_has_variants_false(): void
    {
        $data = Produto::factory()->make([
            'tracking_type' => Produto::TRACKING_TYPE_NONE,
            'has_variants' => false,
        ])->toArray();

        $product = $this->service->create($data);

        $this->assertDatabaseCount('produtos', 1);
        $this->assertFalse((bool) $product->has_variants);
        $this->assertCount(0, $product->variacoes);
    }

    public function test_create_product_with_variants_persists_variations(): void
    {
        $data = Produto::factory()->make([
            'tracking_type' => Produto::TRACKING_TYPE_VARIANT,
            'has_variants' => true,
        ])->toArray();

        $data['variants'] = [
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
        ];

        $product = $this->service->create($data)->load('variacoes');

        $this->assertTrue((bool) $product->has_variants);
        $this->assertCount(2, $product->variacoes);
        $this->assertDatabaseHas('produto_variacaos', [
            'produto_id' => $product->id,
            'sku' => 'IPH15PM-128-BLK',
            'color' => 'preto',
            'size' => '128GB',
        ]);
    }

    public function test_update_product_syncs_variants(): void
    {
        $product = $this->service->create([
            ...Produto::factory()->make([
                'tracking_type' => Produto::TRACKING_TYPE_VARIANT,
                'has_variants' => true,
            ])->toArray(),
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
        ])->load('variacoes');

        $existing = $product->variacoes->first();

        $updatedProduct = $this->service->update($product, [
            'nome' => 'Produto Atualizado',
            'tracking_type' => Produto::TRACKING_TYPE_VARIANT,
            'has_variants' => true,
            'valor_unitario' => $product->valor_unitario,
            'valor_minimo_venda' => $product->valor_minimo_venda,
            'valor_compra' => $product->valor_compra,
            'cfop_estadual' => $product->cfop_estadual,
            'cfop_outro_estado' => $product->cfop_outro_estado,
            'variants' => [
                [
                    'id' => $existing->id,
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
        ])->load('variacoes');

        $this->assertSame('Produto Atualizado', $updatedProduct->nome);
        $this->assertCount(2, $updatedProduct->variacoes);
        $this->assertDatabaseHas('produto_variacaos', [
            'id' => $existing->id,
            'color' => 'preto fosco',
            'sku' => 'IPH15PM-128-BLK',
        ]);
        $this->assertDatabaseMissing('produto_variacaos', [
            'sku' => 'IPH15PM-256-PNK',
        ]);
    }

    public function test_tracking_type_variant_forces_has_variants_true(): void
    {
        $product = $this->service->create([
            ...Produto::factory()->make([
                'tracking_type' => Produto::TRACKING_TYPE_VARIANT,
                'has_variants' => false,
            ])->toArray(),
            'variants' => [
                [
                    'descricao' => 'Preto 128GB',
                    'valor' => 1000,
                    'sku' => 'IPH15PM-128-BLK',
                    'color' => 'preto',
                    'size' => '128GB',
                ],
            ],
        ]);

        $this->assertTrue((bool) $product->has_variants);
    }
}
