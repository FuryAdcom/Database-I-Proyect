@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/taller">Inicio</a>
		<a href="/taller/create">Agregar</a>
	</div>
	<div class="contenido_ppal">
        <!--Modificar-->
        <h3 style="text-align: center; color: whitesmoke">Modificar taller</h3>
		<form method="POST" action="/taller/update">
			@csrf
			<!-- Mensaje de alerta -->
			@if(Session::has('message'))
				<div class="alert alert-warning"> {{Session::get('message')}} </div>
			@endif
			<!---->
			<input type="text" name="Codigo" value="{{$taller->Codigo}}" hidden>
			<input type="text" name="CIog" value="{{$contacto->CI}}" hidden>

			<h3 style="color: whitesmoke"> Contacto </h3>
			<div class="form-group" style="width:49%; float: left">
				<label for="inputNombre" style="color: whitesmoke">Nombre Contacto</label>
				<input type="text" name="Nombre" value="{{old('Nombre', $contacto->Nombre)}}" class="form-control" placeholder="Introduzca el nombre" required>
			</div>
			<div class="form-group" style="width:49%; float: right;">
				<label for="inputCI" style="color: whitesmoke">Cedula Contacto</label>
				<input type="number" name="CI" value="{{old('CI', $contacto->CI)}}" class="form-control" placeholder="Introduzca la cedula" required>
			</div>
			<div class="form-group" style="width:49%; float: left;">
				<label for="inputTelefono" style="color: whitesmoke">Telefono Contacto</label>
				<input type="text"  name="TelefonoC" value="{{old('TelefonoC', $telefonoc)}}" class="form-control" placeholder="Introduzca el telefono (Formato: 0XXXXXXXXXX)" required>
			</div>
			<h3 style="color: whitesmoke"> Taller </h3>
			<div class="form-group" style="width:100%; float: left;" id="inputFK_Locacion">
				<label for="inputFK_Locacion" style="color: whitesmoke">Lugar de ubicacion:</label>
				<input class="form-control" name="FK_Locacion" value="{{old('FK_Locacion', $taller->FK_Locacion)}}" list="muns" placeholder="Municipio de ubicacion" required>
				<datalist id="muns">
					@foreach ($muns as $mun)
						<option value="{{ $mun->Codigo }}">{{ $mun->Nombre.', '.$mun->est }}</option>
					@endforeach
				</datalist>
			</div>
			<div class="form-group" style="width:49%; float: left;">
					<label for="inputTelefono" style="color: whitesmoke">Telefono</label>
					<input type="text"  name="Telefono" value="{{old('Telefono', $telefono)}}" class="form-control" placeholder="Introduzca el telefono (Formato: 0XXXXXXXXXX)" required>
			</div>


			<div style="width:100%; height: 40px; float: left;">
				<button type="submit" class="btn btn-primary">Modificar</button>
			</div>
		</form>
        <!--End of modify-->
	</div>
</div>		
@endsection