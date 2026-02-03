@extends('layouts.app', ['title' => 'Produtos Trade-in'])
@php
    use Illuminate\Support\Facades\Auth;
@endphp

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center flex-wrap">
                    <h4 class="card-title mb-0">Produtos Trade-in pendentes</h4>
                    <a href="{{ route('produtos.create') }}" class="btn btn-success btn-sm mt-2 mt-md-0">
                        <i class="ri-add-circle-line"></i> Novo Produto
                    </a>
                </div>
                <div class="card-body border-top">
                    <form class="row gy-2 gx-2 align-items-end" method="get"
                        action="{{ route('produtos.avaliacao.index') }}">
                        <input type="hidden" name="empresa_id"
                            value="{{ request()->empresa_id ?? Auth::user()->empresa_id }}">
                        <div class="col-md-4">
                            <label class="form-label">Buscar</label>
                            <input type="text" name="nome" class="form-control" value="{{ $nome ?? '' }}"
                                placeholder="Nome, código ou referência">
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-primary w-100" type="submit">
                                <i class="ri-search-line"></i> Filtrar
                            </button>
                        </div>
                        <div class="col-md-2">
                            <a href="{{ route('produtos.avaliacao.index') }}" class="btn btn-light w-100">
                                Limpar
                            </a>
                        </div>
                    </form>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped mb-0">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Códigos/Referência</th>
                                <th>Localizações</th>
                                <th>Data de cadastro</th>
                                <th>Usuário</th>
                                <th class="text-end">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($data as $item)
                                <tr>
                                    <td>{{ $item->nome }}</td>
                                    <td>
                                        <div><small>Barra:</small> {{ $item->codigo_barras ?: '--' }}</div>
                                        <div><small>Ref.:</small> {{ $item->referencia ?: '--' }}</div>
                                    </td>
                                    <td>
                                        @php
                                            $locais = $item->estoqueLocais
                                                ->map(function ($estoque) {
                                                    return optional($estoque->local)->nome;
                                                })
                                                ->filter()
                                                ->unique()
                                                ->values();
                                        @endphp
                                        @if ($locais->count())
                                            @foreach ($locais as $local)
                                                <span class="badge bg-secondary me-1 mb-1">{{ $local }}</span>
                                            @endforeach
                                        @else
                                            --
                                        @endif
                                    </td>
                                    <td>{{ $item->created_at ? $item->created_at->format('d/m/Y H:i') : '--' }}</td>
                                    <td>--</td>
                                    <td class="text-end">
                                        @if($item->status_avaliacao === \App\Models\Produto::STATUS_AVALIACAO_PENDENTE)
                                            <form class="d-inline" method="post" action="{{ route('produtos.avaliacao.reject', $item->id) }}">
                                                @csrf
                                                @method('PUT')
                                                <input type="hidden" name="empresa_id" value="{{ request()->empresa_id ?? Auth::user()->empresa_id }}">
                                                <button type="submit" class="btn btn-danger btn-sm"
                                                    onclick="return confirm('Reprovar este trade-in?');">
                                                    Reprovar
                                                </button>
                                            </form>
                                            <a href="{{ route('produtos.avaliacao.edit', $item->id) }}"
                                                class="btn btn-primary btn-sm">
                                                Trade-in
                                            </a>
                                        @else
                                            <a href="{{ route('produtos.avaliacao.edit', $item->id) }}"
                                                class="btn btn-primary btn-sm">
                                                Trade-in
                                            </a>
                                        @endif
                                        <a href="{{ route('produtos.edit', $item->id) }}"
                                            class="btn btn-outline-secondary btn-sm">
                                            Editar cadastro
                                        </a>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="text-center py-4">Nenhum produto trade-in pendente.</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                    {{ $data->appends(request()->all())->links() }}
                </div>
            </div>
        </div>
    </div>
@endsection
