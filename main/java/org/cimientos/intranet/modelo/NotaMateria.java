package org.cimientos.intranet.modelo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import com.cimientos.intranet.enumerativos.CalificacionMateria;
import com.cimientos.intranet.enumerativos.EstadoMateria;


@Entity
public class NotaMateria implements Serializable{
	
	@Id
	@GeneratedValue
	private Long id;
		
	@OneToOne
	private Materia materia;
	
	private String nota;
	
	@Enumerated(EnumType.ORDINAL)
	private CalificacionMateria calificacion;
	
	@Enumerated(EnumType.ORDINAL)
	private EstadoMateria estado;
	
	//solo para previas
	private String ciclo;
	
	//solo para la nueva columna de No Aprueba
	private boolean noAprueba;
	

	/**
	 * @return the ciclo
	 */
	public String getCiclo() {
		return ciclo;
	}

	/**
	 * @param ciclo the ciclo to set
	 */
	public void setCiclo(String ciclo) {
		this.ciclo = ciclo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Materia getMateria() {
		return materia;
	}

	public void setMateria(Materia materia) {
		this.materia = materia;
	}

	public String getNota() {
		return nota;
	}

	public void setNota(String nota) {
		this.nota = nota;
	}

	public EstadoMateria getEstado() {
		return estado;
	}

	public void setEstado(EstadoMateria estado) {
		this.estado = estado;
	}

	/**
	 * @return the calificacion
	 */
	public CalificacionMateria getCalificacion() {
		return calificacion;
	}

	/**
	 * @param calificacion the calificacion to set
	 */
	public void setCalificacion(CalificacionMateria calificacion) {
		this.calificacion = calificacion;
	}

	/**
	 * @return the noAprueba
	 */
	public boolean isNoAprueba() {
		return noAprueba;
	}

	/**
	 * @param noAprueba the noAprueba to set
	 */
	public void setNoAprueba(boolean noAprueba) {
		this.noAprueba = noAprueba;
	}
	
	

}
