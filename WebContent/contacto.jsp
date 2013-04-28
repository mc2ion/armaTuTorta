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
	<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });
	});
	</script>
</head>
<body>
<%
	HttpSession infoPage = request.getSession();
	session.setAttribute("prevPage", "contacto.jsp");
	
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
				<li><a href="/armaTuTorta/index.jsp">Inicio</a></li>
				<li><a href="/armaTuTorta/creaTuTorta.jsp">Arma Tu Torta</a></li>
				<li><a href="/armaTuTorta/dulcesTortas.jsp">Dulces Tortas</a></li>
				<li><a href="/armaTuTorta/cupcakes.jsp">Cupcakes</a></li>
				<li><a href="/armaTuTorta/ocasionesEspeciales.jsp">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/galeria.jsp">Galería</a></li>
				<li class="current"><a href="/armaTuTorta/contacto.jsp">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="home">
			<div class="aside">
				<div class="title"> Informaci&oacute;n de Contacto: </div>
				<div class="title-ins"> Puedes comunicarte directamente con nosotros por cualquiera de estas vías: </div>
				
				<div  style="margin-left: 20px;">
					<img src="/armaTuTorta/images/email.png" width="32" height="32" style="padding-top: 5px;"  alt="Logo"/> Correo Electrónico: armatutorta@gmail.com<br>
					<img src="/armaTuTorta/images/mobile.png" width="32" height="32" alt="Logo"/>Teléfono Móvil: 04241805226<br>
				</div>
			</div>
			<div class="section-contact">
						Cont&aacute;ctanos:<br><br>
						Env&iacute;anos un mensaje con tus dudas o comentarios.<br>
						<fieldset>
							<label for="name">Nombre:</label>
							<input type="text" name="txtName" id="txtName" size="35" maxlength="100" /> <br><br>
							<label for="name">Email:</label>
							<input type="text" name="txtName" id="txtName" size="35"  maxlength="50" /> <br><br>
							<label for="name">Tel&eacute;fono:</label>
							<input type="text" name="txtName" id="txtName" size="35" maxlength="50" /> <br><br>
							<label for="name">Mensaje:</label>
							<textarea rows="4" cols="28" style="resize: none;">
							</textarea>
						</fieldset>
						<div class="cont-button">
							<input type="submit" name="sbmtButton" class="button" value="Enviar"  />
						</div>
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