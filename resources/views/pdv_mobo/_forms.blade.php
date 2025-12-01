
<div class="pdv-header d-flex align-items-center">
    <button class="btn btn-link p-0 me-3" id="btn-menu">
        <i class="ri-menu-line"></i>
    </button>
    <h4>{{ env("APP_NAME") }} PDV</h4>
</div>

<div class="px-3">
    <div class="pdv-categorias">
        @foreach($categorias as $c)
        <button class="pdv-cat">{{ $c->nome }}</button>
        @endforeach
    </div>
</div>

<div class="pdv-produtos-container">
    <div class="row g-1">

        @foreach($produtos as $p)
        <div class="col-4">
            <div class="pdv-card">
                <img src="{{ $p->img ?? '/noimg.png' }}">
                <div class="pdv-card-title">{{ $p->nome }}</div>
                <div class="pdv-card-price">R$ {{ __moeda($p->valor_unitario) }}</div>
            </div>
        </div>
        @endforeach

    </div>
</div>


<div class="pdv-footer">
    <div class="d-flex align-items-center">
        <i class="ri-user-line fs-4 me-2"></i>
        <div>
            <strong id="clienteNome">Cliente não selecionado</strong><br>
            <small id="limparCliente" class="text-muted" style="cursor:pointer">Selecionar</small>
        </div>
    </div>

    <button class="pdv-total-btn" id="btnTotal">R$ 0,00 →</button>
</div>
