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
                
                <h4 class="title">Modificar informaci�n de un usuario</h4>
                <%
                	if(request.getAttribute("adminModificacionUsuario") == "success") { %>
                		<h5 style="color:green;padding:10px;"> Informaci�n modificada con �xito</h5>
                <%	}
                	if(request.getAttribute("adminModificacionUsuario") == "fail") { %>
                		<h5 style="color:red;padding:10px;"> 1 o m�s campos de comprobaci�n incorrectos</h5>
                <%	} %>    
                <div>
          			<div class="wrap">
    		   			<form action="controlador" method="post" name="adminModify" id="adminModifyUser-form">
    			 			<div class="col_1_of_2 span_1_of_2">
		   			 			<div><input type="text" placeholder="Nuevo nombre" name="newName" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nuevo nombre';}"></div>
		    					<div><input type="password" placeholder="Nueva contrase�a" name="newPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nueva contrase�a';}"></div>
		    					<div><input required type="email" placeholder="E-Mail de usuario a modificar" name="userEmail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'E-Mail de usuario a modificar';}"></div>
		    	 			</div>
		    	  			<div class="col_1_of_2 span_1_of_2">	
		    					<div><input type="text" placeholder="Nuevo apellido" name="newSurname" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nuevo apellido';}"></div>		        
		          				<div><input type="text" placeholder="Nueva ciudad" name="newCity" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nueva ciudad';}"></div>
		    					<div><input required type="password" placeholder="Contrase�a de admin" name="adminPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Contrase�a de admin';}"></div>		           				
		           				<input type="hidden" name="accion" value="adminModifyUsuario" />
		           				<div>
		          				</div>
		          			</div>
		          			<input type="submit" name="Submit" class="grey" value="Modificar informaci�n"/>
		    				<div class="clear"></div>
		    			</form>
    				</div>
    			</div>
    			<br />
                
                <h4 class="title">Lista de productos</h4>
                 <a href="controlador?accion=adminVisualizarProductos"> Visualizar productos </a><br>
                <% 
					List<Producto> elementos2= new ArrayList<Producto>();
					Object lista2 = request.getAttribute("listaProductosAdmin");
  					if (lista2 != null){
						if(lista2 instanceof List){
		 					elementos2 = (List<Producto>)lista2; %>
							<% 	for(Producto elemento: elementos2){ %>
									<p>ID:<%=elemento.getId()%>,  TITULO: <%=elemento.getTitulo()%>,  CATEGORIA: <%=elemento.getCategoria()%>,  PRECIO: <%=elemento.getPrecio()%></p>
									<pre>	DESCRIPCI�N: <%=elemento.getDescripcion()%></pre>
									<br>
  							<%	} %>
					<% } %>	
				<%	} %> <br>
                
                <h4 class="title">Modificar un producto</h4>
                <%
                	if(request.getAttribute("adminModificacionProducto") == "success") { %>
                		<h5 style="color:green;padding:10px;"> Producto modificado con �xito</h5>
                <%	}
                	if(request.getAttribute("adminModificacionProducto") == "fail") { %>
                		<h5 style="color:red;padding:10px;"> 1 o m�s campos de comprobaci�n incorrectos</h5>
                <%	}
                	if(request.getAttribute("adminModificacionProducto") == "failProd") { %>
            		<h5 style="color:red;padding:10px;"> ID de producto incorrecto</h5>
            	<%	}
                	if(request.getAttribute("adminModificacionProducto") == "failCampos") { %>
                		<h5 style="color:red;padding:10px;"> Elija al menos 1 campo!</h5>
                <%	} %>    
                <form action="controlador" method="post" name="adminModifyProduct" id="adminModifyProduct-form" enctype="multipart/form-data">
                	<div class="wrap">
  			 			<div class="col_1_of_2 span_1_of_2">
  			 				<div><input required type="number" placeholder="ID de producto a modificar" name="productID" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'ID de producto a modificar';}"></div>
   			 				<div><input type="text" placeholder="Nuevo nombre" name="newProductName" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nuevo nombre';}"></div>
    						<div><input type="number" placeholder="Nuevo precio" name="newProductPrice" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nuevo precio';}"></div>
    	 					<br />
    						Nueva imagen de producto:
    						<input type="file" name="newFileToUpload" id="newFileToUpload">
    						<br /><br />
    					  
    	 					<div class="Eleccion categoria">
								<h4>Nueva Categor�a</h4>
								<select name="newCheckbox">
									<option value="">Sin cambios</option>
									<option value="MujerCamisetas">Camiseta de mujer</option>
  									<option value="MujerCamisas">Camisas de mujer</option>
  									<option value="MujerPantalones">Pantalones de mujer</option>
  									<option value="MujerAbrigos">Abrigos de mujer</option>
  									<option value="MujerSudaderas">Sudaderas de mujer</option>
  									<option value="MujerZapatos">Zapatos de mujer</option>
  									<option value="MujerZapatillas">Zapatillas de mujer</option>
  									<option value="HombreCamisetas">Camiseta de hombre</option>
  									<option value="HombreCamisas">Camisas de hombre</option>
  									<option value="HombrePantalones">Pantalones de hombre</option>
  									<option value="HombreAbrigos">Abrigos de hombre</option>
  									<option value="HombreSudaderas">Sudaderas de hombre</option>
  									<option value="HombreZapatos">Zapatos de hombre</option>
  									<option value="HombreZapatillas">Zapatillas de hombre</option>
 									<option value="AccesoriosGorras">Gorras, Gorros y Sombreros</option>
 									<option value="AccesoriosPendientes">Pendientes</option>
 									<option value="AccesoriosColgantes">Colgantes</option>
 									<option value="AccesoriosCalcetines">Calcetines</option>
								</select>
				     		</div>
				     		<br />
				     		<h4>Nueva descripci�n:</h4><br>
   	 						<textarea class="Area" rows="4" cols="50" name="NewProductDescription" form="adminModifyProduct-form" maxlength="239"></textarea>
							<input type="hidden" name="accion" value="adminModifyProducto" /> 
							<br><br>
							<input type="submit" name="Submit" class="grey" value="Modificar producto"/>
    	 				</div>
    	 				<div class="col_1_of_2 span_1_of_2">
    	 					<div><input required type="password" placeholder="Contrase�a de administrador" name="adminPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Contrase�a de administrador';}"></div>
    	 				</div>
    	 			</div>
    				<div class="clear"></div>
    			</form>
    			<br>
                
                <h4 class="title">Eliminar un producto</h4>
                <strong><p style="color:red;"> Una vez tramitada la baja, no se puede dar marcha atr�s. </p></strong>
          		<%
                	if(request.getAttribute("adminEliminacionProducto") == "success") { %>
                		<h5 style="color:green;padding:10px;"> Producto eliminado con �xito</h5>
                <%	}
          			if(request.getAttribute("adminEliminacionProducto") == "failProd") { %>
        				<h5 style="color:red;padding:10px;"> ID de producto incorrecto</h5>
        		<%	}
                	if(request.getAttribute("adminEliminacionProducto") == "fail") { %>
                		<h5 style="color:red;padding:10px;"> 1 o m�s campos de comprobaci�n incorrectos</h5>
                <%	} %>   
                <div>
          			<div class="wrap">
    		   			<form action="controlador" method="post" name="adminDeleteProduct" id="adminDeleteProduct-form">
    			 			<div class="col_1_of_2 span_1_of_2">
		    					<div><input required type="number" placeholder="ID de producto a borrar" name="delProductID" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'ID de producto a borrar';}"></div>
		    	 			</div>
		    	  			<div class="col_1_of_2 span_1_of_2">	
		    					<div><input required type="password" placeholder="Contrase�a de administrador" name="adminPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Contrase�a de admin';}"></div>		           				
		           				<input type="hidden" name="accion" value="adminDeleteProducto" />
		           				<div>
		          				</div>
		          			</div>
		          			<input type="submit" name="Submit" class="grey" value="Eliminar producto"/>
		    				<div class="clear"></div>
		    			</form>
    				</div>
    			</div>
                <br />
                
				<h4 class="title">Dar de baja a un usuario</h4>
                <strong><p style="color:red;"> Una vez tramitada la baja, no se puede dar marcha atr�s. </p></strong>
          		<%
                	if(request.getAttribute("adminEliminacionUsuario") == "success") { %>
                		<h5 style="color:green;padding:10px;"> Usuario eliminado con �xito</h5>
                <%	}
                	if(request.getAttribute("adminEliminacionUsuario") == "fail") { %>
                		<h5 style="color:red;padding:10px;"> 1 o m�s campos de comprobaci�n incorrectos</h5>
                <%	} %>   
                <div>
          			<div class="wrap">
    		   			<form action="controlador" method="post" name="adminDelete" id="adminDeleteUser-form">
    			 			<div class="col_1_of_2 span_1_of_2">
		    					<div><input required type="email" placeholder="E-Mail de usuario a borrar" name="userEmail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'E-Mail de usuario a borrar';}"></div>
		    	 			</div>
		    	  			<div class="col_1_of_2 span_1_of_2">	
		    					<div><input required type="password" placeholder="Contrase�a de admin" name="adminPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Contrase�a de admin';}"></div>		           				
		           				<input type="hidden" name="accion" value="adminDeleteUsuario" />
		           				<div>
		          				</div>
		          			</div>
		          			<input type="submit" name="Submit" class="grey" value="Dar de baja al usuario"/>
		    				<div class="clear"></div>
		    			</form>
    				</div>
    			</div>
                <br />
                
                <div class="clear"></div>
            </div>
        </div>
        <div class="footer">
            <div class="footer-bottom">
                <div class="wrap">
                    <div class="copy">
                        <p>
                            � 2014 Template by
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
