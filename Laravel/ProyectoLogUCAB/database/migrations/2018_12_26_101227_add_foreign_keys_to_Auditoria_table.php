<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToAuditoriaTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('Auditoria', function(Blueprint $table)
		{
			$table->foreign('"FK_Observa"', 'observa')->references('"Codigo"')->on('Usuario')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('Auditoria', function(Blueprint $table)
		{
			$table->dropForeign('observa');
		});
	}

}
