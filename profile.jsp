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
                        <li><a href="profile.jsp">Account</a></li> 
                    	|
                    	<li><a href="checkout.html">Checkout</a></li>
                    	|
                    	<li><a href="controlador?accion=logOffUsuario"> Log Off </a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="header-bottom">
            <div class="wrap">
                <div class="header-bottom-left">
                    <div class="logo">
                        <a href="index.jsp"
                            ><img src="images/logo.png" alt=""
                        /></a>
                    </div>
                    <div class="menu">
                        <ul class="megamenu skyblue">
                            <li class="active grid">
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                <a class="color4" href="womens.html">women</a>
                                <div class="megapanel">
                                    <div class="row">
                                        <div class="col1">
                                            <div class="h_nav">
                                                <ul>
                                                    <li>
                                                        <a href="womens.html"
                                                            >Camisetas</a
                                                        >
                                                    </li>
                                                    <li>
                                                        <a href="womens.html"
                                                            >Camisas</a
                                                        >
                                                    </li>
                                                    <li>
                                                        <a href="womens.html"
                                                            >Pantalones</a
                                                        >
                                                    </li>
                                                    <li>
                                                        <a href="womens.html"
                                                            >Abrigos</a
                                                        >
                                                    </li>
                                                    <li>
                                                        <a href="womens.html"
                                                            >Sudaderas</a
                                                        >
                                                    </li>
                                                    <li>
                                                        <a href="womens.html"
                                                            >Zapatos</a
                                                        >
                                                    </li>
                                                    <li>
                                                        <a href="womens.html"
                                                            >Zapatillas</a
                                                        >
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a class="color5" href="mens.html">Men</a>
                                <div class="megapanel">
                                    <div class="col1">
                                        <div class="h_nav">
                                            <ul>
                                                <li>
                                                    <a href="mens.html"
                                                        >Camisetas</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="mens.html"
                                                        >Camisas</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="mens.html"
                                                        >Pantalones</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="mens.html"
                                                        >Abrigos</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="mens.html"
                                                        >Sudaderas</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="mens.html"
                                                        >Zapatos</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="mens.html"
                                                        >Zapatillas</a
                                                    >
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a class="color6" href="other.html"
                                    >Accesorios</a
                                >
                                <div class="megapanel">
                                    <div class="col1">
                                        <div class="h_nav">
                                            <ul>
                                                <li>
                                                    <a href="other.html"
                                                        >Gorras, gorros y
                                                        sombreros</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="other.html"
                                                        >Pendientes</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="other.html"
                                                        >Colgantes y pulseras</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="other.html"
                                                        >Calcetines</a
                                                    >
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="header-bottom-right">
                    <div class="search">
                        <input
                            type="text"
                            name="s"
                            class="textbox"
                            value="Search"
                            onfocus="this.value = '';"
                            onblur="if (this.value == '') {this.value = 'Search';}"
                        />
                        <input
                            type="submit"
                            value="Subscribe"
                            id="submit"
                            name="submit"
                        />
                        <div id="response"></div>
                    </div>
                    <div class="tag-list">
                        <ul class="icon1 sub-icon1 profile_img">
                            <li>
                                <a class="active-icon c2" href="#"> </a>
                                <ul class="sub-icon1 list">
                                    <li>
                                        <h3>No Products</h3>
                                        <a href=""></a>
                                    </li>
                                    <li>
                                        <p>
                                            Lorem ipsum dolor sit amet,
                                            consectetuer
                                            <a href=""
                                                >adipiscing elit, sed diam</a
                                            >
                                        </p>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="last">
                            <li><a href="#">Cart(0)</a></li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="register_account">
            <div class="wrap">
                <h4 class="title">Información de usuario</h4>
                <pre>	<strong>Nombre:</strong>	<%out.print(session.getAttribute("nombre"));%> 		</pre>
                <pre>	<strong>Apellido:</strong>	<%out.print(session.getAttribute("apellido"));%> 	</pre>
                <pre>	<strong>Email:</strong>		<%out.print(session.getAttribute("email"));%> 		</pre>
                <pre>	<strong>Ciudad:</strong>		<%out.print(session.getAttribute("ciudad"));%> 		</pre>
                <br />
                
                <h4 class="title">Modificar información</h4>
                <%
                	if(request.getAttribute("modificacionUsuario") == "success") { %>
                		<h5 style="color:green;padding:10px;"> Información modificada con éxito</h5>
                <%	}
                	if(request.getAttribute("modificacionUsuario") == "fail") { %>
                		<h5 style="color:red;padding:10px;"> 1 o más campos de comprobación incorrectos</h5>
                <%	} %>    
                <div>
          			<div class="wrap">
    		   			<form action="controlador" method="post" name="modify" id="modifyUser-form">
    			 			<div class="col_1_of_2 span_1_of_2">
		   			 			<div><input type="text" placeholder="Nuevo nombre" name="newName" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nuevo nombre';}"></div>
		    					<div><input type="password" placeholder="Nueva contraseña" name="newPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nueva contraseña';}"></div>
		    					<div><input required type="email" placeholder="E-Mail actual" name="actualEmail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'E-Mail actual';}"></div>
		    	 			</div>
		    	  			<div class="col_1_of_2 span_1_of_2">	
		    					<div><input type="text" placeholder="Nuevo apellido" name="newSurname" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nuevo apellido';}"></div>		        
		          				<div><input type="text" placeholder="Nueva ciudad" name="newCity" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nueva ciudad';}"></div>
		    					<div><input required type="password" placeholder="Contraseña actual" name="actualPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Contraseña actual';}"></div>		           				
		           				<input type="hidden" name="accion" value="modifyUsuario" />
		           				<div>
		          				</div>
		          			</div>
		          			<input type="submit" name="Submit" class="grey" value="Modificar"/>
		    				<div class="clear"></div>
		    			</form>
    				</div>
    			</div>
    			<br />
                
                <h4 class="title">Tus productos</h4>
                <a href="controlador?accion=visualizarProductosUsuario"> Visualizar productos </a><br>
                <% 
					List<Producto> elementos= new ArrayList<Producto>();
					Object lista = request.getAttribute("listaProductosUsuario");
  					if (lista != null){
						if(lista instanceof List){
		 					elementos = (List<Producto>)lista; %>
							<% 	for(Producto elemento: elementos){ %>
									<p>TITULO: <%=elemento.getTitulo()%>,  PRECIO: <%=elemento.getPrecio()%></p>
  							<%	} %>
					<% } %>	
				<%	} %> <br>
                <h5>¿Quieres publicar un nuevo producto? ¡Rellena el siguiente formulario!</h5>
                <%
                	if(request.getAttribute("publicacionProducto") == "success") { %>
                		<h5 style="color:green;padding:10px;"> Producto publicado con éxito</h5>
                <%	}
                	if(request.getAttribute("publicacionProducto") == "fail") { %>
                		<h5 style="color:red;padding:10px;"> Rellene todos los campos!</h5>
                <%	}  
                	if(request.getAttribute("publicacionProducto") == "failDesc") { %>
                		<h5 style="color:red;padding:10px;"> Descripción demasiado corta!</h5>
                <%	} %> 
                <br />
                <form action="controlador" method="post" name="publishProduct" id="publishProduct-form" enctype="multipart/form-data">
                	<div class="wrap">
  			 			<div class="col_1_of_2 span_1_of_2">
   			 				<div><input required type="text" placeholder="Nombre" name="productName" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Nombre';}"></div>
    						<div><input required type="number" placeholder="Precio" name="productPrice" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Precio';}"></div>
    	 					<br />
    						Selecciona una imagen del producto:
    						<input required type="file" name="fileToUpload" id="fileToUpload">
    						<br /><br />
    					  
    	 					<div class="Eleccion categoria">
								<h4>Elige una Categoría</h4>
								<select name="checkbox" required>
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
				     		<h4>Añade una descripción:</h4>
   	 						<textarea class="Area" rows="4" cols="50" name="productDescription" form="publishProduct-form" maxlength="239" required></textarea>
							<input type="hidden" name="accion" value="publishProducto" /> <br><br>
							<input type="submit" name="Submit" class="grey" value="Publicar"/>
    	 				</div>
    	 			</div>
    				<div class="clear"></div>
    			</form>
    			<br>  
    			
                <h4 class="title">Darse de baja</h4>
                <strong><p style="color:red;"> Una vez tramitada la baja, no se puede dar marcha atrás. </p></strong>
          		<%
                	if(request.getAttribute("eliminacionUsuario") == "profile.jsp") { %>
                		<h5 style="color:red;padding:10px;"> 1 o más campos de comprobación incorrectos</h5>
                <%	} %>    
                <div>
          			<div class="wrap">
    		   			<form action="controlador" method="post" name="delete" id="deleteUser-form">
    			 			<div class="col_1_of_2 span_1_of_2">
		    					<div><input required type="email" placeholder="E-Mail actual" name="delEmail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'E-Mail actual';}"></div>
		    	 			</div>
		    	  			<div class="col_1_of_2 span_1_of_2">	
		    					<div><input required type="password" placeholder="Contraseña actual" name="delPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Contraseña actual';}"></div>		           				
		           				<input type="hidden" name="accion" value="deleteUsuario" />
		           				<div>
		          				</div>
		          			</div>
		          			<input type="submit" name="Submit" class="grey" value="Eliminar"/>
		    				<div class="clear"></div>
		    			</form>
    				</div>
    			</div>
                <br />

                <div class="clear"></div>
            </div>
        </div>
        <div class="footer">
            <div class="footer-middle">
                <div class="wrap">
                    <div class="section group example">
                        <div class="col_1_of_f_1 span_1_of_f_1">
                            <div class="section group example">
                                <div class="col_1_of_f_2 span_1_of_f_2">
                                    <h3>Facebook</h3>
                                    <script>
                                        (function (d, s, id) {
                                            var js,
                                                fjs = d.getElementsByTagName(
                                                    s
                                                )[0];
                                            if (d.getElementById(id)) return;
                                            js = d.createElement(s);
                                            js.id = id;
                                            js.src =
                                                "//connect.facebook.net/en_US/all.js#xfbml=1";
                                            fjs.parentNode.insertBefore(
                                                js,
                                                fjs
                                            );
                                        })(
                                            document,
                                            "script",
                                            "facebook-jssdk"
                                        );
                                    </script>
                                    <div class="like_box">
                                        <div
                                            class="fb-like-box"
                                            data-href="http://www.facebook.com/w3layouts"
                                            data-colorscheme="light"
                                            data-show-faces="true"
                                            data-header="true"
                                            data-stream="false"
                                            data-show-border="true"
                                        ></div>
                                    </div>
                                </div>
                                <div class="col_1_of_f_2 span_1_of_f_2">
                                    <h3>From Twitter</h3>
                                    <div class="recent-tweet">
                                        <div class="recent-tweet-icon">
                                            <span> </span>
                                        </div>
                                        <div class="recent-tweet-info">
                                            <p>
                                                Ds which don't look even
                                                slightly believable. If you are
                                                <a href="#"
                                                    >going to use nibh
                                                    euismod</a
                                                >
                                                tincidunt ut laoreet adipisicing
                                            </p>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="recent-tweet">
                                        <div class="recent-tweet-icon">
                                            <span> </span>
                                        </div>
                                        <div class="recent-tweet-info">
                                            <p>
                                                Ds which don't look even
                                                slightly believable. If you are
                                                <a href="#"
                                                    >going to use nibh
                                                    euismod</a
                                                >
                                                tincidunt ut laoreet adipisicing
                                            </p>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="col_1_of_f_1 span_1_of_f_1">
                            <div class="section group example">
                                <div class="col_1_of_f_2 span_1_of_f_2">
                                    <h3>Information</h3>
                                    <ul class="f-list1">
                                        <li>
                                            <a href="#"
                                                >Duis autem vel eum iriure
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"
                                                >anteposuerit litterarum formas
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"
                                                >Tduis dolore te feugait
                                                nulla</a
                                            >
                                        </li>
                                        <li>
                                            <a href="#"
                                                >Duis autem vel eum iriure
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"
                                                >anteposuerit litterarum formas
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"
                                                >Tduis dolore te feugait
                                                nulla</a
                                            >
                                        </li>
                                    </ul>
                                </div>
                                <div class="col_1_of_f_2 span_1_of_f_2">
                                    <h3>Contact us</h3>
                                    <div class="company_address">
                                        <p>500 Lorem Ipsum Dolor Sit,</p>
                                        <p>22-56-2-9 Sit Amet, Lorem,</p>
                                        <p>USA</p>
                                        <p>Phone:(00) 222 666 444</p>
                                        <p>Fax: (000) 000 00 00 0</p>
                                        <p>
                                            Email:
                                            <span>mail[at]leoshop.com</span>
                                        </p>
                                    </div>
                                    <div class="social-media">
                                        <ul>
                                            <li>
                                                <span
                                                    class="simptip-position-bottom simptip-movable"
                                                    data-tooltip="Google"
                                                    ><a
                                                        href="#"
                                                        target="_blank"
                                                    >
                                                    </a
                                                ></span>
                                            </li>
                                            <li>
                                                <span
                                                    class="simptip-position-bottom simptip-movable"
                                                    data-tooltip="Linked in"
                                                    ><a
                                                        href="#"
                                                        target="_blank"
                                                    >
                                                    </a>
                                                </span>
                                            </li>
                                            <li>
                                                <span
                                                    class="simptip-position-bottom simptip-movable"
                                                    data-tooltip="Rss"
                                                    ><a
                                                        href="#"
                                                        target="_blank"
                                                    >
                                                    </a
                                                ></span>
                                            </li>
                                            <li>
                                                <span
                                                    class="simptip-position-bottom simptip-movable"
                                                    data-tooltip="Facebook"
                                                    ><a
                                                        href="#"
                                                        target="_blank"
                                                    >
                                                    </a
                                                ></span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
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
