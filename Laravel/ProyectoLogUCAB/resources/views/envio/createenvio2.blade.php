@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/envio">Inicio</a>
		<a href="/envio/create">Crear</a>
		<a href="/envio/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear envio</h3>
						<form action="/envio/store2" method="POST">
							@csrf

							<input class="form-control" name="paquete" type="number" value="{{$paquete->Numero_guia}}" hidden>
							<div class="form-group" style="width:100%; float: left" id="inputVehiculo">
								<label for="inputVehiculo" style="color: whitesmoke; padding-right: 5px">Metodo de envio:</label>
                                    <input class="form-control" name="Vehiculo" list="vehiculos" placeholder="Seleccione metodo de envio">
                                    <datalist id="vehiculos">
                                        @foreach ($vehiculos as $vehiculo)
                                            <option value="{{ $vehiculo->Codigo }}"> @if($vehiculo->FK_Camino != NULL) Via Aerea: Avion identificado como {{$vehiculo->FK_Camino}} @elseif($vehiculo->FK_Camino2 != NULL) Via Marina: Embarcacion identificada como {{$vehiculo->FK_Camino2}} @else Via Terrestre: Vehiculo de placa {{$vehiculo->FK_Camino3}} @endif </option>
                                        @endforeach
                                    </datalist>
                            </div>
                            <h4 style="text-align: left; color: whitesmoke">NOTA: El costo del envio variara segun el metodo, por via aerea el costo es mayor y por via maritima sera menor.<br> La duracion del envio se vera afectado tambien por esto, inversamente propocional al costo, es decir, a mayor costo, menor tiempo de espera y viceversa.</h4>

							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Siguiente</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@endsection