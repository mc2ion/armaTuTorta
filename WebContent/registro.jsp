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
<div class="wrapper">
	<div id="header">
		<div>
			<div>
				<div id="logo">
					<a href="index.html"><img src="/armaTuTorta/images/logo5.png" alt="Logo"/></a>
				</div>
				<div>
					<div>
						<a href="#signup"  rel="leanModal" id="go" class="pestana">Ingresar</a>
						<a href="/armaTuTorta/registro.jsp" class="pestana_select">Registrarse</a>
					</div>
				</div>
			</div>
			<ul style="margin: 0px; ">
				<li><a href="/armaTuTorta/index.jsp">Inicio</a></li>
				<li><a href="/armaTuTorta/creaTuTorta.jsp">Arma Tu Torta</a></li>
				<li><a href="/armaTuTorta/dulcesTortas.jsp">Dulces Tortas</a></li>
				<li><a href="/armaTuTorta/cupcakes.jsp">Cupcakes</a></li>
				<li><a href="/armaTuTorta/ocasionesEspeciales.jsp">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/galeria.jsp">Galería</a></li>
				<li><a href="/armaTuTorta/contacto.jsp">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="home">
				<div class="datos">
					<div class="separator-current" id="infPers">
						<a href="#" onClick="Back();">Informaci&oacute;n Personal</a>
					</div>
					<div class="separator" id="infEnv">
						<a href="#" onClick="Siguiente();">Datos de Env&iacute;o</a>
					</div>
				</div>
				<div class="registration">
					<span class="regis-title">Registro </span><br>
					<form name="regForm" action="/armaTuTorta/RegisterServlet" method="post" onsubmit="return validateRegCont();" >
						<div class="block1" >
							<fieldset>
								<label for="name">Nombres:</label>
								<input type="text" name="txtName" id="txtName" size="35" maxlength="100" onBlur="validateName(this, '1');" /> 
								<span class="error" id="errorName">Disculpe, debe introducir un nombre v&aacute;lido</span>
								<br>
								<label for="name">Apellidos:</label>
								<input type="text" name="txtLastName" id="txtLastName" size="35"  maxlength="50"  onBlur="validateName(this, '2');"/> 
								<span class="error" id="errorLastName">Disculpe, debe introducir un apellido v&aacute;lido</span>
								<br>
								<label for="name">C&eacute;dula:</label>
								<select name="txtCedId" id="txtCedId">
									<option value="V-">V</option>
									<option value="E-">E</option>
								</select>
								<input type="text" name="txtCed" id="txtCed" size="28" maxlength="50"  onBlur="validateCedIdnt(this);" style="display: inline;" /><br>
								 
								<span class="error" id="errorCed">Disculpe, debe introducir un n&uacute;mero de c&eacute;dula v&aacute;lido</span>
								<br><br>
								<label for="name">Email:</label>
								<input type="text" name="txtEmail" id="txtEmail" size="35" maxlength="50" onBlur="validateEmail(this);" /> 
								<span class="error" id="errorEmail" >Disculpe, debe introducir un correo electr&oacute;nico v&aacute;lido</span>
								<br>
								<label for="name">Contrase&ntilde;a:</label>
								<input type="password" name="txtPass" id="txtPass" size="35" maxlength="50" onBlur="validatePass(this);" /> 
								<span class="error" id="errorPass" >Disculpe, su contrase&ntilde;a debe ser mayor de 6 caracteres</span>
								<br>
								<label for="name">Repetir Contrase&ntilde;a:</label>
								<input type="password" name="txtRptPass" id="txtRptPass" size="35" maxlength="50" onBlur="validateRptPass(this);" /> 
								<span class="error" id="errorRptPass" >Disculpe, las contrase&ntilde;as deben coincidir</span>
								
							</fieldset>
							<div class="reg-button">
									<input type="button" name="sbmtButton" class="button" value="Siguiente" onClick="Siguiente();"  />
							</div>
						</div>
						
						<div class="block2" style="display:none" >
							<fieldset>
								<label for="name">Telef&oacute;no Local:</label>
								<input type="text" name="txtPhone" id="txtPhone" size="35" maxlength="100" onBlur="validatePhone(this, '1');" />
								<img src="/armaTuTorta/images/mas.png" width="20" height="20" class="imgPlus" 
									onClick = "agregarOtro();" >
								<span class="error" id="errorPhone" >Debe introducir un telef&oacute;no v&aacute;lido (C&oacute;d. &Aacute;rea + N&uacute;mero) </span>
								
								<div class = "otherPhone" style="display: none;">
								<br>
									<label for="name">Tel&eacute;fono M&oacute;vil:</label>
									<input type="text" name="txtMovPhone" id="txtMovPhone" size="35" maxlength="100" onBlur="validatePhone(this, '2');" 
									onBlur="validateRptPass(this);" />
									<span class="error" id="errorMovPhone" >Debe introducir un telef&oacute;no v&aacute;lido (C&oacute;d. Operador + N&uacute;mero)</span>									
								</div>

								<br>
								<label for="name">Direcci&oacute;n:</label>
								<textarea rows="4" cols="28" style="resize: none;" onBlur="validateDir(this, '1');" id="dir" name="txtDir"></textarea><br>
								<span class="error" id="errorDir" >Disculpe, debe introducir direcci&oacute;n v&aacute;lida</span>
								<br>
								<input type="checkbox" value="remember" checked id="checkDir" name="checkDir"/> ¿Es su dirección de env&iacute;o? <br>
								
								<div class="otherDir" style="display: none;">
									<label for="name">Direcci&oacute;n de Env&iacute;o:</label>
									<textarea rows="4" cols="28" style="resize: none;" onBlur="validateDir(this, '2');" id="dirEnv" name="txtDirEnv"></textarea><br>
									<span class="error" id="errorDirEnv" >Disculpe, debe introducir direcci&oacute;n de env&iacute;o v&aacute;lida</span>
								</div>
							</fieldset>
							<div class="reg-button">
									<input type="submit" name="sbmtButton" class="button" value="Siguiente"   />
							</div>
						</div>
						
					</form>
					
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