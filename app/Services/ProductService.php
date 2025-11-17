<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\Produto;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

class ProductService
{
    public function create(array $data): Produto
    {
        return DB::transaction(function () use ($data): Produto {
            [$productData, $variants] = $this->extractVariants($data);

            $product = Produto::create($productData);

            if ($this->shouldHandleVariants($product, $variants)) {
                $this->syncVariants($product, $variants);
                $product->load('variacoes');
            }

            return $product;
        });
    }

    public function update(Produto $product, array $data): Produto
    {
        return DB::transaction(function () use ($product, $data): Produto {
            [$productData, $variants] = $this->extractVariants($data, $product);

            $product->fill($productData)->save();

            if ($this->shouldHandleVariants($product, $variants)) {
                $this->syncVariants($product, $variants);
                $product->load('variacoes');
            }

            return $product;
        });
    }

    private function extractVariants(array $data, ?Produto $product = null): array
    {
        $variants = Arr::pull($data, 'variants', []);

        if (($data['tracking_type'] ?? null) === Produto::TRACKING_TYPE_VARIANT) {
            $data['has_variants'] = true;
        } else {
            $data['has_variants'] = false;
            $variants = [];
        }

        $data = array_merge([
            'ncm' => '',
            'unidade' => '',
            'valor_unitario' => 0,
            'valor_minimo_venda' => 0,
            'valor_compra' => 0,
            'cfop_estadual' => '',
            'cfop_outro_estado' => '',
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
        ], $data);

        // Nota: mudanças futuras podem restringir alteração de tracking_type quando já houver IMEIs/estoque vinculados.
        return [$data, $variants];
    }

    private function shouldHandleVariants(Produto $product, array $variants): bool
    {
        return $product->tracking_type === Produto::TRACKING_TYPE_VARIANT && !empty($variants);
    }

    private function syncVariants(Produto $product, array $variants): void
    {
        $keptIds = [];

        foreach ($variants as $variantData) {
            $variantData['produto_id'] = $product->id;

            if (!empty($variantData['id'])) {
                $existing = $product->variacoes()->where('id', $variantData['id'])->first();
                if ($existing) {
                    $existing->fill($variantData)->save();
                    $keptIds[] = $existing->id;
                    continue;
                }
            }

            $created = $product->variacoes()->create($variantData);
            $keptIds[] = $created->id;
        }

        if (!empty($keptIds)) {
            $product->variacoes()->whereNotIn('id', $keptIds)->delete();
        }
    }
}
