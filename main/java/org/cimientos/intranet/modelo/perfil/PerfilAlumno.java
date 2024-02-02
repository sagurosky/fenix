package org.cimientos.intranet.modelo.perfil;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.DesempenioEscolar;
import org.cimientos.intranet.modelo.FichaFamiliar;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.evento.Evento;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.Entrevista;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.cimientos.intranet.modelo.persona.Persona;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.cimientos.intranet.enumerativos.AnioEscolar;
import com.cimientos.intranet.enumerativos.EmitioCarta;
import com.cimientos.intranet.enumerativos.ProyeccionAnioProximo;
import com.cimientos.intranet.enumerativos.ProyeccionDeseada;
import com.cimientos.intranet.enumerativos.SituacionActual;
import com.cimientos.intranet.enumerativos.SituacionEscolarAlumno;
import com.cimientos.intranet.enumerativos.entrevista.Compromiso;
import com.cimientos.intranet.enumerativos.entrevista.CompromisoPBE;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionRenovacionFinal;
import com.cimientos.intranet.enumerativos.entrevista.MotivoEnvioTS;


/**
 * PerfilAlumno.
 *
 * @author Leonardo Capparelli
 */
/**
 * @author msagarduy
 * 
 */
@Entity
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE, region="org.cimientos.intranet.modelo.perfil.PerfilAlumno")
public class PerfilAlumno implements Serializable{

	/** The id. */
	@Id
	@GeneratedValue
	private Long id;
	
	private Long idTroop;

	private Date fechaPBE;
	
	private Date fechaReincorporacionPBE;

	private Date fechaAltaBeca;

	/** The datos personales. */
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Persona datosPersonales;

	/** The telefono1. */
	private String telefono1;

	/** The contacto telefono1. */
	private String contactoTelefono1;

	/** The telefono2. */
	private String telefono2;

	/** The contacto telefono2. */
	private String contactoTelefono2;

	/** The telefono3. */
	private String telefono3;

	/** The contacto telefono3. */
	private String contactoTelefono3;

	/** The escuela. */
	@ManyToOne
	private Escuela escuela;

	/** The turno. */
	private Turno turno;

	/** The responsable1. */
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private ResponsableAdulto responsable1;

	/** The responsable2. */
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private ResponsableAdulto responsable2;

	// Fecha real de carga
	/** The fecha alta. */
	private Date fechaAlta;

	/** The fecha baja. */
	private Date fechaBaja;

	/** The ea. */
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "perfil_ea_id")
	private PerfilEA ea;

	/** The boletin. */
	@OneToOne(fetch = FetchType.LAZY)
	private Boletin boletin;

	// Texto largo
	/** The material completo. */
	private String materialCompleto;

	@Enumerated(EnumType.ORDINAL)
	private DesempenioEscolar desempenioEscolar;

	/** The beca. */
	@OneToOne(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "beca_id")
	private Beca beca;

	/** The historial. */
	@OneToMany(fetch = FetchType.LAZY)
	private List<Evento> historial;
	
	/** The historial. */
	@OneToMany(fetch = FetchType.LAZY)
	private List<Entrevista> historialEntrevistas;

	/** Movito de baja se usa para guardar el motivo que haya generado dicha baja, ya sea motivo de 
	 * cesacion, motivo no renovacion, motivo no incorporacion */
	private String motivoBaja;
	// Estos campoos var para al entrevista seleccion
	/** The fecha entrevista. */
	private Date fechaEntrevista;
	// Crear enum
	/** The evaluacion. */
	private String evaluacion;
	

	/** The paga entrevista. */
	private Boolean pagaEntrevista;

	/** The estado alumno. */
	@Enumerated(EnumType.ORDINAL)
	private EstadoAlumno estadoAlumno;

	/** The ficha familiar. */
//	@OneToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
	@OneToMany(cascade={CascadeType.ALL})
	@LazyCollection(LazyCollectionOption.TRUE)
	private List<FichaFamiliar> fichaFamiliar;

	

	/** The anio. */
	private AnioEscolar anioEscolar;

	
	private String eae;
	
	
	/** The division. */
	private String division;

	/** The activo. */
	private Boolean activo;

	/** The compromiso escolaridad. */
	@Enumerated(EnumType.ORDINAL)
	private Compromiso compromisoEscolaridad;

	/** The compromiso pbe. */
	@Enumerated(EnumType.ORDINAL)
	private CompromisoPBE compromisoPbe;

	@OneToMany(fetch = FetchType.LAZY)
	private List<Boletin> historialBoletin;

	@ManyToMany
	@JoinTable(name="perfil_alumno_historial_beca")
	private List<Beca> historialBeca;

	@ManyToMany
	@JoinTable(name="perfil_alumno_historial_escuela")
	private List<Escuela> historialEscuela;
	

	@Enumerated(EnumType.ORDINAL)
	private EmitioCarta emitioCarta;
	private Boolean entrevistaTSSeleccion;
	private Boolean entrevistaTSAcompaniamento;
	private Boolean entrevistaTS;
	
	
	@ManyToMany
	@JoinTable(name="perfil_alumno_historial_ea")
	private List<PerfilEA> historialEa;
	
	@OneToOne(fetch = FetchType.LAZY)
	private PerfilTS  perfilTS;
	
	@Enumerated(EnumType.ORDINAL)
	private EvaluacionRenovacionFinal estadoRenovacion;
	@Enumerated(EnumType.ORDINAL)
	private MotivoEnvioTS motivoEnvioTS;
	
	private Boolean anioAdicional;
	
	@OneToOne
	private Periodo periodoDeEgreso;
	
	@Enumerated(EnumType.ORDINAL)
	private SituacionEscolarAlumno situacionEscolar;
	
	
	//Este campo se usa para guardar la situación escolar del becado al momento de su ultima entrevista de acompañamiento
	@Enumerated(EnumType.ORDINAL)
	private SituacionEscolarAlumno situacionEscolarUltimaEntevista;
	
	//Este campo se usa para los alumnos cuyo estado sea "Fin de participacion de PBE"
	private Date ultimaActualizacion;
	
	//Este campo se usa para los alumnos cuyo estado sea "Fin de participacion de PBE"
	@Enumerated(EnumType.ORDINAL)
	private ProyeccionAnioProximo proyeccionEntrevistaFinal;
	
	@OneToOne
	private Periodo periodoDeBaja;
	
	@Enumerated(EnumType.ORDINAL)
	private SituacionActual situacionActual;
	
	private String otraSituacion;
	
	@Enumerated(EnumType.ORDINAL)
	private ProyeccionDeseada proyeccionDeseada;
	
	private String otraProyeccion;
	
	private String obsPostPBE;
	
	private Date fechaSituacionActual;
	
	private Date fechaProyeccionDeseada;
	
	//2018
		private Boolean saludBecado;
		
		private Boolean saludFamilia;
		
		@Column(length=500)
		private String saludBecadoCual;
		
		@Column(length=500)
		private String saludFamiliarCual;
		
		@Column(length=50)
		private String tiempoLibre;
		@Column(length=500)
		private String cuandoTermine;
		
		/** The observaciones generales. */
		@Column(length=1000)
		private String observacionesGenerales;
	
	/**
	 * Constructor creado para hibernate
	 *
	 * @since 14-feb-2011
	 * @author cfigueroa
	 */
	public PerfilAlumno(){
		this.setHistorialBeca(new ArrayList<Beca>());
		this.setHistorial(new ArrayList<Evento>());
		this.setHistorialBoletin(new ArrayList<Boletin>());
		this.setHistorialEa(new ArrayList<PerfilEA>());
		this.setHistorialEscuela(new ArrayList<Escuela>());
		this.setAnioAdicional(false);
	};
	
	/**
	 * Constructo creado para copiar los datos de AlumnoSeleccion en perfilAlumno
	 *   
	 *
	 * @param alumnoSeleccion the alumno seleccion
	 * @since 14-feb-2011
	 * @author cfigueroa
	 */
	public PerfilAlumno (AlumnoSeleccion alumnoSeleccion){
		this.setAnioEscolar(alumnoSeleccion.getAnioEscolar());
		this.setCompromisoEscolaridad(alumnoSeleccion.getCompromisoEscolaridad());
		this.setCompromisoPbe(alumnoSeleccion.getCompromisoPbe());
		this.setContactoTelefono1(alumnoSeleccion.getContactoTelefono1());
		this.setContactoTelefono2(alumnoSeleccion.getContactoTelefono2());
		this.setContactoTelefono3(alumnoSeleccion.getContactoTelefono3());
		this.setDivision(alumnoSeleccion.getDivision());
		this.setEstadoAlumno(alumnoSeleccion.getEstadoAlumno());
		this.setEvaluacion(alumnoSeleccion.getEvaluacion());
		this.setFichaFamiliar(alumnoSeleccion.getFichaFamiliar());
		this.setTelefono1(alumnoSeleccion.getTelefono1());
		this.setTelefono2(alumnoSeleccion.getTelefono2());
		this.setTelefono3(alumnoSeleccion.getTelefono3());
		this.setTurno(alumnoSeleccion.getTurno());
		this.setHistorialBeca(new ArrayList<Beca>());
		this.setHistorial(new ArrayList<Evento>());
		this.setHistorialBoletin(new ArrayList<Boletin>());
		this.setHistorialEa(new ArrayList<PerfilEA>());
		this.setHistorialEscuela(new ArrayList<Escuela>());
		this.setAnioAdicional(alumnoSeleccion.getAnioAdicional());
		this.setEae(alumnoSeleccion.getEae());
		this.setSaludBecado(alumnoSeleccion.getSaludBecado());
		this.setSaludBecadoCual(alumnoSeleccion.getSaludBecadoCual());;
		this.setSaludFamilia(alumnoSeleccion.getSaludFamilia());
		this.setSaludFamiliarCual(alumnoSeleccion.getSaludFamiliarCual());
		this.setTiempoLibre(alumnoSeleccion.getTiempoLibre());
		this.setCuandoTermine(alumnoSeleccion.getCuandoTermine());
		this.setObservacionesGenerales(alumnoSeleccion.getObservacionesGenerales());
		
	}
	

	
	

	public String getEae() {
		return eae;
	}

	public void setEae(String eae) {
		this.eae = eae;
	}

	public String getMotivoBaja() {
		return motivoBaja;
	}

	public void setMotivoBaja(String motivoBaja) {
		this.motivoBaja = motivoBaja;
	}

	/**
	 * Gets the id.
	 * 
	 * @return the id
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Sets the id.
	 * 
	 * @param id
	 *            the id to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the datos personales.
	 * 
	 * @return the datosPersonales
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Persona getDatosPersonales() {
		return datosPersonales;
	}

	/**
	 * Sets the datos personales.
	 * 
	 * @param datosPersonales
	 *            the datosPersonales to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setDatosPersonales(Persona datosPersonales) {
		this.datosPersonales = datosPersonales;
	}

	/**
	 * Gets the telefono1.
	 * 
	 * @return the telefono1
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public String getTelefono1() {
		return telefono1;
	}

	/**
	 * Sets the telefono1.
	 * 
	 * @param telefono1
	 *            the telefono1 to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setTelefono1(String telefono1) {
		this.telefono1 = telefono1;
	}

	/**
	 * Gets the contacto telefono1.
	 * 
	 * @return the contacto_telefono1
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public String getContactoTelefono1() {
		return contactoTelefono1;
	}

	/**
	 * Sets the contacto telefono1.
	 * 
	 * @param contactoTelefono1
	 *            the contacto_telefono1 to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setContactoTelefono1(String contactoTelefono1) {
		this.contactoTelefono1 = contactoTelefono1;
	}

	/**
	 * Gets the telefono2.
	 * 
	 * @return the telefono2
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public String getTelefono2() {
		return telefono2;
	}

	/**
	 * Sets the telefono2.
	 * 
	 * @param telefono2
	 *            the telefono2 to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setTelefono2(String telefono2) {
		this.telefono2 = telefono2;
	}

	/**
	 * Gets the contacto telefono2.
	 * 
	 * @return the contacto_telefono2
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public String getContactoTelefono2() {
		return contactoTelefono2;
	}

	/**
	 * Sets the contacto telefono2.
	 * 
	 * @param contactoTelefono2
	 *            the contacto_telefono2 to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setContactoTelefono2(String contactoTelefono2) {
		this.contactoTelefono2 = contactoTelefono2;
	}

	/**
	 * Gets the telefono3.
	 * 
	 * @return the telefono3
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public String getTelefono3() {
		return telefono3;
	}

	/**
	 * Sets the telefono3.
	 * 
	 * @param telefono3
	 *            the telefono3 to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setTelefono3(String telefono3) {
		this.telefono3 = telefono3;
	}

	/**
	 * Gets the contacto telefono3.
	 * 
	 * @return the contacto_telefono3
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public String getContactoTelefono3() {
		return contactoTelefono3;
	}

	/**
	 * Sets the contacto telefono3.
	 * 
	 * @param contactoTelefono3
	 *            the contacto_telefono3 to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setContactoTelefono3(String contactoTelefono3) {
		this.contactoTelefono3 = contactoTelefono3;
	}


	/**
	 * Gets the turno.
	 * 
	 * @return the turno
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Turno getTurno() {
		return turno;
	}

	/**
	 * Sets the turno.
	 * 
	 * @param turno
	 *            the turno to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setTurno(Turno turno) {
		this.turno = turno;
	}


	/**
	 * Gets the fecha alta.
	 * 
	 * @return the fechaAlta
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Date getFechaAlta() {
		return fechaAlta;
	}

	/**
	 * Sets the fecha alta.
	 * 
	 * @param fechaAlta
	 *            the fechaAlta to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	/**
	 * Gets the fecha baja.
	 * 
	 * @return the fechaBaja
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Date getFechaBaja() {
		return fechaBaja;
	}

	/**
	 * Sets the fecha baja.
	 * 
	 * @param fechaBaja
	 *            the fechaBaja to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setFechaBaja(Date fechaBaja) {
		this.fechaBaja = fechaBaja;
	}



	/**
	 * Gets the material completo.
	 * 
	 * @return the materialCompleto
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public String getMaterialCompleto() {
		return materialCompleto;
	}

	/**
	 * Sets the material completo.
	 * 
	 * @param materialCompleto
	 *            the materialCompleto to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setMaterialCompleto(String materialCompleto) {
		this.materialCompleto = materialCompleto;
	}


	/**
	 * Gets the historial.
	 * 
	 * @return the historial
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public List<Evento> getHistorial() {
		return historial;
	}

	/**
	 * Sets the historial.
	 * 
	 * @param historial
	 *            the historial to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setHistorial(List<Evento> historial) {
		this.historial = historial;
	}

	

	public DesempenioEscolar getDesempenioEscolar() {
		return desempenioEscolar;
	}

	public void setDesempenioEscolar(DesempenioEscolar desempenioEscolar) {
		this.desempenioEscolar = desempenioEscolar;
	}

	/**
	 * Gets the escuela.
	 * 
	 * @return the escuela
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Escuela getEscuela() {
		return escuela;
	}

	/**
	 * Sets the escuela.
	 * 
	 * @param escuela
	 *            the escuela to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setEscuela(Escuela escuela) {
		this.escuela = escuela;
	}

	/**
	 * Gets the responsable1.
	 * 
	 * @return the responsable1
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public ResponsableAdulto getResponsable1() {
		return responsable1;
	}

	/**
	 * Sets the responsable1.
	 * 
	 * @param responsable1
	 *            the responsable1 to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setResponsable1(ResponsableAdulto responsable1) {
		this.responsable1 = responsable1;
	}

	/**
	 * Gets the responsable2.
	 * 
	 * @return the responsable2
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public ResponsableAdulto getResponsable2() {
		return responsable2;
	}

	/**
	 * Sets the responsable2.
	 * 
	 * @param responsable2
	 *            the responsable2 to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setResponsable2(ResponsableAdulto responsable2) {
		this.responsable2 = responsable2;
	}

	

	/**
	 * Gets the ea.
	 * 
	 * @return the ea
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public PerfilEA getEa() {
		return ea;
	}

	/**
	 * Sets the ea.
	 * 
	 * @param ea
	 *            the ea to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setEa(PerfilEA ea) {
		this.ea = ea;
	}

	/**
	 * Gets the ficha familiar.
	 * 
	 * @return the fichaFamiliar
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public List<FichaFamiliar> getFichaFamiliar() {
		return fichaFamiliar;
	}

	/**
	 * Sets the ficha familiar.
	 * 
	 * @param fichaFamiliar
	 *            the fichaFamiliar to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setFichaFamiliar(List<FichaFamiliar> fichaFamiliar) {
		this.fichaFamiliar = fichaFamiliar;
	}

	/**
	 * Gets the boletin.
	 * 
	 * @return the boletin
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Boletin getBoletin() {
		return boletin;
	}

	/**
	 * Sets the boletin.
	 * 
	 * @param boletin
	 *            the boletin to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setBoletin(Boletin boletin) {
		this.boletin = boletin;
	}

	/**
	 * Gets the beca.
	 * 
	 * @return the beca
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Beca getBeca() {
		return beca;
	}

	/**
	 * Sets the beca.
	 * 
	 * @param beca
	 *            the beca to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setBeca(Beca beca) {
		this.beca = beca;
	}

	/**
	 * Gets the fecha entrevista.
	 * 
	 * @return the fechaEntrevista
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Date getFechaEntrevista() {
		return fechaEntrevista;
	}

	/**
	 * Sets the fecha entrevista.
	 * 
	 * @param fechaEntrevista
	 *            the fechaEntrevista to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setFechaEntrevista(Date fechaEntrevista) {
		this.fechaEntrevista = fechaEntrevista;
	}

	/**
	 * Gets the evaluacion.
	 * 
	 * @return the evaluacion
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public String getEvaluacion() {
		return evaluacion;
	}

	/**
	 * Sets the evaluacion.
	 * 
	 * @param evaluacion
	 *            the evaluacion to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setEvaluacion(String evaluacion) {
		this.evaluacion = evaluacion;
	}



	/**
	 * Checks if is paga entrevista.
	 * 
	 * @return the pagaEntrevista
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Boolean isPagaEntrevista() {
		return pagaEntrevista;
	}

	/**
	 * Sets the paga entrevista.
	 * 
	 * @param pagaEntrevista
	 *            the pagaEntrevista to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setPagaEntrevista(Boolean pagaEntrevista) {
		this.pagaEntrevista = pagaEntrevista;
	}

	/**
	 * Gets the estado alumno.
	 * 
	 * @return the estadoAlumno
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public EstadoAlumno getEstadoAlumno() {
		return estadoAlumno;
	}

	/**
	 * Sets the estado alumno.
	 * 
	 * @param estadoAlumno
	 *            the estadoAlumno to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setEstadoAlumno(EstadoAlumno estadoAlumno) {
		this.estadoAlumno = estadoAlumno;
	}

	

	/**
	 * Gets the anio.
	 * 
	 * @return the anio
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public AnioEscolar getAnioEscolar() {
		return anioEscolar;
	}

	/**
	 * Sets the anio.
	 * 
	 * @param anio
	 *            the anio to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setAnioEscolar(Integer anioEscolar) {
		this.anioEscolar = AnioEscolar.getAnioEscolar(anioEscolar);
	}

	/**
	 * Gets the division.
	 * 
	 * @return the division
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public String getDivision() {
		return division;
	}

	/**
	 * Sets the division.
	 * 
	 * @param division
	 *            the division to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setDivision(String division) {
		this.division = division;
	}

	/**
	 * Gets the activo.
	 * 
	 * @return the activo
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Boolean getActivo() {
		return activo;
	}

	/**
	 * Sets the activo.
	 * 
	 * @param activo
	 *            the activo to set
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	/**
	 * Gets the compromiso escolaridad.
	 * 
	 * @return the compromiso escolaridad
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public Compromiso getCompromisoEscolaridad() {
		return compromisoEscolaridad;
	}

	/**
	 * Sets the compromiso escolaridad.
	 * 
	 * @param compromisoEscolaridad
	 *            the new compromiso escolaridad
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setCompromisoEscolaridad(Compromiso compromisoEscolaridad) {
		this.compromisoEscolaridad = compromisoEscolaridad;
	}

	/**
	 * Gets the compromiso pbe.
	 * 
	 * @return the compromiso pbe
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public CompromisoPBE getCompromisoPbe() {
		return compromisoPbe;
	}

	/**
	 * Sets the compromiso pbe.
	 * 
	 * @param compromisoPbe
	 *            the new compromiso pbe
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setCompromisoPbe(CompromisoPBE compromisoPbe) {
		this.compromisoPbe = compromisoPbe;
	}


	public Date getFechaAltaBeca() {
		return fechaAltaBeca;
	}

	public void setFechaAltaBeca(Date fechaAltaBeca) {
		this.fechaAltaBeca = fechaAltaBeca;
	}


	/**
	 * @return the historialBoletin
	 */
	public List<Boletin> getHistorialBoletin() {
		return historialBoletin;
	}

	/**
	 * @param historialBoletin
	 *            the historialBoletin to set
	 */
	public void setHistorialBoletin(List<Boletin> historialBoletin) {
		this.historialBoletin = historialBoletin;
	}

	/**
	 * @return the historialBeca
	 */
	public List<Beca> getHistorialBeca() {
		return historialBeca;
	}

	/**
	 * @param historialBeca
	 *            the historialBeca to set
	 */
	public void setHistorialBeca(List<Beca> historialBeca) {
		this.historialBeca = historialBeca;
	}

	/**
	 * Gets the historial escuela.
	 *
	 * @return the historial escuela
	 */
	public List<Escuela> getHistorialEscuela() {
		return historialEscuela;
	}

	/**
	 * Sets the historial escuela.
	 *
	 * @param historialEscuela the new historial escuela
	 */
	public void setHistorialEscuela(List<Escuela> historialEscuela) {
		this.historialEscuela = historialEscuela;
	}
	

	/**
	 * @return the fechaPBE
	 */
	public Date getFechaPBE() {
		return fechaPBE;
	}

	/**
	 * @param fechaPBE
	 *            the fechaPBE to set
	 */
	public void setFechaPBE(Date fechaPBE) {
		this.fechaPBE = fechaPBE;
	}

	/**
	 * @return the pagaEntrevista
	 */
	public Boolean getPagaEntrevista() {
		return pagaEntrevista;
	}

	/**
	 * @param anioEscolar
	 *            the anioEscolar to set
	 */
	public void setAnioEscolar(AnioEscolar anioEscolar) {
		this.anioEscolar = anioEscolar;
	}

	public EmitioCarta getEmitioCarta() {
		return emitioCarta;
	}


	public void setEmitioCarta(EmitioCarta emitioCarta) {
		this.emitioCarta = emitioCarta;
	}

	/**
	 * @return the historialEa
	 */
	public List<PerfilEA> getHistorialEa() {
		return historialEa;
	}

	/**
	 * @param historialEa the historialEa to set
	 */
	public void setHistorialEa(List<PerfilEA> historialEa) {
		this.historialEa = historialEa;
	}

	public PerfilTS getPerfilTS() {
		return perfilTS;
	}

	public void setPerfilTS(PerfilTS perfilTS) {
		this.perfilTS = perfilTS;
	}

	public Long getIdTroop() {
		return idTroop;
	}

	public void setIdTroop(Long idTroop) {
		this.idTroop = idTroop;
	}

	/**
	 * @return the estadoRenovacion
	 */
	public EvaluacionRenovacionFinal getEstadoRenovacion() {
		return estadoRenovacion;
	}

	/**
	 * @param estadoRenovacion the estadoRenovacion to set
	 */
	public void setEstadoRenovacion(EvaluacionRenovacionFinal estadoRenovacion) {
		this.estadoRenovacion = estadoRenovacion;
	}

	public MotivoEnvioTS getMotivoEnvioTS() {
		return motivoEnvioTS ;
	}

	public void setMotivoEnvioTS(MotivoEnvioTS motivoEnvioTS) {
		this.motivoEnvioTS = motivoEnvioTS;
	}

	public Boolean getEntrevistaTSSeleccion() {
		return entrevistaTSSeleccion == null ? false : entrevistaTSSeleccion;
	}

	public void setEntrevistaTSSeleccion(Boolean entrevistaTS) {
		this.entrevistaTSSeleccion = entrevistaTS;
	}

	public Boolean getEntrevistaTSAcompaniamento() {
		return entrevistaTSAcompaniamento == null ? false : entrevistaTSAcompaniamento;
	}

	public void setEntrevistaTSAcompaniamento(Boolean entrevistaTSAcompaniamento) {
		this.entrevistaTSAcompaniamento = entrevistaTSAcompaniamento;
	}

	public Boolean getEntrevistaTS() {
		return entrevistaTS;
	}

	public void setEntrevistaTS(Boolean entrevistaTS) {
		this.entrevistaTS = entrevistaTS;
	}

	/**
	 * @return the historialEntrevistas
	 */
	public List<Entrevista> getHistorialEntrevistas() {
			
		return historialEntrevistas;
	
	}

	/**
	 * @param historialEntrevistas the historialEntrevistas to set
	 */
	public void setHistorialEntrevistas(List<Entrevista> historialEntrevistas) {
		this.historialEntrevistas = historialEntrevistas;
	}

	public Boolean getAnioAdicional() {
		return anioAdicional;
	}

	public void setAnioAdicional(Boolean anioAdicional) {
		this.anioAdicional = anioAdicional;
	}

	public Periodo getPeriodoDeEgreso() {
		return periodoDeEgreso;
	}

	public void setPeriodoDeEgreso(Periodo periodoDeEgreso) {
		this.periodoDeEgreso = periodoDeEgreso;
	}

	public SituacionEscolarAlumno getSituacionEscolar() {
		return situacionEscolar;
	}

	public void setSituacionEscolar(SituacionEscolarAlumno situacionEscolar) {
		this.situacionEscolar = situacionEscolar;
	}

	public Date getUltimaActualizacion() {
		return ultimaActualizacion;
	}

	public void setUltimaActualizacion(Date ultimaActualizacion) {
		this.ultimaActualizacion = ultimaActualizacion;
	}

	public Periodo getPeriodoDeBaja() {
		return periodoDeBaja;
	}

	public void setPeriodoDeBaja(Periodo periodoDeBaja) {
		this.periodoDeBaja = periodoDeBaja;
	}
	
	public String getNombrePadrinoHistorial(){
		if(this.getHistorialBeca() != null && this.getHistorialBeca().size() > 0){
			if(this.getHistorialBeca().get(this.getHistorialBeca().size() -1).getPadrino().getDatosPersonales() != null){
				return this.getHistorialBeca().get(this.getHistorialBeca().size() -1).getPadrino().getDatosPersonales().getApellido() +
						", " + this.getHistorialBeca().get(this.getHistorialBeca().size() -1).getPadrino().getDatosPersonales().getNombre();
				
			}
			else{
				return this.getHistorialBeca().get(this.getHistorialBeca().size() -1).getPadrino().getEmpresa().getDenominacion();
			}
		}
		return "";
	}
	
	public String getTipoPadrinoHistorial(){
		if(this.getHistorialBeca() != null && this.getHistorialBeca().size() > 0){
			if(this.getHistorialBeca().get(this.getHistorialBeca().size() -1).getPadrino().getDatosPersonales() != null){
				return this.getHistorialBeca().get(this.getHistorialBeca().size() -1).getPadrino().getTipo().getValor();		
			}
			else{
				return this.getHistorialBeca().get(this.getHistorialBeca().size() -1).getPadrino().getTipo().getValor();
			}
		}
		return "";
	}

	public String getIdPlataformaPadrinoHistorial(){
		if(this.getHistorialBeca() != null && this.getHistorialBeca().size() > 0){
			if(this.getHistorialBeca().get(this.getHistorialBeca().size() -1).getPadrino().getDatosPersonales() != null){
				if(this.getHistorialBeca().get(this.getHistorialBeca().size() -1).getPadrino().getNroCtesPlataformaContable()!=null){
					return this.getHistorialBeca().get(this.getHistorialBeca().size() -1).getPadrino().getNroCtesPlataformaContable().toString();		
				}
				return "";
				}				
			else{
				//return this.getHistorialBeca().get(this.getHistorialBeca().size() -1).getPadrino().getNroCtesPlataformaContable().toString();
				return "";
			}
		}
		return "";
	}
	
	public SituacionActual getSituacionActual() {
		return situacionActual;
	}

	public void setSituacionActual(SituacionActual situacionActual) {
		this.situacionActual = situacionActual;
	}

	public ProyeccionDeseada getProyeccionDeseada() {
		return proyeccionDeseada;
	}

	public void setProyeccionDeseada(ProyeccionDeseada proyeccionDeseada) {
		this.proyeccionDeseada = proyeccionDeseada;
	}

	public String getOtraSituacion() {
		return otraSituacion;
	}

	public void setOtraSituacion(String otraSituacion) {
		this.otraSituacion = otraSituacion;
	}

	public String getOtraProyeccion() {
		return otraProyeccion;
	}

	public void setOtraProyeccion(String otraProyeccion) {
		this.otraProyeccion = otraProyeccion;
	}

	public String getObsPostPBE() {
		return obsPostPBE;
	}

	public void setObsPostPBE(String obsPostPBE) {
		this.obsPostPBE = obsPostPBE;
	}

	public Date getFechaSituacionActual() {
		return fechaSituacionActual;
	}

	public void setFechaSituacionActual(Date fechaSituacionActual) {
		this.fechaSituacionActual = fechaSituacionActual;
	}

	public Date getFechaProyeccionDeseada() {
		return fechaProyeccionDeseada;
	}

	public void setFechaProyeccionDeseada(Date fechaProyeccionDeseada) {
		this.fechaProyeccionDeseada = fechaProyeccionDeseada;
	}
	
	public ProyeccionAnioProximo getProyeccionEntrevistaFinal() {
		return proyeccionEntrevistaFinal;
	}

	public void setProyeccionEntrevistaFinal(
			ProyeccionAnioProximo proyeccionEntrevistaFinal) {
		this.proyeccionEntrevistaFinal = proyeccionEntrevistaFinal;
	}

	public SituacionEscolarAlumno getSituacionEscolarUltimaEntevista() {
		return situacionEscolarUltimaEntevista;
	}

	public void setSituacionEscolarUltimaEntevista(
			SituacionEscolarAlumno situacionEscolarUltimaEntevista) {
		this.situacionEscolarUltimaEntevista = situacionEscolarUltimaEntevista;
	}

	public Date getFechaReincorporacionPBE() {
		return fechaReincorporacionPBE;
	}

	public void setFechaReincorporacionPBE(Date fechaReincorporacionPBE) {
		this.fechaReincorporacionPBE = fechaReincorporacionPBE;
	}	

	
	public Boletin obtenerBoletinCiclo(CicloPrograma ciclo){
		boolean esBoletinCiclo = false;
		Boletin boletinCiclo = null;
		Iterator<Boletin> it = getHistorialBoletin().iterator();
		while (it.hasNext() && !esBoletinCiclo) {
			Boletin bole = it.next();
			if(bole.getCiclo()!= null && bole.getCiclo().equals(ciclo)){
				boletinCiclo = bole;
				esBoletinCiclo = true;
			}						
		}
		return boletinCiclo;
	}

	public Boolean getSaludBecado() {
		return saludBecado;
	}

	public void setSaludBecado(Boolean saludBecado) {
		this.saludBecado = saludBecado;
	}

	public Boolean getSaludFamilia() {
		return saludFamilia;
	}

	public void setSaludFamilia(Boolean saludFamilia) {
		this.saludFamilia = saludFamilia;
	}

	public String getSaludBecadoCual() {
		return saludBecadoCual;
	}

	public void setSaludBecadoCual(String saludBecadoCual) {
		this.saludBecadoCual = saludBecadoCual;
	}

	public String getSaludFamiliarCual() {
		return saludFamiliarCual;
	}

	public void setSaludFamiliarCual(String saludFamiliarCual) {
		this.saludFamiliarCual = saludFamiliarCual;
	}

	public String getTiempoLibre() {
		return tiempoLibre;
	}

	public void setTiempoLibre(String tiempoLibre) {
		this.tiempoLibre = tiempoLibre;
	}

	public String getCuandoTermine() {
		return cuandoTermine;
	}

	public void setCuandoTermine(String cuandoTermine) {
		this.cuandoTermine = cuandoTermine;
	}

	public String getObservacionesGenerales() {
		return observacionesGenerales;
	}

	public void setObservacionesGenerales(String observacionesGenerales) {
		this.observacionesGenerales = observacionesGenerales;
	}

	
	
}
