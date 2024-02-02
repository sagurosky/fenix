package org.cimientos.intranet.modelo.sucursalBanco;


import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.hibernate.annotations.Where;

/**
 * 
 * @author jrios
 *
 */

@Entity
@Where(clause = "activo = 1")
public class SucursalBanco implements Serializable{
	
	@Id
	@GeneratedValue
	private Long id;
	
	private String direccion; 
		
	private String numeroSucursal;
	
	private String nombreContacto;
	
	private String telContacto;
	
	private String nombre; 
	
	private boolean activo;
	
	@OneToOne
	@JoinColumn(name="banco_id")
	private Banco banco;

	@OneToOne
	private ZonaCimientos zona;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getNumeroSucursal() {
		return numeroSucursal;
	}

	public void setNumeroSucursal(String numeroSucursal) {
		this.numeroSucursal = numeroSucursal;
	}

	public String getNombreContacto() {
		return nombreContacto;
	}

	public void setNombreContacto(String nombreContacto) {
		this.nombreContacto = nombreContacto;
	}

	public String getTelContacto() {
		return telContacto;
	}

	public void setTelContacto(String telContacto) {
		this.telContacto = telContacto;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}
	
	public Banco getBanco() {
		return banco;
	}

	public void setBanco(Banco banco) {
		this.banco = banco;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return the zona
	 */
	public ZonaCimientos getZona() {
		return zona;
	}

	/**
	 * @param zona the zona to set
	 */
	public void setZona(ZonaCimientos zona) {
		this.zona = zona;
	}

	
	
	

}
