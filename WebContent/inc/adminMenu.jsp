<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<ul>
<%
	domain.User user = (domain.User) session.getAttribute("user");

	if (user == null){
		response.sendRedirect("/admin");
	} else {
%>
    <li><a href="/servlet/servlet.ListEstimationsServlet">Presupuestos</a></li>
    <li><a href="/servlet/servlet.ListOrdersServlet">Pedidos</a></li>
    <li><a href="/servlet/servlet.ListClientsServlet">Clientes</a></li>
	<li><a href="/servlet/servlet.ListOrderStepsServlet?typeId=2">Cupcakes</a></li>
    <li><a href="/servlet/servlet.ListOrderStepsServlet?typeId=1">Tortas</a></li>
    <li><a href="/servlet/servlet.ListOrderStepsServlet?typeId=3">Dulces Tortas</a></li>
	<li><a href="/servlet/servlet.ListAlbumsServlet">Galería</a></li>
<%
	}
%>	    
</ul>