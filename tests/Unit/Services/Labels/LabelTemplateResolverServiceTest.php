<?php

declare(strict_types=1);

namespace Tests\Unit\Services\Labels;

use App\Models\LabelTemplate;
use App\Services\Labels\LabelTemplateResolverService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\Empresa;

class LabelTemplateResolverServiceTest extends TestCase
{
    use RefreshDatabase;

    public function test_resolve_prefers_exact_company_and_branch(): void
    {
        $empresa = Empresa::create([
            'nome' => 'Empresa',
            'cpf_cnpj' => '00000000000000',
            'ambiente' => 1,
            'tributacao' => 'MEI',
            'observacao_padrao_nfe' => '',
            'observacao_padrao_nfce' => '',
            'mensagem_aproveitamento_credito' => '',
            'status' => 1,
            'perc_ap_cred' => 0,
        ]);

        $global = LabelTemplate::factory()->create([
            'empresa_id' => null,
            'filial_id' => null,
            'is_default' => true,
            'type' => 'imei_label',
        ]);

        $companyOnly = LabelTemplate::factory()->create([
            'empresa_id' => $empresa->id,
            'filial_id' => null,
            'is_default' => true,
            'type' => 'imei_label',
        ]);

        $exact = LabelTemplate::factory()->create([
            'empresa_id' => $empresa->id,
            'filial_id' => 2,
            'is_default' => true,
            'type' => 'imei_label',
        ]);

        $resolver = $this->app->make(LabelTemplateResolverService::class);

        $imeiUnit = new \App\Models\ImeiUnit([
            'empresa_id' => $empresa->id,
            'localizacao_id' => 2,
        ]);

        $result = $resolver->resolveForImei($imeiUnit, 'imei_label');

        $this->assertEquals($exact->id, $result->id);

        $imeiUnit->localizacao_id = 99;
        $resultCompany = $resolver->resolveForImei($imeiUnit, 'imei_label');
        $this->assertEquals($companyOnly->id, $resultCompany->id);

        $imeiUnit->empresa_id = 99;
        $resultGlobal = $resolver->resolveForImei($imeiUnit, 'imei_label');
        $this->assertEquals($global->id, $resultGlobal->id);
    }

    public function test_resolver_returns_null_when_inactive(): void
    {
        $empresa = Empresa::create([
            'nome' => 'Empresa',
            'cpf_cnpj' => '00000000000000',
            'ambiente' => 1,
            'tributacao' => 'MEI',
            'observacao_padrao_nfe' => '',
            'observacao_padrao_nfce' => '',
            'mensagem_aproveitamento_credito' => '',
            'status' => 1,
            'perc_ap_cred' => 0,
        ]);

        LabelTemplate::factory()->create([
            'empresa_id' => 1,
            'filial_id' => null,
            'is_default' => true,
            'type' => 'imei_label',
            'active' => false,
        ]);

        $resolver = $this->app->make(LabelTemplateResolverService::class);
        $imeiUnit = new \App\Models\ImeiUnit([
            'empresa_id' => $empresa->id,
            'localizacao_id' => null,
        ]);

        $this->assertNull($resolver->resolveForImei($imeiUnit, 'imei_label'));
    }
}
