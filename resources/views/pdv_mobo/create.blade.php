@extends('pdv_mobo.default', 
['title' => 'Nova Venda' ])
@section('content')

<!-- {!!Form::open()
->post()
->route('frontbox.store')->id('form-pdv')
!!} -->
<div class="pl-lg-4">
    @include('pdv_mobo._forms')
</div>
<!-- {!!Form::close()!!} -->

@endsection
@section('js')
<script type="text/javascript" src="/js/pdv_mobo.js"></script>
@endsection
