@extends('layouts.header_auth', ['title' => 'Login'])

@section('content')

@php
$login = (isset($_COOKIE['ckLogin'])) ? base64_decode($_COOKIE['ckLogin']) : '';
$pass = (isset($_COOKIE['ckPass'])) ? base64_decode($_COOKIE['ckPass']) : '';
$remember = (isset($_COOKIE['ckRemember'])) ? ($_COOKIE['ckRemember']) : '';
@endphp

@section('css')
<style type="text/css">
    img 
    {
        display: block; 
    }
    .mt-4 
    {
        margin-top: 3rem !important;
    }
    .logo-mob 
    {
        margin-top: 4rem;
        margin-bottom: 2rem;
        margin-inline: auto;
        width: 100%;
        align-items: center;
        display: flex;
        justify-content: left
    }

    .logo-width 
    {
        max-width: 200px;
        width: 100%;
        height: auto;
        object-fit: contain;       
    }

    .card-body 
    {
        display: flex;
        flex-direction: column;
        justify-content: start; 
        align-items: center; 
        height: 100vh;
        padding: 1rem; 
        overflow: hidden;
        box-sizing: border-box;
    }
    
    .my-auto 
    {
        margin: 0 auto; 
        width: 100%; 
    }

    .form-content
    {
        margin-bottom: 1.5rem;
        width: 100%;
    }


    @media screen and (max-width: 1280px) 
    {
        .logo-mob 
        {
            margin-top: 2rem;
            margin-bottom: 2rem;
        }

    }

    @media screen and (max-width: 991px) 
    {
        .gap-3 
        {
            gap: 4rem !important;
        }

        .auth-brand 
        {
            margin-bottom: -1rem;
        }

        .auth-fluid .auth-fluid-form-box 
        {
            padding: 2rem !important;
        }

        .logo-width 
        {
            width: 100%;
            max-width: 200px;
            min-width: 100px;
            height: auto;
            object-fit: contain;       
        }

        .form-content
        {
            max-width: 100% !important;
        }
    }

    
    @media screen and (max-width: 576px) 
    {
        .card-body 
        {
            padding: 0.5rem; 
            height: 100vh; 
            display: flex;
            flex-direction: column;
            justify-content: center; 
            align-items: center;
            box-sizing: border-box;
        }

        .logo-width 
        {
            max-width: 170px !important; 
            min-width: auto; 
        }

        .logo-mob 
        {
            margin-top: 2rem !important; 
            margin-bottom: 1.5rem;
        }

        .gap-3 
        {
            gap: 1.5rem !important;
        }

        .form-content p 
        {
            font-size: 0.875rem; 
        }

        .form-content 
        {
            margin-bottom: 2.5rem; 
            
        }

        button 
        {
            font-size: 0.875rem; 
            padding: 0.5rem;
        }

        footer.footer-alt 
        {
            margin-top: 1rem; 
            font-size: 0.875rem; 
            text-align: center;
        }

        footer p 
        {
            font-size: 0.75rem; 
        }
    }

</style>
@endsection

<div class="auth-fluid">

    <!-- Auth fluid right content -->
    <div class="auth-fluid-right text-center">
        <div class="auth-user-testimonial">
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">

                </div>
            </div>
        </div> <!-- end auth-user-testimonial-->
    </div>
    <!-- end Auth fluid right content -->

    <!--Auth fluid left content -->
    <div class="auth-fluid-form-box">
        <div class="card-body d-flex flex-column h-100 gap-3">
            <!-- Logo -->
            <div class="auth-brand text-center logo-mob">
                <span>
                    <img class="logo-width" src="/logo.png" alt="dark logo">
                </span>
            </div>
            <!-- Formulário de login -->
            <div class="form-content">
                <h4 class="mt-0">Login</h4>
                <p class="text-muted mb-4">Digite seu endereço de email e senha para acessar a conta.</p>
    
                <form method="POST" action="{{ route('login') }}" id="form-login">
                    @csrf
                    <div class="mb-3">
                        <label for="emailaddress" class="form-label">Email</label>
                        <input class="form-control" type="email" name="email" id="email" required value="{{ $login }}" placeholder="Digite seu email">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Senha</label>
                        <input class="form-control" type="password" name="password" required value="{{ $pass }}" id="password" placeholder="Digite sua senha">
                    </div>
                    <div class="mb-3">
                        <div class="form-check">
                            <input name="remember" type="checkbox" {{ $remember ? 'checked' : '' }} class="form-check-input" id="checkbox-signin">
                            <label class="form-check-label" for="checkbox-signin">Lembrar-me</label>
                        </div>
                    </div>
                    <div class="d-grid mb-0 mt-4 text-center">
                        <button class="btn btn-primary" type="submit">
                            <i class="ri-login-box-line"></i> Acessar
                        </button>
                    </div>
                </form>
            </div>
            <!-- Footer -->
            <footer class="footer footer-alt">
                <p class="text-muted">Não tem uma conta? <a href="{{ route('register') }}" class="text-muted ms-1"><b>Inscrever-se</b></a></p>
            </footer>
        </div>
    </div>
    
</div>
    @endsection

    @section('js')
    <script type="text/javascript">
        function login(email, senha){
            $('#email').val(email)
            $('#password').val(senha)
            $('#form-login').submit()
        }
    </script>
    @endsection