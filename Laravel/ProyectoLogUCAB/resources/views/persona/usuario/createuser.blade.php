@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/user">Inicio</a>
		<a href="/user/create">Agregar</a>
		<a href="/user/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear usuario</h3>
						<form action="/user/store" method="POST">
							@csrf

							<div class="form-group" style="width:49%; float: left">
								<label for="inputNombre" style="color: whitesmoke">Nombre</label>
								<input type="text" name="Nombre" class="form-control" id="Nombre" placeholder="Introduzca el nombre" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputCorreo" style="color: whitesmoke">Correo</label>
								<input type="text" name="Correo" class="form-control" id="inputCorreo" placeholder="Introduzca Correo" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputContraseña" style="color: whitesmoke">Contraseña</label>
								<input type="password" name="Contraseña" class="form-control" id="inputContraseña"placeholder="Introduzca la Contraseña" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputFK_Sele_Concede" style="color: whitesmoke">Rol</label>
								<input type="text" name="FK_Sele_Concede" class="form-control" id="inputFK_Sele_Concede"placeholder="Introduzca rol" required>
							</div>
							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@stop