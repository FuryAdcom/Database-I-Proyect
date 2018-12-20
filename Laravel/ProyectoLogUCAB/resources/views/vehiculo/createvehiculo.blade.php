@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/transporte">Inicio</a>
		<a href="/transporte/create">Agregar</a>
		<a href="/transporte/listaAerea">Aereos</a>
		<a href="/transporte/listaMarina">Maritimos</a>
		<a href="/transporte/listaTerrestre" style="border-bottom: 0px">Terrestres</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear vehiculo</h3>
						<form action="/transporte/store" method="POST">
						@csrf
							@if(Session::has('message'))
								<div class="alert alert-warning"> {{Session::get('message')}} </div>
							@endif

							<div class="form-group" style="width:49%; float: left;">
								<label for="inputPlaca" style="color: whitesmoke">Placa</label>
								<input type="text" name="Placa" value="{{old('Placa')}}" class="form-control" id="inputPlaca" placeholder="Introduzca la placa" required>
								<small id="placa" style="color: rgb(180, 198, 214)">Con ella identificaremos el vehiculo.</small>
							</div>
							<div class="form-group" style="width:49%; float: right;height: 79px">
								<label for="inputSerial" style="color: whitesmoke">Serial motor</label>
								<input type="text" name="Serial_Motor"value="{{old('Serial_Motor')}}" class="form-control" id="inputSerial"placeholder="Introduzca el serial" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputModelo" style="color: whitesmoke">Modelo</label>
								<input type="text" name="modelo"value="{{old('modelo')}}" class="form-control" id="inputModelo" placeholder="Introduzca el modelo" required>
							</div>
							<div class="form-group" style="width:49%; float: right">
								<label for="inputMarca" style="color: whitesmoke">Marca</label>
								<input type="text" name="marca"value="{{old('marca')}}" class="form-control" id="inputMarca" placeholder="Introduzca la marca">
							</div>
							<div class="form-group" style="width:49%; float: left">
								<label for="inputPeso" style="color: whitesmoke">Peso</label>
								<input type="number" name="Peso"value="{{old('Peso')}}" step="0.01" class="form-control" id="inputPeso" placeholder="Introduzca el peso">
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputCapa" style="color: whitesmoke">Capacidad</label>
								<input type="number" name="Capacidad"value="{{old('Capacidad')}}" step="0.01" class="form-control" id="inputCapa" placeholder="Introduzca la capacidad" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputAltura" style="color: whitesmoke">Altura</label>
								<input type="number" name="Altura"value="{{old('Altura')}}" step="0.01" class="form-control" id="inputAltura"placeholder="Introduzca la altura" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputCapaComb" style="color: whitesmoke">Capacidad de combustible</label>
								<input type="number" name="Capacidad_Combustible"value="{{old('Capacidad_Combustible')}}" step="0.01" class="form-control" id="inputCapaComb" placeholder="Introduzca la capacidad de combustible" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputVel" style="color: whitesmoke">Velocidad maxima</label>
								<input type="number" name="Velocidad_Maxima"value="{{old('Velocidad_Maxima')}}" class="form-control" id="inputVel"placeholder="Introduzca la velocidad maxima" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputClasificacion" style="color: whitesmoke">Clasificacion</label>
								<select class="form-control" style="height: 34px" id="inputClasificacion" name="Clasificacion" required>
									<option value="">Seleccione una</option>
									<option value="a" @if(old('Clasificacion') == 'a') selected @endif>Aereo</option>
									<option value="m" @if(old('Clasificacion') == 'm') selected @endif>Maritimo</option>
									<option value="t" @if(old('Clasificacion') == 't') selected @endif>Terrestre</option>
								</select>
							</div>
							<div id="vehAereo" class="form-group" style="width:100%; @if ( old('Clasificacion') == 'a') display: block @else display: none @endif">
								<h3 style="color: whitesmoke">Vehiculo aereo</h3>
								<div class="form-group" style="width:49%; float: left;">
									<label for="inputEnv" style="color: whitesmoke">Envergadura</label>
									<input type="number" name="Envergadura"value="{{old('Envergadura')}}" step="0.01" class="form-control" id="inputEnv" placeholder="Introduzca la envergadura">
								</div>
								<div class="form-group" style="width:49%; float: right;">
									<label for="inputCab" style="color: whitesmoke">Ancho cabina</label>
									<input type="number" name="Ancho_Cabina"value="{{old('Ancho_Cabina')}}" step="0.01" class="form-control" id="inputCab" placeholder="Introduzca el ancho de la cabina">
								</div>
								<div class="form-group" style="width:49%; float: left;">
									<label for="inputDiaFus" style="color: whitesmoke">Diametro fuselaje</label>
									<input type="number" name="Diametro_Fusilaje"value="{{old('Diametro_Fusilaje')}}" step="0.01" class="form-control" id="inputDiaFus" placeholder="Introduzca el diametro fuselaje">
								</div>
								<div class="form-group" style="width:49%; float: right;">
									<label for="inputPesVac" style="color: whitesmoke">Peso vacio</label>
									<input type="number" name="Peso_Vacio"value="{{old('Peso_Vacio')}}" step="0.01" class="form-control" id="inputPesVac" placeholder="Introduzca el peso cuando esta vacio">
								</div>
								<div class="form-group" style="width:49%; float: left;">
									<label for="inputPesMax" style="color: whitesmoke">Peso maximo para despegue</label>
									<input type="number" name="Peso_Max_Despegue"value="{{old('Peso_Max_Despegue')}}" step="0.01" class="form-control" id="inputPesMax" placeholder="Introduzca el peso maximo">
								</div>
								<div class="form-group" style="width:49%; float: right;">
									<label for="inputCarDes" style="color: whitesmoke">Distancia de carrera despegue</label>
									<input type="number" name="Carrera_Despegue"value="{{old('Carrera_Despegue')}}" step="0.01" class="form-control" id="inputCarDes" placeholder="Introduzca la carrera para despegue">
								</div>
								<div class="form-group" style="width:100%; float: left;">
									<label for="inputMotor" style="color: whitesmoke">Motor (Turbina)</label>
									<input type="text" name="Motores"value="{{old('Motores')}}" class="form-control" id="inputMotor" placeholder="Introduzca el motor">
								</div>
							</div>
							<div id="vehMar" class="form-group" style="width:100%; @if ( old('Clasificacion') == 'm') display: block @else display: none @endif">
								<h3 style="color: whitesmoke">Vehiculo maritimo</h3>
								<label for="inputNomNav" style="color: whitesmoke">Nombre embarcacion</label>
								<input type="text" name="Nombre"value="{{old('Nombre')}}" class="form-control" id="inputNomNav" placeholder="Introduzca nombre del navio">
							</div>
							<div id="vehTer" class="form-group" style="width:100%; @if ( old('Clasificacion') == 't') display: block @else display: none @endif">
								<h3 style="color: whitesmoke">Vehiculo terrestre</h3>
								<label for="inputSerCar" style="color: whitesmoke">Serial carroceria</label>
								<input type="text" name="Serial_Carroceria"value="{{old('Serial_Carroceria')}}" class="form-control" id="inputSerCar" placeholder="Introduzca serial de la carroceria">
							</div>
							<div class="form-group" style="width:100%; float: left;" id="inputFK_Cuentacon">
								<label for="inputFK_Cuentacon" style="color: whitesmoke">Oficina a la que pertenece</label>
								<input class="form-control" name="FK_Cuentacon" value="{{old('FK_Cuentacon')}}" list="oficinas" placeholder="Nombre de oficina">
								<datalist id="oficinas">
									<option value="">
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