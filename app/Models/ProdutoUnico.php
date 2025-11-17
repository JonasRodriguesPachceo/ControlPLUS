<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProdutoUnico extends Model
{
    use HasFactory;

    /**
     * Tracked unit (IMEI/serial) tied to a product or variant.
     */
    protected $fillable = [
        'nfe_id',
        'nfce_id',
        'empresa_id',
        'localizacao_id',
        'produto_id',
        'produto_variacao_id',
        'codigo',
        'observacao',
        'tipo',
        'em_estoque',
        'imei',
        'serial_number',
        'status',
    ];

    public function nfe()
    {
        return $this->belongsTo(Nfe::class, 'nfe_id');
    }

    public function nfce()
    {
        return $this->belongsTo(Nfce::class, 'nfce_id');
    }

    public function produto()
    {
        return $this->belongsTo(Produto::class, 'produto_id');
    }

    public function variacao()
    {
        return $this->belongsTo(ProdutoVariacao::class, 'produto_variacao_id');
    }

    public function localizacao()
    {
        return $this->belongsTo(Localizacao::class, 'localizacao_id');
    }
}
