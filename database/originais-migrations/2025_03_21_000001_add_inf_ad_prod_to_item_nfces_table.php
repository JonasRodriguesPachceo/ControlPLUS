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
        Schema::table('item_nfces', function (Blueprint $table) {
            if (!Schema::hasColumn('item_nfces', 'infAdProd')) {
                $table->string('infAdProd', 200)->nullable()->after('observacao');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('item_nfces', function (Blueprint $table) {
            if (Schema::hasColumn('item_nfces', 'infAdProd')) {
                $table->dropColumn('infAdProd');
            }
        });
    }
};
