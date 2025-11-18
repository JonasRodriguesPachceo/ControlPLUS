<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PrinterSpoolItem extends Model
{
    use HasFactory;

    public const STATUS_QUEUED = 'queued';
    public const STATUS_SENDING = 'sending';
    public const STATUS_SENT = 'sent';
    public const STATUS_PRINTED = 'printed';
    public const STATUS_FAILED = 'failed';

    protected $fillable = [
        'label_print_job_item_id',
        'printer_id',
        'status',
        'payload',
        'attempts',
        'last_error',
        'last_attempt_at',
        'printed_at',
    ];

    protected $casts = [
        'payload' => 'array',
        'last_attempt_at' => 'datetime',
        'printed_at' => 'datetime',
    ];

    public function jobItem(): BelongsTo
    {
        return $this->belongsTo(LabelPrintJobItem::class, 'label_print_job_item_id');
    }

    public function printer(): BelongsTo
    {
        return $this->belongsTo(Printer::class, 'printer_id');
    }
}
