<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnBodyAndUrlToDocumentReceipt extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('document_receipts', function (Blueprint $table) {
            $table->jsonb('payload')->nullable();
            $table->string('end_point')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('document_receipts', function (Blueprint $table) {
            $table->dropColumn('payload');
            $table->dropColumn('end_point');
        });
    }
}
