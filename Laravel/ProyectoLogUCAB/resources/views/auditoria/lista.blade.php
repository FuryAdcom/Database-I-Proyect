@extends('layouts.app')
@section('contenido')
<div class="wrapper">
					<div class="contenido_ppal">
                        <!--Consultar-->
						<h2 style="text-align: center; color: whitesmoke">Auditoria</h2>
						@if(Session::has('message'))
							<div class="alert alert-info"> {{Session::get('message')}} </div>
						@elseif(Session::has('messagedel'))
							<div class="alert alert-danger"> {{Session::get('messagedel')}} </div>
						@endif

						<!-- Busqueda-->
						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-condensed table-hover">
										<thead class="thead-dark">
											<th>Codigo</th>
											<th>Usuario</th>
											<th>Codigo User</th>
											<th>Accion</th>
											<th>Fecha</th>
										</thead>
										@foreach ($audis as $a)
										<tbody>	
											<th> {{$a->Codigo}} </th>
											<th> {{$a->Usuario}} </th>
											<th> {{$a->FK_Observa}} </th>
											<th> {{$a->Accion}} </th>
											<th> {{$a->Fecha_Ingreso}} </th>
										</tbody>
										@endforeach
									</table>
									{{ $audis->links() }}
								</div>
							</div>
						</div>
                        <!---->
					</div>
				</div>		
@endsection