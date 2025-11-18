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
            if (!Schema::hasColumn('produto_unicos', 'warehouse_id')) {
                $table->foreignId('warehouse_id')
                    ->nullable()
                    ->after('localizacao_id')
                    ->constrained('localizacaos');
            }

            if (!Schema::hasColumn('produto_unicos', 'status')) {
                $table->string('status', 30)
                    ->default('available')
                    ->after('serial_number');
            }

            if (!Schema::hasColumn('produto_unicos', 'origin_type')) {
                $table->string('origin_type', 50)
                    ->nullable()
                    ->after('status');
            }

            if (!Schema::hasColumn('produto_unicos', 'origin_id')) {
                $table->unsignedBigInteger('origin_id')
                    ->nullable()
                    ->after('origin_type');
            }

            if (!Schema::hasColumn('produto_unicos', 'locked_at')) {
                $table->timestamp('locked_at')
                    ->nullable()
                    ->after('origin_id');
            }

            if (!Schema::hasColumn('produto_unicos', 'sold_at')) {
                $table->timestamp('sold_at')
                    ->nullable()
                    ->after('locked_at');
            }

            if (!Schema::hasColumn('produto_unicos', 'last_moved_at')) {
                $table->timestamp('last_moved_at')
                    ->nullable()
                    ->after('sold_at');
            }

            if (!Schema::hasColumn('produto_unicos', 'deleted_at')) {
                $table->softDeletes();
            }

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
