<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreTransferInRequest;
use App\Http\Requests\StoreTransferOutRequest;
use App\Http\Resources\StockMoveResource;
use App\Services\StockTransferService;

class StockTransferController extends Controller
{
    public function transferOut(StoreTransferOutRequest $request, StockTransferService $service): StockMoveResource
    {
        $move = $service->transferOut($request->validated());

        return new StockMoveResource($move);
    }

    public function transferIn(StoreTransferInRequest $request, StockTransferService $service): StockMoveResource
    {
        $move = $service->transferIn($request->validated());

        return new StockMoveResource($move);
    }
}
