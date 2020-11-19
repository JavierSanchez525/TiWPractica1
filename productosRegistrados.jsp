<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List,java.util.ArrayList,database.*;" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Productos</title>
</head>
<body>
<h1> Producto maricon</h1>
<h3> Buscador sencillito para toda la familia oiga </h3>
<form action="controlador" method="post" >
	<input type="hidden" name="accion" value="buscarSencillo">
    Busca en titulo y descripcion:
    <input type="text" name="consulta">
    <input type="submit" value="Buscar" name="submit">
</form>
<h3> Mirame los productos niña barato barato </h3> <a href="controlador?accion=mostrarTodos">Ver todos los productos</a>
<% 
List<Producto> elementos= new ArrayList<Producto>();
Object lista = request.getAttribute("lista");
  if (lista != null){
	if(lista instanceof List){
		 elementos = (List<Producto>)lista;
		for(Producto elemento: elementos){ %>
			<h5>Id:<%=elemento.getId() %> (Titulo: <%=elemento.getTitulo() %>) </h5>
		<% }
	}
}%>

<h3> Buscador avanzado para los mas atrevidos PEGI 13 </h3>
<form action="controlador" method="post" >
	<input type="hidden" name="accion" value="buscarAvanzado">
    Busca en cualquier campo:
    <input type="text" name="consulta">
    <input type="submit" value="Buscar" name="submit">
</form>


</body>
</html>