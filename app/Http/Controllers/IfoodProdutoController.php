<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Utils\IfoodUtil;
use App\Models\IfoodConfig;
use App\Models\Produto;
use App\Models\CategoriaProdutoIfood;

class IfoodProdutoController extends Controller
{

    protected $util;

    public function __construct(IfoodUtil $util)
    {
        $this->util = $util;
    }

    public function index(Request $request){
        $config = IfoodConfig::
        where('empresa_id', $request->empresa_id)
        ->first();

        if($config == null){
            session()->flash("flash_error", "Configure o App");
            return redirect()->route('ifood-config.index');
        }

        if($config->catalogId == ""){
            session()->flash("flash_error", "Defina o catalogo!");
            return redirect()->route('ifood-catalogos.index');
        }

        $this->getProdutosIfood($config);

        $data = Produto::where('empresa_id', $request->empresa_id)
        ->where('ifood_id', '!=', null)
        ->paginate(env("PAGINACAO"));

    }

    private function getProdutosIfood($config){

        $categorias = $this->util->getCategories($config);
        foreach($categorias as $c){
            CategoriaProdutoIfood::updateOrCreate([
                'empresa_id' => $config->empresa_id,
                'ifood_id' => $c->id,
                'nome' => $c->name,
                'status' => $c->status

            ]);
        }
    }
}
