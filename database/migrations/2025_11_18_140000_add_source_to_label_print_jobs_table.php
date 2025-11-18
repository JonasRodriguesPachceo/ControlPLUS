<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('label_print_jobs', function (Blueprint $table): void {
            if (!Schema::hasColumn('label_print_jobs', 'source')) {
                $table->string('source', 50)->nullable()->after('type');
            }
        });
    }

    public function down(): void
    {
        Schema::table('label_print_jobs', function (Blueprint $table): void {
            if (Schema::hasColumn('label_print_jobs', 'source')) {
                $table->dropColumn('source');
            }
        });
    }
};
