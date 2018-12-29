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
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Personal</h3>
						@if(Session::has('message'))
							<div class="alert alert-info"> {{Session::get('message')}} </div>
						@elseif(Session::has('messagedel'))
							<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
						@endif
						<!-- Busqueda -->
						<div class="row">
							<div class="col-lg-18">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>Cédula</th>
											<th>Nombre</th>
											<th>Apellido</th>
											<th>Correo</th>
											<th style="width: 70px;">Fecha de nacimiento</th>
											<th>Puesto</th>
											<th>Residencia</th>
											@if(Auth::user()->rol >= 4 && Auth::user()->rol < 7)
												<th style="width: 94px;">Opciones</th>
											@endif
										</thead>
										@foreach ($empleados as $empleado)
										<tbody>	
											<th> {{$empleado->Cedula}} </th>
											<th> {{$empleado->Nombre}} </th>
											<th> {{$empleado->Apellido}} </th>
											<th> {{$empleado->Correo_Personal}} </th>
											<th style="text-align:center"> {{ date('d-m-Y', strtotime($empleado->Fecha_Nacimiento)) }} </th>
											<th> {{$empleado->rolt}} </th>
											<th> {{$empleado->sitio}} </th>
											@if(Auth::user()->rol >= 4 && Auth::user()->rol < 7)
											<th> 
													<a class="boton_show btn btn-info" href="/empleado/mostrar/{{$empleado->Cedula}}"><i class="fa fa-align-left"></i></a>
													<a class="boton_show btn btn-secondary" href="/empleado/edit/{{$empleado->Cedula}}"><i class="fa fa-wrench"></i></a>
													<a class="boton_show btn btn-danger" href="/empleado/delete/{{$empleado->Cedula}}"><i class="fa fa-times"></i></a> 
											</th>
											@endif
											
										</tbody>
										@endforeach
									</table>
									{{ $empleados->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection