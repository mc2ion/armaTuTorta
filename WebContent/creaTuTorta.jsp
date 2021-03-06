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
	<link rel="shortcut icon" href="/armaTuTorta/images/ico.ico">
	<script type="text/javascript" src="/armaTuTorta/js/jquery.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/tortas.js"></script>
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
				<li><a href="/armaTuTorta/GalleryServlet">Galer�a</a></li>
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
							<div style="position: relative; left: -10px; top: -10px; background-color: black;">
								<img id="pasoImgBase" src="./images/paso_torta.png" alt="Image"  style="position: relative; top: 0; left: 0;" />
								<img id="pasoImgSabor" src="" width="160" height="170" alt="Image" 
									style="position: absolute;top:70px; left: 45px; display:none;"  />
								<img id="pasoImgCapas" src="" width="160" height="170" alt="Image" 
								style="position: absolute; top:70px; left: 45px; display:none;"  />
								<img id="pasoImgRelleno" src="" width="160" height="170" alt="Image"
								style="position: absolute;top:70px; left: 45px;  display: none;"/>
								<img id="pasoImgCubierta" src="./images/tortas/capa_general.png" width="160" height="170" alt="Image" 
									style="position: absolute; top:70px; left: 45px;  display:none;" />
							</div>	
						</li>
					</ul>
				</div>	
				<span style="font-size: 8.4px; font-family: Arial; ">Imagen de referencia, no debe ser interpretada como versi�n final de tu pedido</span>
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
						<p> <span class="step1"> Paso <%= i %>: </span> <span class="desc<%= i %>"> <%= actualOrder.getName() %> </span></p>
						<div class="options-steps">
								<% for(int j= 1; j<= actualOptions.size(); j++) {
									int aux2 = j - 1;
									StepOption step = actualOptions.get(aux2);
									String description = step.getDescription();
									String imgDescription = "";
									if (description != null && !description.equals(""))
										imgDescription = "<img  id=\"imgFudge\" src=\"./images/question.png\" title=\"" +  description  + "\"/>";
									String imagen = step.getImage();
									hashMap.put(i + "" +j, step.getName());
									hashMapPrice.put(i + "" +j, step.getPrice());
									hashMapId.put(i + "" +j, step.getId());
								%>
							
							<input  class="rdB<%= i %>" onClick="prueba('<%= imagen %>','<%= i %>', '<%= step.getId() %>', this);" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <span id="name<%= i+ "" +j%>">  <%= step.getName()%><%= imgDescription %></span> <br>
							<span style="display:none;" class="price-int<%= i %><%= j %>"> <%= step.getPrice() %></span>
							<% }
							%>
						</div>
						<span style="display: inline;" class="buttons">
							<input  type="button" name="sbmtButtonPrev" class="buttonR" value="Reiniciar" />
							<input  type="button" name="sbmtButton" class="buttonDisable" value="Siguiente" id="bt1Disable"  />
							<input  type="button" name="sbmtButton" class="button" value="Siguiente"  style="display: none;" id="bt<%= i %>" />
						</span>						
					</div>
				<% 
					}else{
				
					if (i == 5){
				%>	
						<div class="block-<%=i%>" style="display:none">
							<p>
							<span class="step1"> Paso <%= i %>: </span> <span class="desc<%= i %>"> <%= actualOrder.getName() %> </span> 
							</p>
							<div class="options-steps">
								<div id="capa1" style="display:none">
									Capa 1: <select name="capa1"  id="selectCapa1"> 
									<option value="0">  Seleccione Sabor
									<% for(int j= 1; j<= actualOptions.size(); j++) {
										int aux2 = j - 1;
										StepOption step = actualOptions.get(aux2);
										String imagen = step.getImage();
										hashMap.put(i + "" +j, step.getName());
										hashMapPrice.put(i + "" +j, step.getPrice());
										hashMapId.put(i + "" +j, step.getId());
											
									%>
									<option value="<%= j %>"> <%= step.getName()%>
									<% }
									%>
									</select>
									<span style="display:none;" class="price-intC10"> 0</span>
									<% for(int j= 1; j<= actualOptions.size(); j++) {
										int aux2 = j - 1;
										StepOption step = actualOptions.get(aux2);
									%>
										<span style="display:none;" class="price-intC1<%= j %>"> <%= step.getPrice() %></span>
									<% }%>
								</div>
								<div id="capa2" style="display:none">
									Capa 2: <select name="capa2"  id="selectCapa2"> 
									<option value="0">  Seleccione Sabor
									<% for(int j= 1; j<= actualOptions.size(); j++) {
										int aux2 = j - 1;
										StepOption step = actualOptions.get(aux2);
									%>
									<option value="<%= j %>"><%= step.getName()%>
									<% }
									%>
									</select>
									<span style="display:none;" class="price-intC20"> 0</span>
									<% for(int j= 1; j<= actualOptions.size(); j++) {
										int aux2 = j - 1;
										StepOption step = actualOptions.get(aux2);
									%>
										<span style="display:none;" class="price-intC2<%= j %>"> <%= step.getPrice() %></span>
									<% }%>
								</div>
								
								<div id="capa3" style="display:none">
									Capa 3: <select name="capa3" id="selectCapa3"> 
									<option value="0">  Seleccione Sabor 
									<% for(int j= 1; j<= actualOptions.size(); j++) {
										int aux2 = j - 1;
										StepOption step = actualOptions.get(aux2);
										
											
									%>
									<option value="<%= j %>"><%= step.getName()%>
									<% }
									%>
									</select>
									<span style="display:none;" class="price-intC30"> 0</span>
									<% for(int j= 1; j<= actualOptions.size(); j++) {
										int aux2 = j - 1;
										StepOption step = actualOptions.get(aux2);
									%>
										<span style="display:none;" class="price-intC3<%= j %>"> <%= step.getPrice() %></span>
									<% }%>
								</div>
							</div>
					
						
						<span style="display: inline;" class="buttons">
							<input  type="button" name="sbmtButtonPrev" class="buttonR" value="Reiniciar"  />
							<input  type="button" name="sbmtButton" class="buttonDisable" value="Siguiente" id="bt<%= i %>Disable"  />
							<input  type="button" name="sbmtButton" class="button" value="Siguiente"  style="display: none;" id="bt<%= i %>" />
						</span>	
						</div>						
					
				<%	}else{ %>	
				
					<div class="block-<%=i%>" style="display:none">
						<p>
						<span class="step1"> Paso <%= i %>: </span> <span class="desc<%= i %>"> <%= actualOrder.getName() %> </span> </p>
						<div class="options-steps">
								<% for(int j= 1; j<= actualOptions.size(); j++) {
									int aux2 = j - 1;
									StepOption step = actualOptions.get(aux2);
									hashMap.put(i + "" +j, step.getName());
									hashMapPrice.put(i + "" +j, step.getPrice());
									hashMapId.put(i + "" +j, step.getId());
									String imagen = step.getImage();	
									String description = step.getDescription();
									String imgDescription = "";
									if (description != null && !description.equals(""))
										imgDescription = "<img  id=\"imgFudge\" src=\"./images/question.png\" title=\"" +  description  + "\"/>";
									
									if (actualOptions.size() > 4){
											
										
								%>
									<%
										if (!step.getName().contains("imagen")){
									%>
										<div class="options-steps-left">
											<input  class="rdB<%= i %>" onClick="prueba('<%= imagen %>','<%= i %>', '<%= step.getId() %>', this);" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <span id="name<%= i+ "" +j%>">  <%= step.getName()%><%= imgDescription  %> </span> <br>
											<span style="display:none;" class="price-int<%= i %><%= j %>"> <%= step.getPrice() %></span>
										</div>	
									<%
										}else{
									%>
										<div class="options-steps-especial">
											<input  class="rdB<%= i %>"  onClick="prueba('<%= imagen %>','<%= i %>', '<%= step.getId() %>', this);" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <span id="name<%= i+ "" +j%>">  <%= step.getName()%><%= imgDescription  %> </span>
											<span style="display:none;" class="price-int<%= i %><%= j %>"> <%= step.getPrice() %></span>
											<input type="file" accept='image/*' name="txtImage" id="txtImage" maxlength="25" lang="es"  style="display:none;"/>  <br>
										</div>
									
									<%	
										}
									
									%>
								<%
									}else{
								%>
									<input  class="rdB<%= i %>" onClick="prueba('<%= imagen %>','<%= i %>', '<%= step.getId() %>', this);" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <span id="name<%= i+ "" +j%>">  <%= step.getName()%> </span> <br>
									<span style="display:none;" class="price-int<%= i %><%= j %>"> <%= step.getPrice() %></span>
								
								<% 
									}
								}
								%>
							
						</div>
				<% if (i != 6){%>
					<span style="display: inline;" class="buttons">
							<input  type="button" name="sbmtButtonPrev" class="buttonR" value="Reiniciar"  />
							<input  type="button" name="sbmtButton" class="buttonDisable" value="Siguiente" id="bt<%= i %>Disable"  />
							<input  type="button" name="sbmtButton" class="button" value="Siguiente"  style="display: none;" id="bt<%= i %>" />
					</span>		
					
				<% }else{%>
					<span style="display: inline;" class="buttons">
						<input  type="button" name="sbmtButtonPrev" class="buttonR" value="Reiniciar"  />
						<input  type="button" name="sbmtButton" class="buttonDisable" value="Siguiente" id="bt<%= i %>Disable"  />
						<input  type="submit" name="sbmtButton" class="button" value="Ordenar"  style="display: none;" id="bt<%= i %>" />
					</span>		
				<% }%>
				</div>
				<%	} %>	
				
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