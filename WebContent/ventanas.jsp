<script type="text/javascript" src="/armaTuTorta/js/messages.js"></script>

<div id="signup" style="display: none;">
	<div id="signup-ct">
		<div id="signup-header">
			<h2>Iniciar Sesi&oacute;n</h2>
			<p>Ingresa tus datos:</p>
			<a class="modal_close" href="#"></a>
		</div>
		<%
		String error = (String) request.getAttribute("error");
		if (error != null){
			if (error.startsWith("La información de nombre")){ %>
				<span class="errorLogin" style="color:red; margin-left: 10px; font-size: 16px;"></span>
			<%	}
		}
		%>
		<form name="loginForm" action="/armaTuTorta/LoginPageServlet" method="post">
		  <div class="missing-info"></div>
		  <div class="txt-fld">
		    <label for="name">Email:</label>
		    <input type="text" name="txtNameLogin" id="txtNameLogin" maxlength="50" class="good_input" onkeydown="show();" onmousedown="show()" />
		  </div>
		  <div class="txt-fld-pass">
		    <label for="password">Contrase&ntilde;a</label>
		    <input type="password" name="txtPasswordLogin" id="txtPasswordLogin" maxlength="50" onkeydown="show();" onmousedown="show()"  /> <br>
			<div >
			  <a href="#" style="margin-top: 5px; text-decoration:none;">&iquest;Olvidaste tu contrase&ntilde;a?</a>
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
</div>