@extends('layouts.app')
@section('contenido')
<div class="wrapper">
	<div class="sidemenu">
		<a href="/vehiculo">Inicio</a>
		<a href="/vehiculo/create">Agregar</a>
		<a href="/vehiculo/edit">Modificar</a>
		<a href="/vehiculo/lista" style="border-bottom: 0px">Lista</a>
	</div>
	<div class="contenido_ppal">
        <!--Modificar-->
        <h3 style="text-align: center; color: whitesmoke">Modificar vehiculo</h3>
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
					<div class="input-group stylish-input-group">
						<input type="text" class="form-control"  placeholder="Search" >
						<span class="input-group-addon">
							<button type="submit">
								<span class="glyphicon glyphicon-search"></span>
							</button>  
						</span>
					</div>
			</div>
		</div>
        <!---->
	</div>
</div>		
@stop