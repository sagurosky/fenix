package org.cimientos.intranet.modelo.ubicacion;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import net.sf.cglib.core.Local;

import org.hibernate.annotations.Where;


@Entity
@Where(clause = "activo = 1")
public class Provincia implements Serializable{

	@Id
	@GeneratedValue
	private Long id;
	
	private String descripcion;
	
	private Long idPais;
	
	private boolean activo;
	
	@OneToMany()
	@JoinColumn(name = "provincia_id")
	private List<Localidad> localidades;
	
	private String pais;
	
	public Long getId() {
		return id;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<Localidad> getLocalidades() {
		return localidades;
	}

	public void setLocalidades(List<Localidad> localidades) {
		this.localidades = localidades;
	}

	public void agregarLocalidad(Localidad localidad){
		if(localidades == null){
			localidades = new LinkedList<Localidad>();
		}
		localidades.add(localidad);
	}
	public Long getIdPais() {
		return idPais;
	}

	public void setIdPais(Long idPais) {
		this.idPais = idPais;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}
	
	
	
}
