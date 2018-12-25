<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>LogUCAB Website</title>
		<meta name="description" content="A sidebar menu as seen on the Google Nexus 7 website" />
		<meta name="keywords" content="google nexus 7 menu, css transitions, sidebar, side menu, slide out menu" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="{{asset('/css/normalize.css')}}" />
		<link rel="stylesheet" type="text/css" href="{{asset('/css/demo.css')}}" />
		<link rel="stylesheet" type="text/css" href="{{asset('/css/component.css')}}" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    	<script src="{{asset('/js/modernizr.custom.js')}}"></script>
	</head>
	<body style="background: #34495e; overflow-y: scroll">
		<ul id="gn-menu" class="gn-menu-main">
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
											<a href="/rol"><li class="sub_option"><i class="fa fa-address-book" id="inside_opt"></i>Rol</li></a>
									</ul>
								</li>
								<li><a href="/paquete"><i class="fa fa-box" id="inside_opt"></i>Paquetes</a></li>
								<li><a href="/envio"><i class="fa fa-truck-loading" id="inside_opt"></i>Envios</a></li>
								<li>
									<a href="/oficina"><i class="fa fa-building" id="inside_opt"></i>Oficina</a>
									<ul class="gn-submenu">
											<a href="/zona"><li class="sub_option"><i class="fa fa-warehouse" id="inside_opt"></i>Zona</li></a>
									</ul>
								</li>
								<li><a href="/transporte"><i class="fa fa-truck" id="inside_opt"></i>Transporte</a></li>
								<li><a href="/ruta"><i class="fa fa-route" id="inside_opt"></i>Ruta</a></li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li><a href="/">LogUCAB</a></li>
				<li><a href="/login"><i class="fa fa-user"></i> <span>Login</span></a></li>
			</ul>
		<div class="container" style="padding-left: 10px; padding-right: 10px">
			<!---->
			@yield('contenido')
			<!--Til here-->	
		</div><!-- /container -->
		<script src="{{asset('/js/classie.js')}}"></script>
		<script src="{{asset('/js/thermo.js')}}"></script>
		<script src="{{asset('/js/gnmenu.js')}}"></script>
		<script src="{{asset('/js/forms.js')}}"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>
	</body>
</html>