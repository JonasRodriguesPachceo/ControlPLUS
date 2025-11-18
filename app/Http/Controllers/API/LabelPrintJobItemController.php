<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\LabelPrintJobItemResource;
use App\Models\LabelPrintJob;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class LabelPrintJobItemController extends Controller
{
    public function index(LabelPrintJob $job, Request $request): JsonResponse
    {
        $query = $job->items()->with(['imeiUnit']);

        if ($status = $request->get('status')) {
            $query->where('status', $status);
        }

        if ($imei = $request->get('imei')) {
            $query->whereHas('imeiUnit', function ($q) use ($imei) {
                $q->where('imei', 'like', '%' . $imei . '%');
            });
        }

        $items = $query->orderByDesc('id')->paginate($request->get('per_page', 15));

        return response()->json(LabelPrintJobItemResource::collection($items));
    }
}
