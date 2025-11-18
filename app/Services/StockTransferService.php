<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\ImeiUnit;
use App\Models\StockMove;
use App\Events\StockMoved;
use DomainException;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;

class StockTransferService
{
    public function __construct(private readonly ImeiUnitService $imeiService)
    {
    }

    /**
     * Etapa de saída: bloqueia IMEIs na origem e cria movimento transfer_out.
     */
    public function transferOut(array $data): StockMove
    {
        return DB::transaction(function () use ($data): StockMove {
            $imeis = $this->loadImeis($data['imei_unit_ids']);

            $this->assertTransferOutEligibility($imeis, $data['warehouse_from_id']);

            foreach ($imeis as $imei) {
                $this->imeiService->lock($imei);
                $this->imeiService->changeStatus($imei, ImeiUnitService::STATUS_IN_TRANSFER);
            }

            $move = StockMove::create([
                'empresa_id' => $data['empresa_id'] ?? null,
                'warehouse_from_id' => $data['warehouse_from_id'],
                'warehouse_to_id' => $data['warehouse_to_id'],
                'move_type' => 'transfer_out',
                'source_type' => $data['source_type'] ?? 'transfer',
                'source_id' => $data['source_id'] ?? null,
                'reference' => $data['reference'] ?? null,
                'description' => $data['description'] ?? null,
                'executed_at' => $data['executed_at'] ?? now(),
            ]);

            foreach ($imeis as $imei) {
                $move->items()->create([
                    'imei_unit_id' => $imei->id,
                    'quantity' => 1,
                    'previous_status' => ImeiUnitService::STATUS_AVAILABLE,
                    'new_status' => ImeiUnitService::STATUS_IN_TRANSFER,
                ]);
            }

            event(new StockMoved($move, $imeis));

            return $move->load(['items.imeiUnit', 'imeiUnits']);
        });
    }

    /**
     * Etapa de entrada: libera IMEIs no destino, cria movimento transfer_in e atualiza depósito/status.
     */
    public function transferIn(array $data): StockMove
    {
        return DB::transaction(function () use ($data): StockMove {
            $imeis = $this->loadImeis($data['imei_unit_ids']);

            $this->assertTransferInEligibility($imeis, $data['warehouse_from_id']);

            $move = StockMove::create([
                'empresa_id' => $data['empresa_id'] ?? null,
                'warehouse_from_id' => $data['warehouse_from_id'],
                'warehouse_to_id' => $data['warehouse_to_id'],
                'move_type' => 'transfer_in',
                'source_type' => $data['source_type'] ?? 'transfer',
                'source_id' => $data['source_id'] ?? null,
                'reference' => $data['reference'] ?? null,
                'description' => $data['description'] ?? null,
                'executed_at' => $data['executed_at'] ?? now(),
            ]);

            foreach ($imeis as $imei) {
                $this->imeiService->unlock($imei);
                $this->imeiService->changeStatus($imei, ImeiUnitService::STATUS_AVAILABLE);
                $imei->warehouse_id = $data['warehouse_to_id'];
                $imei->save();

                $move->items()->create([
                    'imei_unit_id' => $imei->id,
                    'quantity' => 1,
                    'previous_status' => ImeiUnitService::STATUS_IN_TRANSFER,
                    'new_status' => ImeiUnitService::STATUS_AVAILABLE,
                ]);
            }

            event(new StockMoved($move, $imeis));

            return $move->load(['items.imeiUnit', 'imeiUnits']);
        });
    }

    private function loadImeis(array $ids): Collection
    {
        $imeis = ImeiUnit::whereIn('id', $ids)->lockForUpdate()->get();
        if ($imeis->count() !== count($ids)) {
            throw new DomainException('Algum IMEI não foi encontrado.');
        }

        return $imeis;
    }

    private function assertTransferOutEligibility(Collection $imeis, int $warehouseFromId): void
    {
        foreach ($imeis as $imei) {
            if ((int) $imei->warehouse_id !== $warehouseFromId) {
                throw new DomainException('IMEI não pertence ao depósito de origem.');
            }
            if ($imei->status !== ImeiUnitService::STATUS_AVAILABLE) {
                throw new DomainException('IMEI deve estar disponível para saída de transferência.');
            }
            if ($imei->locked_at !== null) {
                throw new DomainException('IMEI já está bloqueado.');
            }
            if (in_array($imei->status, [ImeiUnitService::STATUS_SOLD, ImeiUnitService::STATUS_LOST, ImeiUnitService::STATUS_DEFECTIVE], true)) {
                throw new DomainException('IMEI em estado final não pode ser transferido.');
            }
        }
    }

    private function assertTransferInEligibility(Collection $imeis, int $warehouseFromId): void
    {
        foreach ($imeis as $imei) {
            if ($imei->status !== ImeiUnitService::STATUS_IN_TRANSFER) {
                throw new DomainException('IMEI deve estar em transferência para entrar no destino.');
            }
            if ((int) $imei->warehouse_id !== $warehouseFromId) {
                throw new DomainException('IMEI não corresponde ao depósito de origem informado.');
            }
        }
    }
}
