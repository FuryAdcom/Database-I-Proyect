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
			<!-- Mensaje de alerta -->
			@if(Session::has('message'))
				<div class="alert alert-warning"> {{Session::get('message')}} </div>
			@endif
			<!---->
			<input type="text" name="Codigo" value="{{$validated->Codigo}}" hidden>

			<div class="form-group" style="width:49%; float: left">
				<label for="inputNombre" style="color: whitesmoke">Nombre</label>
				<input type="text" name="Nombre" value="{{old('Nombre',$validated->Nombre)}}" class="form-control" id="Nombre" placeholder="Introduzca el nombre" required>
			</div>
			<div class="form-group" style="width:49%; float: right;">
				<label for="inputDeposito" style="color: whitesmoke">Tamaño del depósito</label>
				<input type="number" name="Tamaño_Deposito" value="{{old('Tamaño_Deposito', $validated->Tamaño_Deposito)}}" class="form-control" id="inputDeposito" placeholder="Introduzca el tamaño del depósito" required>
			</div>
			<div class="form-group" style="width:49%; float: left;">
				<label for="inputLocalidad" style="color: whitesmoke">Localidad estado</label>
				<input type="text" name="est" value="{{old('est', $validated->est)}}" class="form-control" placeholder="Introduzca el estado donde se ubica la oficina (Ej: Amazonas, Bolívar, etc.)" required>
			</div>
			<div class="form-group" style="width:49%; float: right;">
				<label for="inputLocalidad" style="color: whitesmoke">Localidad municipio</label>
				<input type="text" name="lugar" value="{{old('lugar', $validated->lugar)}}" class="form-control" placeholder="Introduzca el municipio donde se ubica la oficina (Ej: Atabapo)" required>
			</div>
			<div class="form-group" style="width:49%; float: right;">
					<label for="inputTelefono" style="color: whitesmoke">Telefono</label>
					<input type="tel"pattern="[0-9]{4}-[0-9]{7}" name="Telefono" value="{{old('Telefono', $telf)}}" class="form-control" placeholder="Introduzca el telefono (Formato: 0XXX-XXXXXXX)" required>
				</div>

			<div style="width:100%; height: 40px; float: left;">
				<button type="submit" class="btn btn-primary">Modificar</button>
			</div>
		</form>
        <!--End of modify-->
	</div>
</div>		
@endsection