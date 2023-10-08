<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTkdnsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tkdns', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('project_id')->nullable()->references('id')->on('projects');
            $table->string('nilai_tkdn')->nullable();
            $table->string('nilai_tkdn_jasa')->nullable();
            $table->string('nilai_tkdn_gabungan')->nullable();
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
        Schema::dropIfExists('tkdns');
    }
}
