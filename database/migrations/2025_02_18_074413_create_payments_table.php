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
        Schema::create('transaction_table', function (Blueprint $table) {
            $table->id();
            $table->string('payment_id');
            $table->string('itemFile');
            $table->string('itemTitle');
            $table->string('quantity');
            $table->string('ammount');
            $table->string('clientName');
            $table->string('clientEmail');
            $table->string('country');
            $table->string('postalCode');
            $table->string('paymentStats');
            $table->string('paymentMethod');
            $table->string('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transaction_table');
    }
};
