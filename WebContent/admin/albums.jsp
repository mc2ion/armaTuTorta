<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="domain.User"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/armaTuTorta/css/styleAdmin.css" />
<link rel="shortcut icon" href="/armaTuTorta/images/ico.ico">
<title>Administrador Galer�a</title>
<script type="text/javascript" language="javascript" src="/armaTuTorta/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="/armaTuTorta/js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript" src="/armaTuTorta/js/jquery.leanModal.min.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#example').dataTable( {
			"iDisplayLength": 8,
			"bLengthChange": false,
			"sScrollY": "250px",
			"bPaginate": false,
			"aoColumns": [
				null,
				null,
				null,
				null,
				null,
				{ "bSearchable": false, "asSorting": false }
			],
			"oLanguage": {
	            "sLengthMenu": "Mostrar _MENU_ registros",
	            "sZeroRecords": "No hay ning�n registro que coincida con su b�squeda",
	            "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ registros",
	            "sInfoEmpty": "Mostrando 0 a 0 de 0 registros",
	            "sInfoFiltered": "(filtrando de _MAX_ registros totales)",
	            "sEmptyTable": "No hay datos disponibles en la tabla",
	            "sLoadingRecords": "Por favor, espere - cargando...",
	            "sSearch": "Buscar:",
	            "oPaginate": {
	                "sNext": "Siguiente",
	                "sPrevious": "Anterior"
	              }
        	}
		} );
	} );
</script>
<script type="text/javascript">
	var idAlbum;
			
	$(function() {
		$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: ".close_x" });		
	});
	
	function loadVars(var1, var2) {
		idAlbum = var1;
		$('.album').text(var2);
		
	};
	
	function setV(f){
		f.elements['albumId'].value = idAlbum;
		return true;
	}
</script>
</head>
<body>
	<div id="container">
		<div id="header">
        	<img alt="logo" src="/armaTuTorta/images/loguito5.png"/>
        </div>         
        <div id="menu">
			<div class="menuitemHome" ><a href="UserLoginServlet">Home</a></div>	
	    	<ul>
            	<li class="menuitem"><a href="CreateAlbumServlet">Agregar �lbum</a></li>
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
        		<jsp:useBean id="albums" type="java.util.ArrayList<domain.Album>" scope="request"/>  	
        		<h2>�lbumes Registrados:</h2>
				<%
        			String info = (String)request.getAttribute("info");
        			String error = (String)request.getAttribute("error");
					if(!info.equalsIgnoreCase("")){
				%>	
				<p>&nbsp;</p> 
				<p class="info-msg"><%= info %></p> 
				<%	
					}
					if(!error.equalsIgnoreCase("")){
				%>	
           		<p>&nbsp;</p>    
				<p class="error-msg"><%= error %></p>      
           		<%	
					}
					if (albums.size() == 0) {
				%>	
					<p>&nbsp;</p> 
					<p class="noReg">En estos momentos no hay �lbumes registrados.</p>  
				<%
				} else {
				%>		
				<div id="dt_example">
					<div id="container">
						<div id="demo">
						<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
						<thead>
							<tr>
								<th>ID</th>
								<th>Nombre</th>
								<th>Imagen</th>
								<th>Activo</th>
								<th>Nuevo</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<%
							for(domain.Album a : albums) { 											
							%>
								<tr class="gradeA">
									<td><%= a.getId() %></td>
									<td><%= a.getName() %></td>
									<td>
										<img alt="cover" src="<%= "/armaTuTorta/files/" + a.getDirectory() + "/" + a.getImage() %>" width="50" height="50" />
									</td>
									<td><%= (a.isActive()==1)?"Si":"No"  %></td>
									<td><%= (a.isNew()==1)?"Si":"No" %></td>
									<td><p>
										<a href="/armaTuTorta/ListPhotosServlet?albumId=<%= a.getId() %>" style="color: transparent" >
											<img alt="logo" src="/armaTuTorta/images/photos.png"  height="16" width="16" title="Ver Fotos" />
										</a> 
										<a href="/armaTuTorta/EditAlbumServlet?albumId=<%= a.getId() %>" style="color: transparent" >
											<img alt="logo" src="/armaTuTorta/images/edit.png"  height="16" width="16" title="Editar �lbum" />
										</a> 
										<a id="go" rel="leanModal" href="#deleteAlbum" style="color: #f7941e; font-weight: bold;" onclick="return loadVars(<%= a.getId()%>,'<%= a.getName()%>' )" >
										<img alt="logo" src="/armaTuTorta/images/delete.png" height="16" width="16" title="Eliminar �lbum" />
										</a><br>
										</p>
									</td>
								</tr>
							<% 
								}
							%>
						</tbody>
					</table>
					</div>
				</div>
			</div>
			<div class="spacer"></div>
			<% 
			}
			%>
		</div>
 	</div>
	
	<div id="deleteAlbum">
		<div id="signup-ct">
			<h3 id="see_id" class="sprited" > Eliminar �lbum</h3>
			<br><br>
			<span>�Est� seguro que desea eliminar el �lbum <span class="album"></span>? </span> <br><br>
			<div id="signup-header">
				<a class="close_x" id="close_x"  href="#"></a>
			</div>
			<form action="/armaTuTorta/DeleteAlbumServlet" method="post"  onsubmit="return setV(this)">
				<input type="hidden" id="albumId" class="good_input" name="albumId"  value=""/>
				<div class="btn-fld">
					<input type="submit"  class="buttonPopUpDelete"  name="sbmtButton" value="Aceptar"  />
				</div>
		 </form>
		</div>
	</div>
	

</body>
</html>