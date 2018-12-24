@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/ruta">Inicio</a>
		<a href="/ruta/create">Agregar</a>
		<a href="/ruta/lista" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
        <!--Modificar-->
        <h3 style="text-align: center; color: whitesmoke">Modificar ruta</h3>
		<form method="POST" action="/ruta/update">
			@csrf
			@if(Session::has('message'))
				<div class="alert alert-warning"> {{Session::get('message')}} </div>
			@endif

			<input type="number" name="Codigo" value="{{$validated->Codigo}}" hidden="">
			<div class="form-group" style="width:49%; float: left;margin-bottom:0px">
				<label for="inputCharge" style="color: whitesmoke; padding-right: 5px">Crear a partir de ruta existente:</label>
				<input class="form-check-input" name="Charge" type="checkbox" value="true" @if (  isset($validated->FK_Ruta )  ) checked @endif id="inputCharge">
			</div>
			<div class="form-group" style="width:100%; float: left; @if ( isset($validated->FK_Ruta )) display: block @else display: none @endif" id="inputEncargado">
				<input class="form-control" name="FK_Ruta" value="{{$validated->FK_Ruta}}" list="rutas" placeholder="Ruta" style="width: 100%;">
				<datalist id="rutas">
					@foreach ($rutas as $ruta)
						<option value="{{ $ruta->Codigo }}"> {{ $ruta->ofog.': '.$ruta->og.', '.$ruta->oge.' - '.$ruta->ofdest.': '.$ruta->dest.', '.$ruta->deste }} </option>
					@endforeach
				</datalist>
			</div>
			<div class="form-group" style="width:100%; float: left">
				<label for="inputDescripcion" style="color: whitesmoke">Descripcion</label>
				<input type="text" name="Descripcion" value="{{$validated->Descripcion}}" class="form-control" id="Descripcion" placeholder="Descripcion de la ruta (Ej: Alto Orinoco-Atabapo)" required>
			</div>
			<div class="form-group" style="width:50%; float: left; @if ( isset($validated->FK_Ruta )) display: none @else display: block @endif" id="inputEncargado2">
				<label for="inputFK_Ofi_Origen" style="color: whitesmoke">Oficina Origen</label>
				<input class="form-control" name="FK_Ofi_Origen" value="{{$validated->FK_Ofi_Origen}}" list="oficinas" placeholder="Nombre de oficina origen">
				<datalist id="oficinas">
					@foreach ($oficinas as $oficina)
						<option value="{{ $oficina->Codigo }}"> {{ $oficina->Nombre }} </option>
					@endforeach
				</datalist>
			</div>
			<div class="form-group" style="width:50%; float: left;" id="inputFK_Ofi_Destino">
				<label for="inputFK_Ofi_Destino" style="color: whitesmoke">Oficina Destino</label>
				<input class="form-control" name="FK_Ofi_Destino" value="{{$validated->FK_Ofi_Destino}}" list="oficinas" placeholder="Nombre de oficina destino">
				<datalist id="oficinas">
					@foreach ($oficinas as $oficina)
						<option value="{{ $oficina->Codigo }}"> {{ $oficina->Nombre }} </option>
					@endforeach
				</datalist>
			</div>
			<div class="form-group" style="width:49%; float: left;">
					<label for="inputDuracion" style="color: whitesmoke">Duracion aproximada para un auto</label>
					<input type="number" name="Duracion" class="form-control" id="inputDuracion"placeholder="Introduzca duracion aproximada en minutos" required>
				</div>

			<div style="width:100%; height: 40px; float: left;">
				<button type="submit" class="btn btn-primary">Modificar</button>
			</div>
		</form>
        <!---->
	</div>
</div>		
@endsection