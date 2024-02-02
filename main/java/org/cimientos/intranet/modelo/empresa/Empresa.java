/**
 * 
 */
package org.cimientos.intranet.modelo.empresa;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * @author plabaronnie
 *
 */
@Entity
public class Empresa implements Serializable{
	
	@Id
	@GeneratedValue
	private Long id;
	
	private String denominacion;
	
	private String contacto1;
	
	private String mailContacto1;
	
	private String contacto2;
	
	private String mailContacto2;
	
	private Date fechaAlta;
	
	/**
	 * Estado del padrino. Puede ser activo - inactivo
	 * sirve para el borrado logico.
	 */
	private boolean activo;
	
	private String CUIT;
	
	/**
	 * @return
	 */
	public String getDenominacion() {
		return denominacion;
	}

	/**
	 * @param denominacion
	 */
	public void setDenominacion(String denominacion) {
		this.denominacion = denominacion;
	}

	/**
	 * @return
	 */
	public String getContacto1() {
		return contacto1;
	}

	/**
	 * @param contacto1
	 */
	public void setContacto1(String contacto1) {
		this.contacto1 = contacto1;
	}

	/**
	 * @return
	 */
	public String getMailContacto1() {
		return mailContacto1;
	}

	/**
	 * @param mailContacto1
	 */
	public void setMailContacto1(String mailContacto1) {
		this.mailContacto1 = mailContacto1;
	}

	/**
	 * @return
	 */
	public String getContacto2() {
		return contacto2;
	}

	/**
	 * @param contacto2
	 */
	public void setContacto2(String contacto2) {
		this.contacto2 = contacto2;
	}

	/**
	 * @return
	 */
	public String getMailContacto2() {
		return mailContacto2;
	}

	/**
	 * @param mailContacto2
	 */
	public void setMailContacto2(String mailContacto2) {
		this.mailContacto2 = mailContacto2;
	}


	/**
	 * @return
	 */
	public Date getFechaAlta() {
		return fechaAlta;
	}

	/**
	 * @param fechaAlta
	 */
	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	/**
	 * @return
	 */
	public boolean isActivo() {
		return activo;
	}

	/**
	 * @param activo
	 */
	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCUIT() {
		return CUIT;
	}

	public void setCUIT(String cuit) {
		CUIT = cuit;
	}


}
