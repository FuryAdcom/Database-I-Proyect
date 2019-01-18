@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="sidemenu">
						<a href="/paquete">Inicio</a>
						<a href="/paquete/create">Agregar</a>
						<a href="/paquete/lista" style="border-bottom: 0px">Lista</a>
					</div>
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h3 style="text-align: center; color: whitesmoke">Consultar paquetes</h3>
						@if(Session::has('message'))
							<div class="alert alert-info"> {{Session::get('message')}} </div>
						@elseif(Session::has('messagedel'))
							<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
						@endif
                        <h4 style="text-align: center; color: whitesmoke">Peso promedio paquetes por oficina</h4>
						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>Codigo oficina</th>
											<th>Peso promedio</th>
										</thead>
										@foreach ($avgpeso as $o)
										<tbody>	
											<th style="text-align:center"> {{$o->codigo}} </th>
											<th> {{$o->avgpeso}} </th>
										</tbody>
										@endforeach
									</table>

								</div>
							</div>
                        </div>
                        						
					</div>
				</div>		
@endsection