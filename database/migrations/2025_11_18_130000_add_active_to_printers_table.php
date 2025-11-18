<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('printers', function (Blueprint $table): void {
            if (!Schema::hasColumn('printers', 'active')) {
                $table->boolean('active')->default(true)->after('is_default');
            }
        });
    }

    public function down(): void
    {
        Schema::table('printers', function (Blueprint $table): void {
            if (Schema::hasColumn('printers', 'active')) {
                $table->dropColumn('active');
            }
        });
    }
};
