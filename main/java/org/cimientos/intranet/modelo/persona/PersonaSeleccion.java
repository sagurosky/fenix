package org.cimientos.intranet.modelo.persona;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.Provincia;

import com.cimientos.intranet.enumerativos.EstadoCivil;
import com.cimientos.intranet.enumerativos.TipoDni;
import org.cimientos.intranet.utils.Formateador;


/**
 * The Class PersonaSeleccion.
 */
@Entity
public class PersonaSeleccion {


	/** The id persona. */
	@Id
	@GeneratedValue
	private Long id;

	

	/** The nombre. */
	private String nombre;

	/** The apellido. */
	private String apellido;

	private String barrio;
	
	/** The tipo dni. */
	private TipoDni tipoDni;
	
	/** The dni. */
	private Integer dni;

	/** The cuil cuit. */
	private String cuilCuit;

	/** The direccion. */
	private String direccion;
	
	/** The departamento. */
	private String departamento;
	

	/** The codigo postal. */
	private String codigoPostal;

	/** The telefono. */
	private String telefono;

	/** The celular. */
	private String celular;

	
	
	/** The fecha nacimiento. */
	private Date fechaNacimiento;

	/** true = femenino, false masculino. */
	private boolean sexo;

	/** The estado civil. */
	@Enumerated(EnumType.ORDINAL)
	private EstadoCivil estadoCivil;

	/** The mail. */
	private String mail;

	/** The localidad. */
	@ManyToOne
	private Localidad localidad;
	
	/** The entre calles. */
	private String entreCalles;
	
	/** The provincia. */
	@ManyToOne
	private Provincia provincia;
	
	/** The nacionalidad. */
	private String nacionalidad;
	
	/** The numero calle. */
	private String numeroCalle;
	
	/** The piso. */
	private String piso;
	
	private int edad;
	
	/**
	 * Constructor de hibernate 
	 *
	 * @since 20-may-2011
	 * @author cfigueroa
	 */
	public PersonaSeleccion(){};
	
	/**
	 * Instantiates a new persona seleccion.
	 *
	 * @param persona the persona
	 * @since 20-may-2011
	 * @author cfigueroa
	 */
	public PersonaSeleccion(Persona persona) {
		this.id = persona.getId();
		this.nombre = persona.getNombre();
		this.apellido = persona.getApellido();
		this.barrio = persona.getBarrio();
		this.tipoDni = persona.getTipoDni();
		this.dni = persona.getDni();
		this.cuilCuit = persona.getCuilCuit();
		this.direccion = persona.getDireccion();
		this.departamento = persona.getDepartamento();
		this.codigoPostal = persona.getCodigoPostal();
		this.telefono = persona.getTelefono();
		this.celular = persona.getCelular();
		this.fechaNacimiento = persona.getFechaNacimiento();
		this.sexo = persona.isSexo();
		this.estadoCivil = persona.getEstadoCivil();
		this.mail = persona.getMail();
		this.localidad = persona.getLocalidad();
		this.entreCalles = persona.getEntreCalles();
		this.provincia = persona.getProvincia();
		this.nacionalidad = persona.getNacionalidad();
		this.numeroCalle = persona.getNumeroCalle();
		this.piso = persona.getPiso();
		this.edad=persona.getEdad();
	}

	/**
	 * Gets the sex.
	 *
	 * @return the sex
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getSex() {
		return ((sexo ? "Femenino" : "Masculino"));
	}

	

	/**
	 * Gets the id persona.
	 * 
	 * @return the id persona
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Sets the id persona.
	 *
	 * @param id the new id
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the nombre.
	 * 
	 * @return the nombre
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * Sets the nombre.
	 * 
	 * @param nombre
	 *            the new nombre
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * Gets the apellido.
	 * 
	 * @return the apellido
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public String getApellido() {
		return apellido;
	}

	/**
	 * Sets the apellido.
	 * 
	 * @param apellido
	 *            the new apellido
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	/**
	 * Gets the dni.
	 * 
	 * @return the dni
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public Integer getDni() {
		return dni;
	}

	/**
	 * Sets the dni.
	 * 
	 * @param dni
	 *            the new dni
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setDni(Integer dni) {
		this.dni = dni;
	}

	/**
	 * Gets the cuil cuit.
	 * 
	 * @return the cuil cuit
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getCuilCuit() {
		return cuilCuit;
	}

	/**
	 * Sets the cuil cuit.
	 * 
	 * @param cuilCuit
	 *            the new cuil cuit
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setCuilCuit(String cuilCuit) {
		this.cuilCuit = cuilCuit;
	}

	/**
	 * Gets the direccion.
	 * 
	 * @return the direccion
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getDireccion() {
		return direccion;
	}

	/**
	 * Sets the direccion.
	 * 
	 * @param direccion
	 *            the new direccion
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	/**
	 * Gets the codigo postal.
	 * 
	 * @return the codigo postal
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getCodigoPostal() {
		return codigoPostal;
	}

	/**
	 * Sets the codigo postal.
	 * 
	 * @param codigoPostal
	 *            the new codigo postal
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	/**
	 * Gets the telefono.
	 * 
	 * @return the telefono
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getTelefono() {
		return telefono;
	}

	/**
	 * Sets the telefono.
	 * 
	 * @param telefono
	 *            the new telefono
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	/**
	 * Gets the celular.
	 * 
	 * @return the celular
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getCelular() {
		return celular;
	}

	/**
	 * Sets the celular.
	 * 
	 * @param celular
	 *            the new celular
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setCelular(String celular) {
		this.celular = celular;
	}

	
	/**
	 * Gets the fecha nacimiento.
	 * 
	 * @return the fecha nacimiento
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */

	/**
	 * Checks if is sexo.
	 * 
	 * @return true, if is sexo
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public boolean isSexo() {
		return sexo;
	}

	/**
	 * Sets the sexo.
	 * 
	 * @param sexo
	 *            the new sexo
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setSexo(boolean sexo) {
		this.sexo = sexo;
	}

	/**
	 * Sets the fecha nacimiento.
	 *
	 * @param fechaNacimiento the new fecha nacimiento
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	/**
	 * Gets the fecha nacimiento.
	 *
	 * @return the fecha nacimiento
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	/**
	 * Gets the estado civil.
	 *
	 * @return the estado civil
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public EstadoCivil getEstadoCivil() {
		return estadoCivil;
	}

	/**
	 * Sets the estado civil.
	 *
	 * @param estadoCivil the new estado civil
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setEstadoCivil(EstadoCivil estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	/**
	 * Gets the mail.
	 * 
	 * @return the mail
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public String getMail() {
		return mail;
	}

	/**
	 * Sets the mail.
	 * 
	 * @param mail
	 *            the new mail
	 * @since 09-nov-2010
	 * @author cfigueroa
	 */
	public void setMail(String mail) {
		this.mail = mail;
	}

	/**
	 * Gets the localidad.
	 *
	 * @return the localidad
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Localidad getLocalidad() {
		return localidad;
	}

	/**
	 * Sets the localidad.
	 *
	 * @param localidad the localidad to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}

	
	/**
	 * Gets the entre calles.
	 *
	 * @return the entre calles
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getEntreCalles() {
		return entreCalles;
	}

	/**
	 * Sets the entre calles.
	 *
	 * @param entreCalles the new entre calles
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setEntreCalles(String entreCalles) {
		this.entreCalles = entreCalles;
	}

	/**
	 * Gets the provincia.
	 *
	 * @return the provincia
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Provincia getProvincia() {
		return provincia;
	}

	/**
	 * Sets the provincia.
	 *
	 * @param provincia the new provincia
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	
	
	/**
	 * Sets the nacionalidad.
	 *
	 * @param nacionalidad the new nacionalidad
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}

	
	public String getNumeroCalle() {
		return numeroCalle;
	}

	public void setNumeroCalle(String numeroCalle) {
		this.numeroCalle = numeroCalle;
	}

	public String getPiso() {
		return piso;
	}

	public void setPiso(String piso) {
		this.piso = piso;
	}

	/**
	 * Gets the tipo dni.
	 *
	 * @return the tipo dni
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public TipoDni getTipoDni() {
		return tipoDni;
	}

	/**
	 * Sets the tipo dni.
	 *
	 * @param tipoDni the new tipo dni
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setTipoDni(TipoDni tipoDni) {
		this.tipoDni = tipoDni;
	}

	
	/**
	 * Gets the departamento.
	 *
	 * @return the departamento
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getDepartamento() {
		return departamento;
	}

	/**
	 * Sets the departamento.
	 *
	 * @param departamento the new departamento
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public String getNacionalidad() {
		return nacionalidad;
	}

	public String getBarrio() {
		return barrio;
	}

	public void setBarrio(String barrio) {
		this.barrio = barrio;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		edad=Formateador.calcularEdad(fechaNacimiento);
		
		this.edad = edad;
	}


	

}
