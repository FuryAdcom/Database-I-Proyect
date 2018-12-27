<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEnvioTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('Envio', function(Blueprint $table)
		{
			$table->float('Monto', 10, 0);
			$table->integer('Codigo', true);
			$table->integer('FK_Destino')->index('fki_destino');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('Envio');
	}

}
