package managers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

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
		return "";
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

}
