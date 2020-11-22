<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List,java.util.ArrayList,database.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Free Leoshop Website Template | Login :: w3layouts</title>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1"
        />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link
            href="css/style.css"
            rel="stylesheet"
            type="text/css"
            media="all"
        />
        <link
            href="http://fonts.googleapis.com/css?family=Exo+2"
            rel="stylesheet"
            type="text/css"
        />
        <script type="text/javascript" src="js/jquery1.min.js"></script>
        <!-- start menu -->
        <link
            href="css/megamenu.css"
            rel="stylesheet"
            type="text/css"
            media="all"
        />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>
            $(document).ready(function () {
                $(".megamenu").megamenu();
            });
        </script>
        <!-- dropdown -->
        <script src="js/jquery.easydropdown.js"></script>
    </head>
    <body>
        <div class="header-top">
            <div class="wrap">
                <div class="cssmenu">
                    <ul>
                    	<li><a href="admin.jsp">Panel de Admin</a></li>
                    	| 
                    	<li><a href="controlador?accion=logOffUsuario"> Log Off </a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="register_account">
            <div class="wrap">
                <h4 class="title">Lista de usuarios</h4>
                <a href="controlador?accion=adminVisualizarUsuarios"> Visualizar usuarios </a><br>
                <p> </p>
                <% 
					List<Usuario> elementos= new ArrayList<Usuario>();
					Object lista = request.getAttribute("listaUsuarios");
  					if (lista != null){
						if(lista instanceof List){
		 					elementos = (List<Usuario>)lista; %>
							<% 	for(Usuario elemento: elementos){ %>
									<p>EMAIL: <%=elemento.getEmail()%>,  NOMBRE: <%=elemento.getNombre()%>,  APELLIDO: <%=elemento.getApellido()%>,  CIUDAD: <%=elemento.getCiudad()%></p>
  							<%	} %>
					<% } %>	
				<%	} %>
                <br>
                
                <h4 class="title">Modificar información de un usuario</h4>
                <%
                	if(request.getAttribute("adminModificacionUsuario") == "success") { %>
                		<h5 style="color:green;padding:10px;"> Información modificada con éxito</h5>
                <%	}
                	if(request.getAttribute("adminModificacionUsuario") == "fail") { %>
                		<h5 style="color:red;padding:10px;"> 1 o más campos de comprobación incorrectos</h5>
                <%	} %>    
                <div>
          			<div class="wrap">
    		   			<form action="controlador" method="post" name="adminModify" id="adminModifyUser-form">
    			 			<div class="col_1_of_2 span_1_of_2">
		   			 			<div><input type="text" placeholder="Nuevo nombre" name="newName" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nuevo nombre';}"></div>
		    					<div><input type="password" placeholder="Nueva contraseña" name="newPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nueva contraseña';}"></div>
		    					<div><input required type="email" placeholder="E-Mail de usuario a modificar" name="userEmail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'E-Mail de usuario a modificar';}"></div>
		    	 			</div>
		    	  			<div class="col_1_of_2 span_1_of_2">	
		    					<div><input type="text" placeholder="Nuevo apellido" name="newSurname" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nuevo apellido';}"></div>		        
		          				<div><input type="text" placeholder="Nueva ciudad" name="newCity" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nueva ciudad';}"></div>
		    					<div><input required type="password" placeholder="Contraseña de admin" name="adminPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Contraseña de admin';}"></div>		           				
		           				<input type="hidden" name="accion" value="adminModifyUsuario" />
		           				<div>
		          				</div>
		          			</div>
		          			<input type="submit" name="Submit" class="grey" value="Modificar"/>
		    				<div class="clear"></div>
		    			</form>
    				</div>
    			</div>
    			<br />
                
                <h4 class="title">Dar de baja a un usuario</h4>
                <strong><p style="color:red;"> Una vez tramitada la baja, no se puede dar marcha atrás. </p></strong>
          		<%
                	if(request.getAttribute("adminEliminacionUsuario") == "success") { %>
                		<h5 style="color:green;padding:10px;"> Usuario eliminado con éxito</h5>
                <%	}
                	if(request.getAttribute("adminEliminacionUsuario") == "fail") { %>
                		<h5 style="color:red;padding:10px;"> 1 o más campos de comprobación incorrectos</h5>
                <%	} %>   
                <div>
          			<div class="wrap">
    		   			<form action="controlador" method="post" name="adminDelete" id="adminDeleteUser-form">
    			 			<div class="col_1_of_2 span_1_of_2">
		    					<div><input required type="email" placeholder="E-Mail de usuario a borrar" name="userEmail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'E-Mail de usuario a borrar';}"></div>
		    	 			</div>
		    	  			<div class="col_1_of_2 span_1_of_2">	
		    					<div><input required type="password" placeholder="Contraseña de admin" name="adminPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Contraseña de admin';}"></div>		           				
		           				<input type="hidden" name="accion" value="adminDeleteUsuario" />
		           				<div>
		          				</div>
		          			</div>
		          			<input type="submit" name="Submit" class="grey" value="Eliminar"/>
		    				<div class="clear"></div>
		    			</form>
    				</div>
    			</div>
                <br />
                
                <h4 class="title">Lista de productos</h4>
                <p>boi</p>

                <div class="clear"></div>
            </div>
        </div>
        <div class="footer">
            <div class="footer-bottom">
                <div class="wrap">
                    <div class="copy">
                        <p>
                            © 2014 Template by
                            <a href="http://w3layouts.com" target="_blank"
                                >w3layouts</a
                            >
                        </p>
                    </div>
                    <div class="f-list2">
                        <ul>
                            <li class="active">
                                <a href="about.html">About Us</a>
                            </li>
                            |
                            <li>
                                <a href="delivery.html">Delivery & Returns</a>
                            </li>
                            |
                            <li>
                                <a href="delivery.html">Terms & Conditions</a>
                            </li>
                            |
                            <li><a href="contact.html">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </body>
</html>
