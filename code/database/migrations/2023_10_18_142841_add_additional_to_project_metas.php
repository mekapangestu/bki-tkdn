<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAdditionalToProjectMetas extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('project_additionals', function (Blueprint $table) {
            $table->string('kd_hs')->nullable();
            $table->string('spesifikasi')->nullable();
            $table->string('kbli')->nullable();
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
            $table->dropColumn('kd_hs');
            $table->dropColumn('spesifikasi');
            $table->dropColumn('kbli');
        });
    }
}
