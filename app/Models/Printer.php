<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Printer extends Model
{
    use HasFactory;

    protected $fillable = [
        'empresa_id',
        'localizacao_id',
        'name',
        'code',
        'driver',
        'connection_config',
        'is_default',
        'active',
    ];

    protected $casts = [
        'connection_config' => 'array',
        'is_default' => 'boolean',
        'active' => 'boolean',
    ];

    public function empresa(): BelongsTo
    {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }

    public function localizacao(): BelongsTo
    {
        return $this->belongsTo(Localizacao::class, 'localizacao_id');
    }

    public function spoolItems(): HasMany
    {
        return $this->hasMany(PrinterSpoolItem::class, 'printer_id');
    }

    public function scopeForCompanyBranch($query, ?int $empresaId, ?int $filialId)
    {
        return $query->where('empresa_id', $empresaId)
            ->when($filialId !== null, fn ($q) => $q->where('localizacao_id', $filialId));
    }

    public function scopeActive($query)
    {
        return $query->where('active', true);
    }
}
