<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class StockMoveImei extends Model
{
    use HasFactory;

    protected $table = 'stock_move_imeis';

    protected $fillable = [
        'stock_move_id',
        'imei_unit_id',
        'quantity',
        'previous_status',
        'new_status',
    ];

    public function move(): BelongsTo
    {
        return $this->belongsTo(StockMove::class, 'stock_move_id');
    }

    public function imeiUnit(): BelongsTo
    {
        return $this->belongsTo(ImeiUnit::class, 'imei_unit_id');
    }
}
