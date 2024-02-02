package org.cimientos.intranet.modelo.seleccion;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.candidato.convocatoria.ConvocatoriaSeleccion;
import org.cimientos.intranet.modelo.perfil.AlumnoSeleccion;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.hibernate.annotations.CollectionOfElements;

import com.cimientos.intranet.enumerativos.AnioEscolar;
import com.cimientos.intranet.enumerativos.Conducta;
import com.cimientos.intranet.enumerativos.entrevista.EstadoEntrevista;
import com.cimientos.intranet.enumerativos.entrevista.MotivoEnvioTS;
import com.cimientos.intranet.enumerativos.entrevista.MotivoRechazo;
import com.googlecode.ehcache.annotations.Cacheable;

/**
 * The Class EntrevistaSeleccion.
 */
/**
 * @author plabaronnie
 *
 */
@Entity
public class EntrevistaSeleccion {
	/** The id. */
	@Id
	@GeneratedValue
	private Long id;
	
	/** The id perfil alumno. */
	@OneToOne(cascade = CascadeType.ALL)
	private AlumnoSeleccion perfilAlumno;
	
	/** The estado entrevista. */
	@Enumerated(EnumType.ORDINAL)
	private EstadoEntrevista estadoEntrevista;
	
	/** The convocatoria. */
	@OneToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
	private ConvocatoriaSeleccion convocatoria;
	
	/** The estado entrevista alumno. */
	@Enumerated(EnumType.ORDINAL)
	private EstadoAlumno  estadoEntrevistaAlumno;
	
	/** The fecha carga entrevista. */
	private Date fechaCargaEntrevista;
	
	/** The otro motivo rechazo. */
	@Column(length=10000)
	private String otroMotivoRechazo;
	
	/** The repitio. */
	private Boolean repitio;
	
	/** The anio repitio. */
	@CollectionOfElements(targetElement = AnioEscolar.class)
	@Column(name = "anio_repitio", nullable = false)
	@Enumerated(EnumType.ORDINAL)
	private List<AnioEscolar> anioRepitio;
	
	@CollectionOfElements(targetElement = AnioEscolar.class)
	@Column(name = "anio_abandono", nullable = false) 
	@Enumerated(EnumType.ORDINAL)
	private List<AnioEscolar> anioAbandono;
	
	/** The abandono. */
	private Boolean abandono;
	
	@Column(length=500)
	private String observacionesMaterias;
	
	/** The motivo abandono. */
	@Column(length=10000)
	private String motivoAbandono;
	
	/** The motivo repitencia. */
	@Column(length=10000)
	private String motivoRepitencia;
	
	/** The conducta. */
	@Enumerated(EnumType.ORDINAL)
	private Conducta conducta;
	
	/** The cantidad inasistencia anio pasado. */
	private Integer cantidadInasistenciaAnioPasado;
	
	/** The motivos inasistencia anio pasado. */
	@Column(length=10000)
	private String motivosInasistenciaAnioPasado; 
	
	/** The motivos inasistencia anio curso. */
	@Column(length=10000)
	private String motivosInasistenciaAnioCurso;
	
	/** The cantidad inasistencia anio curso. */
	private Integer cantidadInasistenciaAnioCurso;
	
	/** The informacion complementaria. */
	@Column(length=10000)
	private String informacionComplementaria;
	
	/** The percepciones candidato. */
	@Column(length=10000)
	private String percepcionesCandidato;
	
	/** The recibe otra beca. */
	private Boolean recibeOtraBeca;
	
	/** The materia lengua. */
	private Boolean materiaLengua;
	
	/** The materia matematica. */
	private Boolean materiaMatem;
	
	/** The materia ciencias sociales. */
	private Boolean materiaCiencSociales;
	
	/** The materia ingles lengua extranjera. */
	private Boolean materiaInglesLengExt;
	
	/** The materia educacion fisica. */
	private Boolean materiaEduFisica;
	
	/** The materia educacion artistica. */
	private Boolean materiaEduArt;
	
	/** The materia ciencias naturales. */
	private Boolean materiaCienciasNaturales;
	
	/** The boletin seleccions. */
	@ManyToMany(cascade=CascadeType.ALL)
	private List<BoletinSeleccion> boletinSeleccions;
	
	/** The motivo rechazo. */
	@Enumerated(EnumType.ORDINAL)
	/** The motivo rechazo. */
	private MotivoRechazo motivoRechazo;
	
	/** The motivo envio ts. */
	@Enumerated(EnumType.ORDINAL)
	/** The motivo envio ts. */
	private MotivoEnvioTS motivoEnvioTS;
	
	/** The cual beca. */
	private String cualBeca;
	
	/** The perfil ts. */
	@OneToOne
	private PerfilTS  perfilTS;
	
	/** The nombre periodo. */
	private String nombrePeriodo;
	
	/** The nombre ciclo. */
	private String nombreCiclo;

	/** The ingresos totales ficha familiar. */
	private Integer ingresosTotalesFichaFamiliar;
	
	/** The observaciones generales. */
	@Column(length=1000)
	private String observacionesGenerales;
	
	/** The observaciones egreso ingreso. */
	@Column(length=10000)
	private String observacionesEgresoIngreso;
	
	/** Agregada para relacionar la entrevista seleccion 
	 * con su perfil alumno de acompañamiento*/
	private Long idPerfilAlumno;
	
	private String excepcion;
	
	private Boolean otroBecado;
	
	private Date fechaEntrevista;
	
	
	
	//2018
	private Boolean saludBecado;
	
	private Boolean saludFamilia;
	
	@Column(length=500)
	private String saludBecadoCual;
	
	@Column(length=500)
	private String saludFamiliarCual;
	
	@Column(length=500)
	private String orientacion;
	
	
	@Column(length=50)
	private String tiempoLibre;
	@Column(length=500)
	private String cuandoTermine;
	
	private String situacionEscolarAnioAnterior;
	
	/** The materia lengua. */
	private Boolean materiaLenguaC;
	
	/** The materia matematica. */
	private Boolean materiaMatemC;
	
	/** The materia ciencias sociales. */
	private Boolean materiaCiencSocialesC;
	
	/** The materia ingles lengua extranjera. */
	private Boolean materiaInglesLengExtC;
	
	/** The materia educacion fisica. */
	private Boolean materiaEduFisicaC;
	
	/** The materia educacion artistica. */
	private Boolean materiaEduArtC;
	
	/** The materia ciencias naturales. */
	private Boolean materiaCienciasNaturalesC;
	
	@Column(length=5)
	private String materiasPrevias;
	
	
	
	// 2021
	@Column(length=5000)
	private String vosMismo;
	@Column(length=5000)
	private String trabajas;
	@Column(length=5000)
	private String enQue;
	@Column(length=5000)
	private String responsabilidad;
	@Column(length=5000)
	private String repetiste;
	@Column(length=5000)
	private String porQueRepetiste;
	@Column(length=5000)
	private String abandonaste;
	@Column(length=5000)
	private String porQueAbandonaste;
	@Column(length=5000)
	private String situacionEscolarAnioPasado;
	@Column(length=5000)
	private String previas;
	@Column(length=5000)
	private String cualesPrevias;
	@Column(length=5000)
	private String desempenio;
	@Column(length=5000)
	private String porQueDesempenio;
	@Column(length=5000)
	private String faltas;
	@Column(length=5000)
	private String motivoFaltas;
	@Column(length=5000)
	private String materiasPreferidas;
	@Column(length=5000)
	private String materiaCuesta;
	@Column(length=5000)
	private String comentarioAdicional;
	@Column(length=5000)
	private String aportarPFE;
	@Column(length=5000)
	private String cognitivo;
	@Column(length=5000)
	private String riesgoExtraEscolar;
	
	
	
	//2023 esd
	
	@Column(length=500)
	private String accesoCelular;
	@Column(length=500)
	private String celularEp;
	@Column(length=500)
	private String computadora;
	@Column(length=500)
	private String conexion;
	@Column(length=500)
	private String usoCelular;
	@Column(length=500)
	private String conQuienVivis;
	@Column(length=500)
	private String rutinaDiaria;
	@Column(length=500)
	private String deQueTrabajas;
	@Column(length=500)
	private String ayudaTareas;
	@Column(length=500)
	private String cuidaHnos;
	@Column(length=500)
	private String cuidaOtros;
	@Column(length=500)
	private String noCuida;
	@Column(length=500)
	private String faltasCuidado;
	@Column(length=500)
	private String carpetaMama;
	@Column(length=500)
	private String carpetaPapa;
	@Column(length=500)
	private String carpetaHno;
	@Column(length=500)
	private String carpetaNadie;
	@Column(length=500)
	private String carpetaOtros;
	@Column(length=500)
	private String comoTeLlevas;
	@Column(length=500)
	private String comoTerminaste;
	@Column(length=500)
	private String materiasAdeuda;
	@Column(length=500)
	private String desempenioEscolar;
	@Column(length=500)
	private String desempenioPorque;
	@Column(length=500)
	private String inasistenciasPasado;
	@Column(length=500)
	private String motivoInasistenciasPasado;
	@Column(length=500)
	private String inasistenciasActual;
	@Column(length=500)
	private String motivoInasistenciasActual;
	@Column(length=500)
	private String porqueRepatiste;
	@Column(length=500)
	private String abandono2;
	@Column(length=500)
	private String repetiste2;
	@Column(length=500)
	private String otroBecado2;
	@Column(length=500)
	private String cuandoTermine2;
	@Column(length=500)
	private String porqueAbandono;
	@Column(length=500)
	private String sanciones;
	@Column(length=500)
	private String porqueSanciones;
	@Column(length=500)
	private String elegiste;
	@Column(length=500)
	private String importanteTerminar;
	@Column(length=500)
	private String porqueImportante;
	@Column(length=500)
	private String gustaria;
	@Column(length=500)
	private String participarReuniones;
	@Column(length=500)
	private String porqueReuniones;
	@Column(length=500)
	private String participarPrograma;
	@Column(length=500)
	private String porquePrograma;
	@Column(length=500)
	private String informacionComplemetariaEp;
	@Column(length=500)
	private String aportePfe;
	@Column(length=500)
	private String cognitivaEp;
	@Column(length=500)
	private String riesgoEscolarEp;
	@Column(length=500)
	private String fallecimientoEp;
	@Column(length=500)
	private String enfermedadEp;
	@Column(length=500)
	private String maternidadEp;
	@Column(length=500)
	private String mudanzaEp;
	@Column(length=500)
	private String cambioEstructuraEp;
	@Column(length=500)
	private String economicaEp;
	@Column(length=500)
	private String violenciaEp;
	@Column(length=500)
	private String consumoEp;
	@Column(length=500)
	private String violenciaEscolarEp;
	@Column(length=500)
	private String otraSituacionEp;
	@Column(length=500)
	private String cualOtraSituacionEp;
	@Column(length=500)
	private String dirias;
	@Column(length=500)
	private String regularmente;
	@Column(length=500)
	private String pregunta;
	@Column(length=500)
	private String cuaderno;
	@Column(length=500)
	private String padres;
	@Column(length=500)
	private String carpetas;
	@Column(length=500)
	private String cuenta;
	@Column(length=500)
	private String noSabe;
	@Column(length=500)
	private String grupo;
	@Column(length=500)
	private String otroEnteras;
	@Column(length=500)
	private String complicacion;
	@Column(length=500)
	private String disponibilidad;
	@Column(length=500)
	private String pensas;
	@Column(length=500)
	private String auh;
	@Column(length=500)
	private String ingresosTotales;
	@Column(length=500)
	private String ingresoConviviente;
	@Column(length=500)
	private String otroIngreso;
	@Column(length=500)
	private String montoOtroIngreso;
	@Column(length=500)
	private String idTipoVivienda;
	@Column(length=500)
	private String ambientes;
	@Column(length=500)
	private String agua;
	@Column(length=500)
	private String luz;
	@Column(length=500)
	private String gasNatural;
	@Column(length=500)
	private String gasGarrafa;
	@Column(length=500)
	private String telefoniaFija;
	@Column(length=500)
	private String celular;
	@Column(length=500)
	private String internet;
	@Column(length=500)
	private String tvcable;
	@Column(length=500)
	private String vehiculo;
	@Column(length=500)
	private String otroServicio;
	@Column(length=500)
	private String comentariosAdicionalesRa;
	@Column(length=500)
	private String cobertura;
	@Column(length=500)
	private String saludHijo;
	@Column(length=500)
	private String problemaSaludHijo;
	@Column(length=500)
	private String inasistenciasSalud;
	@Column(length=500)
	private String saludFliar;
	@Column(length=500)
	private String problemaSaludFliar;
	@Column(length=500)
	private String faltaFliar;
	@Column(length=500)
	private String informacionComplementariaRa;
	@Column(length=500)
	private String problemaAprendizaje;
	@Column(length=500)
	private String riesgoEscolarRa;
	@Column(length=500)
	private String fallecimientoRa;
	@Column(length=500)
	private String enfermedadRa;
	@Column(length=500)
	private String maternidadRa;
	@Column(length=500)
	private String mudanzaRa;
	@Column(length=500)
	private String cambioEstructuraRa;
	@Column(length=500)
	private String economiaRa;
	@Column(length=500)
	private String violenciaRa;
	@Column(length=500)
	private String consumoRa;
	@Column(length=500)
	private String violenciaEscolarRa;
	@Column(length=500)
	private String otraSituacionRa;
	@Column(length=500)
	private String cualOtraSituacionRa;
	@Column(length=500)
	private String estadoAlumno;
	@Column(length=500)
	private String totalAuh;

	
	
	
	public String getInformacionComplemetariaEp() {
		return informacionComplemetariaEp;
	}



	public void setInformacionComplemetariaEp(String informacionComplemetariaEp) {
		this.informacionComplemetariaEp = informacionComplemetariaEp;
	}



	public String getAccesoCelular() {
		return accesoCelular;
	}



	public void setAccesoCelular(String accesoCelular) {
		this.accesoCelular = accesoCelular;
	}



	public String getCelularEp() {
		return celularEp;
	}



	public void setCelularEp(String celularEp) {
		this.celularEp = celularEp;
	}



	public String getComputadora() {
		return computadora;
	}



	public void setComputadora(String computadora) {
		this.computadora = computadora;
	}



	public String getConexion() {
		return conexion;
	}



	public void setConexion(String conexion) {
		this.conexion = conexion;
	}



	public String getUsoCelular() {
		return usoCelular;
	}



	public void setUsoCelular(String usoCelular) {
		this.usoCelular = usoCelular;
	}



	public String getConQuienVivis() {
		return conQuienVivis;
	}



	public void setConQuienVivis(String conQuienVivis) {
		this.conQuienVivis = conQuienVivis;
	}



	public String getRutinaDiaria() {
		return rutinaDiaria;
	}



	public void setRutinaDiaria(String rutinaDiaria) {
		this.rutinaDiaria = rutinaDiaria;
	}



	public String getDeQueTrabajas() {
		return deQueTrabajas;
	}



	public void setDeQueTrabajas(String deQueTrabajas) {
		this.deQueTrabajas = deQueTrabajas;
	}



	public String getAyudaTareas() {
		return ayudaTareas;
	}



	public void setAyudaTareas(String ayudaTareas) {
		this.ayudaTareas = ayudaTareas;
	}



	public String getCuidaHnos() {
		return cuidaHnos;
	}



	public void setCuidaHnos(String cuidaHnos) {
		this.cuidaHnos = cuidaHnos;
	}



	public String getCuidaOtros() {
		return cuidaOtros;
	}



	public void setCuidaOtros(String cuidaOtros) {
		this.cuidaOtros = cuidaOtros;
	}



	public String getNoCuida() {
		return noCuida;
	}



	public void setNoCuida(String noCuida) {
		this.noCuida = noCuida;
	}



	public String getFaltasCuidado() {
		return faltasCuidado;
	}



	public void setFaltasCuidado(String faltasCuidado) {
		this.faltasCuidado = faltasCuidado;
	}



	public String getCarpetaMama() {
		return carpetaMama;
	}



	public void setCarpetaMama(String carpetaMama) {
		this.carpetaMama = carpetaMama;
	}



	public String getCarpetaPapa() {
		return carpetaPapa;
	}



	public void setCarpetaPapa(String carpetaPapa) {
		this.carpetaPapa = carpetaPapa;
	}



	public String getCarpetaHno() {
		return carpetaHno;
	}



	public void setCarpetaHno(String carpetaHno) {
		this.carpetaHno = carpetaHno;
	}



	public String getCarpetaNadie() {
		return carpetaNadie;
	}



	public void setCarpetaNadie(String carpetaNadie) {
		this.carpetaNadie = carpetaNadie;
	}



	public String getCarpetaOtros() {
		return carpetaOtros;
	}



	public void setCarpetaOtros(String carpetaOtros) {
		this.carpetaOtros = carpetaOtros;
	}



	public String getComoTeLlevas() {
		return comoTeLlevas;
	}



	public void setComoTeLlevas(String comoTeLlevas) {
		this.comoTeLlevas = comoTeLlevas;
	}



	public String getComoTerminaste() {
		return comoTerminaste;
	}



	public void setComoTerminaste(String comoTerminaste) {
		this.comoTerminaste = comoTerminaste;
	}



	public String getMateriasAdeuda() {
		return materiasAdeuda;
	}



	public void setMateriasAdeuda(String materiasAdeuda) {
		this.materiasAdeuda = materiasAdeuda;
	}



	public String getDesempenioEscolar() {
		return desempenioEscolar;
	}



	public void setDesempenioEscolar(String desempenioEscolar) {
		this.desempenioEscolar = desempenioEscolar;
	}



	public String getDesempenioPorque() {
		return desempenioPorque;
	}



	public void setDesempenioPorque(String desempenioPorque) {
		this.desempenioPorque = desempenioPorque;
	}



	public String getInasistenciasPasado() {
		return inasistenciasPasado;
	}



	public void setInasistenciasPasado(String inasistenciasPasado) {
		this.inasistenciasPasado = inasistenciasPasado;
	}



	public String getMotivoInasistenciasPasado() {
		return motivoInasistenciasPasado;
	}



	public void setMotivoInasistenciasPasado(String motivoInasistenciasPasado) {
		this.motivoInasistenciasPasado = motivoInasistenciasPasado;
	}



	public String getInasistenciasActual() {
		return inasistenciasActual;
	}



	public void setInasistenciasActual(String inasistenciasActual) {
		this.inasistenciasActual = inasistenciasActual;
	}



	public String getMotivoInasistenciasActual() {
		return motivoInasistenciasActual;
	}



	public void setMotivoInasistenciasActual(String motivoInasistenciasActual) {
		this.motivoInasistenciasActual = motivoInasistenciasActual;
	}



	public String getPorqueRepatiste() {
		return porqueRepatiste;
	}



	public void setPorqueRepatiste(String porqueRepatiste) {
		this.porqueRepatiste = porqueRepatiste;
	}



	public String getAbandono2() {
		return abandono2;
	}



	public void setAbandono2(String abandono2) {
		this.abandono2 = abandono2;
	}



	public String getRepetiste2() {
		return repetiste2;
	}



	public void setRepetiste2(String repetiste2) {
		this.repetiste2 = repetiste2;
	}



	public String getOtroBecado2() {
		return otroBecado2;
	}



	public void setOtroBecado2(String otroBecado2) {
		this.otroBecado2 = otroBecado2;
	}



	public String getCuandoTermine2() {
		return cuandoTermine2;
	}



	public void setCuandoTermine2(String cuandoTermine2) {
		this.cuandoTermine2 = cuandoTermine2;
	}



	public String getPorqueAbandono() {
		return porqueAbandono;
	}



	public void setPorqueAbandono(String porqueAbandono) {
		this.porqueAbandono = porqueAbandono;
	}



	public String getSanciones() {
		return sanciones;
	}



	public void setSanciones(String sanciones) {
		this.sanciones = sanciones;
	}



	public String getPorqueSanciones() {
		return porqueSanciones;
	}



	public void setPorqueSanciones(String porqueSanciones) {
		this.porqueSanciones = porqueSanciones;
	}



	public String getElegiste() {
		return elegiste;
	}



	public void setElegiste(String elegiste) {
		this.elegiste = elegiste;
	}



	public String getImportanteTerminar() {
		return importanteTerminar;
	}



	public void setImportanteTerminar(String importanteTerminar) {
		this.importanteTerminar = importanteTerminar;
	}



	public String getPorqueImportante() {
		return porqueImportante;
	}



	public void setPorqueImportante(String porqueImportante) {
		this.porqueImportante = porqueImportante;
	}



	public String getGustaria() {
		return gustaria;
	}



	public void setGustaria(String gustaria) {
		this.gustaria = gustaria;
	}



	public String getParticiparReuniones() {
		return participarReuniones;
	}



	public void setParticiparReuniones(String participarReuniones) {
		this.participarReuniones = participarReuniones;
	}



	public String getPorqueReuniones() {
		return porqueReuniones;
	}



	public void setPorqueReuniones(String porqueReuniones) {
		this.porqueReuniones = porqueReuniones;
	}



	public String getParticiparPrograma() {
		return participarPrograma;
	}



	public void setParticiparPrograma(String participarPrograma) {
		this.participarPrograma = participarPrograma;
	}



	public String getPorquePrograma() {
		return porquePrograma;
	}



	public void setPorquePrograma(String porquePrograma) {
		this.porquePrograma = porquePrograma;
	}







	public String getAportePfe() {
		return aportePfe;
	}



	public void setAportePfe(String aportePfe) {
		this.aportePfe = aportePfe;
	}



	public String getCognitivaEp() {
		return cognitivaEp;
	}



	public void setCognitivaEp(String cognitivaEp) {
		this.cognitivaEp = cognitivaEp;
	}



	public String getRiesgoEscolarEp() {
		return riesgoEscolarEp;
	}



	public void setRiesgoEscolarEp(String riesgoEscolarEp) {
		this.riesgoEscolarEp = riesgoEscolarEp;
	}



	public String getFallecimientoEp() {
		return fallecimientoEp;
	}



	public void setFallecimientoEp(String fallecimientoEp) {
		this.fallecimientoEp = fallecimientoEp;
	}



	public String getEnfermedadEp() {
		return enfermedadEp;
	}



	public void setEnfermedadEp(String enfermedadEp) {
		this.enfermedadEp = enfermedadEp;
	}



	public String getMaternidadEp() {
		return maternidadEp;
	}



	public void setMaternidadEp(String maternidadEp) {
		this.maternidadEp = maternidadEp;
	}



	public String getMudanzaEp() {
		return mudanzaEp;
	}



	public void setMudanzaEp(String mudanzaEp) {
		this.mudanzaEp = mudanzaEp;
	}



	public String getCambioEstructuraEp() {
		return cambioEstructuraEp;
	}



	public void setCambioEstructuraEp(String cambioEstructuraEp) {
		this.cambioEstructuraEp = cambioEstructuraEp;
	}



	public String getEconomicaEp() {
		return economicaEp;
	}



	public void setEconomicaEp(String economicaEp) {
		this.economicaEp = economicaEp;
	}



	public String getViolenciaEp() {
		return violenciaEp;
	}



	public void setViolenciaEp(String violenciaEp) {
		this.violenciaEp = violenciaEp;
	}



	public String getConsumoEp() {
		return consumoEp;
	}



	public void setConsumoEp(String consumoEp) {
		this.consumoEp = consumoEp;
	}



	public String getViolenciaEscolarEp() {
		return violenciaEscolarEp;
	}



	public void setViolenciaEscolarEp(String violenciaEscolarEp) {
		this.violenciaEscolarEp = violenciaEscolarEp;
	}



	public String getOtraSituacionEp() {
		return otraSituacionEp;
	}



	public void setOtraSituacionEp(String otraSituacionEp) {
		this.otraSituacionEp = otraSituacionEp;
	}



	public String getCualOtraSituacionEp() {
		return cualOtraSituacionEp;
	}



	public void setCualOtraSituacionEp(String cualOtraSituacionEp) {
		this.cualOtraSituacionEp = cualOtraSituacionEp;
	}



	public String getDirias() {
		return dirias;
	}



	public void setDirias(String dirias) {
		this.dirias = dirias;
	}



	public String getRegularmente() {
		return regularmente;
	}



	public void setRegularmente(String regularmente) {
		this.regularmente = regularmente;
	}



	public String getPregunta() {
		return pregunta;
	}



	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}



	public String getCuaderno() {
		return cuaderno;
	}



	public void setCuaderno(String cuaderno) {
		this.cuaderno = cuaderno;
	}



	public String getPadres() {
		return padres;
	}



	public void setPadres(String padres) {
		this.padres = padres;
	}



	public String getCarpetas() {
		return carpetas;
	}



	public void setCarpetas(String carpetas) {
		this.carpetas = carpetas;
	}



	public String getCuenta() {
		return cuenta;
	}



	public void setCuenta(String cuenta) {
		this.cuenta = cuenta;
	}



	public String getNoSabe() {
		return noSabe;
	}



	public void setNoSabe(String noSabe) {
		this.noSabe = noSabe;
	}



	public String getGrupo() {
		return grupo;
	}



	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}



	public String getOtroEnteras() {
		return otroEnteras;
	}



	public void setOtroEnteras(String otroEnteras) {
		this.otroEnteras = otroEnteras;
	}



	public String getComplicacion() {
		return complicacion;
	}



	public void setComplicacion(String complicacion) {
		this.complicacion = complicacion;
	}



	public String getDisponibilidad() {
		return disponibilidad;
	}



	public void setDisponibilidad(String disponibilidad) {
		this.disponibilidad = disponibilidad;
	}



	public String getPensas() {
		return pensas;
	}



	public void setPensas(String pensas) {
		this.pensas = pensas;
	}



	public String getAuh() {
		return auh;
	}



	public void setAuh(String auh) {
		this.auh = auh;
	}



	public String getIngresosTotales() {
		return ingresosTotales;
	}



	public void setIngresosTotales(String ingresosTotales) {
		this.ingresosTotales = ingresosTotales;
	}



	public String getIngresoConviviente() {
		return ingresoConviviente;
	}



	public void setIngresoConviviente(String ingresoConviviente) {
		this.ingresoConviviente = ingresoConviviente;
	}



	public String getOtroIngreso() {
		return otroIngreso;
	}



	public void setOtroIngreso(String otroIngreso) {
		this.otroIngreso = otroIngreso;
	}



	public String getMontoOtroIngreso() {
		return montoOtroIngreso;
	}



	public void setMontoOtroIngreso(String montoOtroIngreso) {
		this.montoOtroIngreso = montoOtroIngreso;
	}



	public String getIdTipoVivienda() {
		return idTipoVivienda;
	}



	public void setIdTipoVivienda(String idTipoVivienda) {
		this.idTipoVivienda = idTipoVivienda;
	}



	public String getAmbientes() {
		return ambientes;
	}



	public void setAmbientes(String ambientes) {
		this.ambientes = ambientes;
	}



	public String getAgua() {
		return agua;
	}



	public void setAgua(String agua) {
		this.agua = agua;
	}



	public String getLuz() {
		return luz;
	}



	public void setLuz(String luz) {
		this.luz = luz;
	}



	public String getGasNatural() {
		return gasNatural;
	}



	public void setGasNatural(String gasNatural) {
		this.gasNatural = gasNatural;
	}



	public String getGasGarrafa() {
		return gasGarrafa;
	}



	public void setGasGarrafa(String gasGarrafa) {
		this.gasGarrafa = gasGarrafa;
	}



	public String getTelefoniaFija() {
		return telefoniaFija;
	}



	public void setTelefoniaFija(String telefoniaFija) {
		this.telefoniaFija = telefoniaFija;
	}



	public String getCelular() {
		return celular;
	}



	public void setCelular(String celular) {
		this.celular = celular;
	}



	public String getInternet() {
		return internet;
	}



	public void setInternet(String internet) {
		this.internet = internet;
	}



	public String getTvcable() {
		return tvcable;
	}



	public void setTvcable(String tvcable) {
		this.tvcable = tvcable;
	}



	public String getVehiculo() {
		return vehiculo;
	}



	public void setVehiculo(String vehiculo) {
		this.vehiculo = vehiculo;
	}



	public String getOtroServicio() {
		return otroServicio;
	}



	public void setOtroServicio(String otroServicio) {
		this.otroServicio = otroServicio;
	}



	public String getComentariosAdicionalesRa() {
		return comentariosAdicionalesRa;
	}



	public void setComentariosAdicionalesRa(String comentariosAdicionalesRa) {
		this.comentariosAdicionalesRa = comentariosAdicionalesRa;
	}



	public String getCobertura() {
		return cobertura;
	}



	public void setCobertura(String cobertura) {
		this.cobertura = cobertura;
	}



	public String getSaludHijo() {
		return saludHijo;
	}



	public void setSaludHijo(String saludHijo) {
		this.saludHijo = saludHijo;
	}



	public String getProblemaSaludHijo() {
		return problemaSaludHijo;
	}



	public void setProblemaSaludHijo(String problemaSaludHijo) {
		this.problemaSaludHijo = problemaSaludHijo;
	}



	public String getInasistenciasSalud() {
		return inasistenciasSalud;
	}



	public void setInasistenciasSalud(String inasistenciasSalud) {
		this.inasistenciasSalud = inasistenciasSalud;
	}



	public String getSaludFliar() {
		return saludFliar;
	}



	public void setSaludFliar(String saludFliar) {
		this.saludFliar = saludFliar;
	}



	public String getProblemaSaludFliar() {
		return problemaSaludFliar;
	}



	public void setProblemaSaludFliar(String problemaSaludFliar) {
		this.problemaSaludFliar = problemaSaludFliar;
	}



	public String getFaltaFliar() {
		return faltaFliar;
	}



	public void setFaltaFliar(String faltaFliar) {
		this.faltaFliar = faltaFliar;
	}



	public String getInformacionComplementariaRa() {
		return informacionComplementariaRa;
	}



	public void setInformacionComplementariaRa(String informacionComplementariaRa) {
		this.informacionComplementariaRa = informacionComplementariaRa;
	}



	public String getProblemaAprendizaje() {
		return problemaAprendizaje;
	}



	public void setProblemaAprendizaje(String problemaAprendizaje) {
		this.problemaAprendizaje = problemaAprendizaje;
	}



	public String getRiesgoEscolarRa() {
		return riesgoEscolarRa;
	}



	public void setRiesgoEscolarRa(String riesgoEscolarRa) {
		this.riesgoEscolarRa = riesgoEscolarRa;
	}



	public String getFallecimientoRa() {
		return fallecimientoRa;
	}



	public void setFallecimientoRa(String fallecimientoRa) {
		this.fallecimientoRa = fallecimientoRa;
	}



	public String getEnfermedadRa() {
		return enfermedadRa;
	}



	public void setEnfermedadRa(String enfermedadRa) {
		this.enfermedadRa = enfermedadRa;
	}



	public String getMaternidadRa() {
		return maternidadRa;
	}



	public void setMaternidadRa(String maternidadRa) {
		this.maternidadRa = maternidadRa;
	}



	public String getMudanzaRa() {
		return mudanzaRa;
	}



	public void setMudanzaRa(String mudanzaRa) {
		this.mudanzaRa = mudanzaRa;
	}



	public String getCambioEstructuraRa() {
		return cambioEstructuraRa;
	}



	public void setCambioEstructuraRa(String cambioEstructuraRa) {
		this.cambioEstructuraRa = cambioEstructuraRa;
	}



	public String getEconomiaRa() {
		return economiaRa;
	}



	public void setEconomiaRa(String economiaRa) {
		this.economiaRa = economiaRa;
	}



	public String getViolenciaRa() {
		return violenciaRa;
	}



	public void setViolenciaRa(String violenciaRa) {
		this.violenciaRa = violenciaRa;
	}



	public String getConsumoRa() {
		return consumoRa;
	}



	public void setConsumoRa(String consumoRa) {
		this.consumoRa = consumoRa;
	}



	public String getViolenciaEscolarRa() {
		return violenciaEscolarRa;
	}



	public void setViolenciaEscolarRa(String violenciaEscolarRa) {
		this.violenciaEscolarRa = violenciaEscolarRa;
	}



	public String getOtraSituacionRa() {
		return otraSituacionRa;
	}



	public void setOtraSituacionRa(String otraSituacionRa) {
		this.otraSituacionRa = otraSituacionRa;
	}



	public String getCualOtraSituacionRa() {
		return cualOtraSituacionRa;
	}



	public void setCualOtraSituacionRa(String cualOtraSituacionRa) {
		this.cualOtraSituacionRa = cualOtraSituacionRa;
	}



	public String getEstadoAlumno() {
		return estadoAlumno;
	}



	public void setEstadoAlumno(String estadoAlumno) {
		this.estadoAlumno = estadoAlumno;
	}



	public String getTotalAuh() {
		return totalAuh;
	}



	public void setTotalAuh(String totalAuh) {
		this.totalAuh = totalAuh;
	}



	public String getVosMismo() {
		return vosMismo;
	}



	public void setVosMismo(String vosMismo) {
		this.vosMismo = vosMismo;
	}



	public String getTrabajas() {
		return trabajas;
	}



	public void setTrabajas(String trabajas) {
		this.trabajas = trabajas;
	}



	public String getEnQue() {
		return enQue;
	}



	public void setEnQue(String enQue) {
		this.enQue = enQue;
	}



	public String getResponsabilidad() {
		return responsabilidad;
	}



	public void setResponsabilidad(String responsabilidad) {
		this.responsabilidad = responsabilidad;
	}



	public String getRepetiste() {
		return repetiste;
	}



	public void setRepetiste(String repetiste) {
		this.repetiste = repetiste;
	}



	public String getPorQueRepetiste() {
		return porQueRepetiste;
	}



	public void setPorQueRepetiste(String porQueRepetiste) {
		this.porQueRepetiste = porQueRepetiste;
	}



	public String getAbandonaste() {
		return abandonaste;
	}



	public void setAbandonaste(String abandonaste) {
		this.abandonaste = abandonaste;
	}



	public String getPorQueAbandonaste() {
		return porQueAbandonaste;
	}



	public void setPorQueAbandonaste(String porQueAbandonaste) {
		this.porQueAbandonaste = porQueAbandonaste;
	}



	public String getSituacionEscolarAnioPasado() {
		return situacionEscolarAnioPasado;
	}



	public void setSituacionEscolarAnioPasado(String situacionEscolarAnioPasado) {
		this.situacionEscolarAnioPasado = situacionEscolarAnioPasado;
	}



	public String getPrevias() {
		return previas;
	}



	public void setPrevias(String previas) {
		this.previas = previas;
	}



	public String getCualesPrevias() {
		return cualesPrevias;
	}



	public void setCualesPrevias(String cualesPrevias) {
		this.cualesPrevias = cualesPrevias;
	}



	public String getDesempenio() {
		return desempenio;
	}



	public void setDesempenio(String desempenio) {
		this.desempenio = desempenio;
	}



	public String getPorQueDesempenio() {
		return porQueDesempenio;
	}



	public void setPorQueDesempenio(String porQueDesempenio) {
		this.porQueDesempenio = porQueDesempenio;
	}



	public String getFaltas() {
		return faltas;
	}



	public void setFaltas(String faltas) {
		this.faltas = faltas;
	}



	public String getMotivoFaltas() {
		return motivoFaltas;
	}



	public void setMotivoFaltas(String motivoFaltas) {
		this.motivoFaltas = motivoFaltas;
	}



	public String getMateriasPreferidas() {
		return materiasPreferidas;
	}



	public void setMateriasPreferidas(String materiasPreferidas) {
		this.materiasPreferidas = materiasPreferidas;
	}



	public String getMateriaCuesta() {
		return materiaCuesta;
	}



	public void setMateriaCuesta(String materiaCuesta) {
		this.materiaCuesta = materiaCuesta;
	}



	public String getComentarioAdicional() {
		return comentarioAdicional;
	}



	public void setComentarioAdicional(String comentarioAdicional) {
		this.comentarioAdicional = comentarioAdicional;
	}



	public String getAportarPFE() {
		return aportarPFE;
	}



	public void setAportarPFE(String aportarPFE) {
		this.aportarPFE = aportarPFE;
	}



	public String getCognitivo() {
		return cognitivo;
	}



	public void setCognitivo(String cognitivo) {
		this.cognitivo = cognitivo;
	}



	public String getRiesgoExtraEscolar() {
		return riesgoExtraEscolar;
	}



	public void setRiesgoExtraEscolar(String riesgoExtraEscolar) {
		this.riesgoExtraEscolar = riesgoExtraEscolar;
	}



	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @since 13-dic-2010
	 * @author cfigueroa
	 */
	public Long getId() {
		return id;
	}

	

	public String getExcepcion() {
		return excepcion;
	}



	public void setExcepcion(String excepcion) {
		this.excepcion = excepcion;
	}



	/**
	 * Sets the id.
	 *
	 * @param id the id to set
	 * @since 13-dic-2010
	 * @author cfigueroa
	 */
	public void setId(Long id) {
		this.id = id;
	}
	
	/**
	 * Gets the id perfil alumno.
	 *
	 * @return the perfilAlumno
	 * @since 13-dic-2010
	 * @author cfigueroa
	 */
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.perfil.PerfilAlumno")
	public AlumnoSeleccion getPerfilAlumno() {
		return perfilAlumno;
	}
	
	/**
	 * Sets the id perfil alumno.
	 *
	 * @param alumnoSeleccion the new perfil alumno
	 * @since 13-dic-2010
	 * @author cfigueroa
	 */
	public void setPerfilAlumno(AlumnoSeleccion alumnoSeleccion) {
		this.perfilAlumno = alumnoSeleccion;
	}
	
	/**
	 * Gets the estado entrevista.
	 *
	 * @return the estadoEntrevista
	 * @since 13-dic-2010
	 * @author cfigueroa
	 */
	public EstadoEntrevista getEstadoEntrevista() {
		return estadoEntrevista;
	}
	
	/**
	 * Sets the estado entrevista.
	 *
	 * @param estadoEntrevista the estadoEntrevista to set
	 * @since 13-dic-2010
	 * @author cfigueroa
	 */
	public void setEstadoEntrevista(EstadoEntrevista estadoEntrevista) {
		this.estadoEntrevista = estadoEntrevista;
	}

	/**
	 * Gets the convocatoria.
	 *
	 * @return the convocatoria
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public ConvocatoriaSeleccion getConvocatoria() {
		return convocatoria;
	}

	/**
	 * Sets the convocatoria.
	 *
	 * @param convocatoria the new convocatoria
	 * @since 15-dic-2010
	 * @author cfigueroa
	 */
	public void setConvocatoria(ConvocatoriaSeleccion convocatoria) {
		this.convocatoria = convocatoria;
	}

	/**
	 * Gets the estado entrevista alumno.
	 *
	 * @return the estado entrevista alumno
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public EstadoAlumno getEstadoEntrevistaAlumno() {
		return estadoEntrevistaAlumno;
	}

	/**
	 * Sets the estado entrevista alumno.
	 *
	 * @param estadoEntrevistaAlumno the new estado entrevista alumno
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setEstadoEntrevistaAlumno(EstadoAlumno estadoEntrevistaAlumno) {
		this.estadoEntrevistaAlumno = estadoEntrevistaAlumno;
	}
	
	/**
	 * Gets the fecha carga entrevista.
	 *
	 * @return the fecha carga entrevista
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Date getFechaCargaEntrevista() {
		return fechaCargaEntrevista;
	}

	/**
	 * Sets the fecha carga entrevista.
	 *
	 * @param fechaCargaEntrevista the new fecha carga entrevista
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setFechaCargaEntrevista(Date fechaCargaEntrevista) {
		this.fechaCargaEntrevista = fechaCargaEntrevista;
	}

	/**
	 * Gets the repitio.
	 *
	 * @return the repitio
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Boolean getRepitio() {
		return repitio;
	}

	/**
	 * Sets the repitio.
	 *
	 * @param repitio the new repitio
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setRepitio(Boolean repitio) {
		this.repitio = repitio;
	}

	/**
	 * Gets the abandono.
	 *
	 * @return the abandono
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Boolean getAbandono() {
		return abandono;
	}

	/**
	 * Sets the abandono.
	 *
	 * @param abandonoAnio the new abandono
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setAbandono(Boolean abandonoAnio) {
		this.abandono = abandonoAnio;
	}

	/**
	 * Gets the motivo abandono.
	 *
	 * @return the motivo abandono
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public String getMotivoAbandono() {
		return motivoAbandono;
	}

	/**
	 * Sets the motivo abandono.
	 *
	 * @param motivoAbandono the new motivo abandono
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setMotivoAbandono(String motivoAbandono) {
		this.motivoAbandono = motivoAbandono;
	}


	public Conducta getConducta() {
		return conducta;
	}

	public void setConducta(Conducta conducta) {
		this.conducta = conducta;
	}

	/**
	 * Gets the cantidad inasistencia anio pasado.
	 *
	 * @return the cantidad inasistencia anio pasado
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Integer getCantidadInasistenciaAnioPasado() {
		return cantidadInasistenciaAnioPasado;
	}

	/**
	 * Sets the cantidad inasistencia anio pasado.
	 *
	 * @param cantidadInasistenciaAnioPasado the new cantidad inasistencia anio pasado
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setCantidadInasistenciaAnioPasado(
			Integer cantidadInasistenciaAnioPasado) {
		this.cantidadInasistenciaAnioPasado = cantidadInasistenciaAnioPasado;
	}

	/**
	 * Gets the motivos inasistencia anio curso.
	 *
	 * @return the motivos inasistencia anio curso
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public String getMotivosInasistenciaAnioCurso() {
		return motivosInasistenciaAnioCurso;
	}

	/**
	 * Sets the motivos inasistencia anio curso.
	 *
	 * @param motivosInasistenciaAnioCurso the new motivos inasistencia anio curso
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setMotivosInasistenciaAnioCurso(String motivosInasistenciaAnioCurso) {
		this.motivosInasistenciaAnioCurso = motivosInasistenciaAnioCurso;
	}

	/**
	 * Gets the cantidad inasistencia anio curso.
	 *
	 * @return the cantidad inasistencia anio curso
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Integer getCantidadInasistenciaAnioCurso() {
		return cantidadInasistenciaAnioCurso;
	}

	/**
	 * Sets the cantidad inasistencia anio curso.
	 *
	 * @param cantidadInasistenciaAnioCurso the new cantidad inasistencia anio curso
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setCantidadInasistenciaAnioCurso(
			Integer cantidadInasistenciaAnioCurso) {
		this.cantidadInasistenciaAnioCurso = cantidadInasistenciaAnioCurso;
	}

	/**
	 * Gets the motivos inasistencia anio pasado.
	 *
	 * @return the motivos inasistencia anio pasado
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public String getMotivosInasistenciaAnioPasado() {
		return motivosInasistenciaAnioPasado;
	}

	/**
	 * Sets the motivos inasistencia anio pasado.
	 *
	 * @param motivosInasistenciaAnioPasado the new motivos inasistencia anio pasado
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setMotivosInasistenciaAnioPasado(
			String motivosInasistenciaAnioPasado) {
		this.motivosInasistenciaAnioPasado = motivosInasistenciaAnioPasado;
	}

	/**
	 * Gets the informacion complementaria.
	 *
	 * @return the informacion complementaria
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public String getInformacionComplementaria() {
		return informacionComplementaria;
	}

	/**
	 * Sets the informacion complementaria.
	 *
	 * @param informacionComplementaria the new informacion complementaria
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setInformacionComplementaria(String informacionComplementaria) {
		this.informacionComplementaria = informacionComplementaria;
	}

	/**
	 * Gets the percepciones candidato.
	 *
	 * @return the percepciones candidato
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public String getPercepcionesCandidato() {
		return percepcionesCandidato;
	}

	/**
	 * Sets the percepciones candidato.
	 *
	 * @param percepcionesCandidato the new percepciones candidato
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setPercepcionesCandidato(String percepcionesCandidato) {
		this.percepcionesCandidato = percepcionesCandidato;
	}

	/**
	 * Gets the recibe otra beca.
	 *
	 * @return the recibe otra beca
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Boolean getRecibeOtraBeca() {
		return recibeOtraBeca;
	}

	/**
	 * Sets the recibe otra beca.
	 *
	 * @param recibeOtraBeca the new recibe otra beca
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setRecibeOtraBeca(Boolean recibeOtraBeca) {
		this.recibeOtraBeca = recibeOtraBeca;
	}

	/**
	 * Gets the materia lengua.
	 *
	 * @return the materia lengua
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Boolean getMateriaLengua() {
		return materiaLengua;
	}

	/**
	 * Sets the materia lengua.
	 *
	 * @param materiaLengua the new materia lengua
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setMateriaLengua(Boolean materiaLengua) {
		this.materiaLengua = materiaLengua;
	}

	/**
	 * Gets the materia matematica.
	 *
	 * @return the materia matematica
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Boolean getMateriaMatem() {
		return materiaMatem;
	}

	/**
	 * Sets the materia matematica.
	 *
	 * @param materiaMatem the new materia matematica
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setMateriaMatem(Boolean materiaMatem) {
		this.materiaMatem = materiaMatem;
	}

	/**
	 * Gets the materia ciencias sociales.
	 *
	 * @return the materia ciencias sociales
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Boolean getMateriaCiencSociales() {
		return materiaCiencSociales;
	}

	/**
	 * Sets the materia ciencias sociales.
	 *
	 * @param materiaCiencSociales the new materia ciencias sociales
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setMateriaCiencSociales(Boolean materiaCiencSociales) {
		this.materiaCiencSociales = materiaCiencSociales;
	}

	/**
	 * Gets the materia ingles lengua extranjera.
	 *
	 * @return the materia ingles lengua extranjera
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Boolean getMateriaInglesLengExt() {
		return materiaInglesLengExt;
	}

	/**
	 * Sets the materia ingles lengua extranjera.
	 *
	 * @param materiaInglesLengExt the new materia ingles lengua extranjera
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setMateriaInglesLengExt(Boolean materiaInglesLengExt) {
		this.materiaInglesLengExt = materiaInglesLengExt;
	}

	/**
	 * Gets the materia educacion fisica.
	 *
	 * @return the materia educacion fisica.
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Boolean getMateriaEduFisica() {
		return materiaEduFisica;
	}

	/**
	 * Sets the materia educacion fisica.
	 *
	 * @param materiaEduFisica the new educacion fisica.
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setMateriaEduFisica(Boolean materiaEduFisica) {
		this.materiaEduFisica = materiaEduFisica;
	}

	/**
	 * Gets the materia educacion artistica.
	 *
	 * @return the materia educacion artistica
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Boolean getMateriaEduArt() {
		return materiaEduArt;
	}

	/**
	 * Sets the materia educacion artistica.
	 *
	 * @param materiaEduArt the new materia educacion artistica
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setMateriaEduArt(Boolean materiaEduArt) {
		this.materiaEduArt = materiaEduArt;
	}

	/**
	 * Gets the boletin seleccions.
	 *
	 * @return the boletin seleccions
	 */
	public List<BoletinSeleccion> getBoletinSeleccions() {
		return boletinSeleccions;
	}

	/**
	 * Sets the boletin seleccions.
	 *
	 * @param boletinSeleccions the new boletin seleccions
	 */
	public void setBoletinSeleccions(List<BoletinSeleccion> boletinSeleccions) {
		this.boletinSeleccions = boletinSeleccions;
	}

	/**
	 * Gets the motivo rechazo.
	 *
	 * @return the motivo rechazo
	 */
	public MotivoRechazo getMotivoRechazo() {
		return motivoRechazo;
	}

	/**
	 * Sets the motivo rechazo.
	 *
	 * @param motivoRechazo the new motivo rechazo
	 */
	public void setMotivoRechazo(MotivoRechazo motivoRechazo) {
		this.motivoRechazo = motivoRechazo;
	}

	/**
	 * Gets the motivo envio ts.
	 *
	 * @return the motivo envio ts
	 */
	public MotivoEnvioTS getMotivoEnvioTS() {
		return motivoEnvioTS;
	}

	/**
	 * Sets the motivo envio ts.
	 *
	 * @param motivoEnvioTS the new motivo envio ts
	 */
	public void setMotivoEnvioTS(MotivoEnvioTS motivoEnvioTS) {
		this.motivoEnvioTS = motivoEnvioTS;
	}

	/**
	 * Gets the cual beca.
	 *
	 * @return the cual beca
	 */
	public String getCualBeca() {
		return cualBeca;
	}

	/**
	 * Sets the cual beca.
	 *
	 * @param cualBeca the new cual beca
	 */
	public void setCualBeca(String cualBeca) {
		this.cualBeca = cualBeca;
	}

	/**
	 * Gets the perfil ts.
	 *
	 * @return the perfil ts
	 */
	public PerfilTS getPerfilTS() {
		return perfilTS;
	}

	/**
	 * Sets the perfil ts.
	 *
	 * @param perfilTS the new perfil ts
	 */
	public void setPerfilTS(PerfilTS perfilTS) {
		this.perfilTS = perfilTS;
	}

	/**
	 * Gets the nombre periodo.
	 *
	 * @return the nombre periodo
	 */
	public String getNombrePeriodo() {
		return nombrePeriodo;
	}

	/**
	 * Sets the nombre periodo.
	 *
	 * @param nombrePeriodo the new nombre periodo
	 */
	public void setNombrePeriodo(String nombrePeriodo) {
		this.nombrePeriodo = nombrePeriodo;
	}

	/**
	 * Gets the nombre ciclo.
	 *
	 * @return the nombre ciclo
	 */
	public String getNombreCiclo() {
		return nombreCiclo;
	}

	/**
	 * Sets the nombre ciclo.
	 *
	 * @param nombreCiclo the new nombre ciclo
	 */
	public void setNombreCiclo(String nombreCiclo) {
		this.nombreCiclo = nombreCiclo;
	}
	
	/**
	 * Gets the ingresos totales ficha familiar.
	 *
	 * @return the ingresos totales ficha familiar
	 */
	public Integer getIngresosTotalesFichaFamiliar() {
		return ingresosTotalesFichaFamiliar;
	}

	/**
	 * Sets the ingresos totales ficha familiar.
	 *
	 * @param ingresosTotalesFichaFamiliar the new ingresos totales ficha familiar
	 */
	public void setIngresosTotalesFichaFamiliar(Integer ingresosTotalesFichaFamiliar) {
		this.ingresosTotalesFichaFamiliar = ingresosTotalesFichaFamiliar;
	}

	/**
	 * Gets the observaciones generales.
	 *
	 * @return the observaciones generales
	 */
	public String getObservacionesGenerales() {
		return observacionesGenerales;
	}

	/**
	 * Sets the observaciones generales.
	 *
	 * @param observacionesGenerales the new observaciones generales
	 */
	public void setObservacionesGenerales(String observacionesGenerales) {
		this.observacionesGenerales = observacionesGenerales;
	}

	/**
	 * Gets the motivo repitencia.
	 *
	 * @return the motivo repitencia
	 */
	public String getMotivoRepitencia() {
		return motivoRepitencia;
	}

	/**
	 * Sets the motivo repitencia.
	 *
	 * @param motivoRepitencia the new motivo repitencia
	 */
	public void setMotivoRepitencia(String motivoRepitencia) {
		this.motivoRepitencia = motivoRepitencia;
	}

	/**
	 * Gets the observaciones egreso ingreso.
	 *
	 * @return the observaciones egreso ingreso
	 */
	public String getObservacionesEgresoIngreso() {
		return observacionesEgresoIngreso;
	}

	/**
	 * Sets the observaciones egreso ingreso.
	 *
	 * @param observacionesEgresoIngreso the new observaciones egreso ingreso
	 */
	public void setObservacionesEgresoIngreso(String observacionesEgresoIngreso) {
		this.observacionesEgresoIngreso = observacionesEgresoIngreso;
	}

	/**
	 * Gets the otro motivo rechazo.
	 *
	 * @return the otro motivo rechazo
	 */
	public String getOtroMotivoRechazo() {
		return otroMotivoRechazo;
	}

	/**
	 * Sets the otro motivo rechazo.
	 *
	 * @param otroMotivoRechazo the new otro motivo rechazo
	 */
	public void setOtroMotivoRechazo(String otroMotivoRechazo) {
		this.otroMotivoRechazo = otroMotivoRechazo;
	}

	public List<AnioEscolar> getAnioRepitio() {
		return anioRepitio;
	}

	public void setAnioRepitio(List<AnioEscolar> anioRepitio) {
		this.anioRepitio = anioRepitio;
	}

	public List<AnioEscolar> getAnioAbandono() {
		return anioAbandono;
	}

	public void setAnioAbandono(List<AnioEscolar> anioAbandono) {
		this.anioAbandono = anioAbandono;
	}

	public String getObservacionesMaterias() {
		return observacionesMaterias;
	}

	public void setObservacionesMaterias(String observacionesMaterias) {
		this.observacionesMaterias = observacionesMaterias;
	}

	public Boolean getMateriaCienciasNaturales() {
		return materiaCienciasNaturales;
	}

	public void setMateriaCienciasNaturales(Boolean materiaCienciasNaturales) {
		this.materiaCienciasNaturales = materiaCienciasNaturales;
	}

	/**
	 * @return the idPerfilAlumno
	 */
	public Long getIdPerfilAlumno() {
		return idPerfilAlumno;
	}

	/**
	 * @param idPerfilAlumno the idPerfilAlumno to set
	 */
	public void setIdPerfilAlumno(Long idPerfilAlumno) {
		this.idPerfilAlumno = idPerfilAlumno;
	}



	public Boolean getOtroBecado() {
		return otroBecado;
	}



	public void setOtroBecado(Boolean otroBecado) {
		this.otroBecado = otroBecado;
	}



	public Date getFechaEntrevista() {
		return fechaEntrevista;
	}



	public void setFechaEntrevista(Date fechaEntrevista) {
		this.fechaEntrevista = fechaEntrevista;
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



	public String getOrientacion() {
		return orientacion;
	}



	public void setOrientacion(String orientacion) {
		this.orientacion = orientacion;
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



	


	public String getSituacionEscolarAnioAnterior() {
		return situacionEscolarAnioAnterior;
	}



	public void setSituacionEscolarAnioAnterior(String situacionEscolarAnioAnterior) {
		this.situacionEscolarAnioAnterior = situacionEscolarAnioAnterior;
	}



	public Boolean getMateriaLenguaC() {
		return materiaLenguaC;
	}



	public void setMateriaLenguaC(Boolean materiaLenguaC) {
		this.materiaLenguaC = materiaLenguaC;
	}



	public Boolean getMateriaMatemC() {
		return materiaMatemC;
	}



	public void setMateriaMatemC(Boolean materiaMatemC) {
		this.materiaMatemC = materiaMatemC;
	}



	public Boolean getMateriaCiencSocialesC() {
		return materiaCiencSocialesC;
	}



	public void setMateriaCiencSocialesC(Boolean materiaCiencSocialesC) {
		this.materiaCiencSocialesC = materiaCiencSocialesC;
	}



	public Boolean getMateriaInglesLengExtC() {
		return materiaInglesLengExtC;
	}



	public void setMateriaInglesLengExtC(Boolean materiaInglesLengExtC) {
		this.materiaInglesLengExtC = materiaInglesLengExtC;
	}



	public Boolean getMateriaEduFisicaC() {
		return materiaEduFisicaC;
	}



	public void setMateriaEduFisicaC(Boolean materiaEduFisicaC) {
		this.materiaEduFisicaC = materiaEduFisicaC;
	}



	public Boolean getMateriaEduArtC() {
		return materiaEduArtC;
	}



	public void setMateriaEduArtC(Boolean materiaEduArtC) {
		this.materiaEduArtC = materiaEduArtC;
	}



	public Boolean getMateriaCienciasNaturalesC() {
		return materiaCienciasNaturalesC;
	}



	public void setMateriaCienciasNaturalesC(Boolean materiaCienciasNaturalesC) {
		this.materiaCienciasNaturalesC = materiaCienciasNaturalesC;
	}



	public String getMateriasPrevias() {
		return materiasPrevias;
	}



	public void setMateriasPrevias(String materiasPrevias) {
		this.materiasPrevias = materiasPrevias;
	}
	
	

	
	
	
	
}
