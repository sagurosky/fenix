/**
 * 
 */
package org.cimientos.intranet.modelo.evento.eventoGenerico;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.cimientos.intranet.modelo.perfil.PerfilAlumno;

/**
 * @author plabaronnie
 *
 */
@Entity
public class AsistenciaEventoGenerico {
	
	@Id
	@GeneratedValue
	private Long id;

	@ManyToOne
	private PerfilAlumno becado;
	
	private boolean convocado;
	
	private boolean asistenciaAlumno;
	
	private String responsable1;
	
	private String vinculo1;
	
	private String responsable2;
	
	private String vinculo2;
	
	@Column(length=1000)
	private String observaciones;

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}


	/**
	 * @return the asistenciaAlumno
	 */
	public boolean isAsistenciaAlumno() {
		return asistenciaAlumno;
	}

	/**
	 * @param asistenciaAlumno the asistenciaAlumno to set
	 */
	public void setAsistenciaAlumno(boolean asistenciaAlumno) {
		this.asistenciaAlumno = asistenciaAlumno;
	}

	/**
	 * @return the responsable1
	 */
	public String getResponsable1() {
		return responsable1;
	}

	/**
	 * @param responsable1 the responsable1 to set
	 */
	public void setResponsable1(String responsable1) {
		this.responsable1 = responsable1;
	}

	/**
	 * @return the responsable2
	 */
	public String getResponsable2() {
		return responsable2;
	}

	/**
	 * @param responsable2 the responsable2 to set
	 */
	public void setResponsable2(String responsable2) {
		this.responsable2 = responsable2;
	}

	/**
	 * @return the observaciones
	 */
	public String getObservaciones() {
		return observaciones;
	}

	/**
	 * @param observaciones the observaciones to set
	 */
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	/**
	 * @return the vinculo1
	 */
	public String getVinculo1() {
		return vinculo1;
	}

	/**
	 * @param vinculo1 the vinculo1 to set
	 */
	public void setVinculo1(String vinculo1) {
		this.vinculo1 = vinculo1;
	}

	/**
	 * @return the vinculo2
	 */
	public String getVinculo2() {
		return vinculo2;
	}

	/**
	 * @param vinculo2 the vinculo2 to set
	 */
	public void setVinculo2(String vinculo2) {
		this.vinculo2 = vinculo2;
	}

	/**
	 * @return the becado
	 */
	public PerfilAlumno getBecado() {
		return becado;
	}

	/**
	 * @param becado the becado to set
	 */
	public void setBecado(PerfilAlumno becado) {
		this.becado = becado;
	}

	/**
	 * @return the convocado
	 */
	public boolean isConvocado() {
		return convocado;
	}

	/**
	 * @param convocado the convocado to set
	 */
	public void setConvocado(boolean convocado) {
		this.convocado = convocado;
	}

	
}
