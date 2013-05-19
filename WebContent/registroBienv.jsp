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
	<link rel="shortcut icon" href="/armaTuTorta/images/ico.ico">
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
	<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });
		});
	</script>
</head>
<body>
<%
	HttpSession infoPage = request.getSession();
	session.setAttribute("prevPage", "HomePageServlet");
	String error = (String) request.getAttribute("emailExist");
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
				<li><a href="/armaTuTorta/HomePageServlet">Inicio</a></li>
				<li><a href="/armaTuTorta/ArmaTuTortaServlet?typeId=1">Arma Tu Torta</a></li>
				<li><a href="/armaTuTorta/DulcesTortasServlet?typeId=3">Dulces Tortas</a></li>
				<li><a href="/armaTuTorta/CupcakesServlet?typeId=2">Cupcakes</a></li>
				<li><a href="/armaTuTorta/OcasionesEspecialesServlet">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/GalleryServlet">Galería</a></li>
				<li><a href="/armaTuTorta/ContactServlet">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="home">
			<div class="bienv">
			<%
				if (error != null && error == ""){
			%>
				<span class="bienv-title">¡Bienvenido a Arma Tu Torta!</span><br><br>
				Tu registro se ha realizado exitosamente. A partir de este momento puede disfrutar de todos nuestros servicios. Para ello debe iniciar sesi&oacute;n 
				desde la parte superior de la p&aacute;gina web, d&aacute;ndole click a "Ingresar", o d&aacute;ndole click  <a href="#signup"  rel="leanModal" id="go" class="readmore"> aqu&iacute;</a>
				<br><br>
				PD: Te hemos env&iacute;ado un correo electr&oacute;nico con la informaci&oacute;n de tu cuenta.
				<br><br>
				¡Muchas gracias por elegirnos!. 
				
			<% }else if(!error.equals("no se creo")){ 
				String name = (String) request.getAttribute("name");
			%>
					<span class="bienv-title">Disculpe, el correo que intenta registrar ya existe.</span><br><br>
					El correo que usted intenta registrar ya aparece en nuestro sistema. Si no recuerda 
					su clave puede hacer <a href="/armaTuTorta/PasswordGeneratorServlet?email=<%= error %>&name=<%= name %>" 
					class="readmore"> click aqu&iacute;</a>
					 y le enviaremos una nueva clave a su correo
					electr&oacute;nico para que pueda seguir disfrutando de todos nuestros servicios.
					<br><br>
					¡Muchas gracias por elegirnos!. 

			<% }else{ 
			%>
					<span class="bienv-title">¡Te pedimos disculpas!</span><br><br>
					Ha ocurrido un error al intentar registrar su cuenta en el sistema. Por favor, intente m&aacute;s tarde. 
					De persistir el problema lo invitamos a comunicarse con nosotros para transmitirnos el error.
					
					<br><br>
					¡Muchas gracias por elegirnos!. 

			<% }%>
			
			</div>
		</div>
	</div>
	<div class="push"></div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="ventanas.jsp"></jsp:include>
</body>
</html>