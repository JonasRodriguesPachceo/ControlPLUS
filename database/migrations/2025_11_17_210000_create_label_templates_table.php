<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('label_templates', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('empresa_id')->nullable()->constrained('empresas');
            $table->foreignId('filial_id')->nullable();
            $table->string('code', 80);
            $table->string('name', 120);
            $table->string('type', 50)->default('imei_label');
            $table->boolean('is_default')->default(false);
            $table->json('config')->nullable();
            $table->boolean('active')->default(true);
            $table->timestamps();

            $table->unique(['empresa_id', 'filial_id', 'code']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('label_templates');
    }
};
