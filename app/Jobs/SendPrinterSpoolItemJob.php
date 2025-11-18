<?php

declare(strict_types=1);

namespace App\Jobs;

use App\Models\PrinterSpoolItem;
use App\Services\Printing\LabelPrintSpoolService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class SendPrinterSpoolItemJob implements ShouldQueue
{
    use Dispatchable;
    use InteractsWithQueue;
    use Queueable;
    use SerializesModels;

    public $tries = 3;
    public $backoff = 30;

    public function __construct(public PrinterSpoolItem $spoolItem)
    {
        $this->onQueue('printing');
    }

    public function handle(LabelPrintSpoolService $spoolService): void
    {
        $item = $this->spoolItem->fresh()->loadMissing('printer');
        if ($item->status !== PrinterSpoolItem::STATUS_QUEUED) {
            return;
        }

        $spoolService->sendToPrinter($item);
    }
}
