package org.cimientos.intranet.modelo.banco;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import org.cimientos.intranet.modelo.sucursalBanco.SucursalBanco;
import org.hibernate.annotations.Where;

/**
 * 
 * @author jrios
 *
 */

@Entity
@Where(clause = "activo = 1")
public class Banco implements Serializable{
	
	@Id
	@GeneratedValue
	private Long id;
	
	private String nombre;
	
	
	@OneToMany()
	@JoinColumn(name="banco_id")
	private List<SucursalBanco> sucursales;
	
	private boolean activo;
	
	
	public Banco() {
		super();
		sucursales = new ArrayList<SucursalBanco>();
	}

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

	public List<SucursalBanco> getSucursales() {
		return sucursales;
	}

	public void setSucursales(List<SucursalBanco> sucursales) {
		this.sucursales = sucursales;
	}
	
	public void agregarSucursal(SucursalBanco sucursal){
		sucursales.add(sucursal);
	}
		
	public void eliminarSucursal(SucursalBanco sucursal){
		sucursales.remove(sucursal);
	}
	
	public boolean existeSucursal (SucursalBanco sucursal){
		return this.getSucursales().contains(sucursal);
	}
	
	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}
	

}
