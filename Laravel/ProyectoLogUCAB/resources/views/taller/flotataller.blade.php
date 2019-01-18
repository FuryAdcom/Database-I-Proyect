@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="contenido_ppal">
                        <!--Enviar-->
                        <h3 style="text-align: center; color: whitesmoke">Envio de flota</h3>
						<form action="/taller/servpago" method="POST">
							@csrf
                            <input type="number" name="oficina"value="{{$oficina->Codigo}}"class="form-control" id="OfCod" hidden>

                                <div id="inputTaller" class="form-group" style="width:100%;">
                                                <div class="form-group" style="width:49%%; float: left;" id="inputTaller">
                                                    <label for="inputTaller" style="color: whitesmoke">Taller:</label>
                                                    <input class="form-control" name="taller" value="{{old('taller')}}" list="talleres" placeholder="Taller a enviar" required>
                                                    <datalist id="talleres">
                                                        @foreach ($talleres as $t)
                                                            <option value="{{ $t->Codigo }}">{{ $t->sitio.', '.$t->estado }}</option>
                                                        @endforeach
                                                    </datalist>
                                                </div>
                                                <div class="form-group" style="width:49%%; float: left;" id="inputTaller">
                                                    <label for="inputTaller" style="color: whitesmoke">Falla:</label>
                                                    <input class="form-control" type="text" name="falla" value="{{old('falla')}}" placeholder="Falla" required>
                                                </div>
                                </div>

                                <div style="width:100%; height: 40px; float: left;">
                                    <button type="submit" class="btn btn-primary">Enviar</button>
                                </div>
                            @endif
                        </form>
                        <!---->
					</div>
				</div>		
@endsection