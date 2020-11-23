package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import managers.UserManager;
import database.Producto;
import database.Usuario;
import managers.ProductoManager;

/**
 * Servlet implementation class mainController
 */
@WebServlet("/controlador")
@MultipartConfig
public class mainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		if(accion==null){
			accion = "index";
		}
		switch(accion)
		{
			case "index":	
				RequestDispatcher r1 = request.getRequestDispatcher("index.jsp");
				r1.forward(request,response);
				break;
				
			case "usuariosRegistrados":
				UserManager um1 = new UserManager("prueba1");
				List<Usuario> lista1 = um1.findAllUsers();
				request.setAttribute("lista", lista1);
				
				RequestDispatcher r2 = request.getRequestDispatcher("usuariosRegistrados.jsp");
				r2.forward(request,response);
				break;
				
			case "loginUsuario":
				System.out.println("Controlador a logear usuario");
				UserManager lu = new UserManager("prueba1");
				String usuarioToLogin = lu.loginUser(request, response);
				request.setAttribute("inicioUsuario", usuarioToLogin);
				
				RequestDispatcher u1 = request.getRequestDispatcher(usuarioToLogin);
				u1.forward(request,response);
				break;
				
			case "registerUsuario":
				System.out.println("Controlador a registrar usuario");
				UserManager ru = new UserManager("prueba1");
				String usuarioToRegister = ru.registerUser(request, response);
				request.setAttribute("creacionUsuario", usuarioToRegister);
				
				RequestDispatcher r4 = request.getRequestDispatcher(usuarioToRegister);
				r4.forward(request,response);
				break;
			
			case "modifyUsuario":
				System.out.println("Controlador a modificar usuario");
				UserManager mu = new UserManager("prueba1");
				String usuarioToModify = mu.modifyUser(request, response);
				request.setAttribute("modificacionUsuario", usuarioToModify);
				
				RequestDispatcher r5 = request.getRequestDispatcher("profile.jsp");
				r5.forward(request, response);
				break;
				
			case "deleteUsuario":
				System.out.println("Controlador a borrar usuario");
				UserManager du = new UserManager("prueba1");
				String usuarioToDelete = du.deleteUser(request, response);
				request.setAttribute("eliminacionUsuario", usuarioToDelete);
				
				RequestDispatcher rdu = request.getRequestDispatcher(usuarioToDelete);
				rdu.forward(request, response);
				break;
				
			case "logOffUsuario":
				System.out.println("Controlador a cerrar sesión");
				HttpSession currentSession = request.getSession();
				currentSession.invalidate();
				
				RequestDispatcher rlo = request.getRequestDispatcher("index.jsp");
				rlo.forward(request, response);
				break;
				
			case "adminVisualizarUsuarios":
				System.out.println("Controlador a visualizar usuarios por Admin");
				UserManager avu = new UserManager("prueba1");
				List<Usuario> userList = avu.findAllUsers();
				request.setAttribute("listaUsuarios", userList);
				
				RequestDispatcher ar1 = request.getRequestDispatcher("admin.jsp");
				ar1.forward(request, response);
				break;
				
			case "adminModifyUsuario":
				System.out.println("Controlador a modificar usuario por Admin");
				UserManager amu = new UserManager("prueba1");
				String adminUsuarioToModify = amu.adminModifyUser(request, response);
				request.setAttribute("adminModificacionUsuario", adminUsuarioToModify);
				
				RequestDispatcher ar2 = request.getRequestDispatcher("admin.jsp");
				ar2.forward(request, response);
				break;
				
			case "adminDeleteUsuario":
				System.out.println("Controlador a borrar usuario por Admin");
				UserManager adu = new UserManager("prueba1");
				String adminUsuarioToDelete = adu.adminDeleteUser(request, response);
				request.setAttribute("adminEliminacionUsuario", adminUsuarioToDelete);
				
				RequestDispatcher ar3 = request.getRequestDispatcher("admin.jsp");
				ar3.forward(request, response);
				break;
			
			case "adminVisualizarProductos":
				System.out.println("Controlador a visualizar productos por Admin");
				ProductoManager avp = new ProductoManager("prueba1");
				List<Producto> productList = avp.mostrarTodos();
				request.setAttribute("listaProductosAdmin", productList);
				
				RequestDispatcher ar4 = request.getRequestDispatcher("admin.jsp");
				ar4.forward(request, response);
				break;
				
			case "adminModifyProducto":
				System.out.println("Controlador a modificar productos por Admin");
				ProductoManager amp = new ProductoManager("prueba1");
				String adminProductoToModify = amp.adminModifyProduct(request, response);
				request.setAttribute("adminModificacionProducto", adminProductoToModify);
				
				RequestDispatcher ar5 = request.getRequestDispatcher("admin.jsp");
				ar5.forward(request, response);
				break;
				
			case "adminDeleteProducto":
				System.out.println("Controlador a borrar productos por Admin");
				ProductoManager adp = new ProductoManager("prueba1");
				String adminProductoToDelete = adp.adminDeleteProduct(request, response);
				request.setAttribute("adminEliminacionProducto", adminProductoToDelete);
				
				RequestDispatcher ar6 = request.getRequestDispatcher("admin.jsp");
				ar6.forward(request, response);
				break;
				
			case "publishProducto":
				System.out.println("Controlador a publicar producto");
				ProductoManager pp = new ProductoManager("prueba1");
				String productoToPublish = pp.publishProduct(request, response);
				request.setAttribute("publicacionProducto", productoToPublish);
				
				RequestDispatcher ppr = request.getRequestDispatcher("profile.jsp");
				ppr.forward(request,response);
				break;
				
			case "modifyProducto":
				System.out.println("Controlador a modificar producto");
				ProductoManager mp = new ProductoManager("prueba1");
				String productoToModify = mp.modifyProduct(request, response);
				request.setAttribute("modificacionProducto", productoToModify);
				
				RequestDispatcher mpr = request.getRequestDispatcher("profile.jsp");
				mpr.forward(request, response);
				break;
				
			case "deleteProducto":
				System.out.println("Controlador a eliminar producto");
				ProductoManager dp = new ProductoManager("prueba1");
				String productoToDelete = dp.deleteProduct(request, response);
				request.setAttribute("eliminacionProducto", productoToDelete);
				
				RequestDispatcher dpr = request.getRequestDispatcher("profile.jsp");
				dpr.forward(request, response);
				break;
			
			case "visualizarProductosUsuario":
				System.out.println("Controlador a visualizar productos para usuario");
				ProductoManager vpu = new ProductoManager("prueba1");
				List<Producto> productListUser = vpu.buscarPorUsuario(request, response);
				request.setAttribute("listaProductosUsuario", productListUser);
				
				RequestDispatcher vpr = request.getRequestDispatcher("profile.jsp");
				vpr.forward(request,response);
				break;
				
			case "principal":
				System.out.println("Controlador a mostrar productos en index");
				ProductoManager p0 = new ProductoManager("prueba1");
				List<Producto> plista0=p0.mostrarTodos();
				request.setAttribute("lista", plista0);
				
				RequestDispatcher pr0 = request.getRequestDispatcher("index.jsp");
				pr0.forward(request,response);
				break;
				
			case "paginaBuscador":
				System.out.println("Controlador a buscador");
				RequestDispatcher p1 = request.getRequestDispatcher("paginaBuscador.jsp");
				p1.forward(request,response);
				break;
				
			case "paginaBuscadorFiltros":
				System.out.println("Controlador a buscador con filtros");
				RequestDispatcher p2 = request.getRequestDispatcher("paginaBuscadorFiltros.jsp");
				p2.forward(request,response);
				break;
				
			case "mostrarTodos":
				System.out.println("Controlador a mostrar todos los productos");
				ProductoManager pm1 = new ProductoManager("prueba1");
				List<Producto> plista1=pm1.mostrarTodos();
				request.setAttribute("lista", plista1);
				
				RequestDispatcher pr1 = request.getRequestDispatcher("paginaBuscador.jsp");
				pr1.forward(request,response);
				break;
			
			case "buscarSencillo":
				System.out.println("Controlador a buscar con el buscador sencillo");
				ProductoManager pm2 = new ProductoManager("prueba1");
				List<Producto> plista2=pm2.buscarSencillo(request.getParameter("consulta"));
				request.setAttribute("lista", plista2);
				
				RequestDispatcher pr2 = request.getRequestDispatcher("paginaBuscador.jsp");
				pr2.forward(request,response);
				break;
				
			case "buscarAvanzado":
				System.out.println("Controlador a buscar con el buscador avanzado");
				ProductoManager pm3 = new ProductoManager("prueba1");
				List<Producto> plista3=pm3.buscarAvanzado(request.getParameter("consulta"));
				request.setAttribute("lista", plista3);
				
				RequestDispatcher pr3 = request.getRequestDispatcher("paginaBuscador.jsp");
				pr3.forward(request,response);
				break;
				
			case "buscarAvanzadoFiltro":
				System.out.println("Controlador a buscar con el buscador avanzado + filtros");
				ProductoManager pm4 = new ProductoManager("prueba1");
				List<Producto> plista4=pm4.buscarAvanzadoFiltro(request.getParameter("Fconsulta"), request.getParameter("Fcategoria"),
						Integer.parseInt(request.getParameter("precioMinimo")), Integer.parseInt(request.getParameter("precioMaximo")));
				request.setAttribute("lista", plista4);
				
				RequestDispatcher pr4 = request.getRequestDispatcher("paginaBuscadorFiltros.jsp");
				pr4.forward(request,response);
				break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
