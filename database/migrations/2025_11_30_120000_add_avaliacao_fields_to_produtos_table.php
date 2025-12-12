<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('produtos', function (Blueprint $table) {
            if (!Schema::hasColumn('produtos', 'tipo_produto')) {
                $table->string('tipo_produto', 20)->default('novo')->after('tipo_producao');
            }

            if (!Schema::hasColumn('produtos', 'avaliacao_observacao')) {
                $table->text('avaliacao_observacao')->nullable()->after('observacao4');
            }
        });

        DB::table('produtos')
            ->whereNull('tipo_produto')
            ->update(['tipo_produto' => 'novo']);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('produtos', function (Blueprint $table) {
            if (Schema::hasColumn('produtos', 'tipo_produto')) {
                $table->dropColumn('tipo_produto');
            }

            if (Schema::hasColumn('produtos', 'avaliacao_observacao')) {
                $table->dropColumn('avaliacao_observacao');
            }
        });
    }
};
