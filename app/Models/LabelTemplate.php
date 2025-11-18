<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Builder;

class LabelTemplate extends Model
{
    use HasFactory;

    protected $fillable = [
        'empresa_id',
        'filial_id',
        'code',
        'name',
        'type',
        'is_default',
        'config',
        'active',
    ];

    protected $casts = [
        'config' => 'array',
        'is_default' => 'boolean',
        'active' => 'boolean',
    ];

    public function empresa(): BelongsTo
    {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }

    public function scopeForCompanyBranchType(Builder $query, ?int $empresaId, ?int $filialId, string $type): Builder
    {
        return $query->where(function (Builder $q) use ($empresaId, $filialId) {
            $q->where('empresa_id', $empresaId)->where('filial_id', $filialId);
        })->where('type', $type);
    }

    public function scopeActive(Builder $query): Builder
    {
        return $query->where('active', true);
    }
}
