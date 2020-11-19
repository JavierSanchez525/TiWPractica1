<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List,java.util.ArrayList,database.*;" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
</head>
<body>
<h1> Epicos usuarios yes</h1>
<h3> Formulario para hacer una busqueda por nombre </h3>
<form action="controlador" method="post" >
	<input type="hidden" name="accion" value="consultaUsuariosBBDD">
    Que contenga en el titulo:
    <input type="text" name="palabra">
    <input type="submit" value="Buscar" name="submit">
</form>
<h3> Resultado o contenido en la base de datos </h3> <a href="controlador?accion=usuariosRegistrados">Ver todos los elementos</a>
<% 
List<Usuario> elementos= new ArrayList<Usuario>();
Object lista = request.getAttribute("lista");
  if (lista != null){
	if(lista instanceof List){
		 elementos = (List<Usuario>)lista;
		for(Usuario elemento: elementos){
			if(elemento.getIsAdmin()==0){ %>
				<h5 style="color:red;">Email:<%=elemento.getEmail() %> Nombre:<%=elemento.getNombre() %></h5>
		<%	}
		}
	}
}%>
</body>
</html>