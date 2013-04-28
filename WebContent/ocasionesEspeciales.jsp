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
	session.setAttribute("prevPage", "ocasionesEspeciales.jsp");
	
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
				<li class="current"><a href="/armaTuTorta/ocasionesEspeciales.jsp">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/galeria.jsp">Galería</a></li>
				<li><a href="/armaTuTorta/contacto.jsp">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="home">
			<div class="title-ocEsp"> ¿Tienes en mente un diseño especial para una torta? ¿Quieres crear cupcakes especiales? ¿Deseas un gelatina innovadora?
				&iexcl; Est&aacute;s en el lugar indicado! Escr&iacute;benos tu idea, carga im&aacute;genes de referencia que quieras usar y deja que nosotros
				nos encargemos del resto.
			</div>
			<div class="coments-ocEsp">
				<form>
					<fieldset>
						<label for="name">¿Cu&aacute;l es tu ocasi&oacute;n especial?:</label>
						<select>
						  <option value="volvo">Boda</option>
						  <option value="saab">Quincea&ntilde;os</option>
						  <option value="mercedes">Matrimonio</option>
						  <option value="audi">Bautizo</option>
						</select><br><br>
						<label for="name" style="height:60px;">¿Cu&aacute;les de nuestros productos deseas ordenar?:</label>
						<input type="checkbox" name="vehicle" value="Bike">Torta<br>
						<input type="checkbox" name="vehicle" value="Car">Cupcakes <br>
						<input type="checkbox" name="vehicle" value="Car">Gelatina <br><br>
						<label for="name">N&uacute;mero apr&oacute;ximado de invitados:</label>
						<input type="text" name="txtName" id="txtName" size="25" maxlength="50" /> <br><br>
						<label for="name">¿Tienes un dise&ntilde;o en mente? C&aacute;rgalo aqu&iacute;:</label>
						<input type="text" name="txtName" id="txtName" size="25" maxlength="50" /> <input type="submit" value="Cargar Archivo"/> <br><br>
						<label for="name">Cu&eacute;ntanos m&aacute;s acerca de tu idea:</label>
						<textarea style="resize: none;"></textarea> <br><br>
					</fieldset>
					<div class="ocEsp-button">
							<input type="submit" name="sbmtButton" class="button" value="Enviar"  />
					</div>
				</form>
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