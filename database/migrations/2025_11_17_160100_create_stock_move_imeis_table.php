<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Pivot de unidades IMEI/Série movimentadas por stock_moves.
     */
    public function up(): void
    {
        Schema::create('stock_move_imeis', function (Blueprint $table): void {
            $table->id();

            $table->foreignId('stock_move_id')->constrained('stock_moves');
            $table->foreignId('imei_unit_id')->constrained('produto_unicos');

            $table->unsignedInteger('quantity')->default(1);
            $table->string('previous_status', 30)->nullable();
            $table->string('new_status', 30)->nullable();

            $table->timestamps();

            $table->unique(['stock_move_id', 'imei_unit_id']);
            $table->index('imei_unit_id');
            $table->index('stock_move_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('stock_move_imeis');
    }
};
