<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnToProjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('projects', function (Blueprint $table) {
            $table->string('nm_reviewer')->nullable();
            $table->string('tgl_rencana_review')->nullable();
            $table->string('tgl_pelaksanaan_reviu')->nullable();
            $table->string('mom')->nullable();
            $table->string('catatan')->nullable();
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
            $table->dropColumn('nm_reviewer');
            $table->dropColumn('tgl_rencana_review');
            $table->dropColumn('tgl_pelaksanaan_reviu');
            $table->dropColumn('mom');
            $table->dropColumn('catatan');
        });
    }
}
