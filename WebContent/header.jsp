<%@ page import="domain.Client "%> 
<%
	HttpSession infoPage = request.getSession();
	
	String error = (String) request.getAttribute("error");
	if (error != null){
		if (error.startsWith("La información de nombre")){
			
	%>
			<script>
				$(function(){
					$('.errorLogin').text('El nombre de usuario o la contraseña introducidos no son correctos.');
					$('#go').click();
				});
			</script>
	<%
		}else if (error.startsWith("El correo introducido")){
			
	%>
			<script>
				$(function(){
					$('.errorLogin').text('El correo que introdujo no está registrado. Por favor, verifique e intente de nuevo.');
					$('#go').click();
					$('#login').hide();
					$('#passRcv').show();
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
		<a href="/armaTuTorta/RegisterServlet" class="pestana">Registrarse</a>
	</div>
</div>
<% 
	}else{
%>		
	
	<div id="pestana_larga">
			<%
				String name = client.getFirstName();
				if (name.length() > 14 ){
					name = client.getFirstName().substring(0, 12);
					name += "...";
				}
			%>
			<a class="pestN" >Bienvenido, <%= name %> </a>
			<span class="divisor">|</span> 
			<a href="/armaTuTorta/ClientAccountServlet?id=<%= client.getId() %>" class="pestCuenta"> Mi cuenta </a>
			<span class="divisor3">|</span> 
			<a href="/armaTuTorta/LogoutPageServlet" class="pestSalir"> Salir <img src="images/exit.png" width="18" height="18"></a>
			
	</div>
<% 				
	}
%>