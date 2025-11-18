<?php

declare(strict_types=1);

namespace App\Http\Controllers\API\Printing;

use App\Http\Controllers\Controller;
use App\Http\Requests\Printing\StorePrinterRequest;
use App\Http\Requests\Printing\UpdatePrinterRequest;
use App\Http\Resources\PrinterResource;
use App\Models\Printer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class PrinterController extends Controller
{
    public function index(Request $request): JsonResponse
    {
        $query = Printer::query();

        if ($active = $request->get('active')) {
            $query->where('active', filter_var($active, FILTER_VALIDATE_BOOLEAN));
        }

        if ($driver = $request->get('driver')) {
            $query->where('driver', $driver);
        }

        if ($empresaId = $request->get('empresa_id')) {
            $query->where('empresa_id', $empresaId);
        }

        if ($filialId = $request->get('filial_id')) {
            $query->where('localizacao_id', $filialId);
        }

        $printers = $query->orderBy('name')->paginate($request->get('per_page', 15));

        return response()->json(PrinterResource::collection($printers));
    }

    public function store(StorePrinterRequest $request): JsonResponse
    {
        $data = $request->validated();

        $printer = Printer::create($data);

        if (!empty($data['is_default'])) {
            Printer::where('id', '!=', $printer->id)
                ->where('empresa_id', $printer->empresa_id)
                ->where('localizacao_id', $printer->localizacao_id)
                ->update(['is_default' => false]);
        }

        return response()->json(new PrinterResource($printer), 201);
    }

    public function show(Printer $printer): JsonResponse
    {
        return response()->json(new PrinterResource($printer));
    }

    public function update(UpdatePrinterRequest $request, Printer $printer): JsonResponse
    {
        $data = $request->validated();

        $printer->update($data);

        if (!empty($data['is_default'])) {
            Printer::where('id', '!=', $printer->id)
                ->where('empresa_id', $printer->empresa_id)
                ->where('localizacao_id', $printer->localizacao_id)
                ->update(['is_default' => false]);
        }

        return response()->json(new PrinterResource($printer));
    }

    public function destroy(Printer $printer): JsonResponse
    {
        $printer->update([
            'active' => false,
            'is_default' => false,
        ]);

        return response()->json(new PrinterResource($printer));
    }
}
