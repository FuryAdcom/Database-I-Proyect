@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/user">Inicio</a>
						<a href="/user/create">Agregar</a>
						<a href="/user/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Consultar usuarios</h3>
						@if(Session::has('message'))
							<div class="alert alert-info"> {{Session::get('message')}} </div>
						@elseif(Session::has('messagedel'))
							<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
						@endif
						<!-- Busqueda -->
						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>Codigo</th>
											<th>Nombre</th>
											<th>Correo</th>
											<th>Rol</th>
											<th style="width: 20px;">Opciones</th>
										</thead>
										@foreach ($users as $user)
										<tbody>	
											<th> {{$user->Codigo}} </th>
											<th> {{$user->Nombre}} </th>
											<th> {{$user->Correo}} </th>
											<th> {{$user->rol}} </th>
											<th style="text-align:center"> 
												<a class="boton_show btn btn-secondary" href="/user/edit/{{$user->Codigo}}"><i class="fa fa-wrench"></i></a>
												<a class="boton_show btn btn-danger" href="/user/delete/{{$user->Codigo}}"><i class="fa fa-times"></i></a> 
											</th>
										</tbody>
										@endforeach
									</table>
									{{ $users->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection