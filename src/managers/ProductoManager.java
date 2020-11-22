package managers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import database.Usuario;
import database.Producto;


public class ProductoManager {
	
	private EntityManagerFactory emf;
	
	public ProductoManager(String unidadDePersistencia) {
		emf = Persistence.createEntityManagerFactory(unidadDePersistencia);
	}
	
	public ProductoManager(EntityManagerFactory factory)
	{
		emf = factory;
	}
	
	public String createPorducto(Producto producto) {
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(producto);
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
	
	//Mostrar todos los productos
	@SuppressWarnings("unchecked")
	public List<Producto> mostrarTodos() {
		List<Producto> resultado;
		EntityManager em = emf.createEntityManager();
		try {
			Query query = em.createNamedQuery("Producto.mostrarTodos",Producto.class);
			resultado = query.getResultList();
		} finally {
			em.close();
		}
		return resultado;

	}
	
	//Buscador en modo sencillo
	@SuppressWarnings("unchecked")
	public List<Producto> buscarSencillo(String consulta) {
		List<Producto> resultado;
		EntityManager em = emf.createEntityManager();
		try {
			Query query = em.createNamedQuery("Producto.buscarSencillo",Producto.class);
			// Atención: Se necesita agregar el % porque se usa una consulta con like
			query.setParameter("consulta", "%"+consulta+"%");
			resultado = query.getResultList();
		} finally {
			em.close();
		}
		return resultado;

	}
	
	//Buscador en modo avanzado sin filtros
		@SuppressWarnings("unchecked")
		public List<Producto> buscarAvanzado(String consulta) {
			List<Producto> resultado;
			EntityManager em = emf.createEntityManager();
			try {
				Query query = em.createNamedQuery("Producto.buscarAvanzado",Producto.class);
				query.setParameter("consulta", "%"+consulta+"%");
				resultado = query.getResultList();
			} finally {
				em.close();
			}
			return resultado;

		}
	
	
	//Buscador en modo avanzado con filtros
	@SuppressWarnings("unchecked")
	public List<Producto> buscarAvanzadoFiltro(String Fconsulta, String Fcategoria, int precioMinimo, int precioMaximo) {
		List<Producto> resultado;
		EntityManager em = emf.createEntityManager();
		System.out.println(Fconsulta);
		System.out.println(Fcategoria);
		System.out.println(precioMinimo);
		System.out.println(precioMaximo);
		
		try {
			
			Query query = em.createNamedQuery("Producto.buscarAvanzadoFiltro", Producto.class);
			query.setParameter("Fconsulta", "%"+Fconsulta+"%");
			query.setParameter("Fcategoria", Fcategoria);
			query.setParameter("precioMinimo", precioMinimo);
			query.setParameter("precioMaximo", precioMaximo);
			resultado = query.getResultList();
		} finally {
			em.close();
		}
		return resultado;

	}
	
}
