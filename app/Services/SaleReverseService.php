<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\ImeiUnit;
use App\Models\ItemPreVenda;
use App\Models\PreVenda;
use App\Models\PreVendaItemImei;
use App\Models\Produto;
use App\Models\StockMove;
use App\Events\SaleCanceled;
use App\Events\SaleReturned;
use App\Events\StockMoved;
use DomainException;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class SaleReverseService
{
    public function __construct(private readonly ImeiUnitService $imeiService)
    {
    }

    /**
     * Devolução de venda: devolve IMEIs ao estoque (available ou in_repair) e registra stock_move return.
     */
    public function returnSale(PreVenda $sale, array $data): PreVenda
    {
        return DB::transaction(function () use ($sale, $data): PreVenda {
            $sale->load(['itens.imeiUnits', 'itens.produto', 'itens.produtoVariacao']);

            $itemPayload = collect($data['items'])->keyBy('sale_item_id');

            $this->assertItemsBelongToSale($sale, $itemPayload->keys()->all());

            $stockMove = StockMove::create([
                'empresa_id' => $sale->empresa_id,
                'warehouse_from_id' => null,
                'warehouse_to_id' => $data['warehouse_id'],
                'move_type' => 'return',
                'source_type' => 'sale_return',
                'source_id' => $sale->id,
                'reference' => $data['reference'] ?? null,
                'description' => $data['description'] ?? 'Devolução de venda',
                'executed_at' => $data['executed_at'] ?? now(),
            ]);

            foreach ($itemPayload as $saleItemId => $payload) {
                $item = $sale->itens->firstWhere('id', $saleItemId);
                if (!$item) {
                    continue;
                }

                $imeis = $this->loadImeis($payload['imei_unit_ids']);
                $this->assertImeisBelongToSaleItem($item, $imeis);

                $newStatus = !empty($payload['to_repair']) ? ImeiUnitService::STATUS_IN_REPAIR : ImeiUnitService::STATUS_AVAILABLE;
                $reason = $payload['return_reason'] ?? null;

                foreach ($imeis as $imei) {
                    if (!in_array($imei->status, [ImeiUnitService::STATUS_SOLD, ImeiUnitService::STATUS_IN_REPAIR], true)) {
                        throw new DomainException('IMEI deve estar vendido para ser devolvido.');
                    }

                    $this->imeiService->changeStatus($imei, $newStatus, [
                        'sale_id' => $sale->id,
                        'reason' => $reason,
                    ]);
                    $imei->warehouse_id = $data['warehouse_id'];
                    $imei->save();

                    $stockMove->items()->create([
                        'imei_unit_id' => $imei->id,
                        'quantity' => 1,
                        'previous_status' => ImeiUnitService::STATUS_SOLD,
                        'new_status' => $newStatus,
                    ]);
                }
            }

            // Flag de devolução (ajuste conforme modelo do projeto).
            $sale->status = 2;
            $sale->save();

            $returnedImeis = PreVendaItemImei::whereIn('item_pre_venda_id', $sale->itens->pluck('id'))
                ->with('imeiUnit')
                ->get()
                ->pluck('imeiUnit');

            event(new StockMoved($stockMove, $returnedImeis));
            event(new SaleReturned($sale, $returnedImeis));

            return $sale->load('itens.imeiUnits');
        });
    }

    /**
     * Cancelamento: reverte IMEIs para available e registra stock_move cancel.
     */
    public function cancelSale(PreVenda $sale, array $data): PreVenda
    {
        return DB::transaction(function () use ($sale, $data): PreVenda {
            $sale->load(['itens.imeiUnits', 'itens.produto', 'itens.produtoVariacao']);

            $imeis = $this->resolveImeisForCancel($sale, $data);

            $stockMove = StockMove::create([
                'empresa_id' => $sale->empresa_id,
                'warehouse_from_id' => null,
                'warehouse_to_id' => $data['warehouse_id'],
                'move_type' => 'cancel',
                'source_type' => 'sale_cancel',
                'source_id' => $sale->id,
                'reference' => $data['reference'] ?? null,
                'description' => $data['description'] ?? $data['reason'] ?? 'Cancelamento de venda',
                'executed_at' => $data['executed_at'] ?? now(),
            ]);

            foreach ($imeis as $imei) {
                if (!in_array($imei->status, [ImeiUnitService::STATUS_SOLD, ImeiUnitService::STATUS_RESERVED], true)) {
                    throw new DomainException('IMEI não está em estado cancelável.');
                }

                $previous = $imei->status;
                $this->imeiService->changeStatus($imei, ImeiUnitService::STATUS_AVAILABLE, [
                    'sale_id' => $sale->id,
                    'reason' => $data['reason'] ?? 'cancel',
                ]);
                $imei->warehouse_id = $data['warehouse_id'];
                $imei->save();

                $stockMove->items()->create([
                    'imei_unit_id' => $imei->id,
                    'quantity' => 1,
                    'previous_status' => $previous,
                    'new_status' => ImeiUnitService::STATUS_AVAILABLE,
                ]);
            }

            $sale->status = -1;
            $sale->save();

            $canceledImeis = PreVendaItemImei::whereIn('item_pre_venda_id', $sale->itens->pluck('id'))
                ->with('imeiUnit')
                ->get()
                ->pluck('imeiUnit');

            event(new StockMoved($stockMove, $canceledImeis));
            event(new SaleCanceled($sale, $canceledImeis));

            return $sale->load('itens.imeiUnits');
        });
    }

    private function assertItemsBelongToSale(PreVenda $sale, array $itemIds): void
    {
        foreach ($itemIds as $id) {
            if (!$sale->itens->firstWhere('id', $id)) {
                throw new DomainException("Item {$id} não pertence a esta venda.");
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

    private function assertImeisBelongToSaleItem(ItemPreVenda $item, Collection $imeis): void
    {
        foreach ($imeis as $imei) {
            $exists = PreVendaItemImei::where('item_pre_venda_id', $item->id)
                ->where('imei_unit_id', $imei->id)
                ->exists();
            if (!$exists) {
                throw new DomainException("IMEI {$imei->id} não pertence ao item {$item->id}.");
            }

            if ((int) $imei->produto_id !== (int) $item->produto_id) {
                throw new DomainException('IMEI não corresponde ao produto do item.');
            }
            if ($item->variacao_id && (int) $imei->produto_variacao_id !== (int) $item->variacao_id) {
                throw new DomainException('IMEI não corresponde à variação do item.');
            }
        }
    }

    private function resolveImeisForCancel(PreVenda $sale, array $data): Collection
    {
        if (!empty($data['cancel_all'])) {
            return PreVendaItemImei::whereIn('item_pre_venda_id', $sale->itens->pluck('id'))
                ->with('imeiUnit')
                ->get()
                ->pluck('imeiUnit');
        }

        if (empty($data['items'])) {
            throw new DomainException('Informe IMEIs para cancelamento parcial ou use cancel_all.');
        }

        $itemPayload = collect($data['items'])->keyBy('sale_item_id');
        $this->assertItemsBelongToSale($sale, $itemPayload->keys()->all());

        $imeis = collect();
        foreach ($itemPayload as $saleItemId => $payload) {
            $item = $sale->itens->firstWhere('id', $saleItemId);
            $itemImeis = $this->loadImeis($payload['imei_unit_ids']);
            $this->assertImeisBelongToSaleItem($item, $itemImeis);
            $imeis = $imeis->merge($itemImeis);
        }

        return $imeis;
    }
}
