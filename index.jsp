<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page import="java.util.List,java.util.ArrayList,database.*;" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Free Leoshop Website Template | Home :: w3layouts</title>
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
            href="css/form.css"
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
        <!--start slider -->
        <link rel="stylesheet" href="css/fwslider.css" media="all" />
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/css3-mediaqueries.js"></script>
        <script src="js/fwslider.js"></script>
        <!--end slider -->
        <script src="js/jquery.easydropdown.js"></script>
    </head>
    <body>
        <div class="header-top">
            <div class="wrap">
                <div class="cssmenu">
                    <ul>
                        <li class="active"><a href="login.html">Account</a></li>
                        |
                        <li><a href="checkout.html">Checkout</a></li>
                        |
                        <li><a href="login.html">Log In</a></li>
                        |
                        <li><a href="register.html">Sign Up</a></li>
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
                                <a class="color6" href="other.html">Accesorios</a>
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
                        <form action="controlador" method="post" >
						<input class="textbox" type="hidden" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}" name="accion" value="paginaBuscador">
    					<div class="letrasChulis2"><a href="paginaBuscador.jsp" style="color:rgb(131,131,131);">Buscador</a></div>
    					<input type="submit" value="Buscar" name="submit" style="float:right;">
						</form>
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
        <!-- start slider -->
        <div id="fwslider">
            <div class="slider_container">
                <div class="slide">
                    <!-- Slide image -->
                    <img src="images/banner.jpg" alt="" />
                    <!-- /Slide image -->
                    <!-- Texts container -->
                    <div class="slide_content">
                        <div class="slide_content_wrap">
                            <!-- Text title -->
                            <h4 class="title">Aluminium Club</h4>
                            <!-- /Text title -->

                            <!-- Text description -->
                            <p class="description">Experiance ray ban</p>
                            <!-- /Text description -->
                        </div>
                    </div>
                    <!-- /Texts container -->
                </div>
                <!-- /Duplicate to create more slides -->
                <div class="slide">
                    <img src="images/banner1.jpg" alt="" />
                    <div class="slide_content">
                        <div class="slide_content_wrap">
                            <h4 class="title">consectetuer adipiscing</h4>
                            <p class="description">diam nonummy nibh euismod</p>
                        </div>
                    </div>
                </div>
                <!--/slide -->
            </div>
            <div class="timers"></div>
            <div class="slidePrev"><span></span></div>
            <div class="slideNext"><span></span></div>
        </div>
        <!--/slider -->
        <div class="main">
            <div class="wrap">
                <div class="section group">
                    <div class="cont span_2_of_3">
                        <h2 class="head">Featured Products</h2>
                        <div class="letrasChulis"><a href="controlador?accion=principal">Ver todos los productos</a> </div> 
                        <div class="clear"></div>
                        <%for (int i = 0; i < 3; i++){ %>
        				<div class="top-box">
       
        <% 
		List<Producto> elementos= new ArrayList<Producto>();
		Object lista = request.getAttribute("lista");
  		if (lista != null){
			if(lista instanceof List){
		 	elementos = (List<Producto>)lista;
				for(Producto elemento: elementos){ %>
                            <div class="col_1_of_3 span_1_of_3">
                                <a href="single.html">
                                    <div class="inner_content clearfix">
                                        <div class="product_image">
                                            <img src="images/pic.jpg" alt="" />
                                        </div>
                                        <div class="price">
                                            <div class="cart-left">
                                                <p class="title">
                                                   <%=elemento.getTitulo() %>
                                                </p>
                                                <div class="price1">
                                                    <span class="actual"><%=elemento.getPrecio()%>.00$</span>
                                                </div>
                                            </div>
                                            <div class="cart-right"></div>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            </div>
                            <div class="clear"></div>
                        
		<% }
	}
}%>
<%} %>
        
                        
                        
                           
                        </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
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
