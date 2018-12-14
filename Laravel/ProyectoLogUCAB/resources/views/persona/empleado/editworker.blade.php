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
			<input type="text" name="Cedula" value="{{$validated->Cedula}}" hidden>
			<div class="form-group" style="width:100%; float: left">
					<label for="inputCedula" style="color: whitesmoke">Cedula</label>
					<input type="number" name="Cedula" value="{{$validated->Cedula}}" class="form-control" disabled required>
					<small id="Cedula" style="color: rgb(180, 198, 214)">Importante.</small>
			</div>
			<div class="form-group" style="width:49%; float: left">
					<label for="inputNombre" style="color: whitesmoke">Nombre</label>
					<input type="text" name="Nombre" value="{{$validated->Nombre}}" class="form-control" id="Nombre" placeholder="Introduzca nombre" required>
				</div>
				<div class="form-group" style="width:49%; float: right;">
					<label for="inputApellido" style="color: whitesmoke">Apellido</label>
					<input type="text" name="Apellido" value="{{$validated->Apellido}}" class="form-control" id="inputApellido" placeholder="Introduzca apellido" required>
				</div>
				<div class="form-group" style="width:49%; float: left;">
					<label for="inputCorreo_Personal" style="color: whitesmoke">Correo</label>
					<input type="text" name="Correo_Personal" value="{{$validated->Correo_Personal}}" class="form-control" id="inputCorreo_Personal"placeholder="Introduzca correo" required>
				</div>
				<div class="form-group" style="width:49%; float: right;">
					<label for="inputFecha_Nacimiento" style="color: whitesmoke">Fecha Nacimiento</label>
					<input type="date" name="Fecha_Nacimiento" value="{{$validated->Fecha_Nacimiento}}" class="form-control" id="inputFecha_Nacimiento"placeholder="Introduzca fecha de nacimiento" required>
				</div>
				<div class="form-group" style="width:60%; float: left;">
						<label for="inputRol" style="color: whitesmoke">Rol</label>
						<input type="text" name="rol"value="{{$validated->rol}}" class="form-control" id="inputRol"placeholder="Introduzca rol" required>
					</div>
				<div class="form-group" style="width:49%; float: left;">
						<label for="inputNivel_Academico" style="color: whitesmoke">Nivel Academico</label>
						<select class="form-control" style="height: 34px" id="inputNivel_Academico"  name="Nivel_Academico" required>
							<option value="">Seleccione una...</option>
							<option value="Sin estudios"@if($validated->Nivel_Academico='Sin estudios') selected @endif>Sin estudios</option>
							<option value="Educación básica"@if($validated->Nivel_Academico='Educación básica') selected @endif>Educación básica</option>
							<option value="Educación media"@if($validated->Nivel_Academico='Educación media') selected @endif>Educación media</option>
							<option value="Educación superior"@if($validated->Nivel_Academico='Educación superior') selected @endif>Educación superior</option>
						</select>
				</div>
				<div class="form-group" style="width:49%; float: right;">
						<label for="inputEstado_civil" style="color: whitesmoke">Estado civil</label>
						<select class="form-control" style="height: 34px" id="inputEstado_civil"  name="estado_civil" required>
							<option value="">Seleccione una...</option>
							<option value="soltero"@if($validated->estado_civil='soltero') selected @endif>Soltero</option>
							<option value="casado"@if($validated->estado_civil='casado') selected @endif>Casado</option>
							<option value="viudo"@if($validated->estado_civil='viudo') selected @endif>Viudo</option>
							<option value="divorciado"@if($validated->estado_civil='divorciado') selected @endif>Divorciado</option>
						</select>
				</div>
				<div class="form-group" style="width:49%; float: left;">
						<label for="inputNum_hijos" style="color: whitesmoke">Numero de hijos</label>
						<input class="form-control" name="Num_Hijos"value="{{$validated->Num_Hijos}}" type="number" id="inputNum_hijos"placeholder="Introduzca cantidad">
					</div>
					<div class="form-group" style="width:49%; float: right;margin-bottom:0px">
							<label for="inputCharge" style="color: whitesmoke; padding-right: 5px">Encargado de oficina:</label>
							<input class="form-check-input" name="Charge"@if($validated->Charge=true) checked @endif type="checkbox" value="true" id="inputCharge">
					</div>
					<div  id="inputEncargado" class="form-group" @if($validated->Charge=true) style="width:49%; float: right" @else style="width:49%; float: right;display: none"  @endif>
							<input class="form-control" name="Empleado_Cargo"value="{{$validated->Empleado_Cargo}}" type="text" id="inputEncargado"placeholder="Introduzca nombre de oficina">
						</div>
			<div style="width:100%; height: 40px; float: left;">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
        <!---->
	</div>
</div>		
@endsection