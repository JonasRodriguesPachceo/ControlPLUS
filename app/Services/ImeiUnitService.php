<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\ImeiUnit;
use App\Models\Produto;
use App\Models\ProdutoVariacao;
use DomainException;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ImeiUnitService
{
    public const STATUS_AVAILABLE = 'available';
    public const STATUS_RESERVED = 'reserved';
    public const STATUS_SOLD = 'sold';
    public const STATUS_IN_TRANSFER = 'in_transfer';
    public const STATUS_RETURNED = 'returned';
    public const STATUS_DEFECTIVE = 'defective';
    public const STATUS_LOST = 'lost';
    public const STATUS_IN_REPAIR = 'in_repair';

    /**
     * Cria uma unidade rastreável respeitando o tracking_type do produto.
     * Usado por fluxos de entrada; valida duplicidade de IMEI/série.
     */
    public function create(array $data): ImeiUnit
    {
        return DB::transaction(function () use ($data): ImeiUnit {
            [$product, $variant] = $this->resolveProduct($data);

            $this->assertTrackingCompatibility($product, $data);
            $this->assertUniqueness($data);

            $payload = $this->normalizePayload($product, $variant, $data);

            $imeiUnit = ImeiUnit::create($payload);

            return $imeiUnit;
        });
    }

    /**
     * Cria várias unidades (IMEI/série) para uma mesma entrada/recebimento.
     * Será usada por fluxos de compra/entrada na fase 2.4.
     */
    public function createManyForEntry(Produto|ProdutoVariacao $productOrVariant, array $identifiers, array $context = []): Collection
    {
        return DB::transaction(function () use ($productOrVariant, $identifiers, $context): Collection {
            $created = collect();

            foreach ($identifiers as $identifier) {
                $data = array_merge($context, $identifier);

                if ($productOrVariant instanceof ProdutoVariacao) {
                    $data['produto_variacao_id'] = $productOrVariant->id;
                    $data['produto_id'] = $productOrVariant->produto_id;
                } else {
                    $data['produto_id'] = $productOrVariant->id;
                }

                $created->push($this->create($data));
            }

            return $created;
        });
    }

    /**
     * Atualiza o status da unidade. Guard-rails simples; a máquina de estados completa virá depois.
     */
    public function changeStatus(ImeiUnit $imeiUnit, string $newStatus, ?array $meta = null): ImeiUnit
    {
        $current = $imeiUnit->status;

        if ($current === self::STATUS_SOLD && $newStatus === self::STATUS_AVAILABLE) {
            throw new DomainException('Cannot move sold IMEI back to available directly.');
        }

        $imeiUnit->status = $newStatus;

        if ($newStatus === self::STATUS_SOLD && $imeiUnit->sold_at === null) {
            $imeiUnit->sold_at = now();
        }

        if ($newStatus !== self::STATUS_SOLD && $imeiUnit->sold_at !== null && $newStatus !== self::STATUS_RETURNED) {
            // Mantemos sold_at para histórico; limpeza fica a cargo do fluxo de devolução/cancelamento.
        }

        $imeiUnit->last_moved_at = now();
        $imeiUnit->save();

        return $imeiUnit;
    }

    /**
     * Bloqueia (reserva) a unidade. Usado por carrinho/PDV ou transferência pendente.
     */
    public function lock(ImeiUnit $imeiUnit): ImeiUnit
    {
        if (in_array($imeiUnit->status, [self::STATUS_SOLD, self::STATUS_LOST, self::STATUS_DEFECTIVE], true)) {
            throw new DomainException('Cannot lock IMEI in final state.');
        }

        if ($imeiUnit->locked_at === null) {
            $imeiUnit->locked_at = now();
            if ($imeiUnit->status === self::STATUS_AVAILABLE) {
                $imeiUnit->status = self::STATUS_RESERVED;
            }
            $imeiUnit->save();
        }

        return $imeiUnit;
    }

    /**
     * Desbloqueia (remove reserva) da unidade.
     */
    public function unlock(ImeiUnit $imeiUnit): ImeiUnit
    {
        if ($imeiUnit->status === self::STATUS_SOLD) {
            throw new DomainException('Cannot unlock a sold IMEI.');
        }

        $imeiUnit->locked_at = null;
        if ($imeiUnit->status === self::STATUS_RESERVED) {
            $imeiUnit->status = self::STATUS_AVAILABLE;
        }
        $imeiUnit->save();

        return $imeiUnit;
    }

    private function resolveProduct(array $data): array
    {
        $product = null;
        $variant = null;

        if (isset($data['produto_variacao_id'])) {
            $variant = ProdutoVariacao::findOrFail($data['produto_variacao_id']);
            $product = $variant->produto;
        } elseif (isset($data['produto_id'])) {
            $product = Produto::findOrFail($data['produto_id']);
        } else {
            throw new DomainException('Produto ou variação não informado para o IMEI.');
        }

        return [$product, $variant];
    }

    private function assertTrackingCompatibility(Produto $product, array $data): void
    {
        $tracking = $product->tracking_type ?? Produto::TRACKING_TYPE_NONE;

        if ($tracking === Produto::TRACKING_TYPE_NONE) {
            throw new DomainException('Produto sem rastreamento não aceita IMEI/Série.');
        }

        if ($tracking === Produto::TRACKING_TYPE_IMEI && empty($data['imei'])) {
            throw new DomainException('IMEI obrigatório para produto com tracking_type=imei.');
        }

        if ($tracking === Produto::TRACKING_TYPE_SERIAL && empty($data['serial_number'])) {
            throw new DomainException('Número de série obrigatório para produto com tracking_type=serial.');
        }

        if ($tracking === Produto::TRACKING_TYPE_VARIANT && empty($data['produto_variacao_id'])) {
            // No modelo atual, amarramos IMEI à variação quando tracking_type=variant.
            throw new DomainException('Variação obrigatória para produtos com grade.');
        }
    }

    private function assertUniqueness(array $data): void
    {
        $empresaId = $data['empresa_id'] ?? null;

        if (!empty($data['imei'])) {
            $query = ImeiUnit::withTrashed()->where('imei', $data['imei']);
            if ($empresaId !== null) {
                $query->where('empresa_id', $empresaId);
            }
            if ($query->exists()) {
                throw new DomainException('IMEI já cadastrado.');
            }
        }

        if (!empty($data['serial_number'])) {
            $query = ImeiUnit::withTrashed()->where('serial_number', $data['serial_number']);
            if ($empresaId !== null) {
                $query->where('empresa_id', $empresaId);
            }
            if ($query->exists()) {
                throw new DomainException('Número de série já cadastrado.');
            }
        }
    }

    private function normalizePayload(?Produto $product, ?ProdutoVariacao $variant, array $data): array
    {
        $payload = array_merge([
            'produto_id' => $product?->id,
            'produto_variacao_id' => $variant?->id,
            'status' => self::STATUS_AVAILABLE,
            'locked_at' => null,
            'sold_at' => null,
            'last_moved_at' => null,
            // Campos legados exigidos pela tabela produto_unicos.
            'codigo' => $data['imei'] ?? $data['serial_number'] ?? Str::uuid()->toString(),
            'tipo' => $data['tipo'] ?? 'entrada',
            'em_estoque' => $data['em_estoque'] ?? true,
        ], $data);

        return Arr::except($payload, ['variants']);
    }
}
