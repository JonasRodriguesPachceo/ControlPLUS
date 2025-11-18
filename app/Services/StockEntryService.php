<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\Produto;
use App\Models\ProdutoVariacao;
use App\Models\StockMove;
use App\Events\StockMoved;
use App\Services\Labels\LabelPrintQueueService;
use DomainException;
use Illuminate\Support\Facades\DB;

class StockEntryService
{
    private ImeiUnitService $imeiUnitService;
    private LabelPrintQueueService $labelPrintQueueService;

    public function __construct(
        ImeiUnitService $imeiUnitService,
        LabelPrintQueueService $labelPrintQueueService
    )
    {
        $this->imeiUnitService = $imeiUnitService;
        $this->labelPrintQueueService = $labelPrintQueueService;
    }

    /**
     * Cria uma entrada de estoque (move_type=entry) com IMEIs/Séries.
     * Futuras fases (2.5+) plugarão aprovação, etiquetas e workflows adicionais.
     */
    public function createEntry(array $data): StockMove
    {
        [$stockMove, $imeis] = DB::transaction(function () use ($data): array {
            [$product, $variant] = $this->resolveProduct($data);

            $this->assertProductSupportsTracking($product);

            $stockMove = StockMove::create([
                'empresa_id' => $data['empresa_id'] ?? $product->empresa_id,
                'warehouse_from_id' => null,
                'warehouse_to_id' => $data['warehouse_id'],
                'move_type' => 'entry',
                'source_type' => $data['source_type'] ?? null,
                'source_id' => $data['source_id'] ?? null,
                'reference' => $data['reference'] ?? null,
                'description' => $data['description'] ?? null,
                'executed_at' => $data['executed_at'] ?? now(),
            ]);

            $context = [
                'empresa_id' => $data['empresa_id'] ?? $product->empresa_id,
                'localizacao_id' => $data['warehouse_id'],
                'warehouse_id' => $data['warehouse_id'],
                'origin_type' => $data['source_type'] ?? 'stock_entry',
                'origin_id' => $stockMove->id,
            ];

            $imeis = $this->imeiUnitService->createManyForEntry(
                $variant ?? $product,
                $data['items'],
                $context
            );

            foreach ($imeis as $imeiUnit) {
                $stockMove->items()->create([
                    'imei_unit_id' => $imeiUnit->id,
                    'quantity' => 1,
                    'previous_status' => null,
                    'new_status' => $imeiUnit->status,
                ]);
            }

            event(new StockMoved($stockMove, $imeis));

            return [$stockMove->load(['items.imeiUnit', 'imeiUnits']), $imeis];
        });

        $this->labelPrintQueueService->enqueueForImeis($imeis, auth()->user());

        return $stockMove;
    }

    private function resolveProduct(array $data): array
    {
        $product = null;
        $variant = null;

        if (!empty($data['product_variant_id'])) {
            $variant = ProdutoVariacao::findOrFail($data['product_variant_id']);
            $product = $variant->produto;
        } elseif (!empty($data['product_id'])) {
            $product = Produto::findOrFail($data['product_id']);
        } else {
            throw new DomainException('Produto ou variação é obrigatório para entrada.');
        }

        return [$product, $variant];
    }

    private function assertProductSupportsTracking(Produto $product): void
    {
        if ($product->tracking_type === Produto::TRACKING_TYPE_NONE) {
            throw new DomainException('Produto sem rastreamento não aceita entrada de IMEI/Série.');
        }
    }
}
