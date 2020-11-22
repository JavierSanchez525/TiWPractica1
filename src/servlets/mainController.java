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
			
			/*
			case "consultaUsuariosBBDD":
				UserManager um2 = new UserManager("prueba1");
				List<Usuario> lista2=um2.findUsersBySimilarName(request.getParameter("palabra"));
				request.setAttribute("lista", lista2);
				
				RequestDispatcher r3 = request.getRequestDispatcher("usuariosRegistrados.jsp");
				r3.forward(request,response);
				break;
			*/
				
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
			
			case "mostrarTodos":
				ProductoManager pm1 = new ProductoManager("prueba1");
				List<Producto> plista1=pm1.mostrarTodos();
				request.setAttribute("lista", plista1);
				RequestDispatcher pr1 = request.getRequestDispatcher("productosRegistrados.jsp");
				pr1.forward(request,response);
				break;

			case "buscarSencillo":
				ProductoManager pm2 = new ProductoManager("prueba1");
				List<Producto> plista2=pm2.buscarSencillo(request.getParameter("consulta"));
				request.setAttribute("lista", plista2);
				RequestDispatcher pr2 = request.getRequestDispatcher("productosRegistrados.jsp");
				pr2.forward(request,response);
				break;

			case "buscarAvanzado":
				ProductoManager pm3 = new ProductoManager("prueba1");
				List<Producto> plista3=pm3.buscarAvanzado(request.getParameter("consulta"));
				request.setAttribute("lista", plista3);
				RequestDispatcher pr3 = request.getRequestDispatcher("productosRegistrados.jsp");
				pr3.forward(request,response);
				break;

			case "buscarAvanzadoFiltro":
				ProductoManager pm4 = new ProductoManager("prueba1");
				List<Producto> plista4=pm4.buscarAvanzadoFiltro(request.getParameter("Fconsulta"), request.getParameter("Fcategoria"),
						request.getParameter("Fvendedor"), request.getParameter("Ftitulo"), request.getParameter("Fdescripcion"),
						Integer.parseInt(request.getParameter("precioMinimo")), Integer.parseInt(request.getParameter("precioMaximo")));
				request.setAttribute("lista", plista4);
				RequestDispatcher pr4 = request.getRequestDispatcher("productosRegistrados.jsp");
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
