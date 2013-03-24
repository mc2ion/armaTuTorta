<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Arma Tu Torta</title>
	<link href='http://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Economica' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/style.css" />
	
	<!--[if IE 8]>
		<link rel="stylesheet" type="text/css" href="css/ie8.css" />
	<![endif]-->
	<!--[if IE 7]>
		<link rel="stylesheet" type="text/css" href="css/ie7.css" />
	<![endif]-->
	<!--[if IE 6]>
		<link rel="stylesheet" type="text/css" href="css/ie6.css" />
	<![endif]-->
	
	<script type="text/javascript" src="/armaTuTorta/js/jquery.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });
	});
	
	$(document).ready(function(){
	  $("#bt1").click(function(){
	    $(".block").hide();
		$(".block-2").show();
	  });
	  
	  $("#bt2").click(function(){
	    $(".block-2").hide();
		$(".block-3").show();
	  });
	  
	   $("#bt3").click(function(){
	    $(".block-3").hide();
		$(".block-4").show();
	  });
	  
	   $("#bt4").click(function(){
		var value = $("input:radio[name=capas]:checked").val();
		if (value == '-'){
			$(".block-4").hide();
			$(".step6").text("Paso 5:");
			$(".block-6").show();
		}else{
			$(".block-4").hide();
			$(".block-5").show();
		}	
	    
	  });
	  
	  $("#bt5").click(function(){
	    $(".block-5").hide();
		$(".block-6").show();
	  });
	  
	  $(".rdB1").click(function(){
	    $("#bt1Disable").hide();
		$("#bt1").show();
	  });
	  
	  $(".rdB2").click(function(){
	    $("#bt2Disable").hide();
		$("#bt2").show();
	  });
	  
	   $(".rdB3").click(function(){
	    $("#bt3Disable").hide();
		$("#bt3").show();
	  });
	  
	  $(".rdB4").click(function(){
	    $("#bt4Disable").hide();
		$("#bt4").show();
		
	  });
	  
	  $(".rdB5").click(function(){
	    $("#bt5Disable").hide();
		$("#bt5").show();
	  });
	  
	  $("input:checkbox").click(function() {
		var value = $("input:radio[name=capas]:checked").val();
		var bol = $("input:checkbox:checked").length >= value;     
		$("input:checkbox").not(":checked").attr("disabled",bol);
	  });
	  
	  $("#backLink").click(function(event) {
			$(".block").show();
			$(".block-2").hide();
	   });
	   
	   $("#backLink2").click(function(event) {
			$(".block-2").show();
			$(".block-3").hide();
	   });
	   
	   $("#backLink3").click(function(event) {
			$(".block-3").show();
			$(".block-4").hide();
	   });
	   
	   $("#backLink4").click(function(event) {
			$(".block-4").show();
			$(".block-5").hide();
	   });
	   
	   $("#backLink5").click(function(event) {
			$(".block-5").show();
			$(".block-6").hide();
	   });

	});
	
	
	
	
	</script>
</head>
<body>
<div class="wrapper">
	<div id="header">
		<div>
			<div>
				<div id="logo">
					<a href="index.html"><img src="/armaTuTorta/images/logo5.png" alt="Logo"/></a>
				</div>
				<div>
					<div>
						<a href="#signup"  rel="leanModal" id="go" class="pestana">Ingresar</a>
						<a href="/armaTuTorta/registro.jsp" class="pestana">Registrarse</a>
					</div>
				</div>
			</div>
			<ul style="margin: 0px; ">
				<li ><a href="/armaTuTorta/index.jsp">Inicio</a></li>
				<li  class="current"><a href="/armaTuTorta/creaTuTorta.jsp">Arma Tu Torta</a></li>
				<li><a href="/armaTuTorta/dulcesTortas.jsp">Dulces Tortas</a></li>
				<li><a href="/armaTuTorta/cupcakes.jsp">Cupcakes</a></li>
				<li><a href="/armaTuTorta/ocasionesEspeciales.jsp">Ocasiones Especiales</a></li>
				<li><a href="/armaTuTorta/galeria.jsp">Galería</a></li>
				<li><a href="/armaTuTorta/contacto.jsp">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="home">
			<div class="sectionLeft">
				<div>
					<ul>
						<li>
							<img src="./images/paso_torta.png" alt="Image" />
						</li>
					</ul>
				</div>	
			</div>
			
			<div class="title"> &iexcl; Sigue los pasos a continuaci&oacute;n y  arma la torta que deseas! </div>
			
			
			
			<div class="asideRight">
				<div class="block">
					<p> <span class="step1"> Paso 1: </span>  Elige la forma de tu torta </p>
					<div class="options-steps">
						<input  class="rdB1" type="radio" name="forma" value="1" > Redonda<br>
						<input  class="rdB1" type="radio" name="forma" value="2" > Cuadrada <br>
						<input  class="rdB1" type="radio" name="forma" value="3" > Ovalada
					</div>
					<div class="button-section" id="bt1Disable">
						<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
					</div>
					<div class="button-section" style="display: none;" id="bt1">
						<input  type="submit" name="sbmtButton" class="button" value="Siguiente"  />
					</div>
				</div>
				
				<div class="block-2" style="display:none">
					<p> <span class="step1">
						<a href="#" id="backLink"> <img src="images/return.png"> </a>
						Paso 2: </span>  Elige el tamaño de tu torta:</p>
					<div class="options-steps">
						<input class="rdB2" type="radio" name="tamano" value="1"> Pequeña (15 personas aprox.)<br>
						<input class="rdB2" type="radio" name="tamano" value="2" > Mediana (25 personas aprox.) <br>
						<input class="rdB2" type="radio" name="tamano" value="3" > Grande (45 personas aprox.)
					</div>
					<div class="button-section" id="bt2Disable">
						<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
					</div>
					<div class="button-section" style="display: none;" id="bt2">
						<input type="submit" name="sbmtButton" class="button" value="Siguiente"  />
					</div>
				</div>
				
				<div class="block-3" style="display:none">
					<p> <span class="step1">
					<a href="#" id="backLink2"> <img src="images/return.png"> </a>	
					Paso 3: </span>  Elige el sabor del ponqu&eacute;:</p>
					<div class="options-steps-left">
						<input class="rdB3" type="radio" name="sabor" value="1"> Chocolate<br>
						<input class="rdB3" type="radio" name="sabor" value="2" > Vainilla <br>
						<input class="rdB3" type="radio" name="sabor" value="3" > Bizcocho de almendras<br>
						<input class="rdB3" type="radio" name="sabor" value="4" > Marmoleada <br>
						
						
					</div>
					<div class="options-steps-right">
						<input class="rdB3"  type="radio" name="sabor" value="5" > Zanahoria <br>
						<input class="rdB3"  type="radio" name="sabor" value="6" > Naranja <br>
						<input class="rdB3"  type="radio" name="sabor" value="7" >  Chocolate fudge, el especial de la casa! <br>
					</div>
					<div class="button-section" id="bt3Disable">
						<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
					</div>
					<div class="button-section" style="display: none;" id="bt3">
						<input type="submit" name="sbmtButton" class="button" value="Siguiente"  />
					</div>
				</div>
				
				<div class="block-4" style="display:none">
					<p> <span class="step1"> 
					<a href="#" id="backLink3"> <img src="images/return.png"> </a>
					Paso 4: </span>  Elige la cantidad de capas de relleno:</p>
					<div class="options-steps">
						<input class="rdB4" type="radio" name="capas" value="1">  1 Capa<br>
						<input class="rdB4" type="radio" name="capas" value="2" > 2 Capas<br>
						<input class="rdB4" type="radio" name="capas" value="3" > 3 Capas<br>
						<input class="rdB4" type="radio" name="capas" value="-" > Sin relleno <br>
					</div>
					<div class="button-section" id="bt4Disable">
						<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
					</div>
					<div class="button-section" style="display: none;" id="bt4">
						<input type="submit" name="sbmtButton" class="button" value="Siguiente"  />
					</div>
				</div>
				
				<div class="block-5" style="display:none">
					<p> <span class="step1"> 
					<a href="#" id="backLink4"> <img src="images/return.png"> </a>
					Paso 5: </span>  Elige el o los sabores de relleno, si elegiste mas de uno combínalos como quieras!:</p>
					<div class="options-steps-left">
						<input class="rdB5" type="checkbox" name="sabores" value="1"> Chocolate<br>
						<input class="rdB5" type="checkbox" name="sabores" value="2"> Arequipe<br>
						<input class="rdB5" type="checkbox" name="sabores" value="3"> Nutella<br>
						<input class="rdB5" type="checkbox" name="sabores" value="4"> Crema Chantilly con melocotones <br>
						<input class="rdB5" type="checkbox" name="sabores" value="5"> Crema Chantilly con fresas <br>
						
					</div>
					<div class="options-steps-right">
						<input class="rdB5" type="checkbox" name="sabores" value="6"> Crema de Oreo <br>
						<input class="rdB5" type="checkbox" name="sabores" value="7"> Crema con almendras troceadas <br>
						<input class="rdB5" type="checkbox" name="sabores" value="8"> Crema con chispas de chocolate <br>
						<input class="rdB5" type="checkbox" name="sabores" value="9"> Crema Chantilly con cerezas y chispas de chocolate <br>
					</div>
					
					<div class="button-section" id="bt5Disable">
						<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
					</div>
					<div class="button-section" style="display: none;" id="bt5">
						<input type="submit" name="sbmtButton" class="button" value="Siguiente"  />
					</div>
				</div>
				
				<div class="block-6" style="display:none">
					<p>
					<span class="step6">
					<a href="#" id="backLink5"> <img src="images/return.png"> </a>
					Paso 6: </span>   Elige la cubierta de tu preferencia:</p>
					<div class="options-steps-left">
						<input class="rdB3" type="radio" name="cubierta" value="1">   Chocolate<br>
						<input class="rdB3" type="radio" name="cubierta" value="2" >  Arequipe <br>
						<input class="rdB3" type="radio" name="cubierta" value="3" >  Crema Chantilly con fresas<br>
						<input class="rdB3" type="radio" name="cubierta" value="4" >  Crema Chantilly con melocotones <br>
					</div>
					<div class="options-steps-right">
						<input class="rdB3"  type="radio" name="cubierta" value="5" >  Crema Chantilly  <br>
						<input class="rdB3"  type="radio" name="cubierta" value="6" >  Almendras <br>
						<input class="rdB3"  type="radio" name="cubierta" value="7" >  Crema de Oreo <br>
						<input class="rdB3"  type="radio" name="cubierta" value="8" >  Fondant con la imagen o foto que desees, Cárgala aquí! <br>
					</div>
					<div class="button-section" id="bt6Disable">
						<input  type="submit" name="sbmtButton" class="buttonDisable" value="Siguiente"  />
					</div>
					<div class="button-section" style="display: none;" id="bt6">
						<input type="submit" name="sbmtButton" class="button" value="Siguiente"  />
					</div>
				</div>
				
			</div>
			
			
			
			<div class="subtotal-section"> Sub-total: Bs. 100,00 </div>
			
			<div class="banner">
				<a href="./ocasionesEspeciales.jsp"><img src="./images/banner.png" alt="Image" /></a>
			</div>
			
			
			
		</div>
	</div>
	<div class="push"></div>
</div>
<div id="footer">
	<div id="navigation">
		<div>
			<p>Arma Tu Torta &copy; 2013 - Todos los derechos reservados</p>
		</div>
	</div>
	<div class="social">
		<a href="http://www.facebook.com/armatutorta" target="_blank"><img class="facebook" src="./images/facebook_social.png" alt="Facebook" title="Nuestra p&aacute;gina en Facebook"/></a>
		<a href="http://www.twitter.com/armatutorta" target="_blank"><img class="twitter" src="./images/twitter_social.png" alt="Twitter" title="Nuestra cuenta en Twitter"/></a>
	</div>
</div>
<jsp:include page="ventanas.jsp"></jsp:include>
</body>
</html>