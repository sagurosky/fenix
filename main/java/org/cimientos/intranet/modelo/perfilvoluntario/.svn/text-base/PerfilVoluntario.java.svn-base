package org.cimientos.intranet.modelo.perfilvoluntario;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.Parametro;
import org.cimientos.intranet.modelo.evento.Evento;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.utils.Formateador;
import org.hibernate.annotations.Where;

import com.cimientos.intranet.enumerativos.Antiguedad;





/**
 * The Class PerfilVoluntario.
 * @author cfigueroa
 */
@Entity
public class PerfilVoluntario implements Serializable{
	
	/** The id voluntario. */
	@Id
	@GeneratedValue
	/** The id PerfilVoluntario. */
	
	private Long id;
	
	/** The datos personales. */
	@OneToOne(cascade=CascadeType.ALL)
	private Persona datosPersonales;
	
	/** The voluntariados. */
	private Integer voluntariados;
	
	/** The horas donadas. */
	private Float horasDonadas;
	
	/** The historial. */

	@OneToMany 
	private List<Evento> historial;
	
	/** The activo. */
	private Boolean activo;
	
	/** The antiguedad. */
	@Enumerated(EnumType.ORDINAL)
	private Antiguedad antiguedad;
	
	/** The anio. */
	private Integer anio;
	
	
	/** The profesion. */
	private String profesion;
	
	/** The contacto conocimietos. */
	private String contactoCimientos;
	
	/** The fecha contacto. */
	private Date fechaContacto;
	
	/** The fecha desde. */
	private Date fechaDesde;
	
	/** The fecha hasta. */
	private Date fechaHasta;
	
	
	/** The detalle dedicacion. */
	@Column(length=350)
	private String detalleDedicacion;
	
	/** The area. */
	@ManyToOne
	private Parametro area;
	
	/** The proyecto. */
	private String proyecto;
	
	/** The tarea realizada. */
	private String tareaRealizada;
	
	
	
	/** The capicitado seleccion. */
	private Boolean capicitadoSeleccion;
	
	/** The interes seleccion. */
	private Boolean interesSeleccion;
	
	/** The capacitado jornadas. */
	private Boolean capacitadoJornadas;
	
	/** The interes jornadas. */
	private Boolean interesJornadas;
	
	/** The interes presente. */
	private Boolean interesPresente;
	
	/** The interes tareas operativas. */
	private Boolean interesTareasOperativas;
	
	/** The interes tareas profesionales. */
	private Boolean interesTareasProfesionales;
	
	/** The evaluacion. */
	private Boolean evaluacion;
	
	/** The observaciones. */
	@Column(length=350)
	private String observaciones;
	
	/** The induccion. */
	private Boolean induccion;
	
	/** The relacion. */
	private Boolean relacion;
	
	/** The capacitado seleccion. */
	private Boolean capacitadoSeleccion;
	
	/** The termino actividad. */
	private Boolean terminoActividad;
	
	/**
	 * Gets the id PerfilVoluntario.
	 *
	 * @return the id PerfilVoluntario
	 * @since 20-oct-2010
	 * @author cfigueroa
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Sets the id PerfilVoluntario.
	 *
	 * @param id the new id PerfilVoluntario
	 * @since 20-oct-2010
	 * @author cfigueroa
	 */
	public void setId(Long id) {
		this.id = id;
	}

	
	
	/**
	 * Gets the datos personales.
	 *
	 * @return the datos personales
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Persona getDatosPersonales() {
		return datosPersonales;
	}

	/**
	 * Sets the datos personales.
	 *
	 * @param datosPersonales the new datos personales
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setDatosPersonales(Persona datosPersonales) {
		this.datosPersonales = datosPersonales;
	}

	/**
	 * Gets the voluntariados.
	 *
	 * @return the voluntariados
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Integer getVoluntariados() {
		return voluntariados;
	}

	/**
	 * Sets the voluntariados.
	 *
	 * @param voluntariados the new voluntariados
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setVoluntariados(Integer voluntariados) {
		this.voluntariados = voluntariados;
	}

	/**
	 * Gets the horas donadas.
	 *
	 * @return the horas donadas
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Float getHorasDonadas() {
		return horasDonadas;
	}

	/**
	 * Sets the horas donadas.
	 *
	 * @param horasDonadas the new horas donadas
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setHorasDonadas(Float horasDonadas) {
		this.horasDonadas = horasDonadas;
	}
//
//	/**
//	 * Gets the historial.
//	 *
//	 * @return the historial
//	 * @since 21-oct-2010
//	 * @author cfigueroa
//	 */
//	public List<Evento> getHistorial() {
//		return historial;
//	}

	/**
	 * Sets the historial.
	 *
	 * @param historial the new historial
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setHistorial(List<Evento> historial) {
		this.historial = historial;
	}

	public Boolean isActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	public List<Evento> getHistorial() {
		return historial;
	}

	public Boolean getCapicitadoSeleccion() {
		return capicitadoSeleccion;
	}

	/**
	 * Gets the antiguedad.
	 *
	 * @return the antiguedad
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Antiguedad getAntiguedad() {
		return antiguedad;
	}

	/**
	 * Sets the antiguedad.
	 *
	 * @param antiguedad the new antiguedad
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setAntiguedad(Antiguedad antiguedad) {
		this.antiguedad = antiguedad;
	}

	/**
	 * Gets the ano.
	 *
	 * @return the ano
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Integer getAno() {
		return anio;
	}

	/**
	 * Sets the ano.
	 *
	 * @param ano the new ano
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setAno(Integer ano) {
		this.anio = ano;
	}

	

	/**
	 * Gets the profesion.
	 *
	 * @return the profesion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public String getProfesion() {
		return profesion;
	}

	/**
	 * Sets the profesion.
	 *
	 * @param profesion the new profesion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setProfesion(String profesion) {
		this.profesion = profesion;
	}

	/**
	 * Gets the contacto conocimietos.
	 *
	 * @return the contacto conocimietos
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public String getContactoCimientos() {
		return contactoCimientos;
	}

	/**
	 * Sets the contacto conocimietos.
	 *
	 * @param contactoConocimietos the new contacto cimientos
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setContactoCimientos(String contactoConocimietos) {
		this.contactoCimientos = contactoConocimietos;
	}

	/**
	 * Gets the fecha contacto.
	 *
	 * @return the fecha contacto
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Date getFechaContacto() {
		return fechaContacto;
	}

	/**
	 * Sets the fecha contacto.
	 *
	 * @param fechaContacto the new fecha contacto
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setFechaContacto(String fechaContacto) {
		this.fechaContacto = Formateador.parsearFecha(fechaContacto);
	}

	/**
	 * Gets the fecha desde.
	 *
	 * @return the fecha desde
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Date getFechaDesde() {
		return fechaDesde;
	}

	/**
	 * Sets the fecha desde.
	 *
	 * @param fechaDesde the new fecha desde
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setFechaDesde(String fechaDesde) {
		this.fechaDesde = Formateador.parsearFecha(fechaDesde);
	}

	/**
	 * Gets the fecha hasta.
	 *
	 * @return the fecha hasta
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Date getFechaHasta() {
		return fechaHasta;
	}

	/**
	 * Sets the fecha hasta.
	 *
	 * @param fechaHasta the new fecha hasta
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setFechaHasta(String fechaHasta) {
		this.fechaHasta = Formateador.parsearFecha(fechaHasta);
	}

	/**
	 * Gets the detalle dedicacion.
	 *
	 * @return the detalle dedicacion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public String getDetalleDedicacion() {
		return detalleDedicacion;
	}

	/**
	 * Sets the detalle dedicacion.
	 *
	 * @param detalleDedicacion the new detalle dedicacion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setDetalleDedicacion(String detalleDedicacion) {
		this.detalleDedicacion = detalleDedicacion;
	}

	/**
	 * Gets the area.
	 *
	 * @return the area
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Parametro getArea() {
		return area;
	}

	/**
	 * Sets the area.
	 *
	 * @param area the new area
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setArea(Parametro area) {
		this.area = area;
	}

	/**
	 * Gets the proyecto.
	 *
	 * @return the proyecto
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public String getProyecto() {
		return proyecto;
	}

	/**
	 * Sets the proyecto.
	 *
	 * @param proyecto the new proyecto
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setProyecto(String proyecto) {
		this.proyecto = proyecto;
	}

	/**
	 * Gets the tarea realizada.
	 *
	 * @return the tarea realizada
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public String getTareaRealizada() {
		return tareaRealizada;
	}

	/**
	 * Sets the tarea realizada.
	 *
	 * @param tareaRealizada the new tarea realizada
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setTareaRealizada(String tareaRealizada) {
		this.tareaRealizada = tareaRealizada;
	}

	
	/**
	 * Checks if is capicitado seleccion.
	 *
	 * @return true, if is capicitado seleccion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Boolean isCapicitadoSeleccion() {
		return capicitadoSeleccion;
	}

	/**
	 * Sets the capicitado seleccion.
	 *
	 * @param capicitadoSeleccion the new capicitado seleccion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setCapicitadoSeleccion(Boolean capicitadoSeleccion) {
		this.capicitadoSeleccion = capicitadoSeleccion;
	}

	/**
	 * Checks if is interes seleccion.
	 *
	 * @return true, if is interes seleccion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Boolean getInteresSeleccion() {
		return interesSeleccion;
	}

	/**
	 * Sets the interes seleccion.
	 *
	 * @param interesSeleccion the new interes seleccion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setInteresSeleccion(Boolean interesSeleccion) {
		this.interesSeleccion = interesSeleccion;
	}

	/**
	 * Checks if is capacitado jornadas.
	 *
	 * @return true, if is capacitado jornadas
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Boolean getCapacitadoJornadas() {
		return capacitadoJornadas;
	}

	/**
	 * Sets the capacitado jornadas.
	 *
	 * @param capacitadoJornadas the new capacitado jornadas
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setCapacitadoJornadas(Boolean capacitadoJornadas) {
		this.capacitadoJornadas = capacitadoJornadas;
	}

	/**
	 * Checks if is interes jornadas.
	 *
	 * @return true, if is interes jornadas
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Boolean getInteresJornadas() {
		return interesJornadas;
	}

	/**
	 * Sets the interes jornadas.
	 *
	 * @param interesJornadas the new interes jornadas
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setInteresJornadas(Boolean interesJornadas) {
		this.interesJornadas = interesJornadas;
	}

	/**
	 * Checks if is interes presente.
	 *
	 * @return true, if is interes presente
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Boolean getInteresPresente() {
		return interesPresente;
	}

	/**
	 * Sets the interes presente.
	 *
	 * @param interesPresente the new interes presente
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setInteresPresente(Boolean interesPresente) {
		this.interesPresente = interesPresente;
	}

	/**
	 * Checks if is interes tareas operativas.
	 *
	 * @return true, if is interes tareas operativas
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Boolean getInteresTareasOperativas() {
		return interesTareasOperativas;
	}

	/**
	 * Sets the interes tareas operativas.
	 *
	 * @param interesTareasOperativas the new interes tareas operativas
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setInteresTareasOperativas(Boolean interesTareasOperativas) {
		this.interesTareasOperativas = interesTareasOperativas;
	}

	/**
	 * Checks if is interes tareas profesionales.
	 *
	 * @return true, if is interes tareas profesionales
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Boolean getInteresTareasProfesionales() {
		return interesTareasProfesionales;
	}

	/**
	 * Sets the interes tareas profesionales.
	 *
	 * @param interesTareasProfesionales the new interes tareas profesionales
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setInteresTareasProfesionales(Boolean interesTareasProfesionales) {
		this.interesTareasProfesionales = interesTareasProfesionales;
	}

	/**
	 * Checks if is evaluacion.
	 *
	 * @return true, if is evaluacion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Boolean getEvaluacion() {
		return evaluacion;
	}

	/**
	 * Sets the evaluacion.
	 *
	 * @param evaluacion the new evaluacion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setEvaluacion(Boolean evaluacion) {
		this.evaluacion = evaluacion;
	}

	/**
	 * Checks if is terminoActividad.
	 *
	 * @return true, if is terminoActividad
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Boolean getTerminoActividad() {
		return terminoActividad;
	}

	/**
	 * Gets the observaciones.
	 *
	 * @return the observaciones
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public String getObservaciones() {
		return observaciones;
	}

	/**
	 * Sets the observaciones.
	 *
	 * @param observaciones the new observaciones
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	/**
	 * Checks if is induccion.
	 *
	 * @return true, if is induccion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Boolean getInduccion() {
		return induccion;
	}

	/**
	 * Sets the induccion.
	 *
	 * @param induccion the new induccion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setInduccion(Boolean induccion) {
		this.induccion = induccion;
	}

	/**
	 * Checks if is relacion.
	 *
	 * @return true, if is relacion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public Boolean getRelacion() {
		return relacion;
	}

	/**
	 * Sets the relacion.
	 *
	 * @param relacion the new relacion
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setRelacion(Boolean relacion) {
		this.relacion = relacion;
	}
	
	
	/**
	 * Gets the anio.
	 *
	 * @return the anio
	 * @since 10-nov-2010
	 * @author cfigueroa
	 */
	public Integer getAnio() {
		return anio;
	}

	/**
	 * Sets the anio.
	 *
	 * @param anio the new anio
	 * @since 10-nov-2010
	 * @author cfigueroa
	 */
	public void setAnio(Integer anio) {
		this.anio = anio;
	}

	/**
	 * Checks if is capacitado seleccion.
	 *
	 * @return true, if is capacitado seleccion
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public Boolean getCapacitadoSeleccion() {
		return capacitadoSeleccion;
	}

	/**
	 * Sets the capacitado seleccion.
	 *
	 * @param capacitadoSeleccion the new capacitado seleccion
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public void setCapacitadoSeleccion(Boolean capacitadoSeleccion) {
		this.capacitadoSeleccion = capacitadoSeleccion;
	}

	/**
	 * Sets the fecha contacto.
	 *
	 * @param fechaContacto the new fecha contacto
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public void setFechaContacto(Date fechaContacto) {
		this.fechaContacto = fechaContacto;
	}

	/**
	 * Sets the fecha desde.
	 *
	 * @param fechaDesde the new fecha desde
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public void setFechaDesde(Date fechaDesde) {
		this.fechaDesde = fechaDesde;
	}

	/**
	 * Sets the fecha hasta.
	 *
	 * @param fechaHasta the new fecha hasta
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public void setFechaHasta(Date fechaHasta) {
		this.fechaHasta = fechaHasta;
	}

	/**
	 * Checks if is termino actividad.
	 *
	 * @return true, if is termino actividad
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public Boolean isTerminoActividad() {
		return terminoActividad;
	}

	/**
	 * Sets the termino actividad.
	 *
	 * @param terminoActividad the new termino actividad
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public void setTerminoActividad(Boolean terminoActividad) {
		this.terminoActividad = terminoActividad;
	}

//	/**
//	 * Gets the historial.
//	 *
//	 * @return the historial
//	 * @since 10-nov-2010
//	 * @author cfigueroa
//	 */
//	public List<Evento> getHistorial() {
//		return historial;
//	} 
}
