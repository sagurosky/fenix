package org.cimientos.intranet.dto;

import java.io.Serializable;

import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.cimientos.intranet.enumerativos.AnioEscolar;
import com.cimientos.intranet.enumerativos.RecomendacionesTS;
import com.cimientos.intranet.enumerativos.entrevista.MotivoEnvioTS;


// TODO: Auto-generated Javadoc
/**
 * Esta clase es para mapear los datos para el reporte de la lista de convocados.
 *
 * @author cfigueroa
 */
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE, region="org.cimientos.intranet.dto.ConvocadoDTO")
public class ConvocadoDTO implements Serializable{
	
	/** The id alumno. */
	private Long idAlumno;
	
	/** The anio escolar. */
	private AnioEscolar anioEscolar;
	
	/** The estado alumno. */
	private EstadoAlumno estadoAlumno;
	
	/** The nombre alumno. */
	private String nombreAlumno;
	
	/** The apellido alumno. */
	private String apellidoAlumno;
	
	/** The estado alumno entrevista. */
	private EstadoAlumno estadoAlumnoEntrevista;
	
	/** The nombre convocatoria. */
	private String nombreConvocatoria;
	
	/** The dni. */
	private Integer dni;
	
	/** The nombre zona. */
	private String nombreZona;
	
	/** The nombre escuela. */
	private String nombreEscuela;
	
	/** The nombre ciclo. */
	private String nombreCiclo;
	
	/** The motivo envio ts. */
	private MotivoEnvioTS motivoEnvioTS;
	private RecomendacionesTS recomendacionesTS;
	private String apellidoNombreTS;
	
	private Boolean anioAdicional;
	
	private String eae;
	
	
	

	public String getEae() {
		return eae;
	}

	public void setEae(String eae) {
		this.eae = eae;
	}

	/**
	 * Gets the id alumno.
	 *
	 * @return the id alumno
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public Long getIdAlumno() {
		return idAlumno;
	}
	
	/**
	 * Sets the id alumno.
	 *
	 * @param idAlumno the new id alumno
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public void setIdAlumno(Long idAlumno) {
		this.idAlumno = idAlumno;
	}
	
	/**
	 * Gets the anio escolar.
	 *
	 * @return the anio escolar
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public AnioEscolar getAnioEscolar() {
		return anioEscolar;
	}
	
	/**
	 * Sets the anio escolar.
	 *
	 * @param anioEscolar the new anio escolar
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public void setAnioEscolar(AnioEscolar anioEscolar) {
		this.anioEscolar = anioEscolar;
	}
	
	/**
	 * Gets the estado alumno.
	 *
	 * @return the estado alumno
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public EstadoAlumno getEstadoAlumno() {
		return estadoAlumno;
	}
	
	/**
	 * Sets the estado alumno.
	 *
	 * @param estadoAlumno the new estado alumno
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public void setEstadoAlumno(EstadoAlumno estadoAlumno) {
		this.estadoAlumno = estadoAlumno;
	}
	
	/**
	 * Gets the nombre alumno.
	 *
	 * @return the nombre alumno
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public String getNombreAlumno() {
		return nombreAlumno;
	}
	
	/**
	 * Sets the nombre alumno.
	 *
	 * @param nombreAlumno the new nombre alumno
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public void setNombreAlumno(String nombreAlumno) {
		this.nombreAlumno = nombreAlumno;
	}
	
	/**
	 * Gets the apellido alumno.
	 *
	 * @return the apellido alumno
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public String getApellidoAlumno() {
		return apellidoAlumno;
	}
	
	/**
	 * Sets the apellido alumno.
	 *
	 * @param apellidoAlumno the new apellido alumno
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public void setApellidoAlumno(String apellidoAlumno) {
		this.apellidoAlumno = apellidoAlumno;
	}
	
	/**
	 * Gets the estado alumno entrevista.
	 *
	 * @return the estado alumno entrevista
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public EstadoAlumno getEstadoAlumnoEntrevista() {
		return estadoAlumnoEntrevista;
	}
	
	/**
	 * Sets the estado alumno entrevista.
	 *
	 * @param estadoAlumnoEntrevista the new estado alumno entrevista
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public void setEstadoAlumnoEntrevista(EstadoAlumno estadoAlumnoEntrevista) {
		this.estadoAlumnoEntrevista = estadoAlumnoEntrevista;
	}
	
	/**
	 * Gets the nombre convocatoria.
	 *
	 * @return the nombre convocatoria
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public String getNombreConvocatoria() {
		return nombreConvocatoria;
	}
	
	/**
	 * Sets the nombre convocatoria.
	 *
	 * @param nombreConvocatoria the new nombre convocatoria
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public void setNombreConvocatoria(String nombreConvocatoria) {
		this.nombreConvocatoria = nombreConvocatoria;
	}
	
	/**
	 * Gets the dni.
	 *
	 * @return the dni
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public Integer getDni() {
		return dni;
	}
	
	/**
	 * Sets the dni.
	 *
	 * @param dni the new dni
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public void setDni(Integer dni) {
		this.dni = dni;
	}
	
	/**
	 * Gets the nombre zona.
	 *
	 * @return the nombre zona
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public String getNombreZona() {
		return nombreZona;
	}
	
	/**
	 * Sets the nombre zona.
	 *
	 * @param nombreZona the new nombre zona
	 * @since 15-mar-2011
	 * @author cfigueroa
	 */
	public void setNombreZona(String nombreZona) {
		this.nombreZona = nombreZona;
	}

	/**
	 * Gets the nombre escuela.
	 *
	 * @return the nombre escuela
	 * @since 16-mar-2011
	 * @author cfigueroa
	 */
	public String getNombreEscuela() {
		return nombreEscuela;
	}

	/**
	 * Sets the nombre escuela.
	 *
	 * @param nombreEscuela the new nombre escuela
	 * @since 16-mar-2011
	 * @author cfigueroa
	 */
	public void setNombreEscuela(String nombreEscuela) {
		this.nombreEscuela = nombreEscuela;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((anioEscolar == null) ? 0 : anioEscolar.hashCode());
		result = prime * result
				+ ((apellidoAlumno == null) ? 0 : apellidoAlumno.hashCode());
		result = prime * result + ((dni == null) ? 0 : dni.hashCode());
		result = prime * result
				+ ((estadoAlumno == null) ? 0 : estadoAlumno.hashCode());
		result = prime
				* result
				+ ((estadoAlumnoEntrevista == null) ? 0
						: estadoAlumnoEntrevista.hashCode());
		result = prime * result
				+ ((idAlumno == null) ? 0 : idAlumno.hashCode());
		result = prime * result
				+ ((nombreAlumno == null) ? 0 : nombreAlumno.hashCode());
		result = prime
				* result
				+ ((nombreConvocatoria == null) ? 0 : nombreConvocatoria
						.hashCode());
		result = prime * result
				+ ((nombreEscuela == null) ? 0 : nombreEscuela.hashCode());
		result = prime * result
				+ ((nombreZona == null) ? 0 : nombreZona.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ConvocadoDTO other = (ConvocadoDTO) obj;
		if (anioEscolar != other.anioEscolar)
			return false;
		if (apellidoAlumno == null) {
			if (other.apellidoAlumno != null)
				return false;
		} else if (!apellidoAlumno.equals(other.apellidoAlumno))
			return false;
		if (dni == null) {
			if (other.dni != null)
				return false;
		} else if (!dni.equals(other.dni))
			return false;
		if (estadoAlumno != other.estadoAlumno)
			return false;
		if (estadoAlumnoEntrevista != other.estadoAlumnoEntrevista)
			return false;
		if (idAlumno == null) {
			if (other.idAlumno != null)
				return false;
		} else if (!idAlumno.equals(other.idAlumno))
			return false;
		if (nombreAlumno == null) {
			if (other.nombreAlumno != null)
				return false;
		} else if (!nombreAlumno.equals(other.nombreAlumno))
			return false;
		if (nombreConvocatoria == null) {
			if (other.nombreConvocatoria != null)
				return false;
		} else if (!nombreConvocatoria.equals(other.nombreConvocatoria))
			return false;
		if (nombreEscuela == null) {
			if (other.nombreEscuela != null)
				return false;
		} else if (!nombreEscuela.equals(other.nombreEscuela))
			return false;
		if (nombreZona == null) {
			if (other.nombreZona != null)
				return false;
		} else if (!nombreZona.equals(other.nombreZona))
			return false;
		return true;
	}

	/**
	 * Gets the nombre ciclo.
	 *
	 * @return the nombre ciclo
	 * @since 28-mar-2011
	 * @author cfigueroa
	 */
	public String getNombreCiclo() {
		return nombreCiclo;
	}

	/**
	 * Sets the nombre ciclo.
	 *
	 * @param nombreCiclo the new nombre ciclo
	 * @since 28-mar-2011
	 * @author cfigueroa
	 */
	public void setNombreCiclo(String nombreCiclo) {
		this.nombreCiclo = nombreCiclo;
	}

	/**
	 * Gets the motivo envio ts.
	 *
	 * @return the motivo envio ts
	 * @since 28-mar-2011
	 * @author cfigueroa
	 */
	public MotivoEnvioTS getMotivoEnvioTS() {
		return motivoEnvioTS;
	}

	/**
	 * Sets the motivo envio ts.
	 *
	 * @param motivoEnvioTS the new motivo envio ts
	 * @since 28-mar-2011
	 * @author cfigueroa
	 */
	public void setMotivoEnvioTS(MotivoEnvioTS motivoEnvioTS) {
		this.motivoEnvioTS = motivoEnvioTS;
	}

	public RecomendacionesTS getRecomendacionesTS() {
		return recomendacionesTS;
	}

	public void setRecomendacionesTS(RecomendacionesTS recomendacionesTS) {
		this.recomendacionesTS = recomendacionesTS;
	}

	public String getApellidoNombreTS() {
		return apellidoNombreTS;
	}

	public void setApellidoNombreTS(String nombreApellidoTS) {
		this.apellidoNombreTS = nombreApellidoTS;
	}
	
	public Boolean getAnioAdicional() {
		return anioAdicional;
	}

	public void setAnioAdicional(Boolean anioAdicional) {
		this.anioAdicional = anioAdicional;
	}
	
}
