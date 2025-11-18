<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('label_print_job_items', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('label_print_job_id')->constrained('label_print_jobs');
            $table->foreignId('imei_unit_id')->constrained('produto_unicos');
            $table->unsignedInteger('quantity')->default(1);
            $table->string('status', 30)->default('pending');
            $table->text('error_message')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('label_print_job_items');
    }
};
