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

			<div class="form-group" style="width:49%; float: left">
				<label for="inputTipo" style="color: whitesmoke">Tipo</label>
				<input type="text" name="Tipo" value="{{$validated->Tipo}}" class="form-control" id="Tipo" placeholder="Introduzca el nombre" required>
			</div>
			<!-- Privilegios -->
			<!---->
			<div style="width:100%; height: 40px; float: left;">
				<button type="submit" class="btn btn-primary">Modificar</button>
			</div>
		</form>
        <!---->
	</div>
</div>		
@endsection