<?php

declare(strict_types=1);

namespace App\Providers;

use App\Contracts\Printing\LabelPrinterDriverInterface;
use Illuminate\Support\ServiceProvider;

class PrintingServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        // Binding mantido para compatibilidade, retornando o driver default.
        $this->app->bind(LabelPrinterDriverInterface::class, function ($app) {
            $config = $app['config']['printing'];

            $driverName = $config['default_driver'] ?? 'dummy';
            $driverClass = $config['drivers'][$driverName] ?? $config['drivers']['dummy'];

            return $app->make($driverClass);
        });
    }
}
