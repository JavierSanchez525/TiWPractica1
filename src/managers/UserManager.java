package managers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Usuario;
import database.Producto;

public class UserManager {

	private EntityManagerFactory emf;
	
	public UserManager(String unidadDePersistencia)
	{
		emf = Persistence.createEntityManagerFactory(unidadDePersistencia);
	}
	
	public UserManager(EntityManagerFactory factory)
	{
		emf = factory;
	}
	
	public String createUser(Usuario usuario) {
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(usuario);
			em.getTransaction().commit();
		} catch (Exception ex) {
			try {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
			} catch (Exception e) {
				ex.printStackTrace();
				throw e;
			}
			throw ex;
		} finally {
			em.close();
		}
		return "login.html";
	}
	
	// Esta anotación es para quitar el warning avisandonos que es está
	// haciendo una conversión de List a List<Usuario> y puede no ser válida
	@SuppressWarnings("unchecked")
	public List<Usuario> findAllUsers() {
		List<Usuario> resultado;
		EntityManager em = emf.createEntityManager();
		try {
			Query query = em.createNamedQuery("Usuario.findAllUsers", Usuario.class);
			resultado = query.getResultList();
		} finally {
			em.close();
		}
		return resultado;
	}
	
	// Esta anotación es para quitar el warning avisandonos que es está
	// haciendo una conversión de List a List<Usuario> y puede no ser válida
	@SuppressWarnings("unchecked")
	public List<Usuario> findUsersBySimilarName(String nombre) {
		List<Usuario> resultado;
		EntityManager em = emf.createEntityManager();
		try {
			Query query = em.createNamedQuery("Usuario.findUsersBySimilarName",Usuario.class);
			// Atención: Se necesita agregar el % porque se usa una consulta con like (buscar en google)
			query.setParameter("nombre","%"+nombre+"%");
			resultado = query.getResultList();
		} finally {
			em.close();
		}
		return resultado;
	}
	
	@SuppressWarnings("unchecked")
	public String loginUser(HttpServletRequest request, HttpServletResponse response) {
		EntityManager em = emf.createEntityManager();

		String email = request.getParameter("loginEmail");
		String password = request.getParameter("loginPassword");
		
		Query query = em.createNamedQuery("Usuario.findUserLogin",Usuario.class);
		query.setParameter("email", email);
		query.setParameter("password", password);
		
		List<Usuario> listaUsers = query.getResultList();
		
		if(listaUsers.isEmpty()) {
			return "login.html";
		} else {
			Usuario user = (Usuario)query.getSingleResult();
			
			HttpSession session = request.getSession(true);
	        session.setAttribute("email", user.getEmail());
	        session.setAttribute("nombre", user.getNombre());
	        session.setAttribute("apellido", user.getApellido());
	        session.setAttribute("ciudad", user.getCiudad());
	        session.setAttribute("password", user.getPassword());
	        
	        return "index.jsp";
		}	
	}
	
	@SuppressWarnings("unchecked")
	public String registerUser(HttpServletRequest request, HttpServletResponse response) {
		EntityManager em = emf.createEntityManager();

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Query query = em.createNamedQuery("Usuario.findUserLogin",Usuario.class);
		query.setParameter("email", email);
		query.setParameter("password", password);
		System.out.println("RegEmail: " + email + ", " + "RegPass: " + password);
		
		List<Usuario> listaUsers = query.getResultList();
		
		if(listaUsers.isEmpty()) {
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String city = request.getParameter("city");
			
			Usuario newUser = new Usuario();
			
			newUser.setEmail(email);
			newUser.setPassword(password);
			newUser.setNombre(name);
			newUser.setApellido(surname);
			newUser.setCiudad(city);
			//newUser.setIsAdmin((byte)0);
			
			System.out.println("Nombre: " + name + ", " + "Apellido: " + surname);
			
			try {
				em.getTransaction().begin();
				em.persist(newUser);
				em.getTransaction().commit();
			} catch (Exception ex) {
				try {
					if (em.getTransaction().isActive()) {
						em.getTransaction().rollback();
					}
				} catch (Exception ex2) {
					ex.printStackTrace();
					throw ex2;
				}
				throw ex;
			} finally {
				em.close();
			}
			
			return "login.html";
			
			
		} else {
	        return "register.html";
		}	
	}
	
	@SuppressWarnings("unchecked")
	public String modifyUser(HttpServletRequest request, HttpServletResponse response) {
			
		return "";
	}
}
