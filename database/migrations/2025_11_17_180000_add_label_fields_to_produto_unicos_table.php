<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('produto_unicos', function (Blueprint $table): void {
            if (!Schema::hasColumn('produto_unicos', 'label_barcode_value')) {
                $table->string('label_barcode_value', 120)->nullable()->after('last_moved_at');
            }

            if (!Schema::hasColumn('produto_unicos', 'label_qr_value')) {
                $table->text('label_qr_value')->nullable()->after('label_barcode_value');
            }

            if (!Schema::hasColumn('produto_unicos', 'label_version')) {
                $table->unsignedInteger('label_version')->default(1)->after('label_qr_value');
            }

            if (!Schema::hasColumn('produto_unicos', 'label_last_generated_at')) {
                $table->timestamp('label_last_generated_at')->nullable()->after('label_version');
            }
        });
    }

    public function down(): void
    {
        Schema::table('produto_unicos', function (Blueprint $table): void {
            $table->dropColumn([
                'label_barcode_value',
                'label_qr_value',
                'label_version',
                'label_last_generated_at',
            ]);
        });
    }
};
