<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use App\Models\Tradein;
use Dompdf\Dompdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TradeinController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:ordem_servico_edit', ['only' => ['index', 'edit', 'update']]);
        $this->middleware('permission:pdv_edit', ['only' => ['storeWeb']]);
    }

    public function index(Request $request)
    {
        $tradeins = Tradein::where('empresa_id', $request->empresa_id)
            ->whereIn('status', [Tradein::STATUS_SUBMITTED, Tradein::STATUS_IN_REVIEW, Tradein::STATUS_COMPLETED])
            ->orderBy('created_at', 'desc')
            ->paginate(__itensPagina());

        $clienteIds = $tradeins->pluck('cliente_id')->filter()->unique()->values();
        $clientes = $clienteIds->isEmpty()
            ? collect()
            : Cliente::whereIn('id', $clienteIds)->pluck('razao_social', 'id');

        return view('tradein.index', compact('tradeins', 'clientes'));
    }

    public function edit(Request $request, $id)
    {
        $tradein = Tradein::where('empresa_id', $request->empresa_id)->findOrFail($id);
        __validaObjetoEmpresa($tradein);

        if ($tradein->status === Tradein::STATUS_SUBMITTED) {
            $tradein->status = Tradein::STATUS_IN_REVIEW;
            $tradein->assigned_to_user_id = Auth::id();
            $tradein->save();
        }

        $cliente = $tradein->cliente_id ? Cliente::find($tradein->cliente_id) : null;

        return view('tradein.form', compact('tradein', 'cliente'));
    }

    public function update(Request $request, $id)
    {
        $tradein = Tradein::where('empresa_id', $request->empresa_id)->findOrFail($id);
        __validaObjetoEmpresa($tradein);

        $concluir = $request->has('concluir_avaliacao');

        $rules = [
            'check_tela_ok' => 'nullable|boolean',
            'check_bateria_ok' => 'nullable|boolean',
            'check_carregamento_ok' => 'nullable|boolean',
            'check_botoes_ok' => 'nullable|boolean',
            'check_camera_ok' => 'nullable|boolean',
            'observacao_tecnico' => 'nullable|string',
            'valor_avaliado' => $concluir ? 'required|numeric|min:0.01' : 'nullable|numeric|min:0',
        ];
        $request->validate($rules);

        $tradein->check_tela_ok = $request->has('check_tela_ok') ? 1 : null;
        $tradein->check_bateria_ok = $request->has('check_bateria_ok') ? 1 : null;
        $tradein->check_carregamento_ok = $request->has('check_carregamento_ok') ? 1 : null;
        $tradein->check_botoes_ok = $request->has('check_botoes_ok') ? 1 : null;
        $tradein->check_camera_ok = $request->has('check_camera_ok') ? 1 : null;
        $tradein->observacao_tecnico = $request->observacao_tecnico;
        $tradein->valor_avaliado = $request->valor_avaliado ? __convert_value_bd($request->valor_avaliado) : null;

        if ($concluir) {
            $tradein->status = Tradein::STATUS_COMPLETED;
            $tradein->avaliado_em = now();
        } elseif ($tradein->status !== Tradein::STATUS_COMPLETED) {
            $tradein->status = Tradein::STATUS_IN_REVIEW;
        }

        if (!$tradein->assigned_to_user_id) {
            $tradein->assigned_to_user_id = Auth::id();
        }

        $tradein->save();

        session()->flash('flash_success', 'Avaliacao atualizada.');
        return redirect()->route('tradein.edit', ['id' => $tradein->id, 'empresa_id' => $request->empresa_id]);
    }

    public function start(Request $request, $id)
    {
        $tradein = Tradein::findOrFail($id);
        __validaObjetoEmpresa($tradein);

        if ($tradein->status === Tradein::STATUS_COMPLETED || $tradein->status === Tradein::STATUS_CANCELLED) {
            session()->flash('flash_warning', 'Trade-in não pode ser iniciado.');
            return redirect()->route('tradein.index');
        }

        $tradein->status = Tradein::STATUS_IN_REVIEW;
        $tradein->assigned_to_user_id = Auth::id();
        $tradein->save();

        session()->flash('flash_success', 'Trade-in iniciado.');
        return redirect()->route('tradein.edit', $tradein->id);
    }

    public function complete(Request $request, $id)
    {
        $tradein = Tradein::findOrFail($id);
        __validaObjetoEmpresa($tradein);

        if ($tradein->status !== Tradein::STATUS_IN_REVIEW) {
            session()->flash('flash_warning', 'Trade-in deve estar em análise para concluir.');
            return redirect()->route('tradein.edit', $tradein->id);
        }

        $request->validate([
            'valor_avaliado' => 'required',
        ]);

        $tradein->check_tela_ok = $request->check_tela_ok;
        $tradein->check_bateria_ok = $request->check_bateria_ok;
        $tradein->check_carregamento_ok = $request->check_carregamento_ok;
        $tradein->check_botoes_ok = $request->check_botoes_ok;
        $tradein->check_camera_ok = $request->check_camera_ok;
        $tradein->observacao_tecnico = $request->observacao_tecnico;
        $tradein->valor_avaliado = __convert_value_bd($request->valor_avaliado);
        $tradein->avaliado_em = now();
        $tradein->status = Tradein::STATUS_COMPLETED;
        $tradein->save();

        session()->flash('flash_success', 'Trade-in concluído.');
        return redirect()->route('tradein.index');
    }

    public function termoPdf(Request $request, $id)
    {
        $tradein = Tradein::findOrFail($id);
        __validaObjetoEmpresa($tradein);

        $html = view('tradein.termo', compact('tradein'));

        $domPdf = new Dompdf(['enable_remote' => true]);
        $domPdf->loadHtml($html);
        $domPdf->render();

        return $domPdf->stream("Termo Trade-in #{$tradein->id}.pdf", ['Attachment' => false]);
    }

    public function storeWeb(Request $request)
    {
        $request->validate([
            'empresa_id' => 'required|integer',
            'cliente_id' => 'required|integer',
            'nome_item' => 'required|string|max:255',
            'serial_number' => 'nullable|string|max:120',
            'valor_pretendido' => 'nullable',
            'observacao' => 'nullable|string',
        ]);

        $tradein = Tradein::create([
            'empresa_id' => $request->empresa_id,
            'cliente_id' => $request->cliente_id,
            'created_by_user_id' => Auth::id(),
            'status' => Tradein::STATUS_SUBMITTED,
            'nome_item' => $request->nome_item,
            'serial_number' => $request->serial_number,
            'valor_pretendido' => $request->valor_pretendido ? __convert_value_bd($request->valor_pretendido) : null,
            'observacao_vendedor' => $request->observacao,
        ]);

        return response()->json([
            'id' => $tradein->id,
            'status' => $tradein->status,
        ], 201);
    }
}
