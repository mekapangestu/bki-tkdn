<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProjectAdditionalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('project_additionals', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('project_id')->nullable()->references('id')->on('projects');
            $table->string('id_produk')->nullable();
            $table->string('standar')->nullable();
            $table->string('produsen')->nullable();
            $table->string('sertifikat_produk')->nullable();
            $table->string('kd_kelompok_barang')->nullable();
            $table->string('merk')->nullable();
            $table->string('tipe')->nullable();
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
        Schema::dropIfExists('project_additionals');
    }
}
