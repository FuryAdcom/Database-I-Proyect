@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Pago</h3>
						<form action="/pago/store" method="POST">
							@csrf

                            @if(isset($request->pagoDest) && $request->pagoDest==false)
                                <input class="form-control" name="paquete" type="number" value="{{$request->paquete}}" hidden>
                                <input class="form-control" name="veh_rut" type="number" value="{{$request->veh_rut}}" hidden>
                                <input class="form-control" name="costo" type="number" value="{{$request->costo}}" hidden>
                                <input class="form-control" name="destino" type="number" value="{{$request->destino}}" hidden>
                                <input class="form-control" name="ruta" type="number" value="{{$request->ruta}}" hidden>
                                <div class="form-group" style="width:100%; float: left;">
                                        <label for="inputClasificacion" style="color: whitesmoke">Tipo de pago</label>
                                        <select class="form-control" style="height: 34px" id="inputClasificacion" name="Clasificacion" required>
                                            <option value="">Seleccione una</option>
                                            <option value="a" @if(old('Clasificacion') == 'a') selected @endif>Tarjeta de credito</option>
                                            <option value="m" @if(old('Clasificacion') == 'm') selected @endif>Cheque</option>
                                            <option value="t" @if(old('Clasificacion') == 't') selected @endif>Efectivo</option>
                                        </select>
                                </div>
                            
                                <!--Tarjeta-->
                                <div id="vehAereo" class="form-group" style="width:100%; @if ( old('Clasificacion') == 'a') display: block @else display: none @endif">
                                        <h3 style="color: whitesmoke">Tarjeta</h3>
                                        <div class="form-group" style="width:49%; float: left;">
                                                <label for="inputNumero_Tarjeta" style="color: whitesmoke">Numero Tarjeta</label>
                                                <input type="number" name="Numero_Tarjeta" value="{{old('Numero_Tarjeta')}}" class="form-control" id="inputNumero_Cheque" placeholder="Introduzca numero de cheque">
                                        </div>
                                        <div class="form-group" style="width:49%; float: right;">
                                                <label for="inputBanco" style="color: whitesmoke">Banco</label>
                                                <input type="text" name="Banco"value="{{old('Banco')}}" class="form-control" id="inputBanco" placeholder="Introduzca el banco">
                                        </div>
                                        <div class="form-group" style="width:49%; float: left;">
                                                <label for="inputTipo_Tarjeta" style="color: whitesmoke">Tipo Tarjeta</label>
                                                <input type="text" name="Tipo_Tarjeta" value="{{old('Tipo_Tarjeta')}}" class="form-control" id="inputTipo_Tarjeta" placeholder="Introduzca tipo">
                                        </div>
                                        <div class="form-group" style="width:49%; float: right;">
                                                <label for="inputMonto_Total" style="color: whitesmoke">Monto Total</label>
                                                <input type="number" name="Monto_Total"value="{{old('Monto_Total', $request->costo)}}" step="0.01" class="form-control" id="inputMonto_Total" placeholder="Introduzca el Monto Total">
                                        </div>
                                </div>
                                <!--Cheque-->
                                <div id="vehMar" class="form-group" style="width:100%; @if ( old('Clasificacion') == 'm') display: block @else display: none @endif">
                                        <h3 style="color: whitesmoke">Cheque</h3>
                                        <div class="form-group" style="width:49%; float: left;">
                                                <label for="inputNumero_Cheque" style="color: whitesmoke">Numero Cheque</label>
                                                <input type="number" name="Numero_Cheque" value="{{old('Numero_Cheque')}}" class="form-control" id="inputNumero_Cheque" placeholder="Introduzca numero de cheque">
                                        </div>
                                        <div class="form-group" style="width:49%; float: right;">
                                                <label for="inputInstitucion_Financiera" style="color: whitesmoke">Institucion Financiera</label>
                                                <input type="text" name="Institucion_Financiera"value="{{old('Institucion_Financiera')}}" class="form-control" id="inputInstitucion_Financiera" placeholder="Introduzca el banco">
                                        </div>
                                        <div class="form-group" style="width:49%; float: left;">
                                                <label for="inputMonto_Total" style="color: whitesmoke">Monto Total</label>
                                                <input type="number" name="Monto_Total"value="{{old('Monto_Total', $request->costo)}}" step="0.01" class="form-control" id="inputMonto_Total" placeholder="Introduzca el Monto Total">
                                        </div>
                                        
                                </div>
                                <!--Efectivo-->
                                <div id="vehTer" class="form-group" style="width:100%; @if ( old('Clasificacion') == 't') display: block @else display: none @endif">
                                        <h3 style="color: whitesmoke">Efectivo</h3>
                                        <div class="form-group" style="width:49%; float: left;">
                                                <label for="inputTotal_Billetes" style="color: whitesmoke">Billetes</label>
                                                <input type="number" name="Total_Billetes" value="{{old('Total_Billetes')}}" class="form-control" id="inputTotal_Billetes" placeholder="Introduzca la cantidad de billetes">
                                        </div>
                                        <div class="form-group" style="width:49%; float: right;">
                                                <label for="inputMonto_Total" style="color: whitesmoke">Monto Total</label>
                                                <input type="number" name="Monto_Total"value="{{old('Monto_Total', $request->costo)}}" step="0.01" class="form-control" id="inputMonto_Total" placeholder="Introduzca el Monto Total">
                                        </div>

                                </div>

                                <div style="width:100%; height: 40px; float: left;">
                                    <button type="submit" class="btn btn-primary">Pagar</button>
                                </div>
                            @else

                                <input class="form-control" name="envio" type="number" value="{{$envio}}" hidden>
                                <div class="form-group" style="width:100%; float: left;">
                                        <label for="inputClasificacion" style="color: whitesmoke">Tipo de pago</label>
                                        <select class="form-control" style="height: 34px" id="inputClasificacion" name="Clasificacion" disabled>
                                            <option value="t" selected>Efectivo</option>
                                        </select>
                                </div>
                                <!--Efectivo-->
                                <div id="vehTer" class="form-group" style="width:100%;">
                                        <h3 style="color: whitesmoke">Efectivo</h3>
                                        <div class="form-group" style="width:49%; float: left;">
                                                <label for="inputTotal_Billetes" style="color: whitesmoke">Billetes</label>
                                                <input type="number" name="Total_Billetes" value="{{old('Total_Billetes')}}" class="form-control" id="inputTotal_Billetes" placeholder="Introduzca la cantidad de billetes">
                                        </div>
                                        <div class="form-group" style="width:49%; float: right;">
                                                <label for="inputMonto_Total" style="color: whitesmoke">Monto Total</label>
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