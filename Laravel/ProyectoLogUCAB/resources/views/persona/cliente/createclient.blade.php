@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/cliente">Inicio</a>
		<a href="/cliente/create">Agregar</a>
		<a href="/cliente/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear cliente</h3>
						<form action="/cliente/store" method="POST">
							@csrf
							<div class="form-group" style="width:100%; float: left">
									<label for="inputCedula" style="color: whitesmoke">Cedula</label>
									<input type="number" name="Cedula" class="form-control" id="Cedula" placeholder="Introduzca cedula" required>
									<small id="Cedula" style="color: rgb(180, 198, 214)">Importante.</small>
							</div>
							<div class="form-group" style="width:49%; float: left">
								<label for="inputNombre" style="color: whitesmoke">Nombre</label>
								<input type="text" name="Nombre" class="form-control" id="Nombre" placeholder="Introduzca nombre" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputApellido" style="color: whitesmoke">Apellido</label>
								<input type="text" name="Apellido" class="form-control" id="inputApellido" placeholder="Introduzca apellido" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputCorreo_Personal" style="color: whitesmoke">Correo</label>
								<input type="text" name="Correo_Personal" class="form-control" id="inputCorreo_Personal"placeholder="Introduzca correo" required>
							</div>
							<!-- Fecha -->
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputFecha_Nacimiento" style="color: whitesmoke">Fecha Nacimiento</label>
								<input type="date" name="Fecha_Nacimiento" class="form-control" id="inputFecha_Nacimiento"placeholder="Introduzca fecha de nacimiento" required>
							</div>
							<!--  -->
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputEmpresa" style="color: whitesmoke">Empresa</label>
								<input type="text" name="Empresa" class="form-control" id="inputEmpresa" placeholder="Empresa">
							</div>
							<div class="form-group" style="width:49%; float: right;">
									<label for="inputEstado_civil" style="color: whitesmoke">Estado civil</label>
									<select class="form-control" style="height: 34px" name="Estado" required>
										<option value="">Seleccione una...</option>
										<option value="soltero">Soltero</option>
										<option value="casado">Casado</option>
										<option value="viudo">Viudo</option>
										<option value="divorciado">Divorciado</option>
									</select>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputL_vip" style="color: whitesmoke">L-VIP:</label>
								<input class="form-check-input" name="L_Vip" type="checkbox" value="true" id="inputL_vip">
								<small id="inputL_vip" style="color: rgb(180, 198, 214); padding-left: 20px">Seleccione si desea ser cliente VIP</small>
							</div>
							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@stop