<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEstatusTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('Estatus', function(Blueprint $table)
		{
			$table->string('Descripcion', 50);
			$table->integer('Codigo', true);
			$table->integer('FK_Revision')->index('fki_revision');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('Estatus');
	}

}
