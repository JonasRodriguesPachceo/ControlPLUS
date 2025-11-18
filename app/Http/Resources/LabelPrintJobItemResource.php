<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LabelPrintJobItemResource extends JsonResource
{
    /**
     * @mixin \App\Models\LabelPrintJobItem
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'label_print_job_id' => $this->label_print_job_id,
            'imei_unit_id' => $this->imei_unit_id,
            'quantity' => $this->quantity,
            'status' => $this->status,
            'error_message' => $this->error_message,
            'imei' => $this->imeiUnit?->imei,
            'serial_number' => $this->imeiUnit?->serial_number,
            'spool_status' => $this->spoolItem?->status ?? null,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
