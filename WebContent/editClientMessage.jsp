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
	<script type="text/javascript" src="/armaTuTorta/js/jquery.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>
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
	session.setAttribute("prevPage", "index.jsp");
	String error = (String) request.getAttribute("editClient");
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
				<li><a href="/armaTuTorta/GalleryServlet">Galer�a</a></li>
				<li><a href="/armaTuTorta/ContactServlet">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="home">
			<div class="bienv">
			<%
				if (error.equals("successUser")){
			%>
				<span class="bienv-title">&iexcl; Modificaci�n exitosa!</span><br><br>
					Se han modificado exitosamente los datos de tu usuario. 
			<% }else if (error.equals("errorUser")){ 
			%>
				<span class="bienv-title">&iexcl; Error al modificar el usuario!</span><br><br>
					Se ha presentado un problema al intentar modificar los datos del usuario. Por favor, intente nuevamente.

			<% }%>
			<%
				if (error.equals("successPass")){
			%>
				<span class="bienv-title">&iexcl; Modificaci�n exitosa!</span><br><br>
					La contrase&ntilde;a de su usuario fue modificado exitosamente.
			<% }else if (error.equals("errorPass")){ 
			%>
				<span class="bienv-title">&iexcl; Error al modificar la contrase&ntilde;a!</span><br><br>
					Se ha presentado un problema al intentar modificar la contrase&ntilde;a. Por favor, aseg&uacute;rese de introducir correctamente su contrase&ntilde;a
					anterior e intente de nuevo. Si el error persiste, lo invitamos a comunicarse con nosotros para transmitirnos el error.
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