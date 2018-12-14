@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="contenido_ppal" style="width: 100%">
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Consultar roles</h3>
						@if(Session::has('messagedel'))
							<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
						@endif
						<!-- Busqueda -->
						<form action="/rol/store" method="POST">
							@csrf
							<div class="form-group" style="width:90%; float: left">
									<label for="inputTipo" style="color: whitesmoke">Agregar un rol</label>
									<input type="text" name="Tipo" class="form-control" id="Tipo" placeholder="Introduzca el nombre del rol" required>
							</div>
							<div style="width:10%; height: 40px; float: right; padding-top: 25px">
									<button type="submit" class="btn btn-primary" style="width:100%">Agregar</button>
								</div>
						</form>
						@if(Session::has('message'))
						<div class="alert alert-info"> {{Session::get('message')}} </div>
						@endif
						<div class="row" style="width:103%;float: left">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>ID</th>
											<th>Tipo</th>
											<th>Opciones</th>
										</thead>
										@foreach ($roles as $rol)
										<tbody>	
											<th> {{$rol->Codigo}} </th>
											<th> {{$rol->Tipo}} </th>
										    <th> <a class="btn btn-secondary" href="/rol/edit/{{$rol->Codigo}}">Editar</a><a class="btn btn-danger" href="/rol/delete/{{$rol->Codigo}}">Eliminar</a> </th>
										</tbody>
										@endforeach
									</table>
									{{ $roles->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection