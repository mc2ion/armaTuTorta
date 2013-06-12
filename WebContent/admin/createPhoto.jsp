<%@page import="domain.Photo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="../css/styleAdmin.css" />
	<link rel="shortcut icon" href="../images/ico.ico">
	<script type="text/javascript" src="../js/messages.js"></script>
<title>Crear Foto</title>
<script language=JavaScript> 
	<!-- 
	
	function inhabilitar(){ 
	   	return false;
	} 
	
	document.oncontextmenu=inhabilitar;
	
	// --> 
	</script>
</head>
<body oncontextmenu="return inhabilitar()">
	<div id="container">
		<div id="header">
        	<img alt="logo" src="../images/loguito5.png"/>
        </div>           
        <div id="menu">
			<div class="menuitemHome"><a href="/servlet/servlet.UserLoginServlet">Home</a></div>	
			<ul>      
			<li class="menuitem"><a href="/servlet/servlet.ListAlbumsServlet">Ver �lbumes</a></li>
            <li class="menuitem"><a href="/servlet/servlet.ListPhotosServlet?albumId=<%= request.getAttribute("albumId") %>">Ver Fotos</a></li>
			</ul>
			<div class="menuitemPass"><a href="/servlet/servlet.EditUserPasswordServlet">Cambiar Contrase�a</a></div>
			 <div class="menuitemSalir"><a href="../admin/index.jsp">Salir</a></div>	
        </div>       
	  <div id="leftmenu">
        	<div id="leftmenu_top"></div>
			<div id="leftmenu_main">                    
                <jsp:include page="../inc/adminMenu.jsp"></jsp:include>
			</div>
            <div id="leftmenu_bottom"></div>
        </div>  
		<div id="content">
				<h2>Agregar Foto:</h2>
	        	<p>&nbsp;</p>
           		<p>&nbsp;</p>
				<form name="/servlet/servlet.CreatePhotoServlet?albumId=<%= request.getAttribute("albumId") %>" onsubmit="return validateCreatePhoto(this)" method="post" enctype="multipart/form-data">
					<input type="hidden" name="txtAlbumId" value="<%= request.getAttribute("albumId") %>" />
					<fieldset>
						<label for="name">Nombre:</label>
						<input type="text" name="txtName" id="txtName" maxlength="50" size="40" /> <br><br>
						<label for="image">Imagen: (M�x. 200kb)</label>
						<input type="file" name="txtImage" id="txtImage" maxlength="50" lang="es" /> <br><br>
						<input type="checkbox" name="txtIsActive" class="check" id="txtIsActive" maxlength="50" size="40" value="isActive" />&nbsp; 
							&nbsp;&nbsp; Activo <br>
						<input type="checkbox" name="txtIsNew" class="check" id="txtIsNew" maxlength="50" size="40" value="isNew" />&nbsp; 
							&nbsp;&nbsp; Marcar como Nuevo <br><br>
						
					<%
					String error = (String) request.getAttribute("error");
					if (error != null){
					%>
						<div class="error-msg">
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