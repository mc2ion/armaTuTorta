<%@page import="domain.Client"%>
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
	<script type="text/javascript" src="/armaTuTorta/js/registro.js"></script>
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
	infoPage.setAttribute("prevPage", "registro.jsp");
	String message  = (String) request.getAttribute("message");
	String error = (String) request.getAttribute("editClient");
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
					<input type="hidden" name="clientId" value=<%= client.getId() %>>
						<div class="block1" >
							<fieldset>
								<% if (clientInfo.isCompany() == 0){ %>
									<div style="float: right; margin-right: 45px; margin-top: -25px;">
										<input type="radio" name="typePers" value="0" checked="checked"> Persona Natural
										<input type="radio" name="typePers" value="1" >  Persona Jur&iacute;dica 
									</div>
									<span class="error" id="errorType" style="float:right; margin-right:50px;">Disculpe, debe indicar si es persona jur&iacute;dica o natural</span>
									<br> 
								<% }else{ %>
									<div style="float: right; margin-right: 45px; margin-top: -25px;">
										<input type="radio" name="typePers" value="0" > Persona Natural
										<input type="radio" name="typePers" value="1" checked="checked" >  Persona Jur&iacute;dica 
									</div>
									<span class="error" id="errorType" style="float:right; margin-right:50px;">Disculpe, debe indicar si es persona jur&iacute;dica o natural</span>
									<br> 
								<% } %>
								<label for="name"  id="name">Nombres:</label>
								<input type="text" name="txtName" id="txtName" size="35" maxlength="100" 
								onBlur="validateName(this, '1');" value="<%= clientInfo.getFirstName() %>" /> 
								<span class="error" id="errorName">Disculpe, debe introducir un nombre v&aacute;lido</span>
								<br>
								<% String div="display:none";
									if (clientInfo.isCompany() == 0){ 
										div="";
									}
								%>
								<div id="apellido" style="<%= div %>" >
									<label for="name">Apellidos:</label>
									<input type="text" name="txtLastName" id="txtLastName" size="35"  maxlength="50"  
									onBlur="validateName(this, '2');" value="<%= clientInfo.getLastName() %>"/> 
									<span class="error" id="errorLastName">Disculpe, debe introducir un apellido v&aacute;lido</span><br>
								</div>
								<% if (clientInfo.isCompany() == 0){ %>
									<label for="name" id="cedIden">C&eacute;dula:</label>
								<% }else{ %>
								<label for="name" id="cedIden">RIF:</label>
								<% } %>
								<% 
									String[] ced = clientInfo.getIdentityCard().split("-");
									String pref = ced[0];
									String cedN = ced[1];
									
								%>
								<% if (clientInfo.isCompany() == 0){ %>
									<select name="txtCedId" id="txtCedId">
										<option value="V-">V</option>
										<option value="E-">E</option>
									</select>
								<% }else{ %>
									<select name="txtCedId" id="txtCedId">
										<option value="J-">J</option>
										<option value="G-">G</option>
									</select>
								<% } %>
								<input type="text" name="txtCed" id="txtCed" size="28" maxlength="50"  
								onBlur="validateCedIdnt(this);"
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
								
								<%	String style=""; 
								if (clientInfo.getOtherPhone() == null || clientInfo.getOtherPhone().equals("")){
									style = "style=\"display: none;\"";
								}
								%>
								<div class = "otherPhone" <%= style %>>
								<br>
								
									<label for="name">Tel&eacute;fono M&oacute;vil:</label>
									<input type="text" name="txtMovPhone" id="txtMovPhone" size="35" maxlength="100"
									onBlur="validatePhone(this, '2');"  value="<%= clientInfo.getOtherPhone() %>" />
									<span class="error" id="errorMovPhone" >Debe introducir un telef&oacute;no v&aacute;lido (C&oacute;d. Operador + N&uacute;mero)</span>									
								</div>

								<br>
								<label for="name">Direcci&oacute;n:</label>
								<textarea rows="4" cols="28" style="resize: none;" 
								 onBlur="validateDir(this, '1');" id="dir" 
								name="txtDir"><%= clientInfo.getAddress()%></textarea><br>
								<span class="error" id="errorDir" >Disculpe, debe introducir direcci&oacute;n v&aacute;lida</span>
								<br>
								<% if (clientInfo.isShippingAddress() == 1){%>
									<input type="checkbox" value="remember" checked id="checkDir" name="checkDir"/> ¿Es su dirección de env&iacute;o? <br>
								<% }else { %>
									<input type="checkbox" value="remember" id="checkDir" name="checkDir"/> ¿Es su dirección de env&iacute;o? <br>
								<% } %>
								
								<%	style=""; 
									if (clientInfo.isShippingAddress() == 1){
										style = "style=\"display: none;\"";
									}
								%>
									<div class="otherDir" <%= style %>>
											<label for="name">Direcci&oacute;n de Env&iacute;o:</label>
											<textarea rows="4" cols="28" style="resize: none;" 
											onBlur="validateDir(this, '2');" id="dirEnv" name="txtDirEnv"><%= clientInfo.getShippingAddress() %></textarea><br>
											<span class="error" id="errorDirEnv" >Disculpe, debe introducir direcci&oacute;n de env&iacute;o v&aacute;lida</span>
									</div>
								</fieldset>
								<div class="reg-button">
										<input type="submit" name="sbmtButton" class="button" value="Guardar"   />
								</div>
							</div>
							
							</form>
							
							<div class="block3" style="display:none" >
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
									<span class="error" id="errorPassOld" >Debe introducir su contraseña anterior </span>
									<br>
									<label for="name">Contraseña nueva:</label>
									<input type="password" name="txtNewPass" id="txtNewPass" size="35" maxlength="100" 
									 onBlur="validatePassNew(this);" />
									<span class="error" id="errorPassNew" >Disculpe, debe introducir una nueva contraseña</span>
									<br>
								
									<label for="name">Repetir contraseña:</label>
									<input type="password" name="txtNewPassRpt" id="txtNewPassRpt" size="35" maxlength="100" 
									oninput="validatePassRptNew(this);" onBlur="validatePassRptNew(this);" />
									<span class="error" id="errorPassRpt" >Disculpe, las contraseñas deben coincidir</span>
									<br>
									
								</fieldset>
								<div class="reg-button">
										<input type="submit" name="sbmtButton" class="button" value="Cambiar"   />
								</div>
								</form>	
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