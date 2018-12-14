@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/empleado">Inicio</a>
		<a href="/empleado/create">Agregar</a>
		<a href="/empleado/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear empleado</h3>
						<form action="/empleado/store" method="POST">
							@csrf

							<div class="form-group" style="width:100%; float: left">
									<label for="inputCedula" style="color: whitesmoke">Cedula</label>
									<input type="number" name="Cedula" class="form-control" id="Cedula" placeholder="Introduzca cedula" required>
									<small id="Cedula" style="color: rgb(180, 198, 214)">Importante, sin puntos.</small>
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
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputFecha_Nacimiento" style="color: whitesmoke">Fecha Nacimiento</label>
								<input type="date" name="Fecha_Nacimiento" class="form-control" id="inputFecha_Nacimiento"placeholder="Introduzca fecha de nacimiento" required>
							</div>
							<div class="form-group" style="width:60%; float: left;">
									<label for="inputRol" style="color: whitesmoke">Rol</label>
									<input type="text" name="rol" class="form-control" id="inputRol"placeholder="Introduzca rol" required>
								</div>
							<div class="form-group" style="width:49%; float: left;">
									<label for="inputNivel_Academico" style="color: whitesmoke">Nivel Academico</label>
									<select class="form-control" style="height: 34px" id="inputNivel_Academico"  name="Nivel_Academico" required>
										<option value="">Seleccione una...</option>
										<option value="Sin estudios">Sin estudios</option>
										<option value="Educación básica">Educación básica</option>
										<option value="Educación media">Educación media</option>
										<option value="Educación superior">Educación superior</option>
									</select>
							</div>
							<div class="form-group" style="width:49%; float: right;">
									<label for="inputEstado_civil" style="color: whitesmoke">Estado civil</label>
									<select class="form-control" style="height: 34px" id="inputEstado_civil"  name="Estado civil" required>
										<option value="">Seleccione una...</option>
										<option value="soltero">Soltero</option>
										<option value="casado">Casado</option>
										<option value="viudo">Viudo</option>
										<option value="divorciado">Divorciado</option>
									</select>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputNum_hijos" style="color: whitesmoke">Numero de hijos</label>
								<input class="form-control" name="Num_Hijos" type="number" id="inputNum_hijos"placeholder="Introduzca cantidad">
							</div>
							<div class="form-group" style="width:49%; float: right;margin-bottom:0px">
									<label for="inputCharge" style="color: whitesmoke; padding-right: 5px">Encargado de oficina:</label>
									<input class="form-check-input" name="Charge" type="checkbox" value="true" id="inputCharge">
							</div>
							<div  id="inputEncargado" class="form-group" style="width:49%; float: right;display: none">
									<input class="form-control" name="Empleado_Cargo" type="text" id="inputEncargado"placeholder="Introduzca nombre de oficina">
								</div>
							<div style="width:100%; height: 40px; float: left; ">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@endsection