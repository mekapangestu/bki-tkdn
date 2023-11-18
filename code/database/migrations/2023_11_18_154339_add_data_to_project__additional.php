<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDataToProjectAdditional extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('project_additionals', function (Blueprint $table) {
            $table->string('nama_proyek_pbj')->nullable();
            $table->string('pengguna_proyek_pbj')->nullable();
            $table->string('nib_pengguna_proyek_pbj')->nullable();
            $table->string('no_kontrak')->nullable();
            $table->string('kd_provinsi_lokasi')->nullable();
            $table->string('nama_obat')->nullable();
            $table->string('bentuk_sediaan')->nullable();
            $table->string('kemasan')->nullable();
            $table->string('nie')->nullable();
            $table->string('nm_perusahaan_produksi')->nullable();
            $table->string('nib_perusahaan_produksi')->nullable();
            $table->string('nm_perusahaan_desain')->nullable();
            $table->string('nib_perusahaan_desain')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('project_additionals', function (Blueprint $table) {
            $table->dropColumn('nama_proyek_pbj');
            $table->dropColumn('pengguna_proyek_pbj');
            $table->dropColumn('nib_pengguna_proyek_pbj');
            $table->dropColumn('no_kontrak');
            $table->dropColumn('kd_provinsi_lokasi');
            $table->dropColumn('nama_obat');
            $table->dropColumn('bentuk_sediaan');
            $table->dropColumn('kemasan');
            $table->dropColumn('nie');
            $table->dropColumn('nm_perusahaan_produksi');
            $table->dropColumn('nib_perusahaan_produksi');
            $table->dropColumn('nm_perusahaan_desain');
            $table->dropColumn('nib_perusahaan_desain');
        });
    }
}
