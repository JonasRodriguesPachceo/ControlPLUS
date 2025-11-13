<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ImpressoraPedido;
use App\Models\ItemPedido;
use App\Models\ItemPedidoDelivery;

class ImpressaoPedidoController extends Controller
{
    public function index(Request $request){
        $item = ImpressoraPedido::findOrFail($request->impressora_id);

        $data = ItemPedido::
        join('pedidos', 'pedidos.id', '=', 'item_pedidos.pedido_id')
        ->select('item_pedidos.*')
        ->where('pedidos.empresa_id', $item->empresa_id)
        ->where('item_pedidos.impresso', 0)
        ->whereDate('item_pedidos.created_at', date('Y-m-d'))
        ->join('produtos', 'produtos.id', '=', 'item_pedidos.produto_id')
        ->join('impressora_pedido_produtos', 'impressora_pedido_produtos.produto_id', '=', 'produtos.id')
        ->groupBy('item_pedidos.id')
        ->get();

        $itens = "";
        if(sizeof($data) > 0){
            $itemPedido = $data[0];

            $str = "";
            foreach($data as $key => $i){
                if($key == 0){
                    $itens .= "item_id[]=$i->id&pedido_comanda_id=$itemPedido->pedido_id";

                    $str .= " ----- " . number_format($i->quantidade,0)."x ".$i->produto->nome;
                }
                if($itemPedido->pedido_id == $i->pedido_id && $key > 0){
                    $itens .= "&item_id[]=$i->id";

                    $str .= " | " . number_format($i->quantidade,0)."x ".$i->produto->nome;
                }
            }

            $retorno = [
                'log' => "<p class='text-primary'>Impimindo itens da comanda #".$itemPedido->pedido->comanda. " $str" ."</p>",
                'itens' => $itens,
            ];
            return response()->json($retorno, 200);
        }

        // agora delivery

        $data = ItemPedidoDelivery::
        join('pedido_deliveries', 'pedido_deliveries.id', '=', 'item_pedido_deliveries.pedido_id')
        ->select('item_pedido_deliveries.*')
        ->where('pedido_deliveries.empresa_id', $item->empresa_id)
        ->where('item_pedido_deliveries.impresso', 0)
        ->where('pedido_deliveries.estado', 'aprovado')
        ->whereDate('item_pedido_deliveries.created_at', date('Y-m-d'))
        ->join('produtos', 'produtos.id', '=', 'item_pedido_deliveries.produto_id')
        ->join('impressora_pedido_produtos', 'impressora_pedido_produtos.produto_id', '=', 'produtos.id')
        ->where('impressora_pedido_produtos.impressora_id', $item->id)
        ->groupBy('item_pedido_deliveries.id')
        ->get();

        $itens = "";

        if(sizeof($data) > 0){
            $itemPedido = $data[0];

            $str = "";
            foreach($data as $key => $i){
                if($key == 0){
                    $itens .= "item_id[]=$i->id&pedido_delivery_id=$itemPedido->pedido_id";

                    $str .= " ----- " . number_format($i->quantidade,0)."x ".$i->produto->nome;
                }
                if($itemPedido->pedido_id == $i->pedido_id && $key > 0){
                    $itens .= "&item_id[]=$i->id";

                    $str .= " | " . number_format($i->quantidade,0)."x ".$i->produto->nome;
                }
            }

            $retorno = [
                'log' => "<p class='text-primary'>Impimindo itens delivery #".$itemPedido->pedido->numero_sequencial. " $str" ."</p>",
                'itens' => $itens,
            ];
            return response()->json($retorno, 200);
        }
        return response()->json([], 200);
    }
}
