<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateOfiPaqTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('Ofi-Paq', function(Blueprint $table)
		{
			$table->integer('Codigo', true);
			$table->integer('FK_Almacena')->index('fki_almacena');
			$table->integer('FK_Llega')->index('fki_llega');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('Ofi-Paq');
	}

}
