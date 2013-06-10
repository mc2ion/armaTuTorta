<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/styleAdmin.css" />
	<link rel="shortcut icon" href="/armaTuTorta/images/ico.ico">
	<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>
	<title>Detalle Presupuesto</title>
	<script language="javascript">
	/*****************************************************************************
	Pop-up ajustada a foto. Script creado por Tunait!
	Si quieres usar este script en tu sitio eres libre de hacerlo con la condici�n de que permanezcan intactas estas l�neas, osea, los cr�ditos.
	No autorizo a publicar y ofrecer el c�digo en sitios de script sin previa autorizaci�n
	Si quieres publicarlo, por favor, contacta conmigo.
	http://javascript.tunait.com/
	tunait@yahoo.com 
	******************************************************************************/
	
	var titulopordefecto = "Imagen Referencia"; //Si no se especifica un t�tulo al llamar a la funci�n colocar� el que se especifique aqu�
	var ventana;
	var cont=0;
	
	function afoto(cual,titulo){
		if(cont==1){ventana.close();ventana=null;}
		if(titulo==null){titulo=titulopordefecto;}
		ventana=window.open('','ventana','resizable=yes,scrollbars=no');
		ventana.document.write('<html><head><title>' + titulo + '</title></head><body style="overflow:hidden" marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" scroll="no" onUnload="opener.cont=0"><img src="' + cual + '" onLoad="opener.redimensionar(this.width, this.height)">');
		ventana.document.close();
		cont++;
	}
	function redimensionar(ancho, alto){
		ventana.resizeTo(ancho+12,alto+28);
		ventana.moveTo((screen.width-ancho)/2,(screen.height-alto)/2); //centra la ventana. Eliminar si no se quiere centrar el popup
	}
	</script>
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
        	<img alt="logo" src="/armaTuTorta/images/loguito5.png"/>
        </div>           
        <div id="menu">
        	<div class="menuitemHome"><a href="UserLoginServlet">Home</a></div>	
	  		<ul>
           		<li class="menuitem"><a href="ListEstimationsServlet">Ver Presupuestos</a></li>
            </ul>
			<div class="menuitemPass"><a href="EditUserPasswordServlet">Cambiar Contrase�a</a></div>
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
        		<h2>Detalle Presupuesto:</h2>
        		<p>&nbsp;</p> 
				<jsp:useBean id="estimationInfo" type="domain.Estimation" scope="request"/> 
				<input type="hidden" name="txtEstimationId" value="<%= request.getAttribute("estimationId") %>" />
				<h3>Datos Cliente:</h3>
				<fieldset>
					<label for="name" class="etiq"><span id="idCard"><%= estimationInfo.getClient().getIdentityCard() %></span></label><br>
					<label for="name" class="etiq"><span id="idCard"><%= estimationInfo.getClient().getFirstName() + " " + estimationInfo.getClient().getLastName() %></span></label><br>					
					<label for="name" class="etiq"><span id="idCard">Correo Electr�nico: </span></label><%= estimationInfo.getClient().getEmail() %><br>
					<label for="name" class="etiq"><span id="idCard">Tel�fono: </span></label><%= (estimationInfo.getClient().getOtherPhone()==null || estimationInfo.getClient().getOtherPhone().equalsIgnoreCase(""))? estimationInfo.getClient().getPhone(): estimationInfo.getClient().getPhone() + " / "+estimationInfo.getClient().getOtherPhone() %><br>
					<label for="name" class="etiq"><span id="idCard">Direcci�n: </span></label><%= estimationInfo.getClient().getAddress() %><br> 
					<label for="name" class="etiq"><span id="idCard">Direcci�n Env�o: </span></label><%= (estimationInfo.getClient().getShippingAddress()==null || estimationInfo.getClient().getShippingAddress().equalsIgnoreCase(""))?"(Igual a la anterior)":estimationInfo.getClient().getShippingAddress() %><br>
				</fieldset>
				<h3>Datos Solicitud:</h3>
				<fieldset>
				<label for="name" class="etiq"><span id="idCard">Ocasi�n Especial: </span></label><%= estimationInfo.getSpecialOccasion() %><br>
				<label for="name" class="etiq"><span id="idCard">Productos Deseados: </span></label><%= estimationInfo.getProducts() %><br>
				<label for="name" class="etiq"><span id="idCard">N�mero Invitados: </span></label><%= estimationInfo.getGuestsNumber() %><br>
				<label for="name" class="etiq"><span id="idCard">Detalles Adicionales: </span></label>"<%= estimationInfo.getDescription() %>"<br><br>	
				<%
				if(estimationInfo.getImage()!=null && !estimationInfo.getImage().equalsIgnoreCase("")){
				%>
				<a class="seeImage" href= "<%= "/armaTuTorta/files/pedidosOcasionesEspeciales/" + estimationInfo.getImage() %>" onclick="afoto('<%= "/armaTuTorta/files/pedidosOcasionesEspeciales/" + estimationInfo.getImage() %>','Imagen Referencia');return false" > Ver Imagen de Referencia </a>
				<%
				}
				%>
				</fieldset>
				<div style="text-align:center">
					<form action="/armaTuTorta/PrintEstimationServlet?estimationId=<%= estimationInfo.getId() %>"  method="post">
						<div id="botonP">
							<input type="submit"  class="button"  name="sbmtButton" value="Imprimir" style="margin-left:30%;" />
						</div>
					</form>
					<form>
						<div id="botonV" style="position:relative; margin-left: 400px; top: -22px;">
							<input type="button" class="button" value="Volver"  onClick="javascript:history.back();" />						
						</div>	
					</form>
				</div>	
		    <div id="footer"></div>
		</div>
	</div>
</body>
</html>