/**
 * 
 */
package org.cimientos.intranet.modelo.candidato.convocatoria;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.perfilvoluntario.PerfilVoluntario;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.hibernate.annotations.Where;

import com.cimientos.intranet.enumerativos.TipoConvocatoria;

/**
 * The Class Convocatoria.
 *
 * @author nlopez
 * Clase realizada para el bug 813, en desarrollo, circuito terminado con datos de prueba
 * y ademas ya estan creado los Dao's Convocatoria, los servicios, y las propiedades corres
 * pondientes a la clase Convocatoria.
 */

@Entity
@Where(clause="activo = 1")
public class Convocatoria {

	/** The id convocatoria. */
	@Id
	@GeneratedValue
	private Long idConvocatoria;
	
	/** The zona cimientos. */
	@ManyToOne
	private ZonaCimientos zonaCimientos;
	
	/** The tipo convocatoria. */
	@Enumerated(EnumType.ORDINAL)
	private TipoConvocatoria tipoConvocatoria;
	
	/** The escuela. */
	@ManyToOne
	private Escuela escuela;
	
	/** The ciclo programa. */
	@ManyToOne
	private CicloPrograma cicloPrograma;
	
	/** The fechaInicio. */
	private Date fechaInicio;
	
	/** The fecha fin. */
	private Date fechaFin;
	
	/** The entrevistadores. */
	@OneToMany(fetch= FetchType.LAZY)
	private List<PerfilVoluntario> entrevistadores;
	
	/** The activo. */
	private boolean activo;
	
	/** The nombre. */
	private String nombre;

	/** The observaciones. */
	@Column(length=10000)
	private String observaciones;
	
	
	/**
	 * Gets the id convocatoria.
	 *
	 * @return the id convocatoria
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public Long getIdConvocatoria() {
		return idConvocatoria;
	}

	/**
	 * Sets the id convocatoria.
	 *
	 * @param idConvocatoria the new id convocatoria
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public void setIdConvocatoria(Long idConvocatoria) {
		this.idConvocatoria = idConvocatoria;
	}

	/**
	 * Gets the zona cimientos.
	 *
	 * @return the zona cimientos
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public ZonaCimientos getZonaCimientos() {
		return zonaCimientos;
	}

	/**
	 * Sets the zona cimientos.
	 *
	 * @param zonaCimientos the new zona cimientos
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public void setZonaCimientos(ZonaCimientos zonaCimientos) {
		this.zonaCimientos = zonaCimientos;
	}

	/**
	 * Gets the tipo convocatoria.
	 *
	 * @return the tipo convocatoria
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public TipoConvocatoria getTipoConvocatoria() {
		return tipoConvocatoria;
	}

	/**
	 * Sets the tipo convocatoria.
	 *
	 * @param tipoConvocatoria the new tipo convocatoria
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public void setTipoConvocatoria(TipoConvocatoria tipoConvocatoria) {
		this.tipoConvocatoria = tipoConvocatoria;
	}

	/**
	 * Gets the escuela.
	 *
	 * @return the escuela
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public Escuela getEscuela() {
		return escuela;
	}

	/**
	 * Sets the escuela.
	 *
	 * @param escuela the new escuela
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public void setEscuela(Escuela escuela) {
		this.escuela = escuela;
	}

	/**
	 * Gets the ciclo programa.
	 *
	 * @return the ciclo programa
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public CicloPrograma getCicloPrograma() {
		return cicloPrograma;
	}

	/**
	 * Sets the ciclo programa.
	 *
	 * @param cicloPrograma the new ciclo programa
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public void setCicloPrograma(CicloPrograma cicloPrograma) {
		this.cicloPrograma = cicloPrograma;
	}

	/**
	 * Gets the fechaInicio.
	 *
	 * @return the fechaInicio
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public Date getFechaInicio() {
		return fechaInicio;
	}

	/**
	 * Sets the fechaInicio.
	 *
	 * @param fecha the new fecha inicio
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public void setFechaInicio(Date fecha) {
		this.fechaInicio = fecha;
	}

	/**
	 * Gets the entrevistadores.
	 *
	 * @return the entrevistadores
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public List<PerfilVoluntario> getEntrevistadores() {
		return entrevistadores;
	}

	/**
	 * Sets the entrevistadores.
	 *
	 * @param entrevistadores the new entrevistadores
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public void setEntrevistadores(List<PerfilVoluntario> entrevistadores) {
		this.entrevistadores = entrevistadores;
	}

	/**
	 * Checks if is activo.
	 *
	 * @return true, if is activo
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public boolean isActivo() {
		return activo;
	}

	/**
	 * Sets the activo.
	 *
	 * @param activo the new activo
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	/**
	 * Gets the fecha fin.
	 *
	 * @return the fechaFin
	 */
	public Date getFechaFin() {
		return fechaFin;
	}

	/**
	 * Sets the fecha fin.
	 *
	 * @param fechaFin the fechaFin to set
	 */
	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	/**
	 * Gets the nombre.
	 *
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * Sets the nombre.
	 *
	 * @param nombre the new nombre
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * Gets the observaciones.
	 *
	 * @return the observaciones
	 */
	public String getObservaciones() {
		return observaciones;
	}

	/**
	 * Sets the observaciones.
	 *
	 * @param observaciones the new observaciones
	 */
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	
	
}
