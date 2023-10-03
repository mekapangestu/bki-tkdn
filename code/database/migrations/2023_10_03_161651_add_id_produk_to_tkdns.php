<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddIdProdukToTkdns extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tkdns', function (Blueprint $table) {
            $table->string('status')->nullable();
            $table->string('id_produk')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tkdns', function (Blueprint $table) {
            $table->dropColumn('status');
            $table->dropColumn('id_produk');
        });
    }
}
