@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/zona">Inicio</a>
		<a href="/zona/create">Agregar</a>
		<a href="/zona/lista" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
        <!--Modificar-->
        <h3 style="text-align: center; color: whitesmoke">Modificar zona</h3>
		<form method="POST" action="/zona/update">
			@csrf
			<!-- Mensaje de alerta -->
			@if(Session::has('message'))
				<div class="alert alert-warning"> {{Session::get('message')}} </div>
			@endif
			<!---->
			<input type="text" name="Codigo" value="{{$validated->Codigo}}" hidden>

			<div class="form-group" style="width:49%; float: left">
					<label for="inputNombre" style="color: whitesmoke">Nombre</label>
					<input type="text" name="Nombre" value="{{old('Nombre', $validated->Nombre)}}" class="form-control" placeholder="Introduzca el nombre" required>
			</div>
			<div class="form-group" style="width:49%; float: right;">
					<label for="inputDescripcion" style="color: whitesmoke">Descripcion</label>
					<input type="text" name="Descripcion" value="{{old('Descripcion', $validated->Descripcion)}}" class="form-control" placeholder="Introduzca una descripcion" required>
			</div>
			<div class="form-group" style="width:49%; float: left;">
					<label for="inputDivision_area" style="color: whitesmoke">Division area (m²)</label>
					<input type="number" name="Division_area" value="{{old('Division_area', $validated->Division_area)}}" class="form-control" placeholder="Introduzca el tamaño de la zona" required>
			</div>
			<div class="form-group" style="width:49%; float: right;" id="inputFK_Divide">
					<label for="inputFK_Divide" style="color: whitesmoke">Oficina de la zona</label>
					<input class="form-control" name="FK_Divide" value="{{old('FK_Divide', $validated->FK_Divide)}}" list="oficinas" placeholder="Oficina a la que pertenece esta zona">
						<datalist id="oficinas">
							@foreach ($oficinas as $oficina)
								<option value="{{ $oficina->Codigo }}"> {{ $oficina->Nombre.'. '.$oficina->mun.', '.$oficina->est }} </option>
							@endforeach
						</datalist>
			</div>

			<div style="width:100%; height: 40px; float: left;">
				<button type="submit" class="btn btn-primary">Modificar</button>
			</div>
		</form>
        <!--End of modify-->
	</div>
</div>		
@endsection