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
	session.setAttribute("prevPage", "cupcakes.jsp");
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
				<li ><a href="/armaTuTorta/creaTuTorta.jsp">Arma Tu Torta</a></li>
				<li ><a href="/armaTuTorta/dulcesTortas.jsp">Dulces Tortas</a></li>
				<li  class="current"><a href="/armaTuTorta/cupcakes.jsp">Cupcakes</a></li>
				<li><a href="/armaTuTorta/ocasionesEspeciales.jsp">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/galeria.jsp">Galería</a></li>
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
				
			
			
			<div class="asideRight">
				<% if (client != null){ %>
				
					<div class="block" >
						<p> <span class="step1"> Paso 1: </span>  Elige el tamaño de tus Cupcakes: </p>
						<div class="options-steps">
							<input  class="rdB1" type="radio" name="forma" value="1" > Mini Cupcakes<br>
							<input  class="rdB1" type="radio" name="forma" value="2" > Cupcakes tradicionales <br>
						</div>
						<div class="button-section" id="bt1Disable">
							<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
						</div>
						<div class="button-section" style="display: none;" id="bt1">
							<input  type="submit" name="sbmtButton" class="button" value="Siguiente"  />
						</div>
					</div>
					
					<div class="block-2" style="display:none">
						<p> <span class="step1">
							<a href="#" id="backLink"> <img src="images/return.png"> </a>
							Paso 2: </span>  Elige la cantidad que deseas:</p>
						<div class="options-steps">
							<input class="rdB2" type="radio" name="tamano" value="1"> Una docena en caja para regalar! Incluye lazo y calcomanía personalizada!
							<br>  Coloca el texto de tu calcomanía aqui: <input type="text" >
							<br>
							<input class="rdB2" type="radio" name="tamano" value="2" > Cantidad de docenas
							<select>
								<% 
									for (int i = 2 ; i<13 ; i++){
								%>
									<option value="<%= i %>"><%= i %></option>
								<% 
									}
								%>
							</select>
							<br>
						</div>
						<div class="button-section" id="bt2Disable">
							<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
						</div>
						<div class="button-section" style="display: none;" id="bt2">
							<input type="submit" name="sbmtButton" class="button" value="Siguiente"  />
						</div>
					</div>
					
					<div class="block-3" style="display:none">
						<p> <span class="step1">
						<a href="#" id="backLink2"> <img src="images/return.png"> </a>	
						Paso 3: </span>  Elige el o los sabores de tus Cupcakes:</p>
						<div class="options-steps-left">
							<input class="rdB3" type="radio" name="sabor" value="1"> Chocolate<br>
							<input class="rdB3" type="radio" name="sabor" value="2" > Vainilla <br>
							<input class="rdB3" type="radio" name="sabor" value="3" > Vainilla con chispas de chocolate<br>
							<input class="rdB3" type="radio" name="sabor" value="4" > Zanahoria <br>
						</div>
						<div class="options-steps-right">
							<input class="rdB3"  type="radio" name="sabor" value="5" > Lim&oacute;n <br>
							<input class="rdB3"  type="radio" name="sabor" value="6" > Red Velvet <br>
							<input class="rdB3"  type="radio" name="sabor" value="7" >  Chocolate fudge, el especial de la casa! <br>
							<input class="rdB3"  type="radio" name="sabor" value="8" >  Surtidos <br>
					
						</div>
						<div class="button-section" id="bt3Disable">
							<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
						</div>
						<div class="button-section" style="display: none;" id="bt3">
							<input type="submit" name="sbmtButton" class="button" value="Siguiente"  />
						</div>
					</div>
					
					<div class="block-4" style="display:none">
						<p> <span class="step1"> 
						<a href="#" id="backLink3"> <img src="images/return.png"> </a>
						Paso 4: </span>   Elige la cubierta de tus cupcakes:</p>
						<div class="options-steps-left">
							<input class="rdB4" type="radio" name="cubierta" value="1">  Crema de mantequilla tradicional del color que desees<br>
							<input class="rdB4" type="radio" name="cubierta" value="2" > Cobertura glaseada, fina capa del color que elijas<br>
							<input class="rdB4" type="radio" name="cubierta" value="3" > Crema de chocolate<br>
						</div>
						<div class="options-steps-right">	
							<input class="rdB4" type="radio" name="cubierta" value="4" > Cobertura a base de queso crema <br>
							<input class="rdB4" type="radio" name="cubierta" value="5" > Crema de Lim&oacute;n <br>
							<input class="rdB4" type="radio" name="cubierta" value="6" > Surtidos <br>
						</div>
						<div class="button-section" id="bt4Disable">
							<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
						</div>
						<div class="button-section" style="display: none;" id="bt4">
							<input type="submit" name="sbmtButton" class="button" value="Siguiente"  />
						</div>
					</div>
					
					<div class="block-5" style="display:none">
						<p> <span class="step1"> 
						<a href="#" id="backLink4"> <img src="images/return.png"> </a>
						Paso 5: </span>  Elige los colores de la cobertura:</p>
						<div class="options-steps-left">
							<input class="rdB5" type="checkbox" name="colores" value="1"> Azúl<br>
							<input class="rdB5" type="checkbox" name="colores" value="2"> Verde<br>
							<input class="rdB5" type="checkbox" name="colores" value="3"> Rosado<br>
							<input class="rdB5" type="checkbox" name="colores" value="4"> Morado <br>
							<input class="rdB5" type="checkbox" name="colores" value="5"> Rojo <br>
						</div>
						<div class="options-steps-right">
							<input class="rdB5" type="checkbox" name="colores" value="6"> Fucsia<br>
							<input class="rdB5" type="checkbox" name="colores" value="7"> Amarillo <br>
							<input class="rdB5" type="checkbox" name="colores" value="8"> Blanco <br>
							<input class="rdB5" id="surt" type="checkbox" name="colores" value="9"> Surtidos <br>
						</div>
						
						<div class="button-section" id="bt5Disable">
							<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
						</div>
						<div class="button-section" style="display: none;" id="bt5">
							<input type="submit" name="sbmtButton" class="button" value="Siguiente"  />
						</div>
					</div>
					
					<div class="block-6" style="display:none">
						<p>
						<a href="#" id="backLink5"> <img src="images/return.png"> </a>
						<span class="step6">
						Paso 6: </span>  Decora tus Cupcakes:</p>
						<div class="options-steps">
							<input class="rdB6" type="radio" name="decoracion" value="1">  Lluvia de chocolate<br>
							<input class="rdB6" type="radio" name="decoracion" value="2" > Lluvia de chocolate blanco<br>
							<input class="rdB6" type="radio" name="decoracion" value="3" > Lluvia de colores<br>
							<input class="rdB6" type="radio" name="decoracion" value="4" > Lluvia surtidas<br>
							<input class="rdB6" type="radio" name="decoracion" value="5" > Sin topping <br>
						</div>
						<div class="button-section" id="bt6Disable">
							<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
						</div>
						<div class="button-section" style="display: none;" id="bt6">
							<input type="submit" name="sbmtButton" class="button" value="Siguiente"  />
						</div>
					</div>
				<% }else{ %>
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
				<a href="./ocasionesEspeciales.jsp"><img src="./images/banner.png" alt="Image" /></a>
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