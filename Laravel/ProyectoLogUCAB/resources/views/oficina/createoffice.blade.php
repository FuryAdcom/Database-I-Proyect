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
							@if(Session::has('message'))
								<div class="alert alert-warning"> {{Session::get('message')}} </div>
							@endif

							<div class="form-group" style="width:49%; float: left">
								<label for="inputNombre" style="color: whitesmoke">Nombre</label>
								<input type="text" name="Nombre" value="{{old('Nombre')}}" class="form-control" placeholder="Introduzca el nombre" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputDeposito" style="color: whitesmoke">Depósito</label>
								<input type="number" name="Deposito" value="{{old('Deposito')}}" class="form-control" placeholder="Introduzca el tamaño del deposito (En m²)" required>
							</div>
							<div class="form-group" style="width:49%; float: left;" id="inputFK_Entrega">
								<label for="inputFK_Entrega" style="color: whitesmoke">Estado</label>
								<input class="form-control" name="est"value="{{ old('est') }}" list="estados" placeholder="Ubicacion Estado">
									<datalist id="estados">
										@foreach ($estados as $e)
											<option value="{{ $e->Nombre }}">
										@endforeach
									</datalist>
							</div>
							<div class="form-group" style="width:49%; float: right;" id="inputFK_Entrega">
								<label for="inputFK_Entrega" style="color: whitesmoke">Municipio</label>
								<input class="form-control" name="lugar"value="{{ old('lugar') }}" list="muns" placeholder="Ubicacion Municipio">
									<datalist id="muns">
										@foreach ($muns as $m)
											<option value="{{ $m->Nombre }}"> {{$m->est}} </option>
										@endforeach
									</datalist>
							</div>
							<div class="form-group" style="width:49%; float: left;">
									<label for="inputTelefono" style="color: whitesmoke">Telefono</label>
									<input type="text"  name="Telefono" value="{{old('Telefono')}}" class="form-control" placeholder="Introduzca el telefono (Formato: 0XXXXXXXXXX)" required>
								</div>

							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Crear</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@endsection