<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="domain.Client "%> 
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
	<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });
	});
	</script>
	
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/demos.css" />
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/ui.theme.css" />
	<script type="text/javascript" src="/armaTuTorta/js/ui.core.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/ui.datepicker.js"></script>
	<script> 
	$(function() {
		$("#datepicker").datepicker({
			minDate: +2
		});
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
	session.setAttribute("prevPage", "ocasionesEspeciales.jsp");
	Client client = (Client) infoPage.getAttribute("client");
	
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
				<li class="current"><a href="/armaTuTorta/OcasionesEspecialesServlet">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/GalleryServlet">Galer�a</a></li>
				<li><a href="/armaTuTorta/ContactServlet">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="home">
			<div class="title-ocEsp"> �Tienes en mente un dise�o especial para una torta? �Quieres crear cupcakes especiales? �Deseas un gelatina innovadora?
				&iexcl; Est&aacute;s en el lugar indicado! Escr&iacute;benos tu idea, carga im&aacute;genes de referencia que quieras usar y deja que nosotros
				nos encargemos del resto.
			</div>
			<% if (client != null){ %>
			<div class="coments-ocEsp">
				<form name="ocasEspForm" action="/armaTuTorta/OcasionesEspecialesServlet" method="post" enctype="multipart/form-data" onsubmit="return ocaEsp();" >
					<fieldset>
						<label for="name">�Cu&aacute;l es tu ocasi&oacute;n especial?:</label>
						<input type="text" name="txtName" id="txtName" size="25" maxlength="50" />
						<span class="error" id="errorName">Por favor, introduzca su ocasi�n especial.</span>
						<div style="font-size: 10px; font-family: Arial;">Ejemplo: boda, bautizo, entre otros. </div><br>
						<label for="name" style="height:60px;">�Cu&aacute;les de nuestros productos deseas ordenar?:</label>
						<input type="checkbox" name="eventoT" id="eventoT" value="1">Torta<br>
						<input type="checkbox" name="eventoC" id="eventoC" value="2">Cupcakes <br>
						<input type="checkbox" name="eventoG" id="eventoG" value="3">Gelatina 
						<span class="error" id="errorProducto">Por favor, seleccione al menos uno producto.</span><br><br>
						<label for="name">�Tienes un dise&ntilde;o en mente? C&aacute;rgalo aqu&iacute;:</label>
						<input type="file" name="txtImage" id="txtImage" maxlength="50" lang="es" /> <br><br><br>
						<label for="name"  >N&uacute;mero apr&oacute;ximado de invitados:</label>
						<input type="text" name="txtInv" id="txtInv" size="15" maxlength="50" /> <br>
						<span class="error" id="errorInv">Por favor, ingrese un n�mero estimado de invitados</span><br>
						<label for="name">Cu&eacute;ntanos m&aacute;s acerca de tu idea:</label>
						<textarea name="idea" style="resize: none;"></textarea> <br>
					</fieldset>
					<div class="ocEsp-button">
							<input type="submit" name="sbmtButton" class="button" value=" Solicitar Presupuesto "  />
					</div>
					</form>
			</div>
			<% }else{ %>
					<br><br>
					<div style="text-align: justify; margin-left: 30px;">
						Disculpe, para hacer uso de esta secci&oacute;n usted  necesita estar registrado, y haber iniciado sesi&oacute;n. <br><br>
						
						Si no se est&aacute; registrado, comience su <a href="registro.jsp" class="readmore"> registro aqu&iacute;.</a> <br><br>
						
						Si ya est&aacute; registrado, <a href="#signup"  rel="leanModal" id="go" class="readmore"> inicie sesi&oacute;n.</a>
					</div>
				<% } %>
			
			
			
		</div>
	</div>
	<div class="push"></div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="ventanas.jsp"></jsp:include>
</body>
</html>