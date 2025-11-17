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
        Schema::table('produtos', function (Blueprint $table): void {
            $table->enum('tracking_type', ['none', 'serial', 'imei', 'variant'])
                ->default('none')
                ->after('gerenciar_estoque');
            $table->boolean('has_variants')
                ->default(false)
                ->after('tracking_type');
            $table->boolean('is_refurbished')
                ->default(false)
                ->after('has_variants');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('produtos', function (Blueprint $table): void {
            $table->dropColumn(['tracking_type', 'has_variants', 'is_refurbished']);
        });
    }
};
