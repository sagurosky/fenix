/**
 * 
 */
package org.cimientos.intranet.modelo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Where;

/**
 * @author msagarduy
 * 
 */

@Entity
@Where(clause= "activo = 1")
public class Periodo implements Serializable 
{

	@Id
	@GeneratedValue
	private Long id;
	
	private String nombre;
	
	private Date fechaInicio;
	
	private Date fechaFin;

	private boolean activo;
	
	@OneToOne
	private CicloPrograma ciclo;
	
	private Integer orden;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public CicloPrograma getCiclo() {
		return ciclo;
	}

	public void setCiclo(CicloPrograma ciclo) {
		this.ciclo = ciclo;
	}

	public Integer getOrden() {
		return orden;
	}

	public void setOrden(Integer orden) {
		this.orden = orden;
	}
	
	
	
}
