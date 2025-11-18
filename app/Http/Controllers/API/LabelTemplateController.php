<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\LabelTemplateResource;
use App\Models\LabelTemplate;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class LabelTemplateController extends Controller
{
    public function index(Request $request): JsonResponse
    {
        $query = LabelTemplate::query();

        if ($empresaId = $request->get('empresa_id')) {
            $query->where('empresa_id', $empresaId);
        }

        if ($filialId = $request->get('filial_id')) {
            $query->where('filial_id', $filialId);
        }

        if ($type = $request->get('type')) {
            $query->where('type', $type);
        }

        if ($active = $request->get('active')) {
            $query->where('active', filter_var($active, FILTER_VALIDATE_BOOLEAN));
        }

        $templates = $query->orderBy('name')->paginate($request->get('per_page', 15));

        return response()->json(LabelTemplateResource::collection($templates));
    }

    public function setDefault(LabelTemplate $template): JsonResponse
    {
        LabelTemplate::where('empresa_id', $template->empresa_id)
            ->where('filial_id', $template->filial_id)
            ->where('type', $template->type)
            ->update(['is_default' => false]);

        $template->update(['is_default' => true]);

        return response()->json(new LabelTemplateResource($template));
    }
}
