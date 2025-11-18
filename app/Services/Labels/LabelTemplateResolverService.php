<?php

declare(strict_types=1);

namespace App\Services\Labels;

use App\Models\ImeiUnit;
use App\Models\LabelTemplate;

class LabelTemplateResolverService
{
    public function resolveForImei(ImeiUnit $imeiUnit, string $type = 'imei_label'): ?LabelTemplate
    {
        $empresaId = $imeiUnit->empresa_id;
        $filialId = $imeiUnit->localizacao_id ?? null;

        $template = LabelTemplate::active()
            ->where('type', $type)
            ->where('empresa_id', $empresaId)
            ->where('filial_id', $filialId)
            ->where('is_default', true)
            ->first();

        if ($template) {
            return $template;
        }

        $template = LabelTemplate::active()
            ->where('type', $type)
            ->where('empresa_id', $empresaId)
            ->whereNull('filial_id')
            ->where('is_default', true)
            ->first();

        if ($template) {
            return $template;
        }

        return LabelTemplate::active()
            ->where('type', $type)
            ->whereNull('empresa_id')
            ->whereNull('filial_id')
            ->where('is_default', true)
            ->first();
    }
}
