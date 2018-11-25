@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/vehiculo/create">Agregar</a>
		<a href="/vehiculo/edit">Modificar</a>
		<a href="/vehiculo/show">Consultar</a>
		<a href="/vehiculo/destroy" style="border-bottom: 0px solid #5993cd">Eliminar</a>
	</div>
	<div class="contenido_ppal">
		<span>Vehiculos</span>
	</div>
</div>	
@stop