<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="../css/styleAdmin.css" />
	<link rel="shortcut icon" href="../images/ico.ico">
	<script type="text/javascript" language="javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../js/messages.js"></script>
	<title>Modificar Contrase�a</title>	
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
        		<h2>Modificar mi contrase�a:</h2>
           		<%
        			String info = (String)request.getAttribute("info");
        			String error = (String)request.getAttribute("error");
        			
					if(info!=null && !info.equalsIgnoreCase("")){
				%>	
				<p>&nbsp;</p> 
				<p class="info-msg"><%= info %></p> 
				<%	
					}
					if(error!=null && !error.equalsIgnoreCase("")){
				%>	
           		<p>&nbsp;</p>    
				<p class="error-msg"><%= error %></p>      
           		<%	
					}
				%>	
				<br>
				<form action="/servlet/servlet.EditUserPasswordServlet" onsubmit="return validatePassword(this)" method="post">
				<input type="hidden" name="txtUserId" value="<%= request.getAttribute("userId") %>" />				
				<fieldset>
						<label for="oldPassword">Contrase�a anterior:</label>
						<input type="password" name="txtOldPassword" id="txtOldPassword" maxlength="50"  /><br><br>
						<label for="LastName">Contrase�a nueva:</label>
						<input type="password" name="txtPassword" id="txtPassword" maxlength="50"  /><br><br>
						<label for="LastName">Repita contrase�a:</label>
						<input type="password" name="txtPasswordRpt" id="txtPasswordRpt" maxlength="50" /><br><br>
					
					<br><br><br><br><br>
					<div style="text-align:center">
							<input type="button" class="button" value="Volver"  onClick="javascript:history.back();"/>
							<input type="submit"  class="button"  name="sbmtButton" value="Editar" style="margin-left:20px;" />
					</div>	
				</fieldset>
				</form>
		    <div id="footer"></div>
		</div>
	</div>
</body>
</html>