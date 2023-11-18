<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterDeleteTypeDummyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('dummy', function (Blueprint $table) {
            $table->renameColumn('name', 'name_dummy');
            $table->dropColumn('type');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('dummy', function (Blueprint $table) {
            $table->renameColumn('name_dummy', 'name');
            $table->string('type')->nullable();
        });
    }
}
