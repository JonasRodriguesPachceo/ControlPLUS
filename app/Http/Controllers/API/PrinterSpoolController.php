<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\PrinterSpoolItemResource;
use App\Models\PrinterSpoolItem;
use App\Services\Printing\LabelPrintSpoolService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class PrinterSpoolController extends Controller
{
    public function index(Request $request): JsonResponse
    {
        $query = PrinterSpoolItem::query()->with(['jobItem.imeiUnit', 'printer']);

        if ($status = $request->get('status')) {
            $query->where('status', $status);
        }

        if ($printerId = $request->get('printer_id')) {
            $query->where('printer_id', $printerId);
        }

        if ($empresaId = $request->get('empresa_id')) {
            $query->whereHas('printer', function ($q) use ($empresaId) {
                $q->where('empresa_id', $empresaId);
            });
        }

        if ($from = $request->get('from')) {
            $query->whereDate('created_at', '>=', $from);
        }

        if ($to = $request->get('to')) {
            $query->whereDate('created_at', '<=', $to);
        }

        if ($imei = $request->get('imei')) {
            $query->whereHas('jobItem.imeiUnit', function ($q) use ($imei) {
                $q->where('imei', 'like', '%' . $imei . '%')
                    ->orWhere('serial_number', 'like', '%' . $imei . '%');
            });
        }

        $items = $query->orderByDesc('created_at')->paginate($request->get('per_page', 15));

        return response()->json(PrinterSpoolItemResource::collection($items));
    }

    public function show(PrinterSpoolItem $spoolItem): JsonResponse
    {
        $spoolItem->load(['printer', 'jobItem.imeiUnit', 'jobItem.job']);

        return response()->json(new PrinterSpoolItemResource($spoolItem));
    }

    public function retry(PrinterSpoolItem $spoolItem, LabelPrintSpoolService $spoolService): JsonResponse
    {
        if ($spoolItem->status !== PrinterSpoolItem::STATUS_FAILED) {
            return response()->json(['message' => 'Somente itens com status failed podem ser reenviados.'], 422);
        }

        $spoolItem = $spoolService->requeueFailed($spoolItem);

        return response()->json(new PrinterSpoolItemResource($spoolItem));
    }
}
