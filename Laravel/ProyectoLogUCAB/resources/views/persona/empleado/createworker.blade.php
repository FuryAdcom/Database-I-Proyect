@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/empleado">Inicio</a>
		@if(Auth::user()->rol >= 4 && Auth::user()->rol < 7)
			<a href="/empleado/create">Agregar</a>
		@endif
		<a href="/empleado/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear empleado</h3>
						<form action="/empleado/store" method="POST">
							@csrf
							@if(Session::has('message'))
								<div class="alert alert-warning"> {{Session::get('message')}} </div>
							@endif

							<div class="form-group" style="width:49%; float: left">
									<label for="inputCedula" style="color: whitesmoke">Cédula</label>
									<input type="number" name="Cedula" value="{{ old('Cedula') }}" class="form-control" id="Cedula" placeholder="Introduzca cédula" required>
									<small id="Cedula" style="color: rgb(180, 198, 214)">Importante, sin puntos.</small>
							</div>
							<div class="form-group" style="width:49%; float: right; height:79px">
								<label for="inputNombre" style="color: whitesmoke">Nombre</label>
								<input type="text" name="Nombre"value="{{ old('Nombre') }}" class="form-control" id="Nombre" placeholder="Introduzca nombre" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputApellido" style="color: whitesmoke">Apellido</label>
								<input type="text" name="Apellido"value="{{ old('Apellido') }}" class="form-control" id="inputApellido" placeholder="Introduzca apellido" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputCorreo_Personal" style="color: whitesmoke">Correo electrónico</label>
								<input type="email" name="Correo_Personal"value="{{ old('Correo_Personal') }}" class="form-control" id="inputCorreo_Personal"placeholder="Introduzca correo" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputFecha_Nacimiento" style="color: whitesmoke">Fecha Nacimiento</label>
								<input type="date" name="Fecha_Nacimiento"value="{{ old('Fecha_Nacimiento') }}" class="form-control" id="inputFecha_Nacimiento"placeholder="Introduzca fecha de nacimiento" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputFK_Asignado_Puesto" style="color: whitesmoke">Rol</label>
								<select class="form-control" style="height: 34px" name="FK_Asignado_Puesto" id="inputFK_Asignado_Puesto" required>
									<option value="">Seleccione una</option>
									@foreach ($rols as $rol)
										<option value="{{ $rol->Codigo }}" @if(old('FK_Asignado_Puesto')==$rol->Codigo) selected @endif>{{ $rol->Tipo }}</option>
									@endforeach
								</select>
							</div>
							<div class="form-group" style="width:49%; float: left;">
									<label for="inputNivel_Academico" style="color: whitesmoke">Nivel Académico</label>
									<select class="form-control" style="height: 34px" id="inputNivel_Academico"  name="Nivel_Academico" required>
										<option value="">Seleccione una...</option>
										<option value="Sin estudios"@if (old('Nivel_Academico') == 'Sin estudios') selected @endif>Sin estudios</option>
										<option value="Básico"@if (old('Nivel_Academico') == 'Básico') selected @endif>Educación básica</option>
										<option value="Media"@if (old('Nivel_Academico') == 'Media') selected @endif>Educación media</option>
										<option value="Superior"@if (old('Nivel_Academico') == 'Superior') selected @endif>Educación superior</option>
										<option value="Técnico"@if (old('Nivel_Academico') == 'Técnico') selected @endif>Técnico</option>
										<option value="Diplomado"@if (old('Nivel_Academico') == 'Diplomado') selected @endif>Diplomado</option>
										<option value="Maestría"@if (old('Nivel_Academico') == 'Maestría') selected @endif>Maestría</option>
										<option value="Licenciado"@if (old('Nivel_Academico') == 'Licenciado') selected @endif>Licenciado</option>
									</select>
							</div>
							<div class="form-group" style="width:49%; float: right;">
									<label for="inputEstado_civil" style="color: whitesmoke">Estado civil</label>
									<select class="form-control" style="height: 34px" id="inputEstado_civil"  name="estado_civil" required>
										<option value="">Seleccione una...</option>
										<option value="soltero" @if (old('estado_civil') == 'soltero') selected @endif>Soltero</option>
										<option value="casado"@if (old('estado_civil') == 'casado') selected @endif>Casado</option>
										<option value="viudo"@if (old('estado_civil') == 'viudo') selected @endif>Viudo</option>
										<option value="divorciado"@if (old('estado_civil') == 'divorciado') selected @endif>Divorciado</option>
									</select>
							</div>
							<div class="form-group" style="width:49%; float: left;">
									<label for="inputProfesion" style="color: whitesmoke">Profesión</label>
									<input class="form-control" name="Profesion"value="{{ old('Profesion') }}" type="text" id="inputProfesion"placeholder="Introduzca su profesión">
							</div>
							<div class="form-group" style="width:49%; float: right;">
									<label for="inputTelefono" style="color: whitesmoke">Telefono</label>
									<input type="text" name="Telefono" value="{{old('Telefono')}}" class="form-control" placeholder="Introduzca el telefono (Formato: 0XXXXXXXXXX)" required>
								</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputNum_hijos" style="color: whitesmoke">Número de hijos</label>
								<input class="form-control" name="Num_Hijos"value="{{ old('Num_Hijos') }}" type="number" id="inputNum_hijos"placeholder="Introduzca cantidad">
							</div>
							<div class="form-group" style="width:49%; float: right; margin-bottom:0px">
									<label for="inputCharge" style="color: whitesmoke; padding-right: 5px">Encargado de oficina:</label>
									<input class="form-check-input" name="Charge" type="checkbox" value="true" @if ( old('Charge') ) checked @endif id="inputCharge">
							</div>
							<div class="form-group" style="width:49%; float: right; @if ( is_null(old('Charge') )) display: none @else display: block @endif" id="inputEncargado">
								<input class="form-control" name="Empleado_Cargo" value="{{old('Empleado_Cargo')}}" list="oficinas" placeholder="Nombre de oficina">
								<datalist id="oficinas">
									@foreach ($oficinas as $oficina)
										<option value="{{ $oficina->Codigo }}"> {{ $oficina->Nombre }} </option>
									@endforeach
								</datalist>
							</div>
							<div class="form-group" style="width:100%; float: left;" id="inputFK_Habitacion">
									<label for="inputFK_Habitacion" style="color: whitesmoke">Lugar de residencia:</label>
									<input class="form-control" name="FK_Habitacion" value="{{old('FK_Habitacion')}}" list="muns" placeholder="Municipio de residencia" required>
									<datalist id="muns">
										@foreach ($muns as $mun)
											<option value="{{ $mun->Codigo }}">{{ $mun->Nombre.', '.$mun->est }}</option>
										@endforeach
									</datalist>
							</div>
							<div class="form-group" style="width:100%; float: left;" id="inputZona">
										<label for="inputZona" style="color: whitesmoke">Zona donde desea trabajar (Por Oficina):</label>
										<input class="form-control" name="Zona" value="{{old('Zona')}}" list="zonas" placeholder="Seleccione la zona (revise las cercanas)" required>
										<datalist id="zonas">
											@foreach ($zonas as $zona)
												<option value="{{ $zona->Codigo }}">{{ '"'.$zona->Nombre.'". Ubicada en: '.$zona->mun.', '.$zona->est }}</option>
											@endforeach
										</datalist>
							</div>
							<div style="width:100%; height: 40px; float: left; ">
								<button type="submit" class="btn btn-primary">Crear</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@endsection