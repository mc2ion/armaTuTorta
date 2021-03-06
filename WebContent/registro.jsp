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
	session.setAttribute("prevPage", "registro.jsp");
	
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
				<li><a href="/armaTuTorta/GalleryServlet">Galer�a</a></li>
				<li><a href="/armaTuTorta/ContactServlet">Contacto</a></li>
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
					<form class="formReg" name="regForm" action="/armaTuTorta/RegisterServlet" method="post" onsubmit="return validateRegCont();" >
						<div class="block1" >
							<fieldset>
								<div class="radioPersonas">
									<input type="radio" name="typePers" value="0"> Persona Natural
									<input type="radio" name="typePers" value="1" > Persona Jur&iacute;dica 
								</div>
								<span class="error" id="errorType" style="float:right; margin-right:50px;">Disculpe, debe indicar si es persona jur&iacute;dica o natural</span>
								<br> 
								<label for="name" id="name">Nombres:</label>
								<input type="text" name="txtName" id="txtName" size="35" maxlength="100" 
								onBlur="validateName(this, '1');" /> 
								<span class="error" id="errorName">Disculpe, debe introducir un nombre v&aacute;lido</span>
								<br>
								<div id="apellido">
									<label for="name">Apellidos:</label>
									<input type="text" name="txtLastName" id="txtLastName" size="35"  maxlength="50"  
									onBlur="validateName(this, '2');"/> 
									<span class="error" id="errorLastName">Disculpe, debe introducir un apellido v&aacute;lido</span><br>
								</div>
								<label for="name" id="cedIden">C&eacute;dula:</label>
								<select name="txtCedId" id="txtCedId">
									<option value="V-">V</option>
									<option value="E-">E</option>
								</select>
								<input type="text" name="txtCed" id="txtCed" size="28" maxlength="50"  
								onBlur="validateField(this);" style="display: inline;" /><br>
								<span class="error" id="errorRif">Disculpe, debe introducir un n&uacute;mero de Rif v&aacute;lido</span>
								<span class="error" id="errorCed">Disculpe, debe introducir un n&uacute;mero de c&eacute;dula v&aacute;lido</span>
								<br>
								<label for="name">Email:</label>
								<input type="text" name="txtEmail" id="txtEmail" size="35" maxlength="50"
								 onBlur="validateEmail(this);" /> 
								<span class="error" id="errorEmail" >Disculpe, debe introducir un correo electr&oacute;nico v&aacute;lido</span><br>
								<label for="name">Contrase&ntilde;a:</label>
								<input type="password" name="txtPass" id="txtPass" size="35" maxlength="50"
								onBlur="validatePass(this);" /> 
								<span class="error" id="errorPass" >Disculpe, su contrase&ntilde;a debe ser mayor de 6 caracteres</span>
								<br>
								<label for="name">Repetir Contrase&ntilde;a:</label>
								<input type="password" name="txtRptPass" id="txtRptPass" size="35" maxlength="50"
								oninput="validateRptPass(this);" onBlur="validateRptPass(this);" /> 
								<span class="error" id="errorRptPass" >Disculpe, las contrase&ntilde;as deben coincidir</span>
								
							</fieldset>
							<div class="reg-button">
									<input type="button" name="sbmtButton" class="button" value="Siguiente" onClick="Siguiente();"  />
							</div>
						</div>
						
						<div class="block2" style="display:none" >
							<br><br><fieldset>
								<label for="name">Telef&oacute;no Local:</label>
								<input type="text" name="txtPhone" id="txtPhone" size="35" maxlength="100"
								 onBlur="validatePhone(this, '1');" />
								<img src="/armaTuTorta/images/mas.png" width="20" height="20" class="imgPlus" 
									onClick = "agregarOtro();" >
								<span class="error" id="errorPhone" >Debe introducir un telef&oacute;no v&aacute;lido (C&oacute;d. &Aacute;rea + N&uacute;mero) </span>
								
								<div class = "otherPhone" style="display: none;">
								<br>
									<label for="name">Tel&eacute;fono M&oacute;vil:</label>
									<input type="text" name="txtMovPhone" id="txtMovPhone" size="35" maxlength="100"
									onBlur="validatePhone(this, '2');"  />
									<span class="error" id="errorMovPhone" >Debe introducir un telef&oacute;no v&aacute;lido (C&oacute;d. Operador + N&uacute;mero)</span>									
								</div>

								<br>
								<label for="name">Direcci&oacute;n:</label>
								<textarea rows="4" cols="28" style="resize: none;" 
								onBlur="validateDir(this, '1');" id="dir" name="txtDir"></textarea><br>
								<span class="error" id="errorDir" >Disculpe, debe introducir direcci&oacute;n v&aacute;lida</span>
								<br>
								<input type="checkbox" value="remember" checked id="checkDir" name="checkDir"/> �Es su direcci�n de env&iacute;o? <br>
								
								<div class="otherDir" style="display: none;">
									<label for="name">Direcci&oacute;n de Env&iacute;o:</label>
									<textarea rows="4" cols="28" style="resize: none;" 
									onBlur="validateDir(this, '2');" id="dirEnv" name="txtDirEnv"></textarea><br>
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
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="ventanas.jsp"></jsp:include>
</body>
</html>