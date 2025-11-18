<?php

namespace App\Providers;

use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event to listener mappings for the application.
     *
     * @var array<class-string, array<int, class-string>>
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
        \App\Events\IMEICreated::class => [
            \App\Listeners\LogImeiCreated::class,
            \App\Listeners\GenerateImeiLabelOnCreated::class,
        ],
        \App\Events\IMEIStatusChanged::class => [
            \App\Listeners\LogImeiStatusChanged::class,
        ],
        \App\Events\StockMoved::class => [
            \App\Listeners\LogStockMove::class,
        ],
        \App\Events\SaleFinalized::class => [
            \App\Listeners\LogSaleEvent::class,
        ],
        \App\Events\SaleReturned::class => [
            \App\Listeners\LogSaleEvent::class,
        ],
        \App\Events\SaleCanceled::class => [
            \App\Listeners\LogSaleEvent::class,
        ],
    ];

    /**
     * Register any events for your application.
     */
    public function boot(): void
    {
        //
    }

    /**
     * Determine if events and listeners should be automatically discovered.
     */
    public function shouldDiscoverEvents(): bool
    {
        return false;
    }
}
