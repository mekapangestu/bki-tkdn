<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableKepala extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kepalas', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('project_id')->nullable()->references('id')->on('projects');
            $table->string('kepala_status')->nullable();
            $table->string('kepala_note')->nullable();
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
        Schema::dropIfExists('table_kepala');
    }
}
