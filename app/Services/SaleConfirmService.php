<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\ImeiUnit;
use App\Models\ItemPreVenda;
use App\Models\PreVenda;
use App\Models\PreVendaItemImei;
use App\Models\StockMove;
use App\Models\Produto;
use App\Events\SaleFinalized;
use App\Events\StockMoved;
use DomainException;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class SaleConfirmService
{
    public function __construct(private readonly ImeiUnitService $imeiService)
    {
    }

    /**
     * Confirma venda (PreVenda) associando IMEIs obrigatórios e gerando movimento de estoque (sale).
     */
    public function confirmSaleWithImeis(PreVenda $sale, array $data): PreVenda
    {
        return DB::transaction(function () use ($sale, $data): PreVenda {
            $sale->loadMissing(['itens.produto', 'itens.produtoVariacao']);

            $itemMap = collect($data['items'])->keyBy('sale_item_id');

            $this->validateItems($sale, $itemMap);

            $stockMove = StockMove::create([
                'empresa_id' => $sale->empresa_id,
                'warehouse_from_id' => $sale->local_id,
                'warehouse_to_id' => null,
                'move_type' => 'sale',
                'source_type' => 'pre_venda',
                'source_id' => $sale->id,
                'reference' => $data['reference'] ?? null,
                'description' => $data['description'] ?? ('Venda PDV #' . $sale->id),
                'executed_at' => $data['executed_at'] ?? now(),
            ]);

            foreach ($sale->itens as $item) {
                $payload = $itemMap->get($item->id);
                if (!$payload) {
                    continue;
                }

                $imeiIds = $payload['imei_unit_ids'];
                $imeis = $this->loadImeis($imeiIds);

                $this->validateImeisForItem($sale, $item, $imeis);

                foreach ($imeis as $imei) {
                    if ($imei->locked_at === null) {
                        $this->imeiService->lock($imei);
                    }
                    $this->imeiService->changeStatus($imei, ImeiUnitService::STATUS_SOLD, [
                        'sale_id' => $sale->id,
                    ]);

                    $stockMove->items()->create([
                        'imei_unit_id' => $imei->id,
                        'quantity' => 1,
                        'previous_status' => ImeiUnitService::STATUS_AVAILABLE,
                        'new_status' => ImeiUnitService::STATUS_SOLD,
                    ]);

                    PreVendaItemImei::create([
                        'item_pre_venda_id' => $item->id,
                        'imei_unit_id' => $imei->id,
                    ]);
                }
            }

            $sale->status = 1; // confirmado - ajuste conforme status real.
            $sale->save();

            $soldImeis = PreVendaItemImei::whereIn('item_pre_venda_id', $sale->itens->pluck('id'))
                ->with('imeiUnit')
                ->get()
                ->pluck('imeiUnit');

            event(new StockMoved($stockMove, $soldImeis));
            event(new SaleFinalized($sale, $soldImeis));

            return $sale->load(['itens.imeiUnits']);
        });
    }

    private function validateItems(PreVenda $sale, Collection $itemMap): void
    {
        foreach ($sale->itens as $item) {
            $tracking = $item->produto->tracking_type ?? 'none';
            if (in_array($tracking, [Produto::TRACKING_TYPE_IMEI, Produto::TRACKING_TYPE_SERIAL, Produto::TRACKING_TYPE_VARIANT], true)) {
                if (!$itemMap->has($item->id)) {
                    throw new DomainException("Item {$item->id} requer IMEIs para confirmar a venda.");
                }

                $payload = $itemMap->get($item->id);
                if (count($payload['imei_unit_ids']) !== (int) $item->quantidade) {
                    throw new DomainException("Item {$item->id} deve ter quantidade de IMEIs igual à quantidade do item.");
                }
            }
        }
    }

    private function loadImeis(array $ids): Collection
    {
        $imeis = ImeiUnit::whereIn('id', $ids)->lockForUpdate()->get();
        if ($imeis->count() !== count($ids)) {
            throw new DomainException('Algum IMEI informado não foi encontrado.');
        }

        return $imeis;
    }

    private function validateImeisForItem(PreVenda $sale, ItemPreVenda $item, Collection $imeis): void
    {
        foreach ($imeis as $imei) {
            if ($imei->status !== ImeiUnitService::STATUS_AVAILABLE && $imei->status !== ImeiUnitService::STATUS_RESERVED) {
                throw new DomainException('IMEI deve estar disponível ou reservado para venda.');
            }
            if ((int) $imei->empresa_id !== (int) $sale->empresa_id) {
                throw new DomainException('IMEI pertence a outra empresa.');
            }
            if ((int) $imei->warehouse_id !== (int) $sale->local_id) {
                throw new DomainException('IMEI não está no depósito/PDV da venda.');
            }
            if ((int) $imei->produto_id !== (int) $item->produto_id) {
                throw new DomainException('IMEI não corresponde ao produto do item.');
            }
            if ($item->variacao_id && (int) $imei->produto_variacao_id !== (int) $item->variacao_id) {
                throw new DomainException('IMEI não corresponde à variação do item.');
            }
        }
    }
}
