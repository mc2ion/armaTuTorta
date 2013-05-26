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
	<script type="text/javascript">

		function changeDir(){
			var check = document.getElementById("txtIsShipping");
			var div = document.getElementById("shippingAddress");
			
			if(check.checked){
				div.style.display = "none";
			} else {
				div.style.display = "block";
			}
		}
		
		function changeForm(){
			var select = document.getElementById("txtTypeId");
			var position = select.options.selectedIndex;
			var typeId = select.options[position].value;
			var personDiv = document.getElementById("person");
			var companyDiv = document.getElementById("company");
			var span = document.getElementById("idCard");
			
			if((typeId == "V-") || (typeId == "E-")){
				companyDiv.style.display="none";
				personDiv.style.display = "block";
				span.innerHTML = "Cédula de Identidad:";
			} else {
				companyDiv.style.display="block";
				personDiv.style.display = "none";
				span.innerHTML = "RIF:";
			}
		}
	</script>
</head>
<body>
	<div id="container">
		<div id="header">
        	<img alt="logo" src="/armaTuTorta/images/loguito5.png"/>
        </div>           
        <div id="menu">
        	<div class="menuitemHome"><a href="UserLoginServlet">Home</a></div>	
	  		<ul>
           		<li class="menuitem"><a href="ListEstimationsServlet">Ver Presupuestos</a></li>
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
        		<h2>Detalle Presupuesto:</h2>
	        	<p>&nbsp;</p>
           		<p>&nbsp;</p>
				<jsp:useBean id="estimationInfo" type="domain.Estimation" scope="request"/> 
				<input type="hidden" name="txtEstimationId" value="<%= request.getAttribute("estimationId") %>" />
				<h3>Datos Cliente:</h3>
				<fieldset>
					<%= estimationInfo.getClient().getIdentityCard() %><br>
					<%= estimationInfo.getClient().getFirstName() + " " + estimationInfo.getClient().getLastName() %><br>					
					<label for="name"><span id="idCard">Correo Electrónico:</span></label><%= estimationInfo.getClient().getEmail() %><br>
					<label for="name"><span id="idCard">Teléfono:</span></label><%= estimationInfo.getClient().getPhone() + (estimationInfo.getClient().getOtherPhone()==null)?"":" / "+estimationInfo.getClient().getOtherPhone() %><br>
					<label for="name"><span id="idCard">Dirección:</span></label><%= estimationInfo.getClient().getAddress() %><br>
					<label for="name"><span id="idCard">Dirección Envío:</span></label><%= (estimationInfo.getClient().getShippingAddress()==null)?"(Igual a la anterior)":estimationInfo.getClient().getShippingAddress() %><br><br>
				</fieldset>
				<h3>Datos Solicitud:</h3>
				<fieldset>
				Ocasión Especial: <%= estimationInfo.getSpecialOccasion() %><br>
				Productos Deseados: <%= estimationInfo.getProducts() %><br>
				Número Invitados: <%= estimationInfo.getGuestsNumber() %><br>
				Detalles Adicionales: <%= estimationInfo.getDescription() %><br>
				Imagen de Referencia: <img alt="ref" src="<%= "/armaTuTorta/files/pedidosOcasionesEspeciales/" + estimationInfo.getImage() %>"/>
				</fieldset>
				<div style="text-align:center">
						<input type="button" class="button" value="Volver"  onClick="javascript:history.back();"/>
						<input type="submit"  class="button"  name="sbmtButton" value="Editar" style="margin-left:20px;" />
				</div>	
		    <div id="footer"></div>
		</div>
	</div>
</body>
</html>