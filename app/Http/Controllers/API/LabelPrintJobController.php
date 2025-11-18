<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\LabelPrintJobResource;
use App\Models\LabelPrintJob;
use App\Services\Labels\LabelPrintQueueService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class LabelPrintJobController extends Controller
{
    public function index(Request $request): JsonResponse
    {
        $query = LabelPrintJob::query()
            ->withCount([
                'items as items_done_count' => fn ($q) => $q->where('status', 'done'),
                'items as items_failed_count' => fn ($q) => $q->where('status', 'failed'),
            ]);

        if ($status = $request->get('status')) {
            $query->where('status', $status);
        }

        if ($type = $request->get('type')) {
            $query->where('type', $type);
        }

        if ($empresaId = $request->get('empresa_id')) {
            $query->where('empresa_id', $empresaId);
        }

        if ($filialId = $request->get('filial_id')) {
            $query->where('filial_id', $filialId);
        }

        if ($from = $request->get('from')) {
            $query->whereDate('requested_at', '>=', $from);
        }

        if ($to = $request->get('to')) {
            $query->whereDate('requested_at', '<=', $to);
        }

        if ($requestedBy = $request->get('requested_by')) {
            $query->where('requested_by', $requestedBy);
        }

        if ($imei = $request->get('imei')) {
            $query->whereHas('items.imeiUnit', function ($q) use ($imei) {
                $q->where('imei', 'like', '%' . $imei . '%')
                    ->orWhere('serial_number', 'like', '%' . $imei . '%');
            });
        }

        $jobs = $query->orderByDesc('requested_at')->paginate($request->get('per_page', 15));

        return response()->json(LabelPrintJobResource::collection($jobs));
    }

    public function show(LabelPrintJob $job): JsonResponse
    {
        $job->load([
            'items.imeiUnit',
            'items.spoolItem',
        ]);

        return response()->json(new LabelPrintJobResource($job));
    }

    public function retry(LabelPrintJob $job, LabelPrintQueueService $queueService): JsonResponse
    {
        $job = $queueService->requeueJob($job);

        return response()->json(new LabelPrintJobResource($job));
    }
}
