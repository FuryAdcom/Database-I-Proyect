<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToEnvioTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('Envio', function(Blueprint $table)
		{
			$table->foreign('"FK_Destino"', 'destino')->references('"Codigo"')->on('Lugar')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('Envio', function(Blueprint $table)
		{
			$table->dropForeign('destino');
		});
	}

}
