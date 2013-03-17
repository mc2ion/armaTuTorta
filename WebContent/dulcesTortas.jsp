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
				<li><a href="/armaTuTorta/index.jsp">Inicio</a></li>
				<li><a href="/armaTuTorta/creaTuTorta.jsp">Arma Tu Torta</a></li>
				<li class="current"><a href="/armaTuTorta/dulcesTortas.jsp">Dulces Tortas</a></li>
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
				<div class="title"> &iexcl; Deleitate con nuestras m&aacute;s sabrosas tortas! </div>
				<div class="subtitle">Es muy f&aacute;cil, escoge las tortas que desees ordenar, escoge la cantidad que desees de cada una y haz click en "Ordenar"</div>
				<div class="cakes">
					<table border="0">
						<tr>
							<td width="220px"> <input type="checkbox" name="option1" value="Milk" > Marquesa de almendras</td>
							<td width="100px">Bs. 15,00 </td>
							<td><input type="text" value="Cantidad" size="8" /> </td>
						</tr>
						<tr>
							<td><input type="checkbox" name="option2" value="Butter" > Marquesa de almendras</td>
							<td>Bs. 15,00 </td>
							<td><input type="text" value="Cantidad" size="8" /> </td>
						</tr>
						<tr>
							<td><input type="checkbox" name="option2" value="Butter" > Pie de lim&oacute;n</td>
							<td>Bs. 15,00 </td>
							<td><input type="text" value="Cantidad" size="8" /> </td>
						</tr>
						<tr>
							<td><input type="checkbox" name="option2" value="Butter" > Pie de parchita</td>
							<td>Bs. 15,00 </td>
							<td><input type="text" value="Cantidad" size="8" /> </td>
						</tr>
						<tr>
							<td><input type="checkbox" name="option2" value="Butter" > Mouse de parchita</td>
							<td>Bs. 15,00 </td>
							<td><input type="text" value="Cantidad" size="8" /> </td>
						</tr>
						<tr>
							<td><input type="checkbox" name="option2" value="Butter"> Tiramis&uacute;</td>
							<td>Bs. 15,00 </td>
							<td><input type="text" value="Cantidad" size="8" /> </td>
						</tr>
					</table>
					<div class="dt-button">
						<input type="submit" name="sbmtButton" class="button" value="Ordenar"  />
					</div> 
					<div class="subtotal-section"> Sub-total: Bs. 0,00 </div><br>
					
				</div>	
			</div>	
			
			<div class="sectionDT">
				<div>
					<ul>
						<li>
							<img src="./images/imagen.png" alt="Image" />
						</li>
					</ul>
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