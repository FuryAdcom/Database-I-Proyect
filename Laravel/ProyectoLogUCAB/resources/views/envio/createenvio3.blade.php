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
						<form action="/envio/store3" method="POST">
							@csrf

							<input class="form-control" name="paquete" type="number" value="{{$request->paquete}}" hidden>
							<input class="form-control" name="veh_rut" type="number" value="{{$request->Vehiculo}}" hidden>
							<input class="form-control" name="costo" type="number" value="{{$costo}}" hidden>
							<input class="form-control" name="destino" type="number" value="{{$destino}}" hidden>
							<input class="form-control" name="ruta" type="number" value="{{$route}}" hidden>
							<div class="form-group" style="width:100%; float: left;margin-bottom:0px">
								<label for="inputPaquete" style="color: whitesmoke;">Paquete a enviar: {{$paquete->Numero_guia}}</label><br>
								<label for="inputPeso" style="color: whitesmoke;">Peso de paquete: {{$paquete->Peso}}</label><br>
								<label for="inputDimensiones" style="color: whitesmoke;">Dimensiones del paquete (AxLxP en cm): {{$paquete->Ancho.' x '.$paquete->Largo.' x '.$paquete->Profundidad}}</label><br>
								<label for="inputOG" style="color: whitesmoke;">Oficina de envio: {{$ofiog->Nombre.'. Codigo: '.$ofiog->Codigo}}</label><br>
								<label for="inputDEST" style="color: whitesmoke;">Oficina destino: {{$ofidest->Nombre.'. Codigo: '.$ofidest->Codigo}}</label><br>
								<h1 for="inputCosto" style="color: whitesmoke;">Costo del envio: {{$costo}}</h1><br>
								<h1 for="inputEstimado" style="color: whitesmoke;">Fecha estimada: {{$est}}</h1><br>
                            </div>
                            <h1 style="color: whitesmoke">Si esta seguro de estos datos, presione Enviar.</h1>

							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Enviar</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@endsection