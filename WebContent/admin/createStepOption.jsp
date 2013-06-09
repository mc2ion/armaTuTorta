<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/styleAdmin.css" />
	<link rel="shortcut icon" href="/armaTuTorta/images/ico.ico">
	<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>
<title>Crear Opción</title>
</head>
<body>
	<div id="container">
		<div id="header">
        	<img alt="logo" src="/armaTuTorta/images/loguito5.png"/>
        </div>           
        <div id="menu">
			<div class="menuitemHome"><a href="UserLoginServlet">Home</a></div>	
			<ul>      
			<li class="menuitem"><a href="ListOrderStepsServlet?typeId=<%= request.getAttribute("typeId") %>">Ver Pasos</a></li>      
			<li class="menuitem"><a href="ListStepOptionsServlet?typeId=<%= request.getAttribute("typeId") %>&stepId=<%= request.getAttribute("stepId") %>">Ver Opciones</a></li>
			</ul>
			<div class="menuitemPass"><a href="EditUserPasswordServlet">Cambiar Contraseña</a></div>
			 <div class="menuitemSalir"><a href="admin/index.jsp">Salir</a></div>	
        </div>       
	  <div id="leftmenu">
        	<div id="leftmenu_top"></div>
			<div id="leftmenu_main">                    
                <jsp:include page="/inc/adminMenu.jsp"></jsp:include>
			</div>
            <div id="leftmenu_bottom"></div>
        </div>  
		<div id="content">
				<h2>Agregar Opción:</h2>
	        	<p>&nbsp;</p>
           		<p>&nbsp;</p>
				<form name="form" action="/armaTuTorta/CreateStepOptionServlet" onsubmit="return validateCreateOption(this)" method="post">
					<input type="hidden" name="txtTypeId" value="<%= request.getAttribute("typeId") %>" />
					<input type="hidden" name="txtStepId" value="<%= request.getAttribute("stepId") %>" />
					<fieldset>
						<label for="name">Posición:</label>
						<input type="number" min="1" name="txtPosition" id="txtPosition" maxlength="3" size="3" value="<%= request.getAttribute("position") %>" /> <br><br>
						<label for="name">Nombre:</label>
						<textarea name="txtName" id="txtName" rows="2" cols="50"></textarea> <br><br>
						<label for="name">Descripción:</label>
						<textarea name="txtDescription" id="txtDescription" rows="3" cols="50"></textarea> <br><br>
						<label for="name">Precio:</label>
						<input type="text" name="txtPrice" id="txtPrice" maxlength="5" size="5" /> <br><br>
						<input type="checkbox" name="txtIsUnavailable" class="check" id="txtIsUnavailable" maxlength="50" size="40" value="isUnavailable" />&nbsp; 
							&nbsp;&nbsp; Está Agotado<br><br>
						
					<%
					String error = (String) request.getAttribute("error");
					if (error != null){
					%>
						<div>
							<%= error %>
						</div>
						<%
					}
					%>	
					<br>
					<div style="text-align:center">
							<input type="button" class="button" value="Volver"  onClick="javascript:history.back();"/>
							<input type="submit"  class="button"  name="sbmtButton" value="Agregar" style="margin-left:20px;" />
					</div>	
					</fieldset>			
			</form>
		    <div id="footer"></div>
		</div>
	</div>
</body>
</html>