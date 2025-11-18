<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Base de movimentação de estoque (entrada, saída, transferência, devolução, cancelamento, ajuste).
     */
    public function up(): void
    {
        Schema::create('stock_moves', function (Blueprint $table): void {
            $table->id();

            $table->foreignId('empresa_id')->nullable()->constrained('empresas');
            $table->foreignId('warehouse_from_id')->nullable()->constrained('localizacaos');
            $table->foreignId('warehouse_to_id')->nullable()->constrained('localizacaos');

            $table->string('move_type', 40);
            $table->string('source_type', 80)->nullable();
            $table->unsignedBigInteger('source_id')->nullable();

            $table->string('reference', 120)->nullable();
            $table->text('description')->nullable();
            $table->dateTime('executed_at');

            $table->softDeletes();
            $table->timestamps();

            $table->index(['empresa_id', 'move_type']);
            $table->index(['warehouse_from_id', 'warehouse_to_id']);
            $table->index(['source_type', 'source_id']);
            $table->index('executed_at');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('stock_moves');
    }
};
