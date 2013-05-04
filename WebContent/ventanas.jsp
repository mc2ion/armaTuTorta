<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>

<div id="signup" style="display: none;">
	<div id="signup-ct">
		<div id="signup-header">
			<h1>Iniciar Sesi&oacute;n</h1>
			<p>Ingresa tus datos:</p>
			<a class="modal_close" href="#"></a>
		</div>
		<%
		String error = (String) request.getAttribute("error");
		if (error != null){
			if (error.startsWith("La información de nombre")){ %>
				<div class="errorLogin" style="color:red; padding-left: 15px; font-size: 16px;"></div>
			<%	}
		}
		%>
		<div id="login">
			<form name="loginForm" action="/armaTuTorta/LoginPageServlet" method="post">
			  <div class="missing-info"></div>
			  <div class="txt-fld">
				<label for="name">Email:</label>
				<input type="text" name="txtNameLogin" id="txtNameLogin" maxlength="50" class="good_input" onkeydown="show();" onmousedown="show()" onBlur="show();" />
			  </div>
			  <div class="txt-fld-pass">
				<label for="password">Contrase&ntilde;a</label>
				<input type="password" name="txtPasswordLogin" id="txtPasswordLogin" maxlength="50" onkeydown="show();" onmousedown="show()" onBlur="show();"  /> <br>
				<div >
				  <a href="#" style="margin-top: 5px; text-decoration:none;" onClick="forgotPass();">&iquest;Olvidaste tu contrase&ntilde;a?</a>
				</div>
			  </div>
			 
			  
			  <div class="txt-fld-text-aux">
				 <input type="checkbox" value="remember"/> Recordar Contrase&ntilde;a
			  </div>
			  <div class="btn-fld">
					<input type="submit" id="loginPage" value ="Iniciar Sesi&oacute;n &raquo;" disabled="disabled" />
				</div>
			 </form>
		 </div>
		 
		 <div id="passRcv" style="display:none">
			<form name="passForm" action="/armaTuTorta/PasswordGeneratorServlet" method="post">
			  <input type="hidden" name="name" id="name" value="" />
			  <div class="missing-info">Introduce tu correo electr&oacute;nico, y te enviaremos un correo con tu nueva contrase&ntilde;a</div>
			<% 
				if (error != null){
					if (error.startsWith("El correo introducido")){ %>
						<div class="errorLogin" style="color:red; padding-left: 15px; font-size: 16px;"></div>
					<%	}
				}
				%> 
		 	 <div class="txt-fld">
				<label for="name">Email:</label>
				<input type="text" name="email" id="email" maxlength="50" class="good_input" onkeydown="showAux();" onmousedown="showAux()" onBlur="showAux();" />
			  </div>
			  
			  
			  <div class="btn-fld">
					<input type="submit" id="passRcvB" value ="Restablecer" disabled="disabled" />
			  </div>
			 </form>
		 </div>
	</div>
	
</div>


