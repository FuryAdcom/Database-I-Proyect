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
											<th>Cédula</th>
											<th>Nombre</th>
											<th>Apellido</th>
											<th>Correo</th>
											<th>Fecha nacimiento</th>
											<th>L-VIP</th>
											<th>Frecuente</th>
											<th style="width: 94px;">Opciones</th>
										</thead>
										@foreach ($clientes as $cliente)
										<tbody>	
											<th> {{$cliente->Cedula}} </th>
											<th> {{$cliente->Nombre}} </th>
											<th> {{$cliente->Apellido}} </th>
											<th> {{$cliente->Correo_Personal}} </th>
											<th style="text-align:center"> {{ date('d-m-Y', strtotime($cliente->Fecha_Nacimiento)) }} </th>
											@if($cliente->FK_Asignado_Tipo == 1)
												<th> Sí <a class="boton_show btn btn-primary" href="/cliente/carnet/{{$cliente->Cedula}}"><i class="fa fa-address-card"></i></a></th>
											@else
												<th> No </th>
											@endif
											@if($cliente->Frecuente)
												<th> Sí </th>
											@else
												<th> No </th>
											@endif
										    <th> 
												<a class="boton_show btn btn-info" href="/cliente/mostrar/{{$cliente->Cedula}}"><i class="fa fa-align-left"></i></a>
												<a class="boton_show btn btn-secondary" href="/cliente/edit/{{$cliente->Cedula}}"><i class="fa fa-wrench"></i></a>
												<a class="boton_show btn btn-danger" href="/cliente/delete/{{$cliente->Cedula}}"><i class="fa fa-times"></i></a> 
											</th>
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