<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('printer_spool_items', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('label_print_job_item_id')->constrained('label_print_job_items');
            $table->foreignId('printer_id')->nullable()->constrained('printers');
            $table->string('status', 30)->default('queued');
            $table->json('payload');
            $table->unsignedSmallInteger('attempts')->default(0);
            $table->text('last_error')->nullable();
            $table->timestamp('last_attempt_at')->nullable();
            $table->timestamp('printed_at')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('printer_spool_items');
    }
};
