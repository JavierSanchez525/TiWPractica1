package database;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the usuario database table.
 * 
 */
@Entity
@Table(name="usuario")
@NamedQueries({
	@NamedQuery(name="Usuario.findAllUsers", query="SELECT u FROM Usuario u"),
	@NamedQuery(name="Usuario.findUsersBySimilarName", query="SELECT i FROM Usuario i where i.nombre LIKE :nombre") })
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false, length=45)
	private String email;

	@Column(nullable=false, length=45)
	private String apellido;

	@Column(nullable=false, length=45)
	private String ciudad;

	@Column(nullable=false)
	private byte isAdmin;

	@Column(nullable=false, length=45)
	private String nombre;

	@Column(nullable=false, length=45)
	private String password;

	//bi-directional many-to-one association to Producto
	@OneToMany(mappedBy="vendedor")
	private List<Producto> productos1;

	//bi-directional many-to-one association to Producto
	@OneToMany(mappedBy="comprador")
	private List<Producto> productos2;

	public Usuario() {
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getApellido() {
		return this.apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getCiudad() {
		return this.ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	
	public byte getIsAdmin() {
		return this.isAdmin;
	}

	public void setIsAdmin(byte isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// Movidas de vendedor
	public List<Producto> getProductos1() {
		return this.productos1;
	}

	public void setProductos1(List<Producto> productos1) {
		this.productos1 = productos1;
	}

	public Producto addProductos1(Producto productos1) {
		getProductos1().add(productos1);
		productos1.setVendedor(this);

		return productos1;
	}

	public Producto removeProductos1(Producto productos1) {
		getProductos1().remove(productos1);
		productos1.setVendedor(null);

		return productos1;
	}

	// Movidas de comprador
	public List<Producto> getProductos2() {
		return this.productos2;
	}

	public void setProductos2(List<Producto> productos2) {
		this.productos2 = productos2;
	}

	public Producto addProductos2(Producto productos2) {
		getProductos2().add(productos2);
		productos2.setComprador(this);

		return productos2;
	}

	public Producto removeProductos2(Producto productos2) {
		getProductos2().remove(productos2);
		productos2.setComprador(null);

		return productos2;
	}

}