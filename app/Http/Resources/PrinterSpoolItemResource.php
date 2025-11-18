<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PrinterSpoolItemResource extends JsonResource
{
    /**
     * @mixin \App\Models\PrinterSpoolItem
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'label_print_job_item_id' => $this->label_print_job_item_id,
            'printer_id' => $this->printer_id,
            'status' => $this->status,
            'attempts' => $this->attempts,
            'last_error' => $this->last_error,
            'last_attempt_at' => $this->last_attempt_at,
            'printed_at' => $this->printed_at,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'imei_unit_id' => $this->jobItem?->imei_unit_id,
            'imei' => $this->jobItem?->imeiUnit?->imei,
        ];
    }
}
