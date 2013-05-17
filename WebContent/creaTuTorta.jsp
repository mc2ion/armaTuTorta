<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="domain.StepOption"%>
<%@page import="domain.ListOrder_Step"%>
<%@page import="domain.OrderStep"%>
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
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/demos.css" />
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/ui.theme.css" />
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
	<script type="text/javascript" src="/armaTuTorta/js/tortas.js"></script>
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
	session.setAttribute("prevPage", "ArmaTuTortaServlet?typeId=1");
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
				<li class="current"><a href="/armaTuTorta/ArmaTuTortaServlet?typeId=1">Arma Tu Torta</a></li>
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
			<div class="sectionLeft">
				<div>
					<ul>
						<li>
							<img id="pasoImgBase" src="./images/paso_torta.png" alt="Image"  />
							<img id="pasoImgSabor" src="" width="160" height="170" alt="Image" 
								style="position: absolute;top:287px; left: 291px; display:none;"  />
							<img id="pasoImgCapas" src="" width="160" height="170" alt="Image" 
								style="position: absolute; top:287px; left: 291px; display:none;"  />
							<img id="pasoImgRelleno" src="" width="160" height="170" alt="Image"
							style="position: absolute;top:287px; left: 291px;  display: none;"/>
							<img id="pasoImgCubierta" src="./images/tortas/capa_general.png" width="160" height="170" alt="Image" 
								style="position: absolute; top:287px; left: 291px;  display:none;" />
						</li>
					</ul>
				</div>	
				<span style="font-size: 8.4px; font-family: Arial; ">Imagen de referencia, no debe ser interpretada como versión final de tu pedido</span>
			</div>
			<jsp:useBean id="options" type="java.util.ArrayList<domain.ListOrder_Step>" scope="request"/>  	
        		
			<% if (client != null){ %>
				<div class="titleTortas"> &iexcl; Sigue los pasos a continuaci&oacute;n y  arma la torta que deseas! </div>
			<% } %>
			
			<div class="asideRight">
				<% if (client != null){ %>
				<form id="target" action="/armaTuTorta/ArmaTuTortaServlet?typeId=1&pr=1" method="post"
				 enctype="multipart/form-data" onSubmit="return setPrice()">
				<input type="hidden" id="priceCake"  name="priceCake" value="0">
					<%
							for(int i= 1; i<= options.size(); i++) { 	
								int aux = i -1;
								ListOrder_Step listO = options.get(aux);
								List<StepOption> actualOptions = listO.getOrderTypeId();
								OrderStep actualOrder = listO.getOrder();
								int isMultChoice = actualOrder.isMultipleChoice();
								String type = "radio";
								if (isMultChoice == 1)
									type = "checkbox";
							
					%>
					<% if ( i == 1) { %>
					<div class="block">
						<p> <span class="step1"> Paso <%= i %>: </span>  <%= actualOrder.getName() %> </p>
						<div class="options-steps">
								<% for(int j= 1; j<= actualOptions.size(); j++) {
									int aux2 = j - 1;
									StepOption step = actualOptions.get(aux2);
									hashMap.put(i + "" +j, step.getName());
									hashMapPrice.put(step.getName(), step.getPrice());
									hashMapId.put(step.getName(), step.getId());
								%>
							
							<input  class="rdB<%= i %>" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <%= step.getName()  %> <br>
							<span style="display:none;" class="price-int<%= i %><%= j %>"> <%= step.getPrice() %></span>
							<% }
							%>
						</div>
						<div class="button-section" id="bt1Disable">
							<input  type="button" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
						</div>
						<div class="button-section" style="display: none;" id="bt<%= i %>">
							<input  type="button" name="sbmtButton" class="button" value="Siguiente"  />
						</div>
					</div>
				<% 
					}else{
				%>
					<div class="block-<%=i%>" style="display:none">
						<p>
						<a href="#" id="backLink<%=aux%>"><img class="imgBack"  src="images/return.png"></a>
						<span class="step1"> Paso <%= i %>: </span>  <%= actualOrder.getName() %> </p>
						<div class="options-steps">
								<% for(int j= 1; j<= actualOptions.size(); j++) {
									int aux2 = j - 1;
									StepOption step = actualOptions.get(aux2);
									hashMap.put(i + "" +j, step.getName());
									hashMapPrice.put(step.getName(), step.getPrice());
									hashMapId.put(step.getName(), step.getId());
										
									if (actualOptions.size() > 4){
										String img = "<img  id=\"imgFudge\" src=\"./images/question.png\" title=\"Deliciosa y esponjosa torta de chocolate oscuro, no podrás parar de comerla!\"  />";
										if (!step.getName().startsWith("Chocolate fudge,")){
											img = "";
										}
									
										
								%>
									<%
										if (!step.getName().contains("imagen")){
									%>
										<div class="options-steps-left">
											<input  class="rdB<%= i %>" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <%= step.getName()  %><%= img  %> <br>
											<span style="display:none;" class="price-int<%= i %><%= j %>"> <%= step.getPrice() %></span>
										</div>	
									<%
										}else{
									%>
										<div class="options-steps-especial">
											<input  class="rdB<%= i %>" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <%= step.getName()  %><%= img  %>
											<span style="display:none;" class="price-int<%= i %><%= j %>"> <%= step.getPrice() %></span>
											<input type="file" name="txtImage" id="txtImage" maxlength="25" lang="es" />  <br>
										</div>
									
									<%	
										}
									
									%>
								<%
									}else{
								%>
									<input  class="rdB<%= i %>" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <%= step.getName()  %> <br>
									<span style="display:none;" class="price-int<%= i %><%= j %>"> <%= step.getPrice() %></span>
								
								<% 
									}
								}
								%>
							
						</div>
				<% if (i != 6){%>
					<div class="button-sectionTortas" id="bt1Disable">
						<input  type="button" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
					</div>
					<div class="button-sectionTortas" style="display: none;" id="bt<%= i %>">
						<input  type="button" name="sbmtButtonPrev" class="button" value="Siguiente"  />
					</div>
					
				<% }else{%>
					<div class="button-sectionTortas" id="bt1Disable">
						<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
					</div>
					<div class="button-sectionTortas" style="display: none;" id="bt<%= i %>">
						<input  type="submit" name="sbmtButtonPrev" class="button" value="Siguiente"  />
					</div>
				
				<% }%>
				</div>
				<% 
					}
				}
				session.setAttribute("hashMap", hashMap);
				session.setAttribute("hashMapPrice", hashMapPrice);
				session.setAttribute("hashMapId", hashMapId);
			%>	
				</form>
			<%
			}else{ 
			%>
					<br>
					<div class="msg-inicio" style="text-align: justify;">
						Disculpe, para tener acceso a esta secci&oacute;n  necesita estar registrado, y haber iniciado sesi&oacute;n. <br><br>
						
						En esta secci&oacute;n usted podr&aacute; crear tortas ajustadas a sus gustos y preferencias.  Podr&aacute; escoger 
						el sabor del ponqu&eacute; el n&uacute;mero de capas de relleno, sus sabores, el sabor de la cubierta, entre otros. <br><br>
						
						Si no se est&aacute; registrado, comience su <a href="registro.jsp" class="readmore"> registro aqu&iacute;.</a> <br><br>
						
						Si ya est&aacute; registrado, <a href="#signup"  rel="leanModal" id="go" class="readmore"> inicie sesi&oacute;n.</a><br><br><br><br>
					</div>
				<% } %>
				
			</div>
			
			<% if (client != null){ %>
				<div class="subtotal-sectionTortas"> Sub-total: Bs. <span class="price"> 0,00</span> </div>
			<% } %>
			<% if (client != null){ %>
			<div class="banner">
				<a href="./ocasionesEspeciales.jsp"><img src="./images/banner_tortas.png" alt="Image" /></a>
			</div>
			<% }else{ %>
			<div class="bannerTorta">
				<a href="./ocasionesEspeciales.jsp"><img src="./images/banner_tortas.png" alt="Image" /></a>
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