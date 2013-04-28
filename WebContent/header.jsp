<%@ page import="domain.Client "%> 
<%
	HttpSession infoPage = request.getSession();
	
	String error = (String) request.getAttribute("error");
	if (error != null){
		if (error.startsWith("La información de nombre")){
			System.out.println("entro");
	%>
			<script>
				$(function(){
					$('.errorLogin').text('El nombre de usuario o la contraseña introducidos no son correctos.');
					$('#go').click();
				});
			</script>
	<%
		}
	}
	Client client = (Client) infoPage.getAttribute("client");
	if (client == null){
%>
<div>
	<div>
		<a href="#signup"  rel="leanModal" id="go" class="pestana">Ingresar</a>
		<a href="/armaTuTorta/registro.jsp" class="pestana">Registrarse</a>
	</div>
</div>
<% 
	}else{
%>		
	
	<div id="pestana_larga">
			<a class="pestN" >Bienvenido, <%= client.getFirstName().substring(0, 14) %> </a>
			<span class="divisor">|</span> 
			<a href="#" class="pestCart"> <span class="numCartOne">  0 </span> <img src="./images/cart.png" height="26" width="38"/>   </a>
			<span class="divisor2">|</span> 
			<a href="/armaTuTorta/ClientAccountServlet?id=<%= client.getId() %>" class="pestCuenta"> Mi cuenta </a>
			<span class="divisor3">|</span> 
			<a href="/armaTuTorta/LogoutPageServlet" class="pestSalir"> Salir </a>
			
	</div>
<% 				
	}
%>