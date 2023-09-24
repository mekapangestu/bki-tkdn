<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('no_berkas')->nullable();
            $table->string('nib')->nullable();
            $table->string('npwp')->nullable();
            $table->string('verifikator')->nullable();
            $table->string('kd_produk')->nullable();
            $table->string('nama_cp')->nullable();
            $table->string('jabatan_cp')->nullable();
            $table->string('no_hp_cp')->nullable();
            $table->string('alamat_kantor')->nullable();
            $table->string('alamat_pabrik')->nullable();
            $table->jsonb('siinas_data')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
