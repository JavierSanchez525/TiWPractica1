package database;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the producto database table.
 * 
 */
@Entity
@Table(name="producto")
@NamedQueries({
	@NamedQuery(name="Producto.mostrarTodos", query="SELECT i FROM Producto i"),
	
	@NamedQuery(name="Producto.buscarSencillo", query="SELECT i FROM Producto i where i.titulo LIKE :consulta "
			+ "OR i.descripcion LIKE :consulta"),
	
	@NamedQuery(name="Producto.buscarAvanzado", query="SELECT i FROM Producto i where i.id LIKE :consulta "
			+ "OR i.fechaCompra LIKE :consulta OR i.titulo LIKE :consulta OR i.categoria LIKE :consulta "
			+ "OR i.descripcion LIKE :consulta")// OR i.comprador LIKE :consulta OR i.vendedor LIKE :consulta")
	 })
public class Producto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false, length=45)
	private String categoria;

	@Column(nullable=false, length=240)
	private String descripcion;

	@Temporal(TemporalType.DATE)
	private Date fechaCompra;

	@Lob
	@Column(nullable=false)
	private byte[] imagen;

	@Column(nullable=false, length=30)
	private int precio;

	@Column(nullable=false, length=100)
	private String titulo;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="vendedor", nullable=false)
	private Usuario vendedor;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="comprador")
	private Usuario comprador;

	public Producto() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategoria() {
		return this.categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Date getFechaCompra() {
		return this.fechaCompra;
	}

	public void setFechaCompra(Date fechaCompra) {
		this.fechaCompra = fechaCompra;
	}

	public byte[] getImagen() {
		return this.imagen;
	}

	public void setImagen(byte[] imagen) {
		this.imagen = imagen;
	}

	public int getPrecio() {
		return this.precio;
	}

	public void setPrecio(int precio) {
		this.precio = precio;
	}

	public String getTitulo() {
		return this.titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Usuario getVendedor() {
		return this.vendedor;
	}

	public void setVendedor(Usuario vendedor) {
		this.vendedor = vendedor;
	}

	public Usuario getComprador() {
		return this.comprador;
	}

	public void setComprador(Usuario comprador) {
		this.comprador = comprador;
	}

}