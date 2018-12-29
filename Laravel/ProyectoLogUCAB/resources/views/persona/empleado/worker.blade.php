@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/empleado">Inicio</a>
		@if(Auth::user()->rol >= 4 && Auth::user()->rol < 7)
			<a href="/empleado/create">Agregar</a>
		@endif
		<a href="/empleado/lista" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
			<h3 style="text-align: center; color: whitesmoke">Empleado</h3>

		<span>Still working on it</span>
	</div>
</div>	
@endsection