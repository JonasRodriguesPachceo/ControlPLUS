<?php

declare(strict_types=1);

namespace App\Services\Printing;

use App\Models\Printer;

class PrinterResolverService
{
    public function resolveDefaultLabelPrinter(?int $empresaId, ?int $filialId): ?Printer
    {
        $printer = Printer::active()
            ->where('is_default', true)
            ->forCompanyBranch($empresaId, $filialId)
            ->first();

        if ($printer) {
            return $printer;
        }

        $printer = Printer::active()
            ->where('is_default', true)
            ->where('empresa_id', $empresaId)
            ->whereNull('localizacao_id')
            ->first();

        if ($printer) {
            return $printer;
        }

        return Printer::active()
            ->where('is_default', true)
            ->whereNull('empresa_id')
            ->whereNull('localizacao_id')
            ->first();
    }
}
