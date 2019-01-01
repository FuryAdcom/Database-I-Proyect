@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/oficina">Inicio</a>
						<a href="/oficina/create">Agregar</a>
						<a href="/oficina/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h2 style="text-align: center; color: whitesmoke">Consultar oficinas</h2>
						@if(Session::has('message'))
							<div class="alert alert-info"> {{Session::get('message')}} </div>
						@elseif(Session::has('messagedel'))
							<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
						@endif
						<div>
							<h4 style="width: 50%; color:whitesmoke">Mas envia: Codigo {{$masenv->Codigo.', Nombre: '.$masenv->Nombre}}</h4>
							<h4  style="width: 50%; color:whitesmoke">Mas recibe: Codigo {{$masrec->Codigo.', Nombre: '.$masrec->Nombre}}</h4>
						</div>
						<!-- Busqueda-->
						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>Codigo</th>
											<th>Nombre</th>
											<th>Tamaño depósito (m­²)</th>
											<th>Municipio</th>
											<th>Estado</th>
											<th style="width: 94px;">Opciones</th>
										</thead>
										@foreach ($oficinas as $office)
										<tbody>	
											<th> {{$office->Codigo}} </th>
											<th> {{$office->Nombre}} </th>
											<th> {{$office->Tamaño_Deposito}} </th>
											<th> {{$office->sitio}} </th>
											<th> {{$office->estado}} </th>
										    <th> 
												<a class="boton_show btn btn-info" href="/oficina/mostrar/{{$office->Codigo}}"><i class="fa fa-align-left"></i></a>
												<a class="boton_show btn btn-secondary" href="/oficina/edit/{{$office->Codigo}}"><i class="fa fa-wrench"></i></a>
												<a class="boton_show btn btn-danger" href="/oficina/delete/{{$office->Codigo}}"><i class="fa fa-times"></i></a> 
											</th>
										</tbody>
										@endforeach
									</table>
									{{ $oficinas->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection