<?php

declare(strict_types=1);

namespace App\Services\Reports;

use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class LabelPrintingReportService
{
    public function getSummaryByDay(array $filters = []): Collection
    {
        $query = DB::table('label_print_jobs')
            ->selectRaw('date(requested_at) as date')
            ->selectRaw('count(*) as total_jobs')
            ->selectRaw("sum(case when status = 'done' then 1 else 0 end) as jobs_done")
            ->selectRaw("sum(case when status = 'failed' then 1 else 0 end) as jobs_failed")
            ->selectRaw('(select count(*) from label_print_job_items i where i.label_print_job_id = label_print_jobs.id) as total_items')
            ->selectRaw("(select count(*) from label_print_job_items i where i.label_print_job_id = label_print_jobs.id and i.status = 'done') as items_done")
            ->selectRaw("(select count(*) from label_print_job_items i where i.label_print_job_id = label_print_jobs.id and i.status = 'failed') as items_failed")
            ->selectRaw('avg(strftime("%s", processed_at) - strftime("%s", requested_at)) as avg_job_duration_seconds')
            ->groupBy('date');

        if (!empty($filters['empresa_id'])) {
            $query->where('empresa_id', $filters['empresa_id']);
        }
        if (!empty($filters['filial_id'])) {
            $query->where('filial_id', $filters['filial_id']);
        }
        if (!empty($filters['from'])) {
            $query->whereDate('requested_at', '>=', $filters['from']);
        }
        if (!empty($filters['to'])) {
            $query->whereDate('requested_at', '<=', $filters['to']);
        }

        return collect($query->get());
    }

    public function getSummaryByPrinter(array $filters = []): Collection
    {
        $query = DB::table('printer_spool_items as psi')
            ->select('psi.printer_id', 'p.name as printer_name', 'p.localizacao_id as filial_id', 'p.driver')
            ->selectRaw('count(*) as spool_count')
            ->selectRaw("sum(case when psi.status = 'printed' then 1 else 0 end) as spool_printed")
            ->selectRaw("sum(case when psi.status = 'failed' then 1 else 0 end) as spool_failed")
            ->selectRaw('avg(psi.attempts) as avg_attempts')
            ->selectRaw('max(psi.printed_at) as last_printed_at')
            ->leftJoin('printers as p', 'p.id', '=', 'psi.printer_id')
            ->groupBy('psi.printer_id', 'p.name', 'p.localizacao_id', 'p.driver');

        if (!empty($filters['empresa_id'])) {
            $query->where('p.empresa_id', $filters['empresa_id']);
        }
        if (!empty($filters['filial_id'])) {
            $query->where('p.localizacao_id', $filters['filial_id']);
        }
        if (!empty($filters['from'])) {
            $query->whereDate('psi.created_at', '>=', $filters['from']);
        }
        if (!empty($filters['to'])) {
            $query->whereDate('psi.created_at', '<=', $filters['to']);
        }
        if (!empty($filters['printer_id'])) {
            $query->where('psi.printer_id', $filters['printer_id']);
        }

        return collect($query->get());
    }

    public function getUserReprintActivity(array $filters = []): Collection
    {
        $query = DB::table('label_print_jobs')
            ->select('requested_by')
            ->selectRaw('count(*) as total_reprints')
            ->where('source', 'reprint')
            ->groupBy('requested_by');

        if (!empty($filters['empresa_id'])) {
            $query->where('empresa_id', $filters['empresa_id']);
        }
        if (!empty($filters['filial_id'])) {
            $query->where('filial_id', $filters['filial_id']);
        }
        if (!empty($filters['from'])) {
            $query->whereDate('requested_at', '>=', $filters['from']);
        }
        if (!empty($filters['to'])) {
            $query->whereDate('requested_at', '<=', $filters['to']);
        }
        if (!empty($filters['user_id'])) {
            $query->where('requested_by', $filters['user_id']);
        }

        return collect($query->get());
    }
}
