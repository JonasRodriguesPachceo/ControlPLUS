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
        Schema::table('produto_variacaos', function (Blueprint $table): void {
            $table->string('sku', 80)
                ->nullable()
                ->after('produto_id');
            $table->string('color', 60)
                ->nullable()
                ->after('descricao');
            $table->string('size', 60)
                ->nullable()
                ->after('color');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('produto_variacaos', function (Blueprint $table): void {
            $table->dropColumn(['sku', 'color', 'size']);
        });
    }
};
