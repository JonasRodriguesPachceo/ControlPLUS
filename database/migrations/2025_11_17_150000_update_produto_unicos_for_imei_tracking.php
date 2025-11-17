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
            $table->foreignId('warehouse_id')
                ->nullable()
                ->after('localizacao_id')
                ->constrained('localizacaos');

            $table->string('status', 30)
                ->default('available')
                ->after('serial_number');
            $table->string('origin_type', 50)
                ->nullable()
                ->after('status');
            $table->unsignedBigInteger('origin_id')
                ->nullable()
                ->after('origin_type');

            $table->timestamp('locked_at')
                ->nullable()
                ->after('origin_id');
            $table->timestamp('sold_at')
                ->nullable()
                ->after('locked_at');
            $table->timestamp('last_moved_at')
                ->nullable()
                ->after('sold_at');

            $table->softDeletes();

            $table->index('status');
            $table->index('warehouse_id');
            $table->index('produto_id');
            $table->index('produto_variacao_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('produto_unicos', function (Blueprint $table): void {
            $table->dropSoftDeletes();
            $table->dropColumn([
                'warehouse_id',
                'status',
                'origin_type',
                'origin_id',
                'locked_at',
                'sold_at',
                'last_moved_at',
            ]);

            $table->dropIndex(['status']);
            $table->dropIndex(['warehouse_id']);
            $table->dropIndex(['produto_id']);
            $table->dropIndex(['produto_variacao_id']);
        });
    }
};
