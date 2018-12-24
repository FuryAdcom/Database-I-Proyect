@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/envio">Inicio</a>
		<a href="/envio/create">Agregar</a>
		<a href="/envio/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear envio</h3>
						<form action="/envio/store" method="POST">
							@csrf

							<div class="form-group" style="width:100%; float: left;" id="inputPaquete">
									<label for="inputPaquete" style="color: whitesmoke">Paquete a enviar</label>
									<input class="form-control" name="Paquete" list="paquetes" placeholder="Paquete a enviar" style="width: 100%;">
									<datalist id="paquetes">
										@foreach ($paquetes as $paquete)
											<option value="{{ $paquete->Numero_guia }}"> {{ $paquete->nombre.' '.$paquete->apellido }} </option>
										@endforeach
									</datalist>
								</div>
							<div class="form-group" style="width:100%; float: left;" id="inputRuta">
								<label for="inputRuta" style="color: whitesmoke">Ruta de envio</label>
								<input class="form-control" name="Ruta" list="rutas" placeholder="Ruta" style="width: 100%;">
								<datalist id="rutas">
									@foreach ($rutas as $ruta)
										<option value="{{ $ruta->Codigo }}"> {{ $ruta->ofog.': '.$ruta->og.', '.$ruta->oge.' - '.$ruta->ofdest.': '.$ruta->dest.', '.$ruta->deste }} </option>
									@endforeach
								</datalist>
							</div>

							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Siguiente</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@endsection