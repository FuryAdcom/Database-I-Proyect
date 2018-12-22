@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/ruta">Inicio</a>
		<a href="/ruta/create">Agregar</a>
		<a href="/ruta/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear ruta</h3>
						<form action="/ruta/store" method="POST">
							@csrf
							@if(Session::has('message'))
								<div class="alert alert-warning"> {{Session::get('message')}} </div>
							@endif

							<div class="form-group" style="width:49%; float: left;margin-bottom:0px">
								<label for="inputCharge" style="color: whitesmoke; padding-right: 5px">Crear a partir de ruta existente:</label>
								<input class="form-check-input" name="Charge" type="checkbox" value="true" @if ( old('Charge') ) checked @endif id="inputCharge">
							</div>
							<div class="form-group" style="width:100%; float: left; @if ( is_null(old('Charge') )) display: none @else display: block @endif" id="inputEncargado">
								<input class="form-control" name="FK_Ruta" list="rutas" placeholder="Ruta" style="width: 100%;">
								<datalist id="rutas">
									@foreach ($rutas as $ruta)
										<option value="{{ $ruta->Codigo }}"> {{ $ruta->ofog.': '.$ruta->og.', '.$ruta->oge.' - '.$ruta->ofdest.': '.$ruta->dest.', '.$ruta->deste }} </option>
									@endforeach
								</datalist>
							</div>
							<div class="form-group" style="width:100%; float: left">
								<label for="inputDescripcion" style="color: whitesmoke">Descripcion</label>
								<input type="text" name="Descripcion" value="{{ old('Descripcion') }}" class="form-control" id="Descripcion" placeholder="Descripcion de la ruta (Ej: Alto Orinoco-Atabapo)" required>
							</div>
							<div class="form-group" style="width:50%; float: left; @if ( is_null(old('Charge') )) display: block @else display: none @endif" id="inputEncargado2">
								<label for="inputFK_Ofi_Origen" style="color: whitesmoke">Oficina Origen</label>
								<input class="form-control" name="FK_Ofi_Origen" value="{{ old('FK_Ofi_Origen') }}" list="oficinas" placeholder="Nombre de oficina origen">
								<datalist id="oficinas">
									@foreach ($oficinas as $oficina)
										<option value="{{ $oficina->Codigo }}"> {{ $oficina->Nombre }} </option>
									@endforeach
								</datalist>
							</div>
							<div class="form-group" style="width:50%; float: left;" id="inputFK_Ofi_Destino">
								<label for="inputFK_Ofi_Destino" style="color: whitesmoke">Oficina Destino</label>
								<input class="form-control" name="FK_Ofi_Destino" value="{{ old('FK_Ofi_Destino') }}" list="oficinas" placeholder="Nombre de oficina destino">
								<datalist id="oficinas">
									@foreach ($oficinas as $oficina)
										<option value="{{ $oficina->Codigo }}"> {{ $oficina->Nombre }} </option>
									@endforeach
								</datalist>
							</div>

							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Crear</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@endsection