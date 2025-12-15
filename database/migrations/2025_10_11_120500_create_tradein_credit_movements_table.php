<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tradein_credit_movements', function (Blueprint $table) {
            $table->id();
            $table->foreignId('empresa_id')->constrained('empresas');
            $table->string('documento', 20);
            $table->foreignId('cliente_id')->nullable()->constrained('clientes')->nullOnDelete();
            $table->foreignId('fornecedor_id')->nullable()->constrained('fornecedors')->nullOnDelete();
            $table->enum('tipo', ['credit', 'debit']);
            $table->decimal('valor', 12, 2);
            $table->string('origem_tipo', 60)->nullable();
            $table->unsignedBigInteger('origem_id')->nullable();
            $table->string('ref_texto', 255)->nullable();
            $table->foreignId('user_id')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamps();

            $table->index(['empresa_id', 'documento']);
            $table->index(['origem_tipo', 'origem_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tradein_credit_movements');
    }
};
