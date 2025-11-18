<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('printers', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('empresa_id')->nullable()->constrained('empresas');
            $table->foreignId('localizacao_id')->nullable()->constrained('localizacaos');
            $table->string('name', 120);
            $table->string('code', 80);
            $table->string('driver', 80)->default('dummy');
            $table->json('connection_config')->nullable();
            $table->boolean('is_default')->default(false);
            $table->timestamps();

            $table->unique(['empresa_id', 'code']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('printers');
    }
};
