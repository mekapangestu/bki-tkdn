<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddBastToProjects extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('projects', function (Blueprint $table) {
            $table->string('judul')->nullable();
            $table->string('bast_no')->nullable();
            $table->string('bast_date')->nullable();
            $table->string('no_referensi')->nullable();
            $table->string('no_laporan')->nullable();
            $table->string('bidang_usaha')->nullable();
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
            $table->dropColumn('judul');
            $table->dropColumn('bast_no');
            $table->dropColumn('bast_date');
            $table->dropColumn('no_referensi');
            $table->dropColumn('no_laporan');
            $table->dropColumn('bidang_usaha');
        });
    }
}
