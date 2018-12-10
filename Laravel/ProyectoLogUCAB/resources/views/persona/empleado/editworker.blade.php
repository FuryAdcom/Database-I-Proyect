@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/empleado">Inicio</a>
		<a href="/empleado/create">Agregar</a>
		<a href="/empleado/lista" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
        <!--Modificar-->
        <h3 style="text-align: center; color: whitesmoke">Modificar empleado</h3>
		<form method="POST" action="/empleado/update">
			@csrf
			<input type="text" name="Codigo" value="{{$validated->Codigo}}" hidden="">

			<div class="form-group" style="width:49%; float: left">
				<label for="inputNombre" style="color: whitesmoke">Nombre</label>
				<input type="text" name="Nombre" value="{{$validated->Nombre}}" class="form-control" id="Nombre" placeholder="Introduzca el nombre" required>
			</div>
			<div class="form-group" style="width:49%; float: right;">
				<label for="inputDeposito" style="color: whitesmoke">Deposito</label>
				<input type="number" name="Tamaño_deposito" value="{{$validated->Tamaño_deposito}}" class="form-control" id="inputDeposito" placeholder="Introduzca el tamaño del deposito" required>
			</div>
			<div class="form-group" style="width:49%; float: left;">
				<label for="inputVehiculos" style="color: whitesmoke">Vehiculos</label>
				<input type="number" name="Cantidad_vehiculos" value="{{$validated->Cantidad_vehiculos}}" class="form-control" id="inputVehiculos"placeholder="Introduzca la cantidad de vehiculos" required>
			</div>
			<div class="form-group" style="width:49%; float: right;">
				<label for="inputEmpleados" style="color: whitesmoke">Empleados</label>
				<input type="number" name="Cantidad_empleados" value="{{$validated->Cantidad_empleados}}" class="form-control" id="inputEmpleados"placeholder="Introduzca la cantidad de empleados" required>
			</div>
			<!-- REVISAR MEJOR FORMA -->
			<div class="form-group" style="width:49%; float: left;">
				<label for="inputEncargado" style="color: whitesmoke">Encargado</label>
				<input type="text" name="Empleado_cargo" value="{{$validated->Empleado_cargo}}" class="form-control" id="inputEncargado" placeholder="Introduzca la capacidad de combustible" required>
			</div>
			<div style="width:100%; height: 40px; float: left;">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
        <!---->
	</div>
</div>		
@endsection