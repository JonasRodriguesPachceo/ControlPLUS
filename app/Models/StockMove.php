<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class StockMove extends Model
{
    use HasFactory;
    use SoftDeletes;

    /**
     * Registro de movimentação de estoque (entrada, saída, transferência, devolução, ajuste).
     */
    protected $fillable = [
        'empresa_id',
        'warehouse_from_id',
        'warehouse_to_id',
        'move_type',
        'source_type',
        'source_id',
        'reference',
        'description',
        'executed_at',
    ];

    protected $casts = [
        'executed_at' => 'datetime',
    ];

    public function items(): HasMany
    {
        return $this->hasMany(StockMoveImei::class, 'stock_move_id');
    }

    public function imeiUnits(): BelongsToMany
    {
        return $this->belongsToMany(ImeiUnit::class, 'stock_move_imeis', 'stock_move_id', 'imei_unit_id')
            ->withPivot(['quantity', 'previous_status', 'new_status'])
            ->withTimestamps();
    }

    public function empresa(): BelongsTo
    {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }

    public function warehouseFrom(): BelongsTo
    {
        return $this->belongsTo(Localizacao::class, 'warehouse_from_id');
    }

    public function warehouseTo(): BelongsTo
    {
        return $this->belongsTo(Localizacao::class, 'warehouse_to_id');
    }
}
