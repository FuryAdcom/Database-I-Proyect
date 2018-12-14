@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/oficina">Inicio</a>
		<a href="/oficina/create">Agregar</a>
		<a href="/oficina/lista" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
        <!--Modificar-->
        <h3 style="text-align: center; color: whitesmoke">Modificar oficina</h3>
		<form method="POST" action="/oficina/update">
			@csrf
			<input type="text" name="Codigo" value="{{$validated->Codigo}}" hidden="">

			<div class="form-group" style="width:49%; float: left">
				<label for="inputNombre" style="color: whitesmoke">Nombre</label>
				<input type="text" name="Nombre" value="{{$validated->Nombre}}" class="form-control" id="Nombre" placeholder="Introduzca el nombre" required>
			</div>
			<div class="form-group" style="width:49%; float: right;">
				<label for="inputDeposito" style="color: whitesmoke">Tamaño del deposito</label>
				<input type="number" name="Tamaño_Deposito" value="{{$validated->Tamaño_Deposito}}" class="form-control" id="inputDeposito" placeholder="Introduzca el tamaño del deposito" required>
			</div>
			<div class="form-group" style="width:100%; float: left;">
				<label for="inputLugar" style="color: whitesmoke">Lugar</label>
				<input type="text" name="sitio" value="{{$validated->sitio}}" class="form-control" id="inputLugar" placeholder="Introduzca municipio donde se localiza" required>
			</div>
			<div style="width:100%; height: 40px; float: left;">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
        <!---->
	</div>
</div>		
@endsection