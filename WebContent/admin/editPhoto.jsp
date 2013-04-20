<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/styleAdmin.css" />
	<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>
	<title>Editar Foto</title>
</head>
<body>
	<div id="container">
		<div id="header">
        	<img alt="logo" src="/armaTuTorta/images/loguito5.png"/>
        </div>           
        <div id="menu">
        	<div class="menuitemHome"><a href="UserLoginServlet">Home</a></div>	
	  		<ul>
           		<li class="menuitem"><a href="ListAlbumsServlet">Ver Álbumes</a></li>
            	<li class="menuitem"><a href="ListPhotosServlet?albumId=<%= request.getAttribute("albumId") %>">Ver Fotos</a></li>
           		<li class="menuitem"><a href="CreatePhotoServlet?albumId=<%= request.getAttribute("albumId") %>">Agregar Foto</a></li>
            </ul>
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
        		<h2>Editar Foto:</h2>
	        	<p>&nbsp;</p>
           		<p>&nbsp;</p>
				<form action="/armaTuTorta/EditPhotoServlet" onsubmit="return validateEditPhoto(this)" method="post" enctype="multipart/form-data">
				<jsp:useBean id="photoInfo" type="domain.Photo" scope="request"/> 
				<input type="hidden" name="txtPhotoId" value="<%= photoInfo.getId() %>" />
				<input type="hidden" name="txtAlbumId" value="<%= request.getAttribute("albumId") %>" />
				<input type="hidden" name="txtCurrentImage" value="<%= photoInfo.getImage() %>" />
				<fieldset>
					<label for="name">Nombre:</label>
					<input type="text" name="txtName" id="txtName" maxlength="50" size="40" value="<%= photoInfo.getName() %>"/> <br><br>
					<label for="image">Imagen:</label>
					<input type="file" name="txtImage" id="txtImage" maxlength="50" lang="es"/> <br>	
					 <%= photoInfo.getImage() %><br><br>				
					<%
					if (photoInfo.isActive() == 1){
					%>
						<input type="checkbox" name="txtIsActive" class="check" id="txtIsActive" maxlength="50" size="40" value="isActive" checked />&nbsp; 
						&nbsp;&nbsp; Activo <br>
					<%
					}else{
					%>
						<input type="checkbox" name="txtIsActive" class="check" id="txtIsActive" maxlength="50" size="40" value="isActive" />&nbsp; 
						&nbsp;&nbsp; Activo <br>
					<%
					}
					if (photoInfo.isNew() == 1){
					%>
						<input type="checkbox" name="txtIsNew" class="check" id="txtIsNew" maxlength="50" size="40" value="isNew" checked />&nbsp; 
						&nbsp;&nbsp; Marcar como Nuevo <br><br>
					<%
					}else{
					%>
						<input type="checkbox" name="txtIsNew" class="check" id="txtIsNew" maxlength="50" size="40" value="isNew" />&nbsp; 
						&nbsp;&nbsp; Marcar como Nuevo <br><br>
					<%
					}
					String error = (String) request.getAttribute("error");

					if (error != null){
					%>
					<div>
						<%= error %>
					</div>
					<%
					}
					%><br>
					<div class="buttonCenter">
						<input type="button" class="button" value="Volver"  onClick="javascript:history.back();"/>
						<input type="submit" name="sbmtButton" class="button" value="Aceptar" style="margin-left:20px;" />
					</div>
				 </fieldset>
				</form>
		    <div id="footer"></div>
		</div>
	</div>
</body>
</html>