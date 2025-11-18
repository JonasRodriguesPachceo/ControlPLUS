<?php

declare(strict_types=1);

return [
    'default_driver' => env('PRINTING_DRIVER', 'dummy'),
    'drivers' => [
        'dummy' => \App\Services\Printing\Drivers\DummyLabelPrinterDriver::class,
        'http' => \App\Services\Printing\Drivers\HttpLabelPrinterDriver::class,
    ],
];
