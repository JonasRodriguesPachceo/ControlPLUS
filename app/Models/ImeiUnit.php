<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class ImeiUnit extends Model
{
    use HasFactory;
    use SoftDeletes;

    /**
     * Physical tracked unit (IMEI/serial). Status/state transitions will be coordinated
     * by an ImeiUnitService and movement state machine in later phases.
     */
    protected $table = 'produto_unicos';

    protected $fillable = [
        'empresa_id',
        'localizacao_id',
        'warehouse_id',
        'produto_id',
        'produto_variacao_id',
        'codigo',
        'observacao',
        'tipo',
        'em_estoque',
        'imei',
        'serial_number',
        'status',
        'origin_type',
        'origin_id',
        'locked_at',
        'sold_at',
        'last_moved_at',
        'label_barcode_value',
        'label_qr_value',
        'label_version',
        'label_last_generated_at',
    ];

    protected $casts = [
        'locked_at' => 'datetime',
        'sold_at' => 'datetime',
        'last_moved_at' => 'datetime',
        'label_last_generated_at' => 'datetime',
    ];

    public function produto(): BelongsTo
    {
        return $this->belongsTo(Produto::class, 'produto_id');
    }

    public function variacao(): BelongsTo
    {
        return $this->belongsTo(ProdutoVariacao::class, 'produto_variacao_id');
    }

    public function warehouse(): BelongsTo
    {
        return $this->belongsTo(Localizacao::class, 'warehouse_id');
    }

    public function localizacao(): BelongsTo
    {
        return $this->belongsTo(Localizacao::class, 'localizacao_id');
    }

    public function stockMoveItems()
    {
        return $this->hasMany(StockMoveImei::class, 'imei_unit_id');
    }

    public function stockMoves()
    {
        return $this->belongsToMany(StockMove::class, 'stock_move_imeis', 'imei_unit_id', 'stock_move_id')
            ->withPivot(['quantity', 'previous_status', 'new_status'])
            ->withTimestamps();
    }

    public function labelPrintItems()
    {
        return $this->hasMany(LabelPrintJobItem::class, 'imei_unit_id');
    }
}
