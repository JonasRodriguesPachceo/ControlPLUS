<?php

declare(strict_types=1);

namespace App\Http\Controllers\API\Reports;

use App\Http\Controllers\Controller;
use App\Services\Reports\LabelPrintingReportService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class LabelPrintingReportController extends Controller
{
    public function __construct(private readonly LabelPrintingReportService $reportService)
    {
    }

    public function summaryByDay(Request $request): JsonResponse
    {
        $filters = $request->only(['empresa_id', 'filial_id', 'from', 'to']);
        $data = $this->reportService->getSummaryByDay($filters);

        return response()->json(['data' => $data]);
    }

    public function summaryByPrinter(Request $request): JsonResponse
    {
        $filters = $request->only(['empresa_id', 'filial_id', 'from', 'to', 'printer_id']);
        $data = $this->reportService->getSummaryByPrinter($filters);

        return response()->json(['data' => $data]);
    }

    public function userReprints(Request $request): JsonResponse
    {
        $filters = $request->only(['empresa_id', 'filial_id', 'from', 'to', 'user_id']);
        $data = $this->reportService->getUserReprintActivity($filters);

        return response()->json(['data' => $data]);
    }
}
