<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Arma Tu Torta</title>
	<link rel="shortcut icon" href="/armaTuTorta/images/ico.ico">
	<link href='http://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Economica' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/style.css" />
	<script type="text/javascript" src="/armaTuTorta/js/jquery.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });
	});
	</script>
	<script type="text/javascript" charset="utf-8">
		function inhabilitar(){ 
		   	return false;
		} 
		document.oncontextmenu=inhabilitar;
	</script>
</head>
<body oncontextmenu="return inhabilitar()">
<%
	HttpSession infoPage = request.getSession();
	session.setAttribute("prevPage", "contacto.jsp");
	String mensajeExitoso = (String) request.getAttribute("mensaje");
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
				<li class="current"><a href="/armaTuTorta/ContactServlet">Contacto</a></li>
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
						Cont&aacute;ctanos:<br>
						<span style="font-size: 18px;"> "Env&iacute;anos un mensaje con tus dudas o comentarios.</span><br>
						<% if (mensajeExitoso != null){ %>
							<span style="color:red;"> <%= mensajeExitoso %></span>
						<% } %>
						<form name="contactForm" action="/armaTuTorta/ContactServlet" method="post" onsubmit="return contact();"  >
						<fieldset>
								<label for="name">Nombre (*):</label>
								<input type="text" name="txtName" id="txtName" size="35" maxlength="100" />
								<span class="error" id="errorName" style="float:right; margin-right:50px;">Disculpe, debe ingresar su nombre.</span>
								 <br>
								<label for="name">Email (*):</label>
								<input type="text" name="txtEmail" id="txtEmail" size="35"  maxlength="50" />
								<span class="error" id="errorEmail" style="float:right; margin-right:50px;">Disculpe, debe ingresar un correo válido.</span> <br>
								<label for="name">Tel&eacute;fono:</label>
								<input type="text" name="txtPhone" id="txtPhone" size="35" maxlength="50" /> <br>
								<label for="name">Mensaje (*):</label>
								<textarea name="txtMsg"  id="txtMsg" rows="4" cols="28" style="resize: none;"></textarea>
								
								<div class="txtCheck">
									<input type="checkbox" name="txtCheck"  value="1"> Enviar copia de este mensaje a mi correo <br>
								</div>
								<span class="error" id="errorMensaje" style="float:right; margin-right:50px;">Disculpe, debe algún comentario o mensaje.</span>
							</fieldset>
							<div class="cont-button">
								<input type="submit" name="sbmtButton" class="button" value="Enviar"  />
							</div>
						</form>
			</div>
			</div>
		</div>
	<div class="push"></div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="ventanas.jsp"></jsp:include>
</body>
</html>