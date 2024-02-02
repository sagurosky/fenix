/**
 * 
 */
package org.cimientos.intranet.modelo.supervisorescolar;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaSupervisionEscolar;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.Provincia;
import org.hibernate.annotations.Where;


/**
 * @author nlopez
 * 
 */

@Entity
@Where(clause="activo = 1")
public class SupervisorEscolar {

	@Id
	@GeneratedValue
	private Long id;

	private String nombre;
	
	private String cargo;
		
	//Luego cambiar el objeto String por  
	//el objeto Nivel a Syncronizar.
	private String Nivel;
	
	private String direccion;
	
	private Long telefono;
	
	private Long celular;
	
	private String mail;
	
	@OneToOne(cascade = CascadeType.PERSIST)	
	private Localidad localidad;
		
	@OneToOne(cascade=CascadeType.PERSIST)
	private Escuela escuela;
	
	@OneToMany()
	@JoinColumn(name="supervisor_id")
	private List<EntrevistaSupervisionEscolar> entrevistas;
	
	@OneToOne(cascade= CascadeType.PERSIST)
	private Provincia provincia;
	
	private Boolean activo;
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long idSE) {
		this.id = idSE;
	}

	/**
	 * @return the localidad
	 */
	public Localidad getLocalidad() {
		return localidad;
	}

	/**
	 * @param localidad the localidad to set
	 */
	public void setLocalidad(Localidad idLocalidad) {
		this.localidad = idLocalidad;
	}


	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombreDeContacto) {
		this.nombre = nombreDeContacto;
	}

	/**
	 * @return the cargo
	 */
	public String getCargo() {
		return cargo;
	}

	/**
	 * @param cargo the cargo to set
	 */
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	/**
	 * @return the nivel
	 */
	public String getNivel() {
		return Nivel;
	}

	/**
	 * @param nivel the nivel to set
	 */
	public void setNivel(String nivel) {
		Nivel = nivel;
	}

	/**
	 * @return the direccion
	 */
	public String getDireccion() {
		return direccion;
	}

	/**
	 * @param direccion the direccion to set
	 */
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	/**
	 * @return the telefono
	 */
	public Long getTelefono() {
		return telefono;
	}

	/**
	 * @param telefono the telefono to set
	 */
	public void setTelefono(Long telefono) {
		this.telefono = telefono;
	}

	/**
	 * @return the celular
	 */
	public Long getCelular() {
		return celular;
	}

	/**
	 * @param celular the celular to set
	 */
	public void setCelular(Long celular) {
		this.celular = celular;
	}

	/**
	 * @return the mail
	 */
	public String getMail() {
		return mail;
	}

	/**
	 * @param mail the mail to set
	 */
	public void setMail(String mail) {
		this.mail = mail;
	}

	

	public List<EntrevistaSupervisionEscolar> getEntrevistas() {
		return entrevistas;
	}

	public void setEntrevistas(List<EntrevistaSupervisionEscolar> entrevistas) {
		this.entrevistas = entrevistas;
	}	
	
	public void agregarEntrevista(EntrevistaSupervisionEscolar entrevista){
		entrevistas.add(entrevista);
	}
		
	public void eliminarEntevista(EntrevistaSupervisionEscolar entrevista){
		entrevistas.remove(entrevista);
	}
	
	public boolean existeEntrevista (EntrevistaSupervisionEscolar entrevista){
		return this.getEntrevistas().contains(entrevista);
	}

	public Provincia getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	public Boolean getActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	public Escuela getEscuela() {
		return escuela;
	}

	public void setEscuela(Escuela escuela) {
		this.escuela = escuela;
	}
}
