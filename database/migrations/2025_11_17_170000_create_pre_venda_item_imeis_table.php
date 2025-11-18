<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * IMEIs vinculados a itens de pré-venda (PDV).
     */
    public function up(): void
    {
        Schema::create('pre_venda_item_imeis', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('item_pre_venda_id')->constrained('item_pre_vendas');
            $table->foreignId('imei_unit_id')->constrained('produto_unicos');
            $table->timestamps();

            $table->unique(['item_pre_venda_id', 'imei_unit_id']);
            $table->index('imei_unit_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pre_venda_item_imeis');
    }
};
