<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAsesorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('asesors', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_id')->nullable()->references('id')->on('projects');
            $table->foreignId('asesor')->nullable()->references('id')->on('users');
            $table->string('asesor_status')->nullable();
            $table->string('asesor_note')->nullable();
            $table->foreignId('qc')->nullable()->references('id')->on('users');
            $table->string('qc_status')->nullable();
            $table->string('qc_note')->nullable();
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
        Schema::dropIfExists('asesors');
    }
}
