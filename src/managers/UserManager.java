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
			return "login.jsp";
		} else {
			Usuario user = (Usuario)query.getSingleResult();
			
			HttpSession session = request.getSession(true);
	        session.setAttribute("email", user.getEmail());
	        session.setAttribute("nombre", user.getNombre());
	        session.setAttribute("apellido", user.getApellido());
	        session.setAttribute("ciudad", user.getCiudad());
	        session.setAttribute("password", user.getPassword());
	        int varAdmin = (int)user.getIsAdmin();
	        if(varAdmin == 1) {
	        	session.setAttribute("isAdmin", user.getIsAdmin());
	        } else {
	        	return "index.jsp";
	        }
	        
	        return "index.jsp";
		}	
	}
	
	public String registerUser(HttpServletRequest request, HttpServletResponse response) {
		EntityManager em = emf.createEntityManager();
		
		String email = request.getParameter("email");
		Usuario user = em.find(Usuario.class, email);
		
		if(user != null) {
			return "register.jsp";
		} else {
			Usuario newUser = new Usuario();
			
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String city = request.getParameter("city");
			
			newUser.setEmail(email);
			newUser.setPassword(password);
			newUser.setNombre(name);
			newUser.setApellido(surname);
			newUser.setCiudad(city);
			//newUser.setIsAdmin((byte)0);
			
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
			
			return "login.jsp";
		}

	}
	
	public String modifyUser(HttpServletRequest request, HttpServletResponse response) {
		EntityManager em = emf.createEntityManager();
		HttpSession currentSession = request.getSession();
		
		String sessionPass = (String)currentSession.getAttribute("password");
		String sessionEmail = (String)currentSession.getAttribute("email");
		
		String currentPass = request.getParameter("actualPassword");
		String currentEmail = request.getParameter("actualEmail");
		
		if (sessionPass.equals(currentPass) && sessionEmail.equals(currentEmail)){
			Usuario user = em.find(Usuario.class, currentSession.getAttribute("email"));
			
			String password = request.getParameter("newPassword");
			String name = request.getParameter("newName");
			String surname = request.getParameter("newSurname");
			String city = request.getParameter("newCity");
	
			//System.out.println("newPassword: " + password + ", newName: " + name + ", newSurname: " + surname + ", newCity: " + city);
			
			try {
				em.getTransaction().begin();
			
				if(!password.isEmpty()) {
					user.setPassword(password);
					currentSession.setAttribute("password", password);
				}
				if(!name.isEmpty()) {
					user.setNombre(name);
					currentSession.setAttribute("nombre", name);
				}
				if(!surname.isEmpty()) {
					user.setApellido(surname);
					currentSession.setAttribute("apellido", surname);
				}
				if(!city.isEmpty()) {
					user.setCiudad(city);
					currentSession.setAttribute("ciudad", city);
				}
				//System.out.println("PasswordAttribute:" + currentSession.getAttribute("password") + ", NameAttribute:" + currentSession.getAttribute("nombre") + ", SurnameAttribute:" + currentSession.getAttribute("apellido"));

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
			
			return "success";
			
		} else {
			return "fail";
		}
	}
	
	public String deleteUser(HttpServletRequest request, HttpServletResponse response) {
		EntityManager em = emf.createEntityManager();
		HttpSession currentSession = request.getSession();
		
		String sessionPass = (String)currentSession.getAttribute("password");
		String sessionEmail = (String)currentSession.getAttribute("email");
		
		String currentPass = request.getParameter("delPassword");
		String currentEmail = request.getParameter("delEmail");
		
		if (sessionPass.equals(currentPass) && sessionEmail.equals(currentEmail)){
			Usuario user = em.find(Usuario.class, currentSession.getAttribute("email"));
			currentSession.invalidate();
			
			try {
				em.getTransaction().begin();
				em.remove(user);
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
			
			return "index.jsp";
			
		} else {
			return "profile.jsp";
		}
	}
	
	/*---------------- Admin thingies ------------------*/
	
	public String adminModifyUser(HttpServletRequest request, HttpServletResponse response) {
		EntityManager em = emf.createEntityManager();
		HttpSession currentSession = request.getSession();
		
		String adminPass = request.getParameter("adminPassword");
		String sessionPass = (String)currentSession.getAttribute("password");
		
		String userEmail = request.getParameter("userEmail");
		Usuario user = em.find(Usuario.class, userEmail);
		
		if (sessionPass.equals(adminPass) && user != null){
			
			String password = request.getParameter("newPassword");
			String name = request.getParameter("newName");
			String surname = request.getParameter("newSurname");
			String city = request.getParameter("newCity");
				
			try {
				em.getTransaction().begin();
			
				if(!password.isEmpty()) {
					user.setPassword(password);
					currentSession.setAttribute("password", password);
				}
				if(!name.isEmpty()) {
					user.setNombre(name);
					currentSession.setAttribute("nombre", name);
				}
				if(!surname.isEmpty()) {
					user.setApellido(surname);
					currentSession.setAttribute("apellido", surname);
				}
				if(!city.isEmpty()) {
					user.setCiudad(city);
					currentSession.setAttribute("ciudad", city);
				}
				//System.out.println("PasswordAttribute:" + currentSession.getAttribute("password") + ", NameAttribute:" + currentSession.getAttribute("nombre") + ", SurnameAttribute:" + currentSession.getAttribute("apellido"));

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
			
			return "success";
			
		} else {
			return "fail";
		}
	}
	
	public String adminDeleteUser(HttpServletRequest request, HttpServletResponse response) {
		EntityManager em = emf.createEntityManager();
		HttpSession currentSession = request.getSession();
		
		String adminPass = request.getParameter("adminPassword");
		String sessionPass = (String)currentSession.getAttribute("password");
		
		String userEmail = request.getParameter("userEmail");
		Usuario user = em.find(Usuario.class, userEmail);
		
		if (sessionPass.equals(adminPass) && user != null){
			try {
				em.getTransaction().begin();
				em.remove(user);
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
			
			return "success";
			
		} else {
			return "fail";
		}
	}
	
}
