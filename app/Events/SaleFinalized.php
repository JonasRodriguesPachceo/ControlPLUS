<?php

declare(strict_types=1);

namespace App\Events;

use App\Models\PreVenda;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Collection;

class SaleFinalized
{
    use Dispatchable;
    use SerializesModels;

    /**
     * @param Collection<int, \App\Models\ImeiUnit> $imeiUnits
     */
    public function __construct(public PreVenda $sale, public Collection $imeiUnits)
    {
    }
}
