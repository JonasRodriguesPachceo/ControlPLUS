<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\ConfirmSaleWithImeisRequest;
use App\Http\Requests\ReturnSaleRequest;
use App\Http\Requests\CancelSaleRequest;
use App\Models\PreVenda;
use App\Services\SaleConfirmService;
use App\Services\SaleReverseService;
use Illuminate\Http\JsonResponse;

class SaleImeisController extends Controller
{
    public function confirm(ConfirmSaleWithImeisRequest $request, PreVenda $sale, SaleConfirmService $service): JsonResponse
    {
        $sale = $service->confirmSaleWithImeis($sale, $request->validated());

        return response()->json($sale->load('itens.imeiUnits'));
    }

    public function returnSale(ReturnSaleRequest $request, PreVenda $sale, SaleReverseService $service): JsonResponse
    {
        $sale = $service->returnSale($sale, $request->validated());

        return response()->json($sale->load('itens.imeiUnits'));
    }

    public function cancel(CancelSaleRequest $request, PreVenda $sale, SaleReverseService $service): JsonResponse
    {
        $sale = $service->cancelSale($sale, $request->validated());

        return response()->json($sale->load('itens.imeiUnits'));
    }
}
