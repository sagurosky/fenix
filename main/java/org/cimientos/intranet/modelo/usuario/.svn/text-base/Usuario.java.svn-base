package org.cimientos.intranet.modelo.usuario;


import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.persona.Persona;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.jasypt.hibernate.type.EncryptedStringType;


/**
 * Usuario
 * Clase utilizada para la administracion de usuarios del sistema. Manejo de perfiles asociados	
 * @author msagarduy
 *
 */

@TypeDef(
	    name="encryptedString", 
	    typeClass=EncryptedStringType.class, 
	    parameters= {
	        @Parameter(name="encryptorRegisteredName", value="hibernateStringEncryptor")
	    }
	)
	
@Entity
public class Usuario implements Serializable{

	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Identificador unico del usuario
	 */
	@Id
	@GeneratedValue
	private Long id;

	/**
	 * Contrasena del usuario
	 * Encriptada con algoritmo MD5
	 */
	@Type(type="encryptedString")
	private String password;

	/**
	 * Estado del usuario. Puede ser activo - inactivo
	 */
	private boolean activo;
	
	/**
	 * Nombre del usuario
	 */
	private String usuario;

	@OneToOne(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private Persona persona;

	public Persona getPersona() {
		return persona;
	}
	
	private String nombre;


	public void setPersona(Persona persona) {
		this.persona = persona;
	}


	/**
	 * Retorna si las contrasenas coinciden.
	 * @author msagarduy
	 * @param otraPassword
	 *            la password a comparar
	 * @return si la password coincide
	 */
	public boolean passwordValida(String otraPassword) {
		return password.equals(otraPassword);
	}


	/**
	 * Setea la password del usuario
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}


	/**
	 * Retorna el estado del usuario. Activo o inactivo
	 * @return
	 */
	public boolean isActivo() {
		return activo;
	}

	/**
	 * Setea el estado del usuario.
	 * @param activo
	 */
	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	/**
	 * Retorna el atributo usuario del objeto usuario.
	 * @return String
	 */
	public String getUsuario() {
		return usuario;
	}

	/**
	 * Setea el atributo usuario del objeto usuario.
	 * @param usuario
	 */
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	/**
	 * Retorna el identificador unico del usuario
	 * @return Long
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Retorna la password
	 * @return String
	 */
	public String getPassword() {
		return password;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public void desactivar() {
		
		this.setActivo(false);
		this.getPersona().setActivo(false);
		
		if(this.getPersona().getPerfilEA() != null){
			this.getPersona().getPerfilEA().setActivo(false);
		}
		if(this.getPersona().getPerfilRR() != null){
			this.getPersona().getPerfilRR().setActivo(false);
		}
		if(this.getPersona().getPerfilTS() != null){
			this.getPersona().getPerfilTS().setActivo(false);
		}
		if(this.getPersona().getPerfilStaff() != null){
			this.getPersona().getPerfilStaff().setActivo(false);
		}
		if(this.getPersona().getPerfilVoluntario() != null){
			this.getPersona().getPerfilVoluntario().setActivo(false);
		}
		
		this.getPersona().setPerfilAdmin(false);
		this.getPersona().setPerfilCoordPBE(false);
		this.getPersona().setPerfilSelector(false);
		this.getPersona().setPerfilCorrector(false);
		this.getPersona().setPerfilDI(false);
		this.getPersona().setPerfilSysAdmin(false);
		this.getPersona().setPerfilRRHH(false);
		this.getPersona().setPerfilVisita(false);
		this.getPersona().setPerfilSuperUsuario(false);
	}


	public void activar() {
		this.setActivo(true);
		this.getPersona().setActivo(true);
		
		if(this.getPersona().getPerfilEA() != null){
			this.getPersona().getPerfilEA().setActivo(true);
		}
		if(this.getPersona().getPerfilRR() != null){
			this.getPersona().getPerfilRR().setActivo(true);
		}
		if(this.getPersona().getPerfilTS() != null){
			this.getPersona().getPerfilTS().setActivo(true);
		}
		if(this.getPersona().getPerfilStaff() != null){
			this.getPersona().getPerfilStaff().setActivo(true);
		}
		if(this.getPersona().getPerfilVoluntario() != null){
			this.getPersona().getPerfilVoluntario().setActivo(true);
		}		
	}
	
}
