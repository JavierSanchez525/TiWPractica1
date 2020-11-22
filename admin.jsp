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
		          			<input type="submit" name="Submit" class="grey" value="Modificar"/>
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
		          			<input type="submit" name="Submit" class="grey" value="Eliminar"/>
		    				<div class="clear"></div>
		    			</form>
    				</div>
    			</div>
                <br />
                
                <h4 class="title">Tus productos</h4>
                <p>boi</p>

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
