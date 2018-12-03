@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/oficina">Inicio</a>
		<a href="/oficina/create">Agregar</a>
		<a href="/oficina/edit">Modificar</a>
		<a href="/oficina/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear oficina</h3>
						<form>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputCod" style="color: whitesmoke">Codigo</label>
								<input type="text" class="form-control" id="inputCod" placeholder="Introduzca el codigo" required>
								<small id="cod" style="color: rgb(180, 198, 214)">Con el identificaremos la oficina.</small>
							</div>
							<div class="form-group" style="width:49%; float: right;height: 79px">
								<label for="inputNombre" style="color: whitesmoke">Nombre</label>
								<input type="text" class="form-control" id="inputNombre" placeholder="Introduzca el nombre">
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputDeposito" style="color: whitesmoke">Deposito</label>
								<input type="number" class="form-control" id="inputDeposito" placeholder="Introduzca el tamaño del deposito" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputVehiculos" style="color: whitesmoke">Vehiculos</label>
								<input type="number" class="form-control" id="inputVehiculos"placeholder="Introduzca la cantidad de vehiculos" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputEmpleados" style="color: whitesmoke">Empleados</label>
								<input type="number" class="form-control" id="inputEmpleados"placeholder="Introduzca la cantidad de empleados" required>
							</div>
							<!-- REVISAR MEJOR FORMA -->
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputEncargado" style="color: whitesmoke">Encargado</label>
								<input type="text" class="form-control" id="inputEncargado" placeholder="Introduzca la capacidad de combustible" required>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@stop