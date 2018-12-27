<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToEstatusTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('Estatus', function(Blueprint $table)
		{
			$table->foreign('"FK_Revision"', 'revision')->references('"Cedula"')->on('Empleado')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('Estatus', function(Blueprint $table)
		{
			$table->dropForeign('revision');
		});
	}

}
