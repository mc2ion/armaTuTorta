<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Arma Tu Torta</title>
	<link href='http://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Economica' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/style.css" />
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/styleImage.css" />
	
	<script type="text/javascript" src="/armaTuTorta/js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });
	});
	
	
	</script>
	
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/shadowbox.css">
	<script type="text/javascript" src="/armaTuTorta/js/shadowbox.js"></script>
	<script type="text/javascript">
		Shadowbox.init({
			handleOversize: "drag",
			modal: true
	});
	</script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/jquery.carousel.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('body').removeClass('no-js');
		    $('#my-carousel-3').carousel({
				itemsPerPage: 4,
				itemsPerTransition: 4,
				easing: 'linear',
				nextPrevLinks:false, 
				pagination: true, 
    			noOfRows: 2
			});
		});
	</script>
	
</head>
<body>
<div class="wrapper">
	<div id="header">
		<div>
			<div>
				<div id="logo">
					<a href="index.html"><img src="/armaTuTorta/images/logo5.png" alt="Logo"/></a>
				</div>
				<div>
					<div>
						<a href="#signup"  rel="leanModal" id="go" class="pestana">Ingresar</a>
						<a href="/armaTuTorta/registro.jsp" class="pestana">Registrarse</a>
					</div>
				</div>
			</div>
			<ul style="margin: 0px; ">
				<li ><a href="/armaTuTorta/index.jsp">Inicio</a></li>
				<li><a href="/armaTuTorta/creaTuTorta.jsp">Arma Tu Torta</a></li>
				<li><a href="/armaTuTorta/dulcesTortas.jsp">Dulces Tortas</a></li>
				<li><a href="/armaTuTorta/cupcakes.jsp">Cupcakes</a></li>
				<li><a href="/armaTuTorta/ocasionesEspeciales.jsp">Ocasiones Especiales</a></li>
				<li class="current"><a href="/armaTuTorta/galeria.jsp">Galería</a></li>
				<li><a href="/armaTuTorta/contacto.jsp">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content-aux">
		<div class="title-img"><a href="/armaTuTorta/galeria.jsp"> <img src="images/return.png"> </a> Cupcakes </div>
		<div id="my-carousel-3" class="carousel module">
			 <ul id="thumbs">
				<li class="clearfix">
					<a href="images/01-birdie-shot-illustration.png" rel="shadowbox[Cakes];height=440;width=440">
					<img src="images/01-birdie-shot-illustration.png" style="width:180px; height:155px;">
					</a>
				</li>
				<li class="clearfix">
					<a href="images/02-steampunk-ray-gun.png" rel="shadowbox[Cakes];height=440;width=440">
						<img src="images/02-steampunk-ray-gun.png" style="width:180px; height:155px;">
					</a>
				</li>
				<li class="clearfix">
					<a href="images/03-fly-away-airplane.png" rel="shadowbox[Cakes];height=440;width=440">
					<img src="images/03-fly-away-airplane.png" style="width:180px; height:155px;">
					</a>
				</li>
				<li class="clearfix">
					<a href="images/04-rooftops-chimney.png" rel="shadowbox[Cakes];height=440;width=440">
					 <img src="images/04-rooftops-chimney.png" style="width:180px; height:155px;">
					</a>
				</li>
				<li class="clearfix"> 
					<a href="images/05-map-candy-wrapper.png" rel="shadowbox[Cakes];height=440;width=440">
					 <img src="images/05-map-candy-wrapper.png" style="width:180px; height:155px;">
					</a>
				</li>
				<li class="clearfix">
					<a href="images/06-office-mac-desk.png" rel="shadowbox[Cakes];height=440;width=440">
					<img src="images/06-office-mac-desk.png" style="width:180px; height:155px;">
					</a>
				</li>
				<li class="clearfix">
					<a href="images/07-toucan-bird-illustration.png" rel="shadowbox[Cakes];height=440;width=440">
						<img src="images/07-toucan-bird-illustration.png" style="width:180px; height:155px;">
					</a>
				</li>
				<li class="clearfix">
					<a href="images/08-mickey-mouse-carpet-ride.png" rel="shadowbox[Cakes];height=440;width=440">
						<img src="images/08-mickey-mouse-carpet-ride.png" style="width:180px; height:155px;">
					</a>
				</li>
				<li class="clearfix">
					<a href="images/09-strawberry-fruit.png" rel="shadowbox[Cakes];height=440;width=440">
						<img src="images/09-strawberry-fruit.png" style="width:180px; height:155px;">
					</a>
				</li>
				
		    </ul>
		</div>
	</div>
	<div class="push"></div>
</div>
<div id="footer">
	<div id="navigation">
		<div>
			<p>Arma Tu Torta &copy; 2013 - Todos los derechos reservados</p>
		</div>
	</div>
	<div class="social">
		<a href="http://www.facebook.com/armatutorta" target="_blank"><img class="facebook" src="./images/facebook_social.png" alt="Facebook" title="Nuestra p&aacute;gina en Facebook"/></a>
		<a href="http://www.twitter.com/armatutorta" target="_blank"><img class="twitter" src="./images/twitter_social.png" alt="Twitter" title="Nuestra cuenta en Twitter"/></a>
	</div>
</div>
<jsp:include page="ventanas.jsp"></jsp:include>
</body>
</html>