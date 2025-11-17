<?php

declare(strict_types=1);

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
        Schema::table('produto_unicos', function (Blueprint $table): void {
            $table->foreignId('empresa_id')
                ->nullable()
                ->after('nfce_id')
                ->constrained('empresas');
            $table->foreignId('localizacao_id')
                ->nullable()
                ->after('empresa_id')
                ->constrained('localizacaos');
            $table->foreignId('produto_variacao_id')
                ->nullable()
                ->after('produto_id')
                ->constrained('produto_variacaos');

            // Domain note: IMEI/serial will be the primary identifiers for tracked units.
            $table->string('imei', 50)
                ->nullable()
                ->after('codigo');
            $table->string('serial_number', 50)
                ->nullable()
                ->after('imei');
            $table->enum('status', ['available', 'reserved', 'sold'])
                ->default('available')
                ->after('serial_number');

            $table->unique(['empresa_id', 'imei']);
            $table->unique(['empresa_id', 'serial_number']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('produto_unicos', function (Blueprint $table): void {
            $table->dropUnique(['empresa_id', 'imei']);
            $table->dropUnique(['empresa_id', 'serial_number']);

            $table->dropConstrainedForeignId('empresa_id');
            $table->dropConstrainedForeignId('localizacao_id');
            $table->dropConstrainedForeignId('produto_variacao_id');

            $table->dropColumn(['imei', 'serial_number', 'status']);
        });
    }
};
