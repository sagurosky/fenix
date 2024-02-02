package org.cimientos.intranet.modelo;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Trimestre implements Serializable{

	@Id
	@GeneratedValue
	private Long id;
	
	private String nombre;
	
	@OneToMany
	@JoinColumn(name="trimestre_notamateria")
	private List<NotaMateria> materias;

	@OneToMany
	@JoinColumn(name="trimestre_previa")
	private List<NotaMateria> previas;
	
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

	public List<NotaMateria> getMaterias() {
		return materias;
	}

	public void setMaterias(List<NotaMateria> materias) {
		this.materias = materias;
	}

	public List<NotaMateria> getPrevias() {
		return previas;
	}

	public void setPrevias(List<NotaMateria> previas) {
		this.previas = previas;
	}
	
	
	
}
