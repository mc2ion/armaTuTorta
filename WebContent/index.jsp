<%@page import="Util.FilesName"%>
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
	<link rel="shortcut icon" href="/armaTuTorta/images/ico.ico">
	<script type="text/javascript" src="/armaTuTorta/js/jquery.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/jquery.leanModal.min.js"></script>
	
	<script src="/armaTuTorta/js/jqbanner.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" media="screen" href="/armaTuTorta/css/jqbanner.css" />
	
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
	session.setAttribute("prevPage", "HomePageServlet");
	
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
				<li class="current"><a href="/armaTuTorta/HomePageServlet">Inicio</a></li>
				<li><a href="/armaTuTorta/ArmaTuTortaServlet?typeId=1">Arma Tu Torta</a></li>
				<li><a href="/armaTuTorta/DulcesTortasServlet?typeId=3">Dulces Tortas</a></li>
				<li><a href="/armaTuTorta/CupcakesServlet?typeId=2">Cupcakes</a></li>
				<li><a href="/armaTuTorta/OcasionesEspecialesServlet">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/GalleryServlet">Galer�a</a></li>
				<li><a href="/armaTuTorta/ContactServlet">Contacto</a></li>
			</ul>
		</div>
	</div>
	<%
		String[] archivos = FilesName.getFilesNamesIndex(request);;	
    %>	
	<div id="content">
		<div class="home">
			<div class="aside">
				<p>En <strong>Arma Tu Torta</strong> elaboramos reposter&iacute;a de forma artesanal, haciendo de la cocina un arte, utilizando la mejor calidad en materia prima y priorizando el sabor de los alimentos.</p>
				<p>Elaboramos tortas para toda ocasi&oacute;n con los ingredientes, sabores y dise&ntilde;os de tu preferencia. El esp&iacute;ritu de <strong>Arma Tu Torta</strong> est&aacute; en la gastronom&iacute;a como
				 forma de vida y en la transmisi&oacute;n de ese placer en cada uno de nuestros productos.</p>
				<p>Elige la forma de tu preferencia, escoge tus sabores favoritos, el relleno que desees, el topping que m&aacute;s te guste... &iexcl;&Aacute;rmala a tu gusto 
				que nosotros nos encargamos del resto!  &nbsp;<a href="ArmaTuTortaServlet?typeId=1" class="readmore"> &iexcl;Solicita aqu&iacute; tu pedido!</a></p>
			</div>
			<div class="section">
				<div id="jqb_object">
					<div class="jqb_slides">
						<% for (int i = 0 ; i < archivos.length; i++){
							String src = "./images/galeria_inicio/" + archivos[i];
						%>
							<div class="jqb_slide" title="slide title" ><a href="/armaTuTorta/GalleryServlet"><img src="<%= src %>"  height="220" width="340"/></a></div>
						<% } %>
					</div>
					
					<div class="jqb_bar">
						<div id="btn_next" class="jqb_btn jqb_btn_next"></div>
						<div id="btn_pauseplay" class="jqb_btn jqb_btn_pause"></div>
						<div id="btn_prev" class="jqb_btn jqb_btn_prev"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="push"></div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="ventanas.jsp"></jsp:include>
</body>
</html>