<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreStockEntryRequest;
use App\Http\Resources\StockMoveResource;
use App\Services\StockEntryService;

class StockEntryController extends Controller
{
    public function store(StoreStockEntryRequest $request, StockEntryService $service): StockMoveResource
    {
        $move = $service->createEntry($request->validated());

        return new StockMoveResource($move);
    }
}
