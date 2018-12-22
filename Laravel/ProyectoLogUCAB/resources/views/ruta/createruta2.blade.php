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

							<input type="number" name="Codigo" value="{{ old('Codigo', $max) }}" class="form-control" hidden>                            
							<input type="text" name="Descripcion" value="{{ old('Descripcion', $request->Descripcion) }}" class="form-control" hidden>                            
							<input type="number" name="FK_Ofi_Origen" value="{{ old('FK_Ofi_Origen', $request->FK_Ofi_Origen) }}" class="form-control" hidden>                            
							<input type="number" name="FK_Ofi_Destino" value="{{ old('FK_Ofi_Destino', $request->FK_Ofi_Destino) }}" class="form-control" hidden>                            
							<input type="number" name="FK_Ruta" value="{{ old('FK_Ruta', $request->FK_Ruta) }}" class="form-control" hidden>                            

							<div class="form-group" style="width:100%; float: left;" id="inputVehiculo">
                                <label for="inputVehiculo" style="color: whitesmoke">Vehiculo</label>
                                
								@if(is_null($oficina->avion) && is_null($oficina->barco) && isset($oficina->auto))
                                    <select class="form-control" style="height: 34px" name="Vehiculo" id="inputVehiculo" required>
                                        <option value="{{ $oficina->auto }}"> Terrestre </option>
                                    </select>
                                @elseif(is_null($oficina->avion) && isset($oficina->barco) && is_null($oficina->auto))
                                    <select class="form-control" style="height: 34px" name="Vehiculo" id="inputVehiculo" required>
                                        <option value="{{ $oficina->barco }}"> Maritimo </option>
                                    </select>
                                @elseif(isset($oficina->avion) && is_null($oficina->barco) && is_null($oficina->auto))
                                    <select class="form-control" style="height: 34px" name="Vehiculo" id="inputVehiculo" required>
                                        <option value="{{ $oficina->avion }}"> Aereo </option>
                                    </select>
                                @elseif(is_null($oficina->avion) && isset($oficina->barco) && isset($oficina->auto))
                                    <select class="form-control" style="height: 34px" name="Vehiculo" id="inputVehiculo" required>
                                        <option value="{{ $oficina->barco }}"> Maritimo </option>
                                        <option value="{{ $oficina->auto }}"> Terrestre </option>
                                    </select>
                                @elseif(isset($oficina->avion) && is_null($oficina->barco) && isset($oficina->auto))
                                    <select class="form-control" style="height: 34px" name="Vehiculo" id="inputVehiculo" required>
                                        <option value="{{ $oficina->avion }}"> Aereo </option>
                                        <option value="{{ $oficina->auto }}"> Terrestre </option>
                                    </select>
                                @elseif(isset($oficina->avion) && isset($oficina->barco) && is_null($oficina->auto))
                                    <select class="form-control" style="height: 34px" name="Vehiculo" id="inputVehiculo" required>
                                        <option value="{{ $oficina->avion }}"> Aereo </option>
                                        <option value="{{ $oficina->barco }}"> Maritimo </option>
                                    </select>
                                @else
                                    <select class="form-control" style="height: 34px" name="Vehiculo" id="inputVehiculo" required>
                                        <option value="{{ $oficina->avion }}"> Aereo </option>
                                        <option value="{{ $oficina->barco }}"> Maritimo </option>
                                        <option value="{{ $oficina->auto }}"> Terrestre </option>
                                    </select>
								@endif
							</div>

							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Crear</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@endsection