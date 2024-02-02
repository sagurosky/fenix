package org.cimientos.intranet.modelo.ubicacion;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;




/**
 * Localidad
 * @author msagarduy
 *
 */
@Entity
public class Localidad implements Serializable{
	
	//atributos
	@Id
	@GeneratedValue
	private Long id;
	//prueba
	private String nombre;
	
	@OneToOne
	private ZonaCimientos zona;
	
	@OneToOne
	private Provincia provincia;
	
	private boolean activo;
	
	
	//metodos
	
	public ZonaCimientos getZona() {
		return zona;
	}

	public void setZona(ZonaCimientos zona) {
		this.zona = zona;
	}
	
	public Localidad() {
		super();
	}

	public Localidad(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return id
	 */
	public Long getId() {
		return id;
	}
	
	/**
	 * @param id
	 * 			El id a setear.
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @param nombre
	 * 				El nombre a setear.
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return nombre
	 */
	public String getNombre() {
		return nombre;
	}
	
	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public Provincia getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	
	
}


