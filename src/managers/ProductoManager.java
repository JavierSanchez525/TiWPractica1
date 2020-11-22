package managers;

import java.util.List;
import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import javax.servlet.annotation.MultipartConfig;


import java.io.InputStream;
import database.Producto;
import database.Usuario;
import managers.ProductoManager;

@MultipartConfig
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
	
	// Publicar productos
	public String publishProduct(HttpServletRequest request, HttpServletResponse response) {
		EntityManager em = emf.createEntityManager();

		String titulo = request.getParameter("productName");
		int precio = Integer.parseInt(request.getParameter("productPrice"));
		String categoria = request.getParameter("checkbox");
		String descripcion = request.getParameter("productDescription");
			
		System.out.println("titulo: " + titulo + ", precio: " + precio + ", categoria: " + categoria + ", descripcion: " + descripcion + descripcion.length());
		    
		byte[] data = null;
		try {
			Part filePart = request.getPart("fileToUpload");
			data = new byte[(int) filePart.getSize()];
			filePart.getInputStream().read(data, 0, data.length);
		}catch(ServletException e) {
			return "fail";
		}catch(IOException e) {
			return "fail";
		}
			
		if(descripcion.length() <= 10) {
			System.out.println("Fallo al meter producto, descripción muy corta");
			return "failDesc";
		}
		if(categoria == null) {
			System.out.println("Fallo al meter producto, categoría null");
				return "fail";
		} else {		
			HttpSession currentSession = request.getSession();
			Usuario vendor = em.find(Usuario.class, currentSession.getAttribute("email"));
			
			Producto p = new Producto();
			p.setTitulo(titulo);
			p.setPrecio(precio);
			p.setCategoria(categoria);
			p.setImagen(data);
			p.setDescripcion(descripcion);
			p.setVendedor(vendor);
	        
			vendor.addProductos1(p);
	        
			try {
				em.getTransaction().begin();
				em.persist(p);
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
		}
	}
	
	//Mostrar todos los productos
	@SuppressWarnings("unchecked")
	public List<Producto> buscarPorUsuario(HttpServletRequest request, HttpServletResponse response) {
		List<Producto> resultado;
		EntityManager em = emf.createEntityManager();
		
		HttpSession currentSession = request.getSession();
		Usuario vendor = em.find(Usuario.class, currentSession.getAttribute("email"));
		
		try {
			Query query = em.createNamedQuery("Producto.buscarPorUsuario",Producto.class);
			query.setParameter("vendedor", vendor);
			resultado = query.getResultList();
		} finally {
			em.close();
		}
		return resultado;

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
