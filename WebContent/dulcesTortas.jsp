<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="domain.Client "%> 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Arma Tu Torta</title>
	<link href='http://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Economica' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/demos.css" />
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/ui.theme.css" />
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
	<script type="text/javascript" src="/armaTuTorta/js/dulcesTortas.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/ui.core.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/ui.datepicker.js"></script>
	<script> 
	$(function() {
		$("#datepicker").datepicker({minDate: +1});
	});
	</script> 
</head>
<body>
<%
	HttpSession infoPage = request.getSession();
	session.setAttribute("prevPage", "DulcesTortasServlet?typeId=3");
	Client client = (Client) infoPage.getAttribute("client");
	HashMap<String, String> hashMap = new HashMap<String, String>();
	HashMap<String, Double> hashMapPrice = new HashMap<String, Double>();
	HashMap<String, Long> hashMapId = new HashMap<String, Long>();
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
				<li class="current"><a href="/armaTuTorta/DulcesTortasServlet?typeId=3">Dulces Tortas</a></li>
				<li><a href="/armaTuTorta/CupcakesServlet?typeId=2">Cupcakes</a></li>
				<li><a href="/armaTuTorta/OcasionesEspecialesServlet">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/GalleryServlet">Galería</a></li>
				<li><a href="/armaTuTorta/ContactServlet">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<form id="formDulcesTortas" action="DulcesTortasServlet" method="post" id="confirm">
		<input type="hidden" id="priceDulcCake" name="priceDulcCake" value = "0">
	
		<div class="home">
			<div class="aside">
				<div class="title"> &iexcl; Deleitate con nuestras m&aacute;s sabrosas tortas! </div>
				<jsp:useBean id="options" type="java.util.ArrayList<domain.StepOption>" scope="request"/>  	
        		<% if (client != null){ %>
				<div class="subtitle">Es muy f&aacute;cil, escoge  las tortas que desees, para cuando las quieres, escoge la cantidad que desees de cada una y haz click en "Ordenar"</div>
				<div class="date"> 
					¿Para cu&aacute;ndo desea su pedido?: <input type="text" autocomplete="off" id="datepicker" name="txtFecha" size="8" />
					<span class="error" id="errorDate">Disculpe, debe introducir una fecha de entrega válida</span>
				</div>
				<div class="cakes">
					<table style="border:none;">
						<%
							for(int i= 1; i<= options.size(); i++) { 	
								int aux = i -1;
								domain.StepOption o = options.get(aux);
								hashMap.put(i +"", o.getName());
								hashMapPrice.put(o.getName(), o.getPrice());
								hashMapId.put(o.getName(), o.getId());
						%>
						<tr height="28">
							<td width="220px"> 
								<input type="checkbox" name="dulcesTortas" class="dulcesTortasCheck" value="<%= i %>" > <%= o.getName() %></td>
							<td width="100px">Bs.<span class="price-int<%= i %>"> <%= o.getPrice() %></span> </td>
							<td>
								<div class="sel<%= i %>" style="display:none">
								Cantidad: &nbsp;
								<select class="selDulcesTortas<%= i %>" name="selDulcesTortas<%= i %>"> 
									<option value="0"> - </option>
									<% for(int j = 1; j < 7; j++){ %>
									<option value="<%= j %>"><%= j %></option>
									<% } %>
								</select>
								</div>
								
							</td>
						</tr>
						<% }
						session.setAttribute("hashMapDulcesTortas", hashMap);
						session.setAttribute("hashMapPriceDulcesTortas", hashMapPrice);
						session.setAttribute("hashMapIdDulcesTortas", hashMapId);
						%>
					</table>
					<br>
					<div class="dt-button" style="display: none">
						<input type="submit" name="sbmtButton" class="button" value="Ordenar"  />
					</div> 
					<div class="dt-button-dis">
						<input type="button" name="sbmtButton" class="buttonDisable" value="Ordenar"  />
					</div> 
					<div class="subtotal-section"> Sub-total: Bs. <span class="price" id="priceTotal"> 0,00</span> </div><br>
				</div>	
				<% }else{ %>
					<br>
					<div style="text-align: justify; margin-left: 30px;">
						Disculpe, para tener acceso a esta secci&oacute;n  necesita estar registrado, y haber iniciado sesi&oacute;n. <br><br>
						
						En esta secci&oacute;n usted podr&aacute; ordenar cualquiera de nuestras deliciosas tortas, tales como marquesa de chocolate,
						pie de lim&oacute;n, pie de parchita, entre muchas otras.<br><br>
						
						Si no se est&aacute; registrado, comience su <a href="registro.jsp" class="readmore"> registro aqu&iacute;.</a> <br><br>
						
						Si ya est&aacute; registrado, <a href="#signup"  rel="leanModal" id="go" class="readmore"> inicie sesi&oacute;n.</a>
					</div>
				<% } %>
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
		</form>
	</div>
	<div class="push"></div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="ventanas.jsp"></jsp:include>
</body>
</html>