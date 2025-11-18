<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PreVendaItemImei extends Model
{
    use HasFactory;

    protected $fillable = [
        'item_pre_venda_id',
        'imei_unit_id',
    ];

    public function item(): BelongsTo
    {
        return $this->belongsTo(ItemPreVenda::class, 'item_pre_venda_id');
    }

    public function imeiUnit(): BelongsTo
    {
        return $this->belongsTo(ImeiUnit::class, 'imei_unit_id');
    }
}
