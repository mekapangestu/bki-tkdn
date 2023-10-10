<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProjectMetas extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('project_metas', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('project_id')->nullable()->references('id')->on('projects');
            $table->string('nm_reviewer')->nullable();
            $table->string('tgl_rencana_review')->nullable();
            $table->string('tgl_pelaksanaan_reviu')->nullable();
            $table->string('mom')->nullable();
            $table->string('catatan')->nullable();
            $table->string('alasan_tidak_sesuai')->nullable();
            $table->string('alasan_tolak')->nullable();
            $table->string('no_tanda_sah')->nullable();
            $table->string('tgl_tanda_sah')->nullable();
            $table->string('tgl_expire')->nullable();
            $table->string('url_qrcode')->nullable();
            $table->string('url_sertifikat_terbit')->nullable();
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
        Schema::dropIfExists('project_metas');
    }
}
