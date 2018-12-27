<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAuditoriaTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('Auditoria', function(Blueprint $table)
		{
			$table->string('Usuario', 20);
			$table->date('Fecha_Ingreso');
			$table->string('Accion', 50);
			$table->integer('Codigo', true);
			$table->integer('FK_Observa')->index('fki_observa');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('Auditoria');
	}

}
