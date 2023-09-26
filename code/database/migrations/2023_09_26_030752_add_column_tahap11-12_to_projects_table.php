<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnTahap1112ToProjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('projects', function (Blueprint $table) {
            $table->string('alasan_tidak_sesuai')->nullable();
            $table->string('alasan_tolak')->nullable();
            $table->string('no_tanda_sah')->nullable();
            $table->string('tgl_tanda_sah')->nullable();
            $table->string('tgl_expire')->nullable();
            $table->string('url_sertifikat_terbit')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('projects', function (Blueprint $table) {
            $table->dropColumn('alasan_tidak_sesuai');
            $table->dropColumn('alasan_tolak');
            $table->dropColumn('no_tanda_sah');
            $table->dropColumn('tgl_tanda_sah');
            $table->dropColumn('tgl_expire');
            $table->dropColumn('url_sertifikat_terbit');
        });
    }
}
