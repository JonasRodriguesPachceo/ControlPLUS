<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Empresa;
use App\Models\CategoriaProduto;
use App\Models\Produto;

class PdvMoboController extends Controller
{
    public function index(Request $request){

        $config = Empresa::findOrFail(request()->empresa_id);
        if($config == null){
            session()->flash("flash_warning", "Configure antes de continuar!");
            return redirect()->route('config.index');
        }

        if (!__isCaixaAberto()) {
            session()->flash("flash_warning", "Abrir caixa antes de continuar!");
            return redirect()->route('caixa.create');
        }

        $caixa = __isCaixaAberto();
        $categorias = CategoriaProduto::where('empresa_id', request()->empresa_id)->where('status', 1)
        ->where('categoria_id', null)
        ->get();

        $produtos = Produto::where('empresa_id', $request->empresa_id)
        ->select('id', 'numero_sequencial', 'codigo_barras', 'referencia', 'referencia_balanca', 'valor_unitario', 'nome', 'categoria_id', 
            'imagem', 'gerenciar_estoque', 'valor_atacado', 'valor_minimo_venda', 'quantidade_atacado')
        ->where('status', 1)->orderBy('nome')
        ->limit(25)->get();

        return view('pdv_mobo.create', compact('config', 'categorias', 'caixa', 'produtos'));
    }
}
