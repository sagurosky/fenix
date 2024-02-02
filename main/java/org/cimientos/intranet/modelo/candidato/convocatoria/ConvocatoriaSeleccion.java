package org.cimientos.intranet.modelo.candidato.convocatoria;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


/**
 * The Class ConvocatoriaSeleccion.
 * Este Entity se creo para mantener un registro para entrevista seelccion
 */
@Entity
public class ConvocatoriaSeleccion implements Serializable{
	
	/** The activo. */
	private boolean activo;
	
	
	/** The fecha fin. */
	private Date fechaFin;
	
	/** The fechaInicio. */
	private Date fechaInicio;
	
	/** The id convocatoria. */
	@Id
	@GeneratedValue
	private Long idConvocatoria;
	
	/** The nombre. */
	private String nombre;
	
	
	/**
	 * Este constructor se genero para hibernate
	 *
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public ConvocatoriaSeleccion(){};
	
	/**
	 * Este constructor se genero para copiar los datos de la {@link Convocatoria} a {@link ConvocatoriaSeleccion}
	 *
	 * @param convocatoria the convocatoria
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public ConvocatoriaSeleccion(Convocatoria convocatoria) {
		this.activo = convocatoria.isActivo();
		this.fechaInicio = convocatoria.getFechaInicio();
		this.idConvocatoria = convocatoria.getIdConvocatoria();
		this.nombre = convocatoria.getNombre();
		
	}

	/**
	 * Checks if is activo.
	 *
	 * @return true, if is activo
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public boolean isActivo() {
		return activo;
	}
	
	/**
	 * Sets the activo.
	 *
	 * @param activo the new activo
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public void setActivo(boolean activo) {
		this.activo = activo;
	}
	
	
	/**
	 * Gets the fecha fin.
	 *
	 * @return the fecha fin
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public Date getFechaFin() {
		return fechaFin;
	}
	
	/**
	 * Sets the fecha fin.
	 *
	 * @param fechaFin the new fecha fin
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
	
	/**
	 * Gets the fecha inicio.
	 *
	 * @return the fecha inicio
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public Date getFechaInicio() {
		return fechaInicio;
	}
	
	/**
	 * Sets the fecha inicio.
	 *
	 * @param fechaInicio the new fecha inicio
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	
	/**
	 * Gets the id convocatoria.
	 *
	 * @return the id convocatoria
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public Long getIdConvocatoria() {
		return idConvocatoria;
	}
	
	/**
	 * Sets the id convocatoria.
	 *
	 * @param idConvocatoria the new id convocatoria
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public void setIdConvocatoria(Long idConvocatoria) {
		this.idConvocatoria = idConvocatoria;
	}
	
	/**
	 * Gets the nombre.
	 *
	 * @return the nombre
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public String getNombre() {
		return nombre;
	}
	
	/**
	 * Sets the nombre.
	 *
	 * @param nombre the new nombre
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	
}
