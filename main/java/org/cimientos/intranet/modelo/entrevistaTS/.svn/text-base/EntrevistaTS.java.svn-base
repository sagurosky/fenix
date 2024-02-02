package org.cimientos.intranet.modelo.entrevistaTS;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;

import com.cimientos.intranet.enumerativos.RecomendacionesTS;
import com.cimientos.intranet.enumerativos.entrevista.MotivoEnvioTS;
import com.cimientos.intranet.enumerativos.entrevista.MotivoRechazo;
import com.googlecode.ehcache.annotations.Cacheable;



// TODO: Auto-generated Javadoc
/**
 * The Class EntrevistaTS.
 */
@Entity
public class EntrevistaTS {

	/** The id. */
	@Id
	@GeneratedValue
	private Long id;
	
	/** The perfil ts. */
	@OneToOne
	private PerfilTS perfilTS;
	
	/** The perfil alumno. */
	@OneToOne(cascade = CascadeType.PERSIST)
	private PerfilAlumno perfilAlumno;
	
	
//	/** The estado alumno. */
//	private EstadoAlumno estadoAlumno;
//	
	/** The egresos totales ficha. */
	private Integer egresosTotales;
	
	/** The ingresos totales. */
	private Integer ingresosTotales;
	
	/** The observaciones egreso ingreso. */
	@Column(length=450)
	private String observacionesEgresoIngreso;
	
	/** The percepciones sobre ra. */
	@Column(length=1000)
	private String percepcionesSobreRA;
	
	/** The Recomendacion ts. */
	@Enumerated(EnumType.ORDINAL)
	private RecomendacionesTS recomendacionesTS;
	/** The observaciones generales. */
	@Column(length=350)
	private String observacionesGenerales;
	
	/** The observaciones ts. */
	@Column(length=450)
	private String observacionesTS;
	
	/** The motivo visita. */
	@Enumerated(EnumType.ORDINAL)
	private MotivoEnvioTS motivoVisita;
	
	/** The motivo rechazo. */
	@Enumerated(EnumType.ORDINAL)
	private MotivoRechazo motivoRechazo;
	
	/** The fecha carga entrevista. */
	private Date fechaCargaEntrevista;
	
	/** The nombre ciclo. */
	private String nombreCiclo;
	
	/** The nombre periodo. */
	private String nombrePeriodo;
	
	/**
	 * Gets the perfil ts.
	 *
	 * @return the perfilTS
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public PerfilTS getPerfilTS() {
		return perfilTS;
	}
	
	/**
	 * Sets the perfil ts.
	 *
	 * @param perfilTS the perfilTS to set
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public void setPerfilTS(PerfilTS perfilTS) {
		this.perfilTS = perfilTS;
	}
	
	/**
	 * Gets the perfil alumno.
	 *
	 * @return the perfilAlumno
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.perfil.PerfilAlumno")
	public PerfilAlumno getPerfilAlumno() {
		return perfilAlumno;
	}
	
	/**
	 * Sets the perfil alumno.
	 *
	 * @param perfilAlumno the perfilAlumno to set
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public void setPerfilAlumno(PerfilAlumno perfilAlumno) {
		this.perfilAlumno = perfilAlumno;
	}
	
	
	/**
	 * Gets the id.
	 *
	 * @return the observacionesIngresosRA2
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
//	public String getObservacionesIngresosRA2() {
//		return observacionesIngresosRA2;
//	}
//	/**
//	 * @param observacionesIngresosRA2 the observacionesIngresosRA2 to set
//	 */
//	public void setObservacionesIngresosRA2(String observacionesIngresosRA2) {
//		this.observacionesIngresosRA2 = observacionesIngresosRA2;
//	}
//	/**
//	 * @return the observacionesRA2
//	 */
//	public String getObservacionesRA2() {
//		return observacionesRA2;
//	}
//	/**
//	 * @param observacionesRA2 the observacionesRA2 to set
//	 */
//	public void setObservacionesRA2(String observacionesRA2) {
//		this.observacionesRA2 = observacionesRA2;
//	}
//	/**
//	 * @return the obervacionesGralRA2
//	 */
//	public String getObervacionesGralRA2() {
//		return obervacionesGralRA2;
//	}
//	/**
//	 * @param obervacionesGralRA2 the obervacionesGralRA2 to set
//	 */
//	public void setObervacionesGralRA2(String obervacionesGralRA2) {
//		this.obervacionesGralRA2 = obervacionesGralRA2;
//	}
//	/**
//	 * @return the recomendacionesRA2
//	 */
//	public String getRecomendacionesRA2() {
//		return recomendacionesRA2;
//	}
//	/**
//	 * @param recomendacionesRA2 the recomendacionesRA2 to set
//	 */
//	public void setRecomendacionesRA2(String recomendacionesRA2) {
//		this.recomendacionesRA2 = recomendacionesRA2;
//	}
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	
	/**
	 * Sets the id.
	 *
	 * @param id the id to set
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public void setId(Long id) {
		this.id = id;
	}
	
//	/**
//	 * Gets the estado alumno.
//	 *
//	 * @return the estadoAlumno
//	 * @author hhrodriguez
//	 * @since 02-feb-2011
//	 */
//	public EstadoAlumno getEstadoAlumno() {
//		return estadoAlumno;
//	}
//	
//	/**
//	 * Sets the estado alumno.
//	 *
//	 * @param estadoAlumno the estadoAlumno to set
//	 * @author hhrodriguez
//	 * @since 02-feb-2011
//	 */
//	public void setEstadoAlumno(EstadoAlumno estadoAlumno) {
//		this.estadoAlumno = estadoAlumno;
//	}

	/**
	 * Gets the egresos totales ficha.
	 *
	 * @return the egresos totales ficha
	 * @since 30-mar-2011
	 * @author cfigueroa
	 */
	public Integer getEgresosTotales() {
		return egresosTotales;
	}

	/**
	 * Sets the egresos totales ficha.
	 *
	 * @param egresosTotalesFicha the new egresos totales
	 * @since 30-mar-2011
	 * @author cfigueroa
	 */
	public void setEgresosTotales(Integer egresosTotalesFicha) {
		this.egresosTotales = egresosTotalesFicha;
	}

	/**
	 * Gets the ingresos totales.
	 *
	 * @return the ingresos totales
	 * @since 30-mar-2011
	 * @author cfigueroa
	 */
	public Integer getIngresosTotales() {
		return ingresosTotales;
	}

	/**
	 * Sets the ingresos totales.
	 *
	 * @param ingresosTotales the new ingresos totales
	 * @since 30-mar-2011
	 * @author cfigueroa
	 */
	public void setIngresosTotales(Integer ingresosTotales) {
		this.ingresosTotales = ingresosTotales;
	}

	/**
	 * Gets the observaciones egreso ingreso.
	 *
	 * @return the observaciones egreso ingreso
	 * @since 30-mar-2011
	 * @author cfigueroa
	 */
	public String getObservacionesEgresoIngreso() {
		return observacionesEgresoIngreso;
	}

	/**
	 * Sets the observaciones egreso ingreso.
	 *
	 * @param observacionesEgresoIngreso the new observaciones egreso ingreso
	 * @since 30-mar-2011
	 * @author cfigueroa
	 */
	public void setObservacionesEgresoIngreso(String observacionesEgresoIngreso) {
		this.observacionesEgresoIngreso = observacionesEgresoIngreso;
	}

	/**
	 * Gets the percepciones sobre ra.
	 *
	 * @return the percepciones sobre ra
	 * @since 30-mar-2011
	 * @author cfigueroa
	 */
	public String getPercepcionesSobreRA() {
		return percepcionesSobreRA;
	}

	/**
	 * Sets the percepciones sobre ra.
	 *
	 * @param percepcionesSobreRA the new percepciones sobre ra
	 * @since 30-mar-2011
	 * @author cfigueroa
	 */
	public void setPercepcionesSobreRA(String percepcionesSobreRA) {
		this.percepcionesSobreRA = percepcionesSobreRA;
	}

	/**
	 * Gets the recomendaciones ts.
	 *
	 * @return the recomendaciones ts
	 * @since 31-mar-2011
	 * @author cfigueroa
	 */
	public RecomendacionesTS getRecomendacionesTS() {
		return recomendacionesTS;
	}

	
	/**
	 * Gets the observaciones generales.
	 *
	 * @return the observaciones generales
	 * @since 31-mar-2011
	 * @author cfigueroa
	 */
	public String getObservacionesGenerales() {
		return observacionesGenerales;
	}

	/**
	 * Sets the observaciones generales.
	 *
	 * @param observacionesGenerales the new observaciones generales
	 * @since 31-mar-2011
	 * @author cfigueroa
	 */
	public void setObservacionesGenerales(String observacionesGenerales) {
		this.observacionesGenerales = observacionesGenerales;
	}

	/**
	 * Sets the recomendaciones ts.
	 *
	 * @param recomendacionesTS the new recomendaciones ts
	 * @since 31-mar-2011
	 * @author cfigueroa
	 */
	public void setRecomendacionesTS(RecomendacionesTS recomendacionesTS) {
		this.recomendacionesTS = recomendacionesTS;
	}

	/**
	 * Gets the observaciones ts.
	 *
	 * @return the observaciones ts
	 * @since 31-mar-2011
	 * @author cfigueroa
	 */
	public String getObservacionesTS() {
		return observacionesTS;
	}

	/**
	 * Sets the observaciones ts.
	 *
	 * @param observacionesTS the new observaciones ts
	 * @since 31-mar-2011
	 * @author cfigueroa
	 */
	public void setObservacionesTS(String observacionesTS) {
		this.observacionesTS = observacionesTS;
	}

	/**
	 * Gets the motivo visita.
	 *
	 * @return the motivo visita
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public MotivoEnvioTS getMotivoVisita() {
		return motivoVisita;
	}

	/**
	 * Sets the motivo visita.
	 *
	 * @param motivoVisita the new motivo visita
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setMotivoVisita(MotivoEnvioTS motivoVisita) {
		this.motivoVisita = motivoVisita;
	}

	/**
	 * Gets the motivo rechazo.
	 *
	 * @return the motivo rechazo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public MotivoRechazo getMotivoRechazo() {
		return motivoRechazo;
	}

	/**
	 * Sets the motivo rechazo.
	 *
	 * @param motivoRechazo the new motivo rechazo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setMotivoRechazo(MotivoRechazo motivoRechazo) {
		this.motivoRechazo = motivoRechazo;
	}

	/**
	 * Gets the fecha carga entrevista.
	 *
	 * @return the fecha carga entrevista
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public Date getFechaCargaEntrevista() {
		return fechaCargaEntrevista;
	}

	/**
	 * Sets the fecha carga entrevista.
	 *
	 * @param fechaCargaEntrevista the new fecha carga entrevista
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setFechaCargaEntrevista(Date fechaCargaEntrevista) {
		this.fechaCargaEntrevista = fechaCargaEntrevista;
	}

	/**
	 * Gets the nombre ciclo.
	 *
	 * @return the nombre ciclo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public String getNombreCiclo() {
		return nombreCiclo;
	}

	/**
	 * Sets the nombre ciclo.
	 *
	 * @param nombreCiclo the new nombre ciclo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setNombreCiclo(String nombreCiclo) {
		this.nombreCiclo = nombreCiclo;
	}

	/**
	 * Gets the nombre periodo.
	 *
	 * @return the nombre periodo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public String getNombrePeriodo() {
		return nombrePeriodo;
	}

	/**
	 * Sets the nombre periodo.
	 *
	 * @param nombrePeriodo the new nombre periodo
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public void setNombrePeriodo(String nombrePeriodo) {
		this.nombrePeriodo = nombrePeriodo;
	}

	
	
	
}
