<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Sistema</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white p-8 rounded-2xl shadow-lg w-full max-w-md">
        <div class="flex flex-col items-center mb-6">
            {{-- Logo centralizado e com tamanho fixo --}}
            <img src="{{ asset('images/logo.png') }}" alt="Logo" class="w-32 h-auto mb-4">
            <h1 class="text-2xl font-bold text-gray-800">Acesse sua conta</h1>
        </div>

        @if ($errors->any())
        <div class="bg-red-100 text-red-700 p-2 rounded mb-4 text-sm">
            {{ $errors->first() }}
        </div>
        @endif

        <form method="POST" action="{{ route('login') }}" class="space-y-4">
            @csrf
            <div>
                <label class="block text-gray-700 text-sm mb-1">E-mail</label>
                <input type="email" name="email" required autofocus
                    class="w-full border border-gray-300 p-2 rounded focus:ring focus:ring-indigo-200">
            </div>

            <div>
                <label class="block text-gray-700 text-sm mb-1">Senha</label>
                <input type="password" name="password" required
                    class="w-full border border-gray-300 p-2 rounded focus:ring focus:ring-indigo-200">
            </div>

            <div class="flex items-center justify-between">
                <label class="flex items-center">
                    <input type="checkbox" name="remember" class="mr-2">
                    <span class="text-sm text-gray-600">Lembrar-me</span>
                </label>
                <a href="{{ route('password.request') }}" class="text-sm text-indigo-600 hover:underline">
                    Esqueceu a senha?
                </a>
            </div>

            <button type="submit"
                class="w-full bg-indigo-600 text-white py-2 rounded hover:bg-indigo-700 transition">
                Entrar
            </button>

            <p class="text-center text-sm text-gray-600 mt-4">
                Não tem conta?
                <a href="{{ route('register') }}" class="text-indigo-600 hover:underline">Cadastre-se</a>
            </p>
        </form>
    </div>
</body>

</html>
