@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/transporte">Inicio</a>
		<a href="/transporte/create">Agregar</a>
		<a href="/transporte/edit">Modificar</a>
		<a href="/transporte/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear vehiculo</h3>
						<form>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputPlaca" style="color: whitesmoke">Placa</label>
								<input type="text" class="form-control" id="inputPlaca" placeholder="Introduzca la placa" required>
								<small id="placa" style="color: rgb(180, 198, 214)">Con ella identificaremos el vehiculo.</small>
							</div>
							<div class="form-group" style="width:49%; float: right;height: 79px">
								<label for="inputSerial" style="color: whitesmoke">Serial motor</label>
								<input type="text" class="form-control" id="inputSerial"placeholder="Introduzca el serial" required>
							</div>
							<div class="form-group" style="width:49%; float: left">
								<label for="inputMarca" style="color: whitesmoke">Marca</label>
								<input type="text" class="form-control" id="inputMarca" placeholder="Introduzca la marca">
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputModelo" style="color: whitesmoke">Modelo</label>
								<input type="text" class="form-control" id="inputModelo" placeholder="Introduzca el modelo" required>
							</div>
							<div class="form-group" style="width:49%; float: left">
								<label for="inputPeso" style="color: whitesmoke">Peso</label>
								<input type="number" class="form-control" id="inputPeso" placeholder="Introduzca el peso">
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputCapa" style="color: whitesmoke">Capacidad</label>
								<input type="number" class="form-control" id="inputCapa" placeholder="Introduzca la capacidad" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputAltura" style="color: whitesmoke">Altura</label>
								<input type="number" class="form-control" id="inputAltura"placeholder="Introduzca la altura" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputCapaComb" style="color: whitesmoke">Capacidad de combustible</label>
								<input type="number" class="form-control" id="inputCapaComb" placeholder="Introduzca la capacidad de combustible" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputVel" style="color: whitesmoke">Velocidad maxima</label>
								<input type="number" class="form-control" id="inputVel"placeholder="Introduzca la velocidad maxima" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputClasificacion" style="color: whitesmoke">Clasificacion</label>
								<select class="form-control" id="inputClasificacion"  name="Clasificacion" required>
									<option value="">Seleccione una</option>
									<option value="a">Aereo</option>
									<option value="m">Maritimo</option>
									<option value="t">Terrestre</option>
								</select>
							</div>
							<div id="vehAereo" class="form-group" style="width:100%; display:none;">
								<h3 style="color: whitesmoke">Vehiculo aereo</h3>
								<div class="form-group" style="width:49%; float: left;">
									<label for="inputEnv" style="color: whitesmoke">Envergadura</label>
									<input type="number" class="form-control" id="inputEnv" placeholder="Introduzca la envergadura">
								</div>
								<div class="form-group" style="width:49%; float: right;">
									<label for="inputCab" style="color: whitesmoke">Ancho cabina</label>
									<input type="number" class="form-control" id="inputCab" placeholder="Introduzca el ancho de la cabina">
								</div>
								<div class="form-group" style="width:49%; float: left;">
									<label for="inputDiaFus" style="color: whitesmoke">Diametro fusilaje</label>
									<input type="number" class="form-control" id="inputDiaFus" placeholder="Introduzca el diametro fusilaje">
								</div>
								<div class="form-group" style="width:49%; float: right;">
									<label for="inputPesVac" style="color: whitesmoke">Peso vacio</label>
									<input type="number" class="form-control" id="inputPesVac" placeholder="Introduzca el peso cuando esta vacio">
								</div>
								<div class="form-group" style="width:49%; float: left;">
									<label for="inputPesMax" style="color: whitesmoke">Peso maximo para despegue</label>
									<input type="number" class="form-control" id="inputPesMax" placeholder="Introduzca el peso maximo">
								</div>
								<div class="form-group" style="width:49%; float: right;">
									<label for="inputCarDes" style="color: whitesmoke">Distancia de carrera despegue</label>
									<input type="number" class="form-control" id="inputCarDes" placeholder="Introduzca la carrera para despegue">
								</div>
								<div class="form-group" style="width:100%; float: left;">
									<label for="inputMotor" style="color: whitesmoke">Motor (Turbina)</label>
									<input type="text" class="form-control" id="inputMotor" placeholder="Introduzca el motor">
								</div>
							</div>
							<div id="vehMar" class="form-group" style="width:100%; display:none;">
								<h3 style="color: whitesmoke">Vehiculo maritimo</h3>
								<label for="inputNomNav" style="color: whitesmoke">Nombre embarcacion</label>
								<input type="text" class="form-control" id="inputNomNav" placeholder="Introduzca nombre del navio">
							</div>
							<div id="vehTer" class="form-group" style="width:100%; display:none;">
								<h3 style="color: whitesmoke">Vehiculo terrestre</h3>
								<label for="inputSerCar" style="color: whitesmoke">Serial carroceria</label>
								<input type="text" class="form-control" id="inputSerCar" placeholder="Introduzca serial de la carroceria">
							</div>
							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@stop