@extends('layouts.app', ['title' => 'Avaliar Produto'])

@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center flex-wrap">
                <div>
                    <h4 class="card-title mb-1">Avaliação do produto</h4>
                    <small class="text-muted">{{ $item->nome }}</small>
                </div>
                <div class="d-flex gap-2 mt-2 mt-md-0">
                    <a href="{{ route('produtos.avaliacao.index') }}" class="btn btn-light btn-sm">
                        <i class="ri-arrow-left-line"></i> Voltar
                    </a>
                    <a href="{{ route('produtos.edit', $item->id) }}" class="btn btn-outline-secondary btn-sm">
                        Editar cadastro
                    </a>
                </div>
            </div>
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-md-4">
                        <h6 class="text-muted text-uppercase fs-12 mt-0">Código de barras</h6>
                        <p class="mb-0">{{ $item->codigo_barras ?: '—' }}</p>
                    </div>
                    <div class="col-md-4">
                        <h6 class="text-muted text-uppercase fs-12 mt-0">Referência</h6>
                        <p class="mb-0">{{ $item->referencia ?: '—' }}</p>
                    </div>
                    <div class="col-md-4">
                        <h6 class="text-muted text-uppercase fs-12 mt-0">Valor de venda</h6>
                        <p class="mb-0">R$ {{ __moeda($item->valor_unitario) }}</p>
                    </div>
                </div>

                <form action="{{ route('produtos.avaliacao.update', $item->id) }}" method="post">
                    @csrf
                    @method('PUT')
                    <input type="hidden" name="empresa_id" value="{{ request()->empresa_id ?? $item->empresa_id }}">
                    <div class="form-check form-switch mb-3">
                        <input type="checkbox" class="form-check-input" id="avaliacao_concluida" name="avaliacao_concluida" value="1">
                        <label class="form-check-label" for="avaliacao_concluida">Avaliação concluída</label>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="avaliacao_observacao">Observações da avaliação</label>
                        <textarea name="avaliacao_observacao" id="avaliacao_observacao" rows="4" class="form-control">{{ old('avaliacao_observacao', $item->avaliacao_observacao) }}</textarea>
                        @error('avaliacao_observacao')
                        <p class="text-danger mb-0">{{ $message }}</p>
                        @enderror
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-primary">
                            <i class="ri-check-line"></i> Salvar avaliação
                        </button>
                        <a href="{{ route('produtos.avaliacao.index') }}" class="btn btn-light">
                            Cancelar
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
