<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LabelPrintJobItem extends Model
{
    use HasFactory;

    public const STATUS_PENDING = 'pending';
    public const STATUS_PROCESSING = 'processing';
    public const STATUS_DONE = 'done';
    public const STATUS_FAILED = 'failed';

    protected $fillable = [
        'label_print_job_id',
        'imei_unit_id',
        'quantity',
        'status',
        'error_message',
    ];

    public function job(): BelongsTo
    {
        return $this->belongsTo(LabelPrintJob::class, 'label_print_job_id');
    }

    public function imeiUnit(): BelongsTo
    {
        return $this->belongsTo(ImeiUnit::class, 'imei_unit_id');
    }
}
