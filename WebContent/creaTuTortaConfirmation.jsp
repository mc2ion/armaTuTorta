<%@page import="domain.Client"%>
<%@page import="java.util.Arrays"%>
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
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	  <script>
	  $(function() {
		$.datepicker.setDefaults($.datepicker.regional['es']);
		$('#datepicker').datepicker({
			buttonText: "Seleccione una fecha",
			dateFormat:'dd/mm/yy',
			changeMonth: true,
		    changeYear: true,
			minDate: +2
		});
	  });
	  </script>
	
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });
		});
	</script>
	<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>
	
</head>
<body>
<%
	HttpSession infoPage = request.getSession();
	session.setAttribute("prevPage", "HomePageServlet");
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
				<li><a href="/armaTuTorta/OcasionesEspecialesServlet">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/GalleryServlet">Galería</a></li>
				<li><a href="/armaTuTorta/ContactServlet">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="home">
			<% String type = (String) request.getAttribute("info"); 
				if (type.equals("1")){
			%>
			<div id="datosVerif">
			<jsp:useBean id="pedido" type="domain.OrderCake" scope="request" />  
					
			<form action="/armaTuTorta/ArmaTuTortaServlet?typeId=1&pr=2" method="post" id="confirm">
				<input type="hidden" name="clientId" id="clientId" value="<%= client.getId() %>">
				<input type="hidden" name="forma" id="forma" value="<%= pedido.getForma() %>">
				<input type="hidden" name="tam"  id="tam" value="<%= pedido.getTamano() %>">
				<input type="hidden" name="sabor"  id="sabor" value="<%= pedido.getSabor() %>">
				<input type="hidden" name="capas" id="capas" value="<%= pedido.getCapas() %>">
				<%
					for (int j= 0; j < pedido.getRelleno().length; j++){
				%>
					<input type="hidden" name="relleno" value="<%= pedido.getRelleno()[j] %>">
				<%
					}
				%>	
				<input type="hidden" name="cubierta" id="cubierta" value="<%= pedido.getCubiertas() %>">
				<input type="hidden" name="priceCake" id="priceCake" value="<%= pedido.getPrecio() %>">
				<input type="hidden" name="nombreImagen" id="nombreImagen" value="<%= pedido.getNombreImagen()==null ? "" : pedido.getNombreImagen() %>">
			
				<div class="bienv">
					<span class="bienv-title">Verifica los datos de tu pedido.</span><br><br>
					<div id="pedido">
						<%
							String rell = "";
							String[] relleno = pedido.getRelleno();
					         for (int i = 0; i< relleno.length; i++){
					        	 if (i == relleno.length - 1)
					        		 rell += "y " + relleno[i] ;
					        	 else
					        		 rell += relleno[i] + ", " ;
					         }
			        	 %>
						<strong>Producto pedido:</strong> Torta <br>
			    		<strong>Forma:</strong>  <%= pedido.getForma() %><br>
			    		<strong>Tama&ntilde;o:</strong> <%= pedido.getTamano() %><br>
			     		<strong>Sabor del ponqu&eacute;:</strong> <%= pedido.getSabor() %><br>
			     		<strong>Cantidad de capas:</strong>  <%= pedido.getCapas() %><br>
			     		<strong>Sabores de capas:</strong>  <%= rell %><br>
			     		<strong>Sabores de cubierta:</strong>   <%= pedido.getCubiertas() %><br>
					</div>
					<div class="total"> Total: <%= pedido.getPrecio() %><br></div><br>
			     	Por favor ingrese la fecha de entrega para la cual desea su pedido: <input type="text" id="datepicker" name="txtFecha" />
			  		<span class="error" id="errorDate">Disculpe, debe introducir una fecha de entrega válida</span>
			   </div>
			   <div class="dt-buttonInline">
					<input type="button" name="sbmtButton" class="buttonInline" value="Cancelar"  />
					<input type="submit" name="sbmtButton" class="buttonInline" value="Ordenar"  />
				</div> 
			</form>
			</div>
			<% 
				}else{
			%>
			<div id="datosVerif" >
				<div class="bienv">
					<span class="bienv-title">&iexcl; Muchas gracias!.</span><br><br>
						Hemos recibido su pedido, en los pr&oacute;ximos d&iacute;as lo
						estaremos contactando para confirmar su compra y coordinar el env&iacute;o. 
						<br><br>
						
						Cualquier duda o inquietud lo invitamos a comunicarse con nosotros. <a href="/armaTuTorta/ContactServlet"  class="readmore">Aqu&iacute;</a> 
						podr&aacute; encontrar nuestros datos.
						
						<br><br>
						
						&iexcl;Hasta pronto!
						
			   </div>
			</div>
			<% 
				}
			%>
		</div>
	</div>
	<div class="push"></div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="ventanas.jsp"></jsp:include>
</body>
</html>