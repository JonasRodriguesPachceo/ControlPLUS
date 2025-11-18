<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ImeiUnit;
use App\Services\Labels\LabelPrintQueueService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class LabelPrintController extends Controller
{
    public function reprintImeiLabel(ImeiUnit $imeiUnit, Request $request, LabelPrintQueueService $queueService): JsonResponse
    {
        $job = $queueService->enqueueSingleLabel($imeiUnit, $request->user());

        return response()->json([
            'data' => [
                'job_id' => $job->id,
                'status' => $job->status,
            ],
        ]);
    }
}
