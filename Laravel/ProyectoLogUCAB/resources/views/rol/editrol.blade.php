@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/rol" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
        <!--Modificar-->
        <h3 style="text-align: center; color: whitesmoke">Modificar rol</h3>
		<form method="POST" action="/rol/update">
			@csrf
			<input type="text" name="Codigo" value="{{$validated->Codigo}}" hidden="">

			<div class="form-group" style="width:100%; float: left">
				<label for="inputTipo" style="color: whitesmoke">Tipo</label>
				<input type="text" name="Tipo" value="{{$validated->Tipo}}" class="form-control" id="Tipo" placeholder="Introduzca el nombre" required>
			</div>
			<!-- Privilegios -->
			<div class="form-group" style="width:100%; float: left">
				<h4 for="inputTipo" style="width:100%;color: whitesmoke;">Seleccione Privilegios</h4>
				<input class="form-check-input" name="Crear" type="checkbox" value="true" @if ( isset($crear) ) checked @endif id="inputCrear">
				<label for="inputTipo" style="padding-left:20px;width:100%;color: whitesmoke;">Crear</label>
				<input class="form-check-input" name="Modificar" type="checkbox" value="true" @if ( isset($modificar) ) checked @endif id="inputModificar">
				<label for="inputTipo" style="padding-left:20px;width:100%;color: whitesmoke;">Modificar</label>
				<input class="form-check-input" name="Eliminar" type="checkbox" value="true" @if ( isset($eliminar) ) checked @endif id="inputEliminar">
				<label for="inputTipo" style="padding-left:20px;width:100%;color: whitesmoke;">Eliminar</label>
				<input class="form-check-input" name="Insertar" type="checkbox" value="true" @if ( isset($insertar) ) checked @endif id="inputInsertar">
				<label for="inputTipo" style="padding-left:20px;width:100%;color: whitesmoke;">Insertar</label>
				<input class="form-check-input" name="Consultar" type="checkbox" value="true" @if ( isset($consultar) ) checked @endif id="inputConsultar">
				<label for="inputTipo" style="padding-left:20px;width:100%;color: whitesmoke;">Consultar</label>
			</div>
			<!---->
			<div style="width:100%; height: 40px; float: left;">
				<button type="submit" class="btn btn-primary">Modificar</button>
			</div>
		</form>
        <!---->
	</div>
</div>		
@endsection