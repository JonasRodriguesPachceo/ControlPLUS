<?php

declare(strict_types=1);

namespace App\Listeners;

use App\Events\IMEICreated;
use App\Services\ImeiLabelService;

class GenerateImeiLabelOnCreated
{
    public function __construct(private readonly ImeiLabelService $labelService)
    {
    }

    public function handle(IMEICreated $event): void
    {
        $this->labelService->generateForImeiUnit($event->imeiUnit);
    }
}
