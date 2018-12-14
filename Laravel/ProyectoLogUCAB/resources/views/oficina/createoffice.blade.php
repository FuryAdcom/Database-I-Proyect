@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/oficina">Inicio</a>
		<a href="/oficina/create">Agregar</a>
		<a href="/oficina/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear oficina</h3>
						<form action="/oficina/store" method="POST">
							@csrf

							<div class="form-group" style="width:49%; float: left">
								<label for="inputNombre" style="color: whitesmoke">Nombre</label>
								<input type="text" name="Nombre" class="form-control" id="Nombre" placeholder="Introduzca el nombre" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputDeposito" style="color: whitesmoke">Deposito</label>
								<input type="number" name="Tamaño_Deposito" class="form-control" id="inputDeposito" placeholder="Introduzca el tamaño del deposito" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputLocalidad" style="color: whitesmoke">Localidad</label>
								<input type="text" name="lugar" class="form-control" id="inputLocalidad" placeholder="Introduzca el municipio" required>
							</div>
							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@stop