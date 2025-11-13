@extends('layouts.header_auth', ['title' => 'Cadastre-se'])

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
        justify-content: left;
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
        height: 100%;
        padding: 1rem; 
        overflow: hidden;
        box-sizing: border-box;
    }

    .my-auto 
    {
        margin-top: 5% !important;
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

        .my-auto 
        {
            margin-top: 0 !important;
            margin-bottom: 4.5rem !important;;
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

@section('content')
<div class="auth-fluid">
    <!-- Auth fluid right content -->
    <div class="auth-fluid-right text-center">
        <div class="auth-user-testimonial">
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">

            </div>
        </div> <!-- end auth-user-testimonial-->
    </div>
    <!-- end Auth fluid right content -->

    <!--Auth fluid left content -->
    <div class="auth-fluid-form-box">
        <div class="card-body d-flex flex-column h-100">

            <!-- Logo -->
            <div class="auth-brand text-center text-lg-start logo-mob">
                <a href="index.html" class="logo-dark">
                    <span><img class="logo-width" src="/logo2.png" alt="dark logo"></span>

                </a>
                
            </div>

            <div class="my-auto">
                <!-- title-->
                <h4>Cadastre-se</h4>
                <p class="text-muted mb-4">Crie sua conta, leva menos de um minuto!</p>

                <!-- form -->
                <form method="POST" action="{{ route('register') }}">
                    @csrf
                    <div class="mb-3">
                        <input class="form-control @error('name') is-invalid @enderror" type="text" id="name" placeholder="Nome" required name="name">
                        @error('name')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <input class="form-control @error('email') is-invalid @enderror" type="email" id="email" placeholder="Email" required name="email">
                        @error('email')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    
                    <div class="mb-3">
                        <input class="form-control @error('password') is-invalid @enderror" type="password" id="password" placeholder="Senha" required name="password">
                        @error('password')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <input class="form-control @error('password_confirmation') is-invalid @enderror" type="password" id="password_confirmation" placeholder="Confirme a Senha" required name="password_confirmation">
                        @error('password_confirmation')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>

                    <div class="mb-0 mt-4 d-grid text-center">
                        <button class="btn btn-primary fw-semibold" type="submit">Cadastrar </button>
                    </div>
                    <!-- social-->

                </form>
                <!-- end form-->
            </div>

            <!-- Footer-->
            <footer class="footer footer-alt">
                <p class="text-muted">Já tem conta? <a href="{{ route('login') }}" class="text-muted ms-1"><b>Login</b></a></p>
            </footer>

        </div> <!-- end .card-body -->
    </div>
    <!-- end auth-fluid-form-box-->
</div>
@endsection
