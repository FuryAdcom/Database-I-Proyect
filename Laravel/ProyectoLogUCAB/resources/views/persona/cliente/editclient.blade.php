@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/cliente">Inicio</a>
		<a href="/cliente/create">Agregar</a>
		<a href="/cliente/lista" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
        <!--Modificar-->
        <h3 style="text-align: center; color: whitesmoke">Modificar cliente</h3>
		<form method="POST" action="/cliente/update">
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
				<!-- Fecha -->
				<div class="form-group" style="width:49%; float: right;">
					<label for="inputFecha_Nacimiento" style="color: whitesmoke">Fecha Nacimiento</label>
					<input type="date" name="Fecha_Nacimiento" value="{{$validated->Fecha_Nacimiento}}" class="form-control" id="inputFecha_Nacimiento"placeholder="Introduzca fecha de nacimiento" required>
				</div>
				<!--  -->
				<div class="form-group" style="width:49%; float: left;">
					<label for="inputEmpresa" style="color: whitesmoke">Empresa</label>
					<input type="text" name="Empresa" value="{{$validated->Empresa}}" class="form-control" id="inputEmpresa" placeholder="Empresa">
				</div>
				<div class="form-group" style="width:49%; float: right;">
						<label for="inputEstado_civil" style="color: whitesmoke">Estado civil</label>
						<select class="form-control" style="height: 34px" id="inputEstado_civil"  name="Estado_Civil" required>
							<option value="">Seleccione una...</option>
							<option value="soltero"@if($validated->Estado_Civil='soltero') selected @endif>Soltero</option>
							<option value="casado"@if($validated->Estado_Civil='casado') selected @endif>Casado</option>
							<option value="viudo"@if($validated->Estado_Civil='viudo') selected @endif>Viudo</option>
							<option value="divorciado"@if($validated->Estado_Civil='divorciado') selected @endif>Divorciado</option>
						</select>
				</div>
				<div class="form-group" style="width:49%; float: left;">
						<label for="inputL_vip" style="color: whitesmoke">L-VIP:</label>
						<input class="form-check-input" name="l_vip" @if($validated->L_Vip=true) checked @endif type="checkbox" value="true" id="inputL_vip">
						<small id="inputL_vip" style="color: rgb(180, 198, 214); padding-left: 20px">Seleccione si desea ser cliente VIP</small>
					</div>
				<div style="width:100%; height: 40px; float: left;">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
        <!---->
	</div>
</div>		
@endsection