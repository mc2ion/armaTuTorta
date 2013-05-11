<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ page import="domain.Album"%> 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Arma Tu Torta</title>
	<link href='http://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Economica' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/style.css" />
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/styleImage.css" />
	<link rel="stylesheet" type="text/css" href="css/styleCar.css" />
	<link rel="stylesheet" type="text/css" href="css/gridNavigation.css" />
	<link rel="shortcut icon" href="/armaTuTorta/images/ico.ico">
	<script type="text/javascript" src="/armaTuTorta/js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="/armaTuTorta/js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" });
	});
	
	
	</script>
	
	<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/shadowbox.css">
	<script type="text/javascript" src="/armaTuTorta/js/shadowbox.js"></script>
	<script type="text/javascript">
		Shadowbox.init({
			handleOversize: "drag",
			modal: true
	});
	</script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.gridnav.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#tj_container').gridnav({
				type	: {
					mode		: 'sequpdown', 	// use def | fade | seqfade | updown | sequpdown | showhide | disperse | rows
					speed		: 500,			// for fade, seqfade, updown, sequpdown, showhide, disperse, rows
					easing		: '',			// for fade, seqfade, updown, sequpdown, showhide, disperse, rows	
					factor		: 100,			// for seqfade, sequpdown, rows
					reverse		: ''			// for sequpdown
				}
			});
		});
	</script>
	
</head>
<body>
<jsp:useBean id="photos" type="java.util.ArrayList<domain.Photo>" scope="request"/>  	
<%
	HttpSession infoPage = request.getSession();
	session.setAttribute("prevPage", "GallerySpecialsCakesServlet?albumId=" + photos.get(0).getAlbumId());
	
%>
<div class="wrapper">
	<div id="header">
		<div>
			<div>
				<div id="logo">
					<a href="index.html"><img src="/armaTuTorta/images/logo5.png" alt="Logo"/></a>
				</div>
				<jsp:include page="header.jsp"></jsp:include>
			</div>
			<ul style="margin: 0px; ">
				<li><a href="/armaTuTorta/HomePageServlet">Inicio</a></li>
				<li><a href="/armaTuTorta/ArmaTuTortaServlet?typeId=1">Arma Tu Torta</a></li>
				<li><a href="/armaTuTorta/DulcesTortasServlet?typeId=3">Dulces Tortas</a></li>
				<li><a href="/armaTuTorta/CupcakesServlet?typeId=2">Cupcakes</a></li>
				<li><a href="/armaTuTorta/OcasionesEspecialesServlet">Ocasiones Especiales</a></li>
				<li class="current"><a href="/armaTuTorta/GalleryServlet">Galería</a></li>
				<li><a href="/armaTuTorta/ContactServlet">Contacto</a></li>
			</ul>
		</div>
	</div>
	<div id="content-aux">
		<div class="title-img"><a href="/armaTuTorta/GalleryServlet"> <img src="images/return.png"> </a> Ocasiones Especiales </div>
		<% 	if (photos.size() > 0){ %>
		<div class="content example3">
				<div id="tj_container" class="tj_container">
					<div class="tj_nav">
						<span id="tj_prev" class="tj_prev">Previous</span>
						<span id="tj_next" class="tj_next">Next</span>
					</div>
					<div class="tj_wrapper">
						<ul class="tj_gallery">
							<%
									for(domain.Photo p : photos) { 											
									String src = "/armaTuTorta/files/" + Album.getDirectory(p.getAlbumId()) + "/" + p.getImage();
							%>
							<li>
								<a href="<%= src %>" rel="shadowbox[Cakes];height=340;width=340">
									<img src="<%= src %>" alt="image01"   style="width:180px; height:155px;" />
								</a>
							</li>
							<% 
								}
							%>
							
							
						</ul>
					</div>
				</div>
		</div>
	<%
	}else{
	%>	
		<br> <span style="margin-left: 30px">En estos momentos no tenemos fotos para mostrar. Intente m&aacute;s tarde.</span>
	<%} %>
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