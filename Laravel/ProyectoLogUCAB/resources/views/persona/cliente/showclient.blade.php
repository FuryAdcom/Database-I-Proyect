@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/cliente">Inicio</a>
						<a href="/cliente/create">Agregar</a>
						<a href="/cliente/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Consultar clientes</h3>
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
											<th>Cedula</th>
											<th>Nombre</th>
											<th>Apellido</th>
											<th>Correo</th>
											<th>Fecha nacimiento</th>
											<th>L-VIP</th>
											<th>Frecuente</th>
											<th>Opciones</th>
										</thead>
										@foreach ($clientes as $cliente)
										<tbody>	
											<th> {{$cliente->Cedula}} </th>
											<th> {{$cliente->Nombre}} </th>
											<th> {{$cliente->Apellido}} </th>
											<th> {{$cliente->Correo_Personal}} </th>
											<th> {{$cliente->Fecha_Nacimiento}} </th>
											@if($cliente->l_vip)
												<th> Si </th>
											@else
												<th> No </th>
											@endif
											@if($cliente->Frecuente)
												<th> Si </th>
											@else
												<th> No </th>
											@endif
										    <th> <a class="btn btn-secondary" href="/cliente/edit/{{$cliente->Cedula}}">Editar</a><a class="btn btn-danger" href="/cliente/delete/{{$cliente->Cedula}}">Eliminar</a> </th>
										</tbody>
										@endforeach
									</table>
									{{ $clientes->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection