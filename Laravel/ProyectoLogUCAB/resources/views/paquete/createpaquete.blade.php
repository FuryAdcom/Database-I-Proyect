@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/paquete">Inicio</a>
		<a href="/paquete/create">Agregar</a>
		<a href="/paquete/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear paquete</h3>
						<form action="/paquete/store" method="POST">
							@csrf
							@if(Session::has('message'))
								<div class="alert alert-info"> {{Session::get('message')}} </div>
							@elseif(Session::has('messagedel'))
								<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
							@endif

							<div class="form-group" style="width:49%; float: left">
								<label for="inputDestinatario" style="color: whitesmoke">Destinatario</label>
								<input type="text" name="Destinatario" value="{{ old('Destinatario') }}" class="form-control" id="Destinatario" placeholder="Nombre del destinatario" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputClasificacion" style="color: whitesmoke">Clasificacion</label>
								<select class="form-control" style="height: 34px" id="inputClasificacion"  name="Clasificacion" required>
									<option value="">Seleccione una...</option>
									<option value="Linea blanca" @if (old('Clasificacion') == 'Linea blanca') selected @endif>Linea blanca</option>
									<option value="Alimento"@if (old('Clasificacion') == 'Alimento') selected @endif>Alimento</option>
									<option value="Electrónica"@if (old('Clasificacion') == 'Electrónica') selected @endif>Electrónica (Telefono, Computador, Consola, etc)</option>
									<option value="Vestimenta"@if (old('Clasificacion') == 'Vestimenta') selected @endif>Vestimenta</option>
									<option value="Juguete"@if (old('Clasificacion') == 'Juguete') selected @endif>Juguete</option>
									<option value="Automovil"@if (old('Clasificacion') == 'Automovil') selected @endif>Automovil</option>
									<option value="Medicamento"@if (old('Clasificacion') == 'Medicamento') selected @endif>Medicamento</option>
									<option value="Otro"@if (old('Clasificacion') == 'Otro') selected @endif>Otro</option>
								</select>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputPeso" style="color: whitesmoke">Peso</label>
								<input type="number" name="Peso"value="{{ old('Peso') }}" class="form-control" id="inputPeso" placeholder="Introduzca peso del paquete en Kg" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputAncho" style="color: whitesmoke">Ancho</label>
								<input type="number" name="Ancho"value="{{ old('Ancho') }}" class="form-control" id="inputAncho"placeholder="Introduzca ancho en m" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputLargo" style="color: whitesmoke">Largo</label>
								<input type="number" name="Largo"value="{{ old('Largo') }}" class="form-control" id="inputLargo" placeholder="Introduzca largo en m" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputProfundidad" style="color: whitesmoke">Profundidad</label>
								<input type="number" name="Profundidad"value="{{ old('Profundidad') }}" class="form-control" id="inputProfundidad"placeholder="Introduzca profundidad en m" required>
							</div>
							<div class="form-group" style="width:49%; float: left;" id="inputFK_Entrega">
								<label for="inputFK_Entrega" style="color: whitesmoke">Cliente del paquete</label>
								<input class="form-control" name="FK_Entrega"value="{{ old('FK_Entrega') }}" list="clientes" placeholder="Nombre de cliente">
									<datalist id="clientes">
										@foreach ($clientes as $cliente)
											<option value="{{ $cliente->Cedula }}"> {{$cliente->Nombre}} </option>
										@endforeach
									</datalist>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputTelefono_Contacto" style="color: whitesmoke">Telefono Contacto</label>
								<input type="tel" pattern="[0-9]{4}-[0-9]{7}"value="{{ old('Telefono_Contacto') }}" name="Telefono_Contacto" class="form-control" id="inputTelefono_Contacto" placeholder="Introduzca un telefono para contactar (Formato: 0XXX-XXXXXXX)" required>
							</div>

							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Crear</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@endsection