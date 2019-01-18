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
						<h3 style="text-align: center; color: whitesmoke">Consultar oficinas</h3>
						@if(Session::has('message'))
							<div class="alert alert-info"> {{Session::get('message')}} </div>
						@elseif(Session::has('messagedel'))
							<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
						@endif
                        <h4 style="text-align: center; color: whitesmoke">Oficinas por estado</h4>
						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>Estado</th>
                                            <th>Codigo</th>
											<th>Nombre</th>
                                            <th>Tamaño depósito (m­²)</th>
										</thead>
										@foreach ($oficinas as $o)
										<tbody>	
                                            <th> {{$o->estado}} </th>
                                            <th> {{$o->Codigo}} </th>
											<th> {{$o->Nombre}} </th>
											<th> {{$o->Tamaño_Deposito}} </th>
										</tbody>
										@endforeach
									</table>
                                    {{ $oficinas->links() }}
								</div>
							</div>
                        </div>
                        						
					</div>
				</div>		
@endsection