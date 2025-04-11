<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('premade_items', function (Blueprint $table) {
            $table->id();
            $table->string('file_image');
            $table->string('title');
            $table->string('original_price');
            $table->string('discount_price')->nullable();
            $table->string('type');
            $table->string('item_class')->nullable();
            $table->text('description');
            $table->boolean('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('premade__items');
    }
};
