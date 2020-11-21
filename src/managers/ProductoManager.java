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
	public List<Producto> buscarAvanzadoFiltro(String Fconsulta, String Fcategoria, String precioMinimo, String precioMaximo) {
		List<Producto> resultado;
		EntityManager em = emf.createEntityManager();
		int FprecioMinimo = Integer.parseInt(precioMinimo);
		int FprecioMaximo = Integer.parseInt(precioMaximo);
		try {
			
			Query query = em.createQuery("SELECT i FROM Producto i WHERE (categoria LIKE concat('%', :Fcategoria, '%')) "
					+ "AND (:FprecioMinimo is NULL OR precio >= :FprecioMinimo) "
					+ "AND (:FprecioMaximo is NULL OR precio <= :FprecioMaximo) AND (i.id LIKE concat('%', :Fconsulta, '%') " 
					+ "OR i.vendedor LIKE concat('%', :Fconsulta, '%') OR i.titulo LIKE concat('%', :Fconsulta, '%') OR i.categoria LIKE concat('%', :Fconsulta, '%') "
					+ "OR i.descripcion LIKE concat('%', :Fconsulta, '%') OR i.comprador LIKE concat('%', :Fconsulta, '%'))");
			resultado = query.getResultList();
		} finally {
			em.close();
		}
		return resultado;

	}
	
}
