<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToOfiPaqTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('Ofi-Paq', function(Blueprint $table)
		{
			$table->foreign('"FK_Almacena"', 'almacena')->references('"Codigo"')->on('Oficina')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('"FK_Llega"', 'llega')->references('"Numero_guia"')->on('Paquete')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('Ofi-Paq', function(Blueprint $table)
		{
			$table->dropForeign('almacena');
			$table->dropForeign('llega');
		});
	}

}
