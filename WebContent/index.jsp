<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="domain.Client "%> 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Arma Tu Torta</title>
	<link href='http://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Economica' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/style.css" />
	
	<!--[if IE 8]>
		<link rel="stylesheet" type="text/css" href="css/ie8.css" />
	<![endif]-->
	<!--[if IE 7]>
		<link rel="stylesheet" type="text/css" href="css/ie7.css" />
	<![endif]-->
	<!--[if IE 6]>
		<link rel="stylesheet" type="text/css" href="css/ie6.css" />
	<![endif]-->
	
	<script type="text/javascript" src="/armaTuTorta/js/jquery.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/rotator.js"></script>
	<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });
	});
	

	</script>
</head>
<body>
<%
	HttpSession infoPage = request.getSession();
	session.setAttribute("prevPage", "index.jsp");
	
%>
<div class="wrapper">
	<div id="header">
		<div>
			<div>
				<div id="logo">
					<a href="index.html"><img src="/armaTuTorta/images/logo5.png" alt="Logo"/></a>
				</div>
				<jsp:include page="header.jsp"></jsp:include>
			</div>
			<ul style="margin: 0px; ">
				<li class="current"><a href="/armaTuTorta/index.jsp">Inicio</a></li>
				<li><a href="/armaTuTorta/creaTuTorta.jsp">Arma Tu Torta</a></li>
				<li><a href="/armaTuTorta/dulcesTortas.jsp">Dulces Tortas</a></li>
				<li><a href="/armaTuTorta/cupcakes.jsp">Cupcakes</a></li>
				<li><a href="/armaTuTorta/ocasionesEspeciales.jsp">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/galeria.jsp">Galería</a></li>
				<li><a href="/armaTuTorta/contacto.jsp">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="home">
			<div class="aside">
				<p>En <strong>Arma Tu Torta</strong> elaboramos reposter&iacute;a de forma artesanal, haciendo de la cocina un arte, utilizando la mejor calidad en materia prima y priorizando el sabor de los alimentos.</p>
				<p>Elaboramos tortas para toda ocasi&oacute;n con los ingredientes, sabores y dise&ntilde;os de tu preferencia. El esp&iacute;ritu de <strong>Arma Tu Torta</strong> est&aacute; en la gastronom&iacute;a como
				 forma de vida y en la transmisi&oacute;n de ese placer en cada uno de nuestros productos.</p>
				<p>Elige la forma de tu preferencia, escoge tus sabores favoritos, el relleno que desees, el topping que m&aacute;s te guste... &iexcl;&Aacute;rmala a tu gusto 
				que nosotros nos encargamos del resto!  &nbsp;<a href="creaTuTorta.jsp" class="readmore"> &iexcl;Solicita aqu&iacute; tu pedido!</a></p>
			</div>
			<div class="section">
				<div class="rotator"> 
					<ul>
						<li><a href="#"><img src="./images/imagen1.png" alt="Image" height="220" width="340"/></a></li>
						<li><a href="#"><img src="./images/imagen2.png" alt="Image" height="220" width="340"/></a></li>
						<li><a href="#"><img src="./images/imagen3.png" alt="Image" height="220" width="340" /></a>
						</li>
					</ul>
					
				</div>	
				<div class="next"><a href="#"><img src="./images/nextNav.png" /></a> </div>
				<div class="prev"><a href="#"><img src="./images/prevNav.png" /> </a></div>
			</div>
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