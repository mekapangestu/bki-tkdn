<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDocumentReceiptsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('document_receipts', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('project_id')->nullable()->references('id')->on('projects');
            $table->string('stage');
            $table->text('siinas_response')->nullable();
            $table->string('siinas_message')->nullable();
            $table->string('siinas_post_at')->nullable();
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
        Schema::dropIfExists('document_receipts');
    }
}
