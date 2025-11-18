<?php

declare(strict_types=1);

namespace App\Events;

use App\Models\ImeiUnit;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class IMEIStatusChanged
{
    use Dispatchable;
    use SerializesModels;

    public function __construct(
        public ImeiUnit $imeiUnit,
        public string $oldStatus,
        public string $newStatus,
        public ?array $meta = null
    ) {
    }
}
