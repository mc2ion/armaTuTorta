<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/styleAdmin.css" />
	<link rel="shortcut icon" href="/armaTuTorta/images/ico.ico">
	<title>Men� Principal</title>
</head>
<body>
	<div id="container">
		<div id="header">
            <img alt="logo" src="/armaTuTorta/images/loguito5.png"/>
        </div>  
        <div id="menu">
			<div class="menuitemHome"><a href="UserLoginServlet">Home</a></div>
			<div class="menuitemPass"><a href="EditUserPasswordServlet">Cambiar Contrase�a</a></div>	
			<div class="menuitemSalir"><a href="admin/index.jsp">Salir</a></div>	
        </div>   	
        <div id="leftmenu">
        	<div id="leftmenu_top"></div>
			<div id="leftmenu_main">                   
                <jsp:include page="../inc/adminMenu.jsp"></jsp:include>
			</div> 
          	<div id="leftmenu_bottom"></div>
        </div>         
		<div id="content">  
	        	<h2>Bienvenido al administrador de contenidos de Arma Tu Torta </h2>
	        	<p>&nbsp;</p>
	           	<p>&nbsp;</p>
	       	  	<h3>Men� Superior</h3>
	        	<p>En el men� superior encontrar�s los enlaces para dirigirte al Home o salir del sistema; as� como tambi�n las opciones propias de cada secci�n (del men� lateral izquierdo).</p>
	        	<p>&nbsp;</p>
	        	<h3>Men� Lateral Izquierdo</h3>
	            <p>En el men� lateral izquierdo encontrar�s las diversas �reas de Arma Tu Torta que tu usuario puede administrar. Ingresa al �rea de tu inter�s y realiza los ajustes que desees desde cualquier lugar gracias a las ventajas de la web.</p>
	            <p>&nbsp;</p>
		   <div id="footer"></div>
      	</div>
   </div>	
</body>
</html>