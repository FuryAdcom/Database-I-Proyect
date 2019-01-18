@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Pago</h3>
						<form action="/oficina/servpago" method="POST">
							@csrf

                                <div id="inputServ" class="form-group" style="width:100%;">
                                                <input type="number" name="of"value="{{$oficina->Codigo}}"class="form-control" id="OfCod" hidden>
                                                <h3 style="color: whitesmoke">Oficina {{$oficina->Codigo}}</h3>
                                        <div class="form-group" style="width:49%; float: left;">
                                            <label for="inputServ" style="color: whitesmoke">Servicio</label>
                                            <select class="form-control" style="height: 34px" id="inputServ"  name="Serv" required>
                                                <option value="">Seleccione uno...</option>
                                                <option value="Agua" @if (old('Serv') == 'Agua') selected @endif>Agua</option>
                                                <option value="Electricidad"@if (old('Serv') == 'Electricidad') selected @endif>Electricidad</option>
                                                <option value="Gas"@if (old('Serv') == 'Gas') selected @endif>Gas</option>
                                                <option value="Telefono"@if (old('Serv') == 'Telefono') selected @endif>Telefono</option>
                                                <option value="Internet"@if (old('Serv') == 'Internet') selected @endif>Internet</option>
                                            </select>
                                        </div>
                                        <div class="form-group" style="width:49%; float: right;">
                                                <label for="inputMonto_Total" style="color: whitesmoke">Monto</label>
                                                <input type="number" name="Monto_Total"value="{{old('Monto_Total')}}" step="0.01" class="form-control" id="inputMonto_Total" placeholder="Introduzca el Monto Total">
                                        </div>
                                </div>

                                <div style="width:100%; height: 40px; float: left;">
                                    <button type="submit" class="btn btn-primary">Pagar</button>
                                </div>
                            @endif
                        </form>
                        <!---->
					</div>
				</div>		
@endsection