<?php

declare(strict_types=1);

namespace App\Events;

use App\Models\StockMove;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Collection;

class StockMoved
{
    use Dispatchable;
    use SerializesModels;

    /**
     * @param Collection<int, \App\Models\ImeiUnit> $imeiUnits
     */
    public function __construct(public StockMove $stockMove, public Collection $imeiUnits)
    {
    }
}
