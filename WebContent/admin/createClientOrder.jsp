<%@page import="domain.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/styleAdmin.css" />
	<link rel="shortcut icon" href="/armaTuTorta/images/ico.ico">
	<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>
<title>Crear Cliente</title>
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
			<li class="menuitem"><a href="ListClientsServlet">Ver Clientes</a></li>
			<li class="menuitem"><a href="ListClientOrdersServlet?clientId=<%= request.getAttribute("clientId") %>">Ver Pedidos</a></li>
			</ul>
			<div class="menuitemPass"><a href="admin/index.jsp">Cambiar Contraseña</a></div>
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
				<h2>Armar Pedido:</h2>
				<form name="form" action="/armaTuTorta/CreateClientOrderServlet" onsubmit="return validateCreateClient(this)" method="post">
					<input type="hidden" name="txtClientId" value="<%= request.getAttribute("clientId") %>" />
					<div id="types">
						<span id="idType">Seleccione el producto que desea encargar:</span><br><br>
						<jsp:useBean id="types" type="java.util.ArrayList<domain.OrderType>" scope="request"/> 
						<%
							for(domain.OrderType t : types) { 											
						%>
						<input type="radio" name="txtTypeId" value="<%= t.getId() %>"><%= t.getName() %><br>
						<%
							}											
						%>
					</div>
					<div id="cakes" style="display:none">
					<jsp:useBean id="cakes" type="java.util.ArrayList<domain.ListOrder_Step>" scope="request"/> 
					<%
						for(domain.ListOrder_Step s : cakes) { 				
							domain.OrderStep step = s.getOrder();
							java.util.List<domain.StepOption> options = s.getOrderTypeId();
					%>
					<%= step.getPosition() + ".-" + step.getName() %><br>
					<%		
							for(domain.StepOption o : options) { 	
					%>
					<%= o.getName() + "+" + o.getPrice() %><br>
					<%		
							}
						}
					%>
					</div>		
					<div id="cupcakes" style="display:none">	
					<jsp:useBean id="cupcakes" type="java.util.ArrayList<domain.ListOrder_Step>" scope="request"/> 
					<%
						for(domain.ListOrder_Step s : cupcakes) { 				
							domain.OrderStep step = s.getOrder();
							java.util.List<domain.StepOption> options = s.getOrderTypeId();
					%>
					<%= step.getPosition() + ".-" + step.getName() %><br>
					<%		
							for(domain.StepOption o : options) { 	
					%>
					<%= o.getName() + "+" + o.getPrice() %><br>
					<%		
							}
						}
					%>
					</div>
					<div id="sweetcakes" style="display:none">	
					<jsp:useBean id="sweetcakes" type="java.util.ArrayList<domain.StepOption>" scope="request"/> 
					<%		
						for(domain.StepOption o : sweetcakes) { 	
					%>
					<%= o.getName() + "+" + o.getPrice() %><br>
					<%		
						}
					%>
					</div>
					<div id="specialOccasions" style="display:none">
					</div>
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
					<div style="text-align:center">
							<input type="button" class="button" value="Volver"  onClick="javascript:history.back();"/>
							<input type="submit"  class="button"  name="sbmtButton" value="Agregar" style="margin-left:20px;" />
					</div>		
			</form>
		    <div id="footer"></div>
		</div>
	</div>
</body>
</html>