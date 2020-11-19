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
				UserManager um1 = new UserManager("prueba2");
				List<Usuario> lista1 = um1.findAllUsers();
				request.setAttribute("lista", lista1);
				
				RequestDispatcher r2 = request.getRequestDispatcher("usuariosRegistrados.jsp");
				r2.forward(request,response);
				break;
				
			case "consultaUsuariosBBDD":
				UserManager um2 = new UserManager("prueba2");
				List<Usuario> lista2=um2.findUsersBySimilarName(request.getParameter("palabra"));
				request.setAttribute("lista", lista2);
				
				RequestDispatcher r3 = request.getRequestDispatcher("usuariosRegistrados.jsp");
				r3.forward(request,response);
				break;
				
			case "paginaBuscador":
				RequestDispatcher p1 = request.getRequestDispatcher("paginaBuscador.jsp");
				p1.forward(request,response);
				break;
				
			case "mostrarTodos":
				ProductoManager pm1 = new ProductoManager("prueba2");
				List<Producto> plista1=pm1.mostrarTodos();
				request.setAttribute("lista", plista1);
				RequestDispatcher pr1 = request.getRequestDispatcher("paginaBuscador.jsp");
				pr1.forward(request,response);
				break;
			
			case "buscarSencillo":
				ProductoManager pm2 = new ProductoManager("prueba2");
				List<Producto> plista2=pm2.buscarSencillo(request.getParameter("consulta"));
				request.setAttribute("lista", plista2);
				RequestDispatcher pr2 = request.getRequestDispatcher("paginaBuscador.jsp");
				pr2.forward(request,response);
				break;
				
			case "buscarAvanzado":
				ProductoManager pm3 = new ProductoManager("prueba2");
				List<Producto> plista3=pm3.buscarAvanzado(request.getParameter("consulta"));
				request.setAttribute("lista", plista3);
				RequestDispatcher pr3 = request.getRequestDispatcher("paginaBuscador.jsp");
				pr3.forward(request,response);
				break;
				
			case "buscarAvanzadoFiltro":
				ProductoManager pm4 = new ProductoManager("prueba2");
				List<Producto> plista4=pm4.buscarAvanzadoFiltro(request.getParameter("Fconsulta"), request.getParameter("Fcategoria"),
						request.getParameter("Fvendedor"), request.getParameter("Ftitulo"), request.getParameter("Fdescripcion"),
						Integer.parseInt(request.getParameter("precioMinimo")), Integer.parseInt(request.getParameter("precioMaximo")));
				request.setAttribute("lista", plista4);
				RequestDispatcher pr4 = request.getRequestDispatcher("paginaBuscador.jsp");
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
