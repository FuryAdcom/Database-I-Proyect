@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/user">Inicio</a>
		<a href="/user/create">Agregar</a>
		<a href="/user/lista" style="border-bottom: 0px">Lista</a>
	</div>
					<div class="contenido_ppal">
                        <!--Agregar-->
                        <h3 style="text-align: center; color: whitesmoke">Crear usuario</h3>
						<form action="/user/store" method="POST">
							@csrf
							@if(Session::has('message'))
							<div class="alert alert-warning"> {{Session::get('message')}} </div>
							@endif
							
							<div class="form-group" style="width:49%; float: left">
								<label for="inputNombre" style="color: whitesmoke">Nombre</label>
								<input type="text" name="Nombre" value="{{old('Nombre')}}" class="form-control" id="Nombre" placeholder="Introduzca el nombre" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputCorreo" style="color: whitesmoke">Correo</label>
								<input type="email" name="Correo"value="{{old('Correo')}}" class="form-control" id="inputCorreo" placeholder="Introduzca Correo" required>
							</div>
							<div class="form-group" style="width:49%; float: left;">
								<label for="inputContraseña" style="color: whitesmoke">Contraseña</label>
								<input type="password" name="Contraseña"value="{{old('Contraseña')}}" class="form-control" id="inputContraseña"placeholder="Introduzca la contraseña" required>
							</div>
							<div class="form-group" style="width:49%; float: right;">
								<label for="inputFK_Sele_Concede" style="color: whitesmoke">Rol</label>
								<select class="form-control" style="height: 34px" name="FK_Sele_Concede" id="inputFK_Sele_Concede" required>
									<option value="">Seleccione una</option>
									@foreach ($rols as $rol)
										<option value="{{ $rol->Codigo }}" @if(old('FK_Sele_Concede')==$rol->Codigo) selected @endif>{{ $rol->Tipo }}</option>
									@endforeach
								</select>
							</div>
							<div style="width:100%; height: 40px; float: left;">
								<button type="submit" class="btn btn-primary">Crear</button>
							</div>
                        </form>
                        <!---->
					</div>
				</div>		
@stop