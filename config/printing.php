<?php

declare(strict_types=1);

return [
    'default_driver' => env('PRINTING_DRIVER', 'dummy'),
    'drivers' => [
        'dummy' => \App\Services\Printing\Drivers\DummyLabelPrinterDriver::class,
        'http' => \App\Services\Printing\Drivers\HttpLabelPrinterDriver::class,
    ],
    'spool' => [
        'max_attempts' => env('PRINTING_SPOOL_MAX_ATTEMPTS', 3),
    ],
];
