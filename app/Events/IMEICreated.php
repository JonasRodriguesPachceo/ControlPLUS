<?php

declare(strict_types=1);

namespace App\Events;

use App\Models\ImeiUnit;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class IMEICreated
{
    use Dispatchable;
    use SerializesModels;

    public function __construct(public ImeiUnit $imeiUnit)
    {
    }
}
