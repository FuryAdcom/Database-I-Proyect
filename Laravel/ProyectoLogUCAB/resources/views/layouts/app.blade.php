<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
						    <!-- CSRF Token -->
							<meta name="csrf-token" content="{{ csrf_token() }}">
		<title>{{ config('app.name', 'LogUCAB Website') }}</title>
		<meta name="description" content="A sidebar menu as seen on the Google Nexus 7 website" />
		<meta name="keywords" content="google nexus 7 menu, css transitions, sidebar, side menu, slide out menu" />
		<meta name="author" content="Codrops" />
					<!-- Fonts -->
					<link rel="dns-prefetch" href="https://fonts.gstatic.com">
					<link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">
				
					<!-- Styles -->
					<link href="{{ asset('css/app.css') }}" rel="stylesheet">
	
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous">

		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="{{asset('/css/dataTables.bootstrap.min.css')}}"/>

		<link rel="stylesheet" type="text/css" href="{{asset('/css/normalize.css')}}" />
		<link rel="stylesheet" type="text/css" href="{{asset('/css/demo.css')}}" />
		<link rel="stylesheet" type="text/css" href="{{asset('/css/component.css')}}" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="{{asset('/js/modernizr.custom.js')}}"></script>
			<!-- Scripts -->
			<script src="{{ asset('js/app.js') }}" defer></script>
	</head>
	<body style="background: #34495e; overflow-y: scroll">
		<ul id="gn-menu" class="gn-menu-main">
				@if(Auth::check() && Auth::user()->rol != 7)
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li class="gn-search-item">
									<input placeholder="Buscar" type="search" class="gn-search">
									<a class="gn-icon gn-icon-search"><span>Buscar</span></a>
								</li>
								<li>
									<a href="/user"><i class="fa fa-address-card" id="inside_opt"></i>Usuario</a>
									<ul class="gn-submenu">
											<a href="/empleado"><li class="sub_option"><i class="fa fa-user-tie" id="inside_opt"></i>Empleado</li></a>
											<a href="/cliente"><li class="sub_option"><i class="fa fa-users" id="inside_opt"></i>Cliente</li></a>
											@if(Auth::check() && Auth::user()->rol == 6)
												<a href="/rol"><li class="sub_option"><i class="fa fa-address-book" id="inside_opt"></i>Rol</li></a>
											@endif
									</ul>
								</li>
								<li><a href="/paquete"><i class="fa fa-box" id="inside_opt"></i>Paquetes</a></li>
								<li><a href="/envio"><i class="fa fa-truck-loading" id="inside_opt"></i>Envios</a></li>
								@if(Auth::check() && Auth::user()->rol >= 4 && Auth::user()->rol < 7)
									<li>
										<a href="/oficina"><i class="fa fa-building" id="inside_opt"></i>Oficina</a>
										<ul class="gn-submenu">
												<a href="/zona"><li class="sub_option"><i class="fa fa-warehouse" id="inside_opt"></i>Zona</li></a>
										</ul>
									</li>
								@endif
								@if(Auth::check() && Auth::user()->rol == 6 || Auth::check() && Auth::user()->rol == 4)
									<li><a href="/transporte"><i class="fa fa-truck" id="inside_opt"></i>Transporte</a></li>
								@endif
								<li><a href="/ruta"><i class="fa fa-route" id="inside_opt"></i>Ruta</a></li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				@endif
				<li style="padding-left: 35%;border-right: 0px solid #c6d0da;"><a href="/"><img src="{{asset('/img/LogUCAB.png')}}" width="150"></a></li>
				@if(is_null(Auth::user()))
					<li style="border-right: 0px solid #c6d0da;float:right"><a href="/register"><i class="fa fa-user-plus"></i> <span>Registrar</span></a></li>
					<li style="border-right: 1px solid #c6d0da;"><a href="/login"><i class="fa fa-user"></i> <span>Login</span></a></li>
				@else
					<li style="border-right: 0px solid #c6d0da;float:right"><a href="/logout"><i class="fa fa-user-minus"></i> <span>Cerrar sesion</span></a></li>
					<li style="border-right: 1px solid #c6d0da;float:right"><a href="/"><i class="fa fa-user"></i> <span>{{Auth::user()->name}}</span></a></li>
				@endif
			</ul>
		<div class="container" style="padding-left: 10px; padding-right: 10px">
			<!---->
			@yield('contenido')
			<!--Til here-->	
		</div><!-- /container -->
		<script type="text/javascript" src="{{asset('/js/jquery-3.3.1.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('/js/jquery.dataTables.min.js')}}"></script>
		<script type="text/javascript" src="{{asset('/js/dataTables.bootstrap.min.js')}}"></script>
		<script src="{{asset('/js/classie.js')}}"></script>
		<script src="{{asset('/js/thermo.js')}}"></script>
		<script src="{{asset('/js/gnmenu.js')}}"></script>
		<script src="{{asset('/js/forms.js')}}"></script>
		<script>
				$(document).ready( function () {
					$('#latabla').DataTable();
				} );
			</script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>
	</body>
</html>