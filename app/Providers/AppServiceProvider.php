<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use Laravel\Sanctum\Sanctum;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use App\Models\Produto;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
         Sanctum::ignoreMigrations();
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::useBootstrap();
        View::composer(['layouts.menu.vertical', 'layouts.menu.horizontal'], function ($view) {
            $count = 0;
            if (Auth::check()) {
                $empresaId = request()->empresa_id;
                if (!$empresaId && Auth::user()->empresa && Auth::user()->empresa->empresa) {
                    $empresaId = Auth::user()->empresa->empresa->id;
                }
                if ($empresaId) {
                    $count = Produto::somenteAvaliacao()
                        ->where('empresa_id', $empresaId)
                        ->count();
                }
            }
            $view->with('produtosAvaliacaoPendentes', $count);
        });
    }
}
