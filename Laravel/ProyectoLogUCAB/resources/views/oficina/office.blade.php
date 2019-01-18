@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/oficina">Inicio</a>
		@if(Auth::user()->rol >= 4 && Auth::user()->rol < 7)
			<a href="/oficina/create">Agregar</a>
		@endif
		<a href="/oficina/lista" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
			<h3 style="text-align: center; color: whitesmoke">Oficina</h3>

		<span>Still working on it</span>
	</div>
</div>	
@endsection