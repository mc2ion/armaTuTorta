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
	<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>

</head>
<body>
<%
	HttpSession infoPage = request.getSession();
	infoPage.setAttribute("prevPage", "registro.jsp");
	String message  = (String) request.getAttribute("message");
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
				<li><a href="/armaTuTorta/index.jsp">Inicio</a></li>
				<li><a href="/armaTuTorta/creaTuTorta.jsp">Arma Tu Torta</a></li>
				<li><a href="/armaTuTorta/dulcesTortas.jsp">Dulces Tortas</a></li>
				<li><a href="/armaTuTorta/cupcakes.jsp">Cupcakes</a></li>
				<li><a href="/armaTuTorta/ocasionesEspeciales.jsp">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/galeria.jsp">Galer�a</a></li>
				<li><a href="/armaTuTorta/contacto.jsp">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="home">
				<div class="datos">
					<% if (message == null || message == ""){ %>
					<div class="separator-current" id="infPers">
						<a href="#" onClick="BackAux();">Informaci&oacute;n Personal</a>
					</div>
					<div class="separator" id="infPass">
						<a href="#" onClick="SiguienteAuxC();">Cambiar Contrase&ntilde;a</a>
					</div>
					<% }else{  %>
						<script>
							$(function(){
								$('#passId').click();
							});
						</script>
					<div class="separator" id="infPers">
						<a href="#" onClick="BackAux();">Informaci&oacute;n Personal</a>
					</div>
					<div class="separator-current" id="infPass">
						<a href="#" onClick="SiguienteAuxC();" id="passId">Cambiar Contrase&ntilde;a</a>
					</div>
					<% }  %>
				</div>
				<div class="registration">
				<jsp:useBean id="clientInfo" type="domain.Client" scope="request"/> 
					<span class="regis-title">Editar Datos</span><br>
					<form name="regForm" action="/armaTuTorta/ClientAccountServlet" method="post" onsubmit="return validateRegCont();" >
						<div class="block1" >
							<fieldset>
								<% if (clientInfo.isCompany() == 0){ %>
									<div style="float: right; margin-right: 45px; margin-top: -25px;">
										<input type="radio" name="typePers" value="0" checked="checked"> Persona Natural
										<input type="radio" name="typePers" value="1" >  Persona Jur&iacute;dica 
									</div><br> 
								<% }else{ %>
									<div style="float: right; margin-right: 45px; margin-top: -25px;">
										<input type="radio" name="typePers" value="0" > Persona Natural
										<input type="radio" name="typePers" value="1" checked="checked" >  Persona Jur&iacute;dica 
									</div><br> 
								<% } %>
								<label for="name">Nombres:</label>
								<input type="text" name="txtName" id="txtName" size="35" maxlength="100" 
									onBlur="validateName(this, '1');" value="<%= clientInfo.getFirstName() %>" /> 
								<span class="error" id="errorName">Disculpe, debe introducir un nombre v&aacute;lido</span>
								<br>
								<label for="name">Apellidos:</label>
								<input type="text" name="txtLastName" id="txtLastName" size="35"  maxlength="50" 
								 onBlur="validateName(this, '2');" value="<%= clientInfo.getLastName() %>"/> 
								<span class="error" id="errorLastName">Disculpe, debe introducir un apellido v&aacute;lido</span>
								<br>
								<label for="name">C&eacute;dula:</label>
								<% 
									String[] ced = clientInfo.getIdentityCard().split("-");
									String pref = ced[0];
									String cedN = ced[1];
									
								%>
								<select name="txtCedId" id="txtCedId">
									<option value="V-">V</option>
									<option value="E-">E</option>
								</select>
								<input type="text" name="txtCed" id="txtCed" size="28" maxlength="50"  onBlur="validateCedIdnt(this);"
								style="display: inline;" value="<%=  cedN %>" /><br>
								 
								<span class="error" id="errorCed">Disculpe, debe introducir un n&uacute;mero de c&eacute;dula v&aacute;lido</span>
								<br>
								<label for="name">Email:</label>
								<input type="text" name="txtEmail" id="txtEmail" size="35" maxlength="50" 
								onBlur="validateEmail(this);" value="<%= clientInfo.getEmail() %>" /> 
								<span class="error" id="errorEmail" >Disculpe, debe introducir un correo electr&oacute;nico v&aacute;lido</span>
								<br>
							</fieldset>
							<div class="reg-button">
									<input type="button" name="sbmtButton" class="button" value="Siguiente" onClick="SiguienteAux();"  />
							</div>
						</div>
						
						<div class="block2" style="display:none" >
							<fieldset>
								<label for="name">Telef&oacute;no Local:</label>
								<input type="text" name="txtPhone" id="txtPhone" size="35" maxlength="100" 
								onBlur="validatePhone(this, '1');" value="<%= clientInfo.getPhone() %>"/>
								<% if (clientInfo.getOtherPhone() == null || clientInfo.getOtherPhone().equals("")) { %>
									<img src="/armaTuTorta/images/mas.png" width="20" height="20" class="imgPlus" 
										onClick = "agregarOtro();" >
								<% } %>
									
								<span class="error" id="errorPhone" >Debe introducir un telef&oacute;no v&aacute;lido (C&oacute;d. &Aacute;rea + N&uacute;mero) </span>
								
								<% 
								if (clientInfo.getOtherPhone() != null && !clientInfo.getOtherPhone().equals("")) { %>
								<div class = "otherPhone" >
								<% }else{ %>
								<div class = "otherPhone" style="display: none;">
								<% } %>
								<br>
								
									<label for="name">Tel&eacute;fono M&oacute;vil:</label>
									<input type="text" name="txtMovPhone" id="txtMovPhone" size="35" maxlength="100"
									 onBlur="validatePhone(this, '2');"  value="<%= clientInfo.getOtherPhone() %>" />
									<span class="error" id="errorMovPhone" >Debe introducir un telef&oacute;no v&aacute;lido (C&oacute;d. Operador + N&uacute;mero)</span>									
								</div>

								<br>
								<label for="name">Direcci&oacute;n:</label>
								<textarea rows="4" cols="28" style="resize: none;" onBlur="validateDir(this, '1');" id="dir" 
								name="txtDir"><%= clientInfo.getAddress()%></textarea><br>
								<span class="error" id="errorDir" >Disculpe, debe introducir direcci&oacute;n v&aacute;lida</span>
								<br>
								<% if (clientInfo.isShippingAddress() == 0){%>
									<input type="checkbox" value="remember" checked id="checkDir" name="checkDir"/> �Es su direcci�n de env&iacute;o? <br>
								<% }else { %>
									<input type="checkbox" value="remember" id="checkDir" name="checkDir"/> �Es su direcci�n de env&iacute;o? <br>
								<% } %>
								
								<% if (clientInfo.isShippingAddress() == 0){%>
										<div class="otherDir" style="display: none;">
								<% }else { %>
										<div class="otherDir" >
								<% } %>
										
											<label for="name">Direcci&oacute;n de Env&iacute;o:</label>
											<textarea rows="4" cols="28" style="resize: none;" 
											onBlur="validateDir(this, '2');" id="dirEnv" name="txtDirEnv"><%= clientInfo.getShippingAddress() %></textarea><br>
											<span class="error" id="errorDirEnv" >Disculpe, debe introducir direcci&oacute;n de env&iacute;o v&aacute;lida</span>
									</div>
								</fieldset>
								<div class="reg-button">
										<input type="submit" name="sbmtButton" class="button" value="Siguiente"   />
								</div>
							</div>
							
							</form>
							
							<div class="block3" style="display:none" >
								<% if (message == null || message == ""){ %>
								<form name="passForm" action="/armaTuTorta/ChangePasswordServlet" method="post" onsubmit="return validatePassCont();" >
								<% 
									infoPage.setAttribute("clientAux", clientInfo); 
								%>
								<input type="hidden" name="email" value ="<%= clientInfo.getEmail() %>" /> 
								<br>
								<fieldset>
									<label for="name">Contrase&ntilde;a Anterior:</label>
									<input type="password" name="txtOldPass" id="txtOldPass" size="35" maxlength="100" 
									onBlur="validatePassAux(this);" />
									<span class="error" id="errorPassOld" >Debe introducir su contrase�a anterior </span>
									<br>
									<label for="name">Contrase�a nueva:</label>
									<input type="password" name="txtNewPass" id="txtNewPass" size="35" maxlength="100" 
									onBlur="validatePassNew(this);" />
									<span class="error" id="errorPassNew" >Disculpe, debe introducir una nueva contrase�a</span>
									<br>
								
									<label for="name">Repetir contrase�a:</label>
									<input type="password" name="txtNewPassRpt" id="txtNewPassRpt" size="35" maxlength="100" 
									onBlur="validatePassRptNew(this);" />
									<span class="error" id="errorPassRpt" >Disculpe, las contrase�as deben coincidir</span>
									<br>
									
								</fieldset>
								<div class="reg-button">
										<input type="submit" name="sbmtButton" class="button" value="Aceptar"   />
								</div>
								</form>	
								<% }else{ %>
									<H2> &iexcl;La contrase&ntilde;a fue cambiada exitosamente!</H2>
									<% request.setAttribute("message", ""); %>
								<% } %>
							</div>
							
							
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