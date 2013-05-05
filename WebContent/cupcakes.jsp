<%@page import="java.util.List"%>
<%@page import="domain.ListOrder_Step"%>
<%@page import="domain.OrderStep"%>
<%@page import="domain.StepOption"%>
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
	<script type="text/javascript" src="/armaTuTorta/js/cupcakes.js"></script>

</head>
<body>
<%
	HttpSession infoPage = request.getSession();
	session.setAttribute("prevPage", "CupcakesServlet?typeId=2");
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
				<li ><a href="/armaTuTorta/index.jsp">Inicio</a></li>
				<li><a href="/armaTuTorta/ArmaTuTortaServlet?typeId=1">Arma Tu Torta</a></li>
				<li><a href="/armaTuTorta/DulcesTortasServlet?typeId=3">Dulces Tortas</a></li>
				<li class="current"><a href="/armaTuTorta/CupcakesServlet?typeId=2">Cupcakes</a></li>
				<li><a href="/armaTuTorta/OcasionesEspecialesServlet">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/GalleryServlet">Galería</a></li>
				<li><a href="/armaTuTorta/contacto.jsp">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="home">
			<div class="sectionLeft">
				<div>
					<ul>
						<li>
							<img id="pasoImgBase" src="./images/paso_cupcakes.png" />
							<!-- Sabores ponqué -->	
							<img id="pasoImgSabor" src="" width="120" height="183" alt="Image" 
								style="position: absolute; top:275px; left: 310px; display:none;"  />
							<!-- Sabores ponqué surtidos -->	
							<img id="pasoImgSabor1" src="" width="90" height="143" alt="Image" 
								style="position: absolute; top:275px; left: 255px; display:none;"  />
							<img id="pasoImgSabor2" src="" width="90" height="143" alt="Image" 
								style="position: absolute; top:275px; left: 405px;display:none; "  />
							<img id="pasoImgSabor3" src="" width="120" height="183" alt="Image" 
								style="position: absolute; top:275px; left: 315px;display:none; "  />
							<!-- Cubiertas -->
							<img id="pasoImgCubierta" src="" width="120" height="183" alt="Image" 
								style="position: absolute; top:275px; left: 310px; display:none;"  />
							<!-- Cubiertas Surtidas -->
							<img id="pasoImgCubierta1" src="" width="90" height="143" alt="Image" 
								style="position: absolute; top:275px; left: 255px; display:none;"  />
							<img id="pasoImgCubierta2" src="" width="90" height="143" alt="Image" 
								style="position: absolute; top:275px; left: 405px; display:none;"  />
							<img id="pasoImgCubierta3" src="" width="120" height="183" alt="Image" 
								style="position: absolute; top:275px; left: 315px; display:none;"  />
							<!-- Colores Cubiertas -->
							<img id="pasoImgColor" src=""width="120" height="183"alt="Image"
							style="position: absolute; top:275px; left: 310px;  display: none;"/>
							<!-- Colores Cubiertas Surtidas -->
							<img id="pasoImgColor1" src=""width="90" height="143"alt="Image"
							style="position: absolute; top:275px; left: 255px;  display: none;"/>
							<img id="pasoImgColor2" src=""width="90" height="143"alt="Image"
							style="position: absolute; top:275px; left: 405px;  display: none;"/>
							<img id="pasoImgColor3" src=""width="120" height="183"alt="Image"
							style="position: absolute; top:275px; left: 315px;  display: none;"/>
							<!-- Decoracion -->							
							<img id="pasoImgDecoracion" src="" width="120" height="183" alt="Image" 
								style="position: absolute; top:275px; left: 310px; display:none;" />
							<!-- Decoracion surtida -->							
							<img id="pasoImgDecoracion1" src="" width="90" height="143" alt="Image" 
								style="position: absolute; top:275px; left: 255px; display:none;" />
							<img id="pasoImgDecoracion2" src="" width="90" height="143" alt="Image" 
								style="position: absolute; top:275px; left: 405px; display:none;" />
							<img id="pasoImgDecoracion3" src="" width="120" height="183" alt="Image" 
								style="position: absolute; top:275px; left: 315px; display:none;" />
						</li>
					</ul>
				</div>	
			</div>
			<% if (client != null){ %>
				<div class="title"> &iexcl; Sigue los pasos a continuaci&oacute;n y  arma los cupcakes que deseas! </div>
			<% } %>
				
			<jsp:useBean id="options" type="java.util.ArrayList<domain.ListOrder_Step>" scope="request"/>  	
        
			
			<div class="asideRight">
				<% if (client != null){ %>
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
								
								%>
							<input  class="rdB<%= i %>" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <%= step.getName()  %> <br>
							<% }
							%>
						</div>
						<div class="button-section" id="bt1Disable">
							<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
						</div>
						<div class="button-section" style="display: none;" id="bt<%= i %>">
							<input  type="submit" name="sbmtButton" class="button" value="Siguiente"  />
						</div>
					</div>
					<% 
					}else if (i==2){ %>
						<div class="block-<%=i%>" style="display:none">
						<p>
						<a href="#" id="backLink<%=aux%>"><img src="images/return.png"></a>
						<span class="step1"> Paso <%= i %>: </span>  <%= actualOrder.getName() %> </p>
						<div class="options-steps">
								<% for(int j= 1; j<= actualOptions.size(); j++) {
									int aux2 = j - 1;
									StepOption step = actualOptions.get(aux2);
									boolean regalo = false;
									boolean cantidad = false;
									if (step.getName().contains("regalar")){
										regalo = true;
									}else if (step.getName().contains("antidad")){
										cantidad = true;
									}
									if (actualOptions.size() > 4){
									
								%>
										<div class="options-steps-left">
											<input  class="rdB<%= i %>" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <%= step.getName()  %> 
											<% if (regalo){  %>
											<br> <span style="color: gray; font-size: 16px; margin-left: 15px;"> Coloca el texto de tu calcoman&iacute;a aqu&iacute; </span>: <input type="text" >
											<br>
											<% }else if (cantidad){ %>
												<select>
												<% 
													for (int k = 1 ; k<3 ; k++){
												%>
													<br><option value="<%= k %>"><%= k %></option>
												<% 
													}
												%>
											</select>
											<span style="color: gray; font-size: 16px; margin-left: 15px;">
												<br>(Si desea ordenar m&aacute;s de 2 docenas, le invitamos a solicitar su pedido por aqu&iacute;)
											</span>
											<% }else{ %>
											<br>
											<% }%>
										</div>	
								<%
									}else{
								%>
									<input  class="rdB<%= i %>" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <%= step.getName()  %> 
									<% if (regalo){  %>
											<br> <span style="color: gray; font-size: 16px; margin-left: 15px;"> Coloca el texto de tu calcoman&iacute;a aqu&iacute; </span>: <input type="text" >
											<br>
									<% }else if (cantidad){ %>
										<select>
										<% 
											for (int k = 1 ; k<3 ; k++){
										%>
											<br><option value="<%= k %>"><%= k %></option>
										<% 
											}
										%>
									</select>
									<span style="color: gray; font-size: 16px; margin-left: 15px;">
												<br>(Si desea ordenar m&aacute;s de 2 docenas, le invitamos a solicitar su pedido por aqu&iacute;)
									</span>
									<% }else{ %>
									<br>
									<% }%>
								<% 
									}
								}
								%>
							
						</div>
						<div class="button-section" id="bt1Disable">
							<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
						</div>
						<div class="button-section" style="display: none;" id="bt<%= i %>">
							<input  type="submit" name="sbmtButton" class="button" value="Siguiente"  />
						</div>
					</div>
				
					
					
					<%
					}else{
					%>
					<div class="block-<%=i%>" style="display:none">
						<p>
						<a href="#" id="backLink<%=aux%>"><img src="images/return.png"></a>
						<span class="step1"> Paso <%= i %>: </span>  <%= actualOrder.getName() %> </p>
						<div class="options-steps">
								<% for(int j= 1; j<= actualOptions.size(); j++) {
									int aux2 = j - 1;
									StepOption step = actualOptions.get(aux2);
									if (actualOptions.size() > 4){
								%>
										<div class="options-steps-left">
											<input  class="rdB<%= i %>" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <%= step.getName()  %> <br>
										</div>	
								<%
									}else{
								%>
									<input  class="rdB<%= i %>" type="<%= type %>" name="<%= i %>" value="<%= j %>" > <%= step.getName()  %> <br>
								
								<% 
									}
								}
								%>
							
						</div>
						<div class="button-section" id="bt1Disable">
							<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
						</div>
						<div class="button-section" style="display: none;" id="bt<%= i %>">
							<input  type="submit" name="sbmtButton" class="button" value="Siguiente"  />
						</div>
					</div>
				
				
				<% 
					}
				}
			}else{ %>
					<br>
					<div style="text-align: justify;">
						Disculpe, para tener acceso a esta secci&oacute;n  necesita estar registrado, y haber iniciado sesi&oacute;n. <br><br>
						
						En esta secci&oacute;n usted podr&aacute; dise&ntilde;ar los cupcakes totalmente ajustados a sus gustos.  Podr&aacute; escoger
						el relleno de su preferencia, la cubierta que desea, el sabor del ponqu&eacute;, entre otros.  <br><br>
						
						Si no se est&aacute; registrado, comience su <a href="registro.jsp" class="readmore"> registro aqu&iacute;.</a> <br><br>
						
						Si ya est&aacute; registrado, <a href="#signup"  rel="leanModal" id="go" class="readmore"> inicie sesi&oacute;n.</a>
					</div>
				<% } %>
			</div>
			<% if (client != null){ %>
				<div class="subtotal-section"> Sub-total: Bs. 100,00 </div>
			<% } %>
			<div class="banner">
				<a href="./ocasionesEspeciales.jsp"><img src="./images/banner_cupcakes.png" alt="Image" /></a>
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