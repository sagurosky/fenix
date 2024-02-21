package org.cimientos.intranet.modelo.escuela;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;

import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Parametro;
import org.cimientos.intranet.modelo.perfil.Turno;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.Provincia;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.CollectionOfElements;

import com.cimientos.intranet.enumerativos.AniosEscuela;
import com.cimientos.intranet.enumerativos.Dependencia;
import com.cimientos.intranet.enumerativos.DesplegadoEscuela;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaAccesibilidad;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaCED;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaECTAES;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaProyeccionPFE;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaREFP;
import com.cimientos.intranet.enumerativos.DesplegadoEscuelaSINO;
import com.cimientos.intranet.enumerativos.EspacioApoyo;
import com.cimientos.intranet.enumerativos.NecesidadesEscuela;
import com.cimientos.intranet.enumerativos.EstadoEscuela;
import com.cimientos.intranet.enumerativos.FaseProyecto;
import com.cimientos.intranet.enumerativos.Modalidad;
import com.cimientos.intranet.enumerativos.ModalidadTrabajoEscuela;
import com.cimientos.intranet.enumerativos.NivelEscuela;
import com.cimientos.intranet.enumerativos.Programa;

/**
 * Escuela.
 *
 * @author pmlabaronnie
 */
@Entity
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE, region="org.cimientos.intranet.modelo.escuela.Escuela")
public class Escuela implements Serializable{

	/*
	 * Datos formales de la escuela y de contacto 
	 */
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;
	
	private Long codigoUnicoEscolar;
	
	private String nombre;
	
	@Enumerated(EnumType.ORDINAL)
	private Modalidad modalidad;
	
	@ManyToOne
	private Parametro modalidadEscolar;

	
	@Column(length=10000)
	private String  orientacion;
	
	@Enumerated(EnumType.ORDINAL)
	private NivelEscuela  nivelAtiendeEscuela;
//	DMS 31/1/24
	@CollectionOfElements
	@JoinTable(name="niveles_atiende_escuela")
	@Enumerated(EnumType.ORDINAL)
	private List<NivelEscuela>  nivelesAtiendeEscuela;
	
	
	@Enumerated(EnumType.ORDINAL)
	private AniosEscuela cantidadDeAnios;
	
	@Enumerated(EnumType.ORDINAL)
	private Dependencia  dependencia;
	
	private String  direccionCalle;
	
	private Integer direccionNumero;
	
	private String codigoPostal;
	
	private String barrio;
	
	@ManyToOne
	private Localidad localidad;
	
	@ManyToOne
	private Provincia provincia;
	
	@ManyToOne
	private ZonaCimientos zonaCimientos;
	
	private String telefono1;
	
	private String telefono2;
	
	private String mail;
	
	private String director;
	
	private String directorCelular;
	
	private String directorMail;
	
	private String secretario;
	
	private String secretarioCelular;
	
	private String secretarioMail;
	
	private String responsable;
	
	private String responsableCelular;
	
	private String responsableMail;
	
	//SI = true / NO = false / Sin dato = null
	private Boolean rural;
	
	//SI = true / NO = false / Sin dato = null
	private Boolean subsidioEstatal;
	
	/*
	 * Informacion general Cimientos 
	 */
	
	@Enumerated(EnumType.ORDINAL)
	private EstadoEscuela estadoEscuela; 
	
	@Column(length=10000)
	private String motivoNoSeleccion;
	
	//Año de incorporación a Cimientos
	private Integer anioIncorporacion;
	
	@Enumerated(EnumType.ORDINAL)
	private Programa programa;
	
	//Si programa es OTRO, se aclara el nombre
	private String nombrePrograma;
	
	@Enumerated(EnumType.ORDINAL)
	private ModalidadTrabajoEscuela modalidadTrabajoEscuela;
	
	private boolean lugarEntrevista;
	
	private Boolean activo;
	
	@Column(length=3000)
	private String objetivoProyecto;
	
	@Column(length=3000)
	private String obsGenerales;
	
	private Integer matricula;

	@CollectionOfElements
	@JoinTable(name="turnos_escuela")
	@Enumerated(EnumType.ORDINAL)
	private List<Turno> turno;
	
	private Float indicadorRepitencia;
	
	private Float indicadorAbandono;
	
	@Enumerated(EnumType.ORDINAL)
	private FaseProyecto faseProyecto;
	
	@CollectionOfElements
	@JoinTable(name="espacio_apoyo_escuela")
	@Enumerated(EnumType.ORDINAL)
	private List<EspacioApoyo> espacioApoyo;
	
		
	@ManyToOne
	private CicloPrograma comienzoProyecto;
	
	@ManyToOne
	private CicloPrograma comienzoPBE;
	
	@Column(length=3000)
	private String observaciones;
	
	private Float porcentajeInasistencia;
	
	private String becadosActivos;
	private String entrevistaLugar;
	private String entrevistaProxima;
	private String convocatoria;
	private String becados;
	private String esal;
	private String evge;
	private String hies;
	
	// 2018
	private Boolean ccephe;
	
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuelaCED  ced;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuelaREFP  refp;
	
	private Boolean tcoo;
	
	@Column(length=3000)
	private String dsoo;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuelaAccesibilidad  accesibilidad;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuelaProyeccionPFE  proyeccionPFE;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuelaECTAES  ectaes;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuela eddes;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuela edfea;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuela  edbis;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuela  edccpa;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuela  raeea;
	
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuela  epep;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuelaSINO  ersb;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuela  ecdPFE;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuelaSINO eudbe;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuelaSINO tpacl;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuelaSINO splftp;
	
	@Enumerated(EnumType.ORDINAL)	
	private DesplegadoEscuelaSINO euscp;
	
		
	
	
	
	private Integer cd1;
	private Integer cd2;
	private Integer cd3;
	private Integer cd4;
	private Integer cd5;
	private Integer cd6;
	private Integer cd7;
	private Integer mat1;
	private Integer mat2;
	private Integer mat3;
	private Integer mat4;
	private Integer mat5;
	private Integer mat6;
	private Integer mat7;
	private Integer rep1;
	private Integer rep2;
	private Integer rep3;
	private Integer rep4;
	private Integer rep5;
	private Integer rep6;
	private Integer rep7;
	private Integer ab1;
	private Integer ab2;
	private Integer ab3;
	private Integer ab4;
	private Integer ab5;
	private Integer ab6;
	private Integer ab7;
	
	//2019
	
	@CollectionOfElements
	@JoinTable(name="necesidades_escuela")
	@Enumerated(EnumType.ORDINAL)
	private List<NecesidadesEscuela> necesidadesEscuela;
	
	private Integer mi1;
	private Integer en1;
	private Integer scp1;
	private Integer ssp1;
	private Integer mf1;
	private Integer pudc1;
	private Integer pcf1;
	private Integer np1;
	
	private Integer mi2;
	private Integer en2;
	private Integer scp2;
	private Integer ssp2;
	private Integer mf2;
	private Integer pudc2;
	private Integer pcf2;
	private Integer np2;
	
	private Integer mi3;
	private Integer en3;
	private Integer scp3;
	private Integer ssp3;
	private Integer mf3;
	private Integer pudc3;
	private Integer pcf3;
	private Integer np3;
	
	private Integer mi4;
	private Integer en4;
	private Integer scp4;
	private Integer ssp4;
	private Integer mf4;
	private Integer pudc4;
	private Integer pcf4;
	private Integer np4;
	
	private Integer mi5;
	private Integer en5;
	private Integer scp5;
	private Integer ssp5;
	private Integer mf5;
	private Integer pudc5;
	private Integer pcf5;
	private Integer np5;
	
	private Integer mi6;
	private Integer en6;
	private Integer scp6;
	private Integer ssp6;
	private Integer mf6;
	private Integer pudc6;
	private Integer pcf6;
	private Integer np6;
	
	private Integer mi7;
	private Integer en7;
	private Integer scp7;
	private Integer ssp7;
	private Integer mf7;
	private Integer pudc7;
	private Integer pcf7;
	private Integer np7;
	
	private Integer totalDocentes;
	private Integer totalPreceptores;
	private Integer totalPersonal;
	
	@Column(length=3000)
	private String mayorInformacion;
	
	//SI = true / NO = false / Sin dato = null
	private Boolean referenteSiNo;
	private String referenteAB;
	private String referenteABCelular;
	private String referenteABMail;
	
	@Column(length=3000)
	private String descripcionEscuela;
	
	//SI = true / NO = false / Sin dato = null
	private Boolean is2030;
	
	@Column(length=3000)
	private String otrosEspacios;
	
	@ManyToOne
	private CicloPrograma cicloIndicador;
	
	private String ultimaModificacion;
	
	@Column(length=50)
	private String eqa;;
	
	@Column(length=50)
	private String rolAutoridad1;;
	@Column(length=50)
	private String rolAutoridad2;;
	@Column(length=50)
	private String rolAutoridad3;;
	@Column(length=50)
	private String rolAutoridad4;;
	@Column(length=50)
	private String rolAutoridad5;;

	@Column(length=100)
	private String nombreApellidoAutoridad1;
	@Column(length=100)
	private String nombreApellidoAutoridad2;
	@Column(length=100)
	private String nombreApellidoAutoridad3;
	@Column(length=100)
	private String nombreApellidoAutoridad4;
	@Column(length=100)
	private String nombreApellidoAutoridad5;

	@Column(length=50)
	private String telefonoAutoridad1;
	@Column(length=50)
	private String telefonoAutoridad2;
	@Column(length=50)
	private String telefonoAutoridad3;
	@Column(length=50)
	private String telefonoAutoridad4;
	@Column(length=50)
	private String telefonoAutoridad5;

	@Column(length=100)
	private String mailAutoridad1;
	@Column(length=100)
	private String mailAutoridad2;
	@Column(length=100)
	private String mailAutoridad3;
	@Column(length=100)
	private String mailAutoridad4;
	@Column(length=100)
	private String mailAutoridad5;

	@Column(length=50)
	private String esReferenteAutoridad1;
	@Column(length=50)
	private String esReferenteAutoridad2;
	@Column(length=50)
	private String esReferenteAutoridad3;
	@Column(length=50)
	private String esReferenteAutoridad4;
	@Column(length=50)
	private String esReferenteAutoridad5;
	
	@Column(length=50)
	private String equipoDirectivo;

	@Column(length=50)
	private String aniosParticipacionEQA;
	@Column(length=50)
	private String redEQA;

	@Column(length=50)
	private String cualesOtrasPropuestas;
	@Column(length=200)
	private String cualOtroEspacioApoyo;
	
	private Boolean participoOtrasPropuestas;
	
	
	
	
	

	
	

	

	public String getRedEQA() {
		return redEQA;
	}

	public void setRedEQA(String redEQA) {
		this.redEQA = redEQA;
	}

	public String getCualOtroEspacioApoyo() {
		return cualOtroEspacioApoyo;
	}

	public void setCualOtroEspacioApoyo(String cualOtroEspacioApoyo) {
		this.cualOtroEspacioApoyo = cualOtroEspacioApoyo;
	}

	public String getCualesOtrasPropuestas() {
		return cualesOtrasPropuestas;
	}

	public void setCualesOtrasPropuestas(String cualesOtrasPropuestas) {
		this.cualesOtrasPropuestas = cualesOtrasPropuestas;
	}

	public void setParticipoOtrasPropuestas(Boolean participoOtrasPropuestas) {
		this.participoOtrasPropuestas = participoOtrasPropuestas;
	}


	public Boolean getParticipoOtrasPropuestas() {
		return participoOtrasPropuestas;
	}

	public String getAniosParticipacionEQA() {
		return aniosParticipacionEQA;
	}

	public void setAniosParticipacionEQA(String aniosParticipacionEQA) {
		this.aniosParticipacionEQA = aniosParticipacionEQA;
	}

	public String getEquipoDirectivo() {
		return equipoDirectivo;
	}

	public void setEquipoDirectivo(String equipoDirectivo) {
		this.equipoDirectivo = equipoDirectivo;
	}

	public String getRolAutoridad1() {
		return rolAutoridad1;
	}

	public void setRolAutoridad1(String rolAutoridad1) {
		this.rolAutoridad1 = rolAutoridad1;
	}

	public String getRolAutoridad2() {
		return rolAutoridad2;
	}

	public void setRolAutoridad2(String rolAutoridad2) {
		this.rolAutoridad2 = rolAutoridad2;
	}

	public String getRolAutoridad3() {
		return rolAutoridad3;
	}

	public void setRolAutoridad3(String rolAutoridad3) {
		this.rolAutoridad3 = rolAutoridad3;
	}

	public String getRolAutoridad4() {
		return rolAutoridad4;
	}

	public void setRolAutoridad4(String rolAutoridad4) {
		this.rolAutoridad4 = rolAutoridad4;
	}

	public String getRolAutoridad5() {
		return rolAutoridad5;
	}

	public void setRolAutoridad5(String rolAutoridad5) {
		this.rolAutoridad5 = rolAutoridad5;
	}

	public String getNombreApellidoAutoridad1() {
		return nombreApellidoAutoridad1;
	}

	public void setNombreApellidoAutoridad1(String nombreApellidoAutoridad1) {
		this.nombreApellidoAutoridad1 = nombreApellidoAutoridad1;
	}

	public String getNombreApellidoAutoridad2() {
		return nombreApellidoAutoridad2;
	}

	public void setNombreApellidoAutoridad2(String nombreApellidoAutoridad2) {
		this.nombreApellidoAutoridad2 = nombreApellidoAutoridad2;
	}

	public String getNombreApellidoAutoridad3() {
		return nombreApellidoAutoridad3;
	}

	public void setNombreApellidoAutoridad3(String nombreApellidoAutoridad3) {
		this.nombreApellidoAutoridad3 = nombreApellidoAutoridad3;
	}

	public String getNombreApellidoAutoridad4() {
		return nombreApellidoAutoridad4;
	}

	public void setNombreApellidoAutoridad4(String nombreApellidoAutoridad4) {
		this.nombreApellidoAutoridad4 = nombreApellidoAutoridad4;
	}

	public String getNombreApellidoAutoridad5() {
		return nombreApellidoAutoridad5;
	}

	public void setNombreApellidoAutoridad5(String nombreApellidoAutoridad5) {
		this.nombreApellidoAutoridad5 = nombreApellidoAutoridad5;
	}

	public String getTelefonoAutoridad1() {
		return telefonoAutoridad1;
	}

	public void setTelefonoAutoridad1(String telefonoAutoridad1) {
		this.telefonoAutoridad1 = telefonoAutoridad1;
	}

	public String getTelefonoAutoridad2() {
		return telefonoAutoridad2;
	}

	public void setTelefonoAutoridad2(String telefonoAutoridad2) {
		this.telefonoAutoridad2 = telefonoAutoridad2;
	}

	public String getTelefonoAutoridad3() {
		return telefonoAutoridad3;
	}

	public void setTelefonoAutoridad3(String telefonoAutoridad3) {
		this.telefonoAutoridad3 = telefonoAutoridad3;
	}

	public String getTelefonoAutoridad4() {
		return telefonoAutoridad4;
	}

	public void setTelefonoAutoridad4(String telefonoAutoridad4) {
		this.telefonoAutoridad4 = telefonoAutoridad4;
	}

	public String getTelefonoAutoridad5() {
		return telefonoAutoridad5;
	}

	public void setTelefonoAutoridad5(String telefonoAutoridad5) {
		this.telefonoAutoridad5 = telefonoAutoridad5;
	}

	public String getMailAutoridad1() {
		return mailAutoridad1;
	}

	public void setMailAutoridad1(String mailAutoridad1) {
		this.mailAutoridad1 = mailAutoridad1;
	}

	public String getMailAutoridad2() {
		return mailAutoridad2;
	}

	public void setMailAutoridad2(String mailAutoridad2) {
		this.mailAutoridad2 = mailAutoridad2;
	}

	public String getMailAutoridad3() {
		return mailAutoridad3;
	}

	public void setMailAutoridad3(String mailAutoridad3) {
		this.mailAutoridad3 = mailAutoridad3;
	}

	public String getMailAutoridad4() {
		return mailAutoridad4;
	}

	public void setMailAutoridad4(String mailAutoridad4) {
		this.mailAutoridad4 = mailAutoridad4;
	}

	public String getMailAutoridad5() {
		return mailAutoridad5;
	}

	public void setMailAutoridad5(String mailAutoridad5) {
		this.mailAutoridad5 = mailAutoridad5;
	}

	public String getEsReferenteAutoridad1() {
		return esReferenteAutoridad1;
	}

	public void setEsReferenteAutoridad1(String esReferenteAutoridad1) {
		this.esReferenteAutoridad1 = esReferenteAutoridad1;
	}

	public String getEsReferenteAutoridad2() {
		return esReferenteAutoridad2;
	}

	public void setEsReferenteAutoridad2(String esReferenteAutoridad2) {
		this.esReferenteAutoridad2 = esReferenteAutoridad2;
	}

	public String getEsReferenteAutoridad3() {
		return esReferenteAutoridad3;
	}

	public void setEsReferenteAutoridad3(String esReferenteAutoridad3) {
		this.esReferenteAutoridad3 = esReferenteAutoridad3;
	}

	public String getEsReferenteAutoridad4() {
		return esReferenteAutoridad4;
	}

	public void setEsReferenteAutoridad4(String esReferenteAutoridad4) {
		this.esReferenteAutoridad4 = esReferenteAutoridad4;
	}

	public String getEsReferenteAutoridad5() {
		return esReferenteAutoridad5;
	}

	public void setEsReferenteAutoridad5(String esReferenteAutoridad5) {
		this.esReferenteAutoridad5 = esReferenteAutoridad5;
	}

	public String getEqa() {
		return eqa;
	}

	public void setEqa(String eqa) {
		this.eqa = eqa;
	}

	public String getUltimaModificacion() {
		return ultimaModificacion;
	}

	public void setUltimaModificacion(String ultimaModificacion) {
		this.ultimaModificacion = ultimaModificacion;
	}

	public CicloPrograma getCicloIndicador() {
		return cicloIndicador;
	}

	public void setCicloIndicador(CicloPrograma cicloIndicador) {
		this.cicloIndicador = cicloIndicador;
	}

	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the nombre.
	 *
	 * @return the nombre
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * Sets the nombre.
	 *
	 * @param nombre the new nombre
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * Gets the localidad.
	 *
	 * @return the localidad
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Localidad getLocalidad() {
		return localidad;
	}

	/**
	 * Sets the localidad.
	 *
	 * @param localidad the new localidad
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}

	/**
	 * Gets the provincia.
	 *
	 * @return the provincia
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Provincia getProvincia() {
		return provincia;
	}

	/**
	 * Sets the provincia.
	 *
	 * @param provincia the new provincia
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	/**
	 * Gets the modalidad escolar.
	 *
	 * @return the modalidad escolar
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Parametro getModalidadEscolar() {
		return modalidadEscolar;
	}

	/**
	 * Sets the modalidad escolar.
	 *
	 * @param modalidadEscolar the new modalidad escolar
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setModalidadEscolar(Parametro modalidadEscolar) {
		this.modalidadEscolar = modalidadEscolar;
	}

	/**
	 * Checks if is lugar entrevista.
	 *
	 * @return true, if is lugar entrevista
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public boolean isLugarEntrevista() {
		return lugarEntrevista;
	}

	/**
	 * Sets the lugar entrevista.
	 *
	 * @param lugarEntrevista the new lugar entrevista
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setLugarEntrevista(boolean lugarEntrevista) {
		this.lugarEntrevista = lugarEntrevista;
	}

	/**
	 * Gets the estado escuela.
	 *
	 * @return the estadoEscuela
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public EstadoEscuela getEstadoEscuela() {
		return estadoEscuela;
	}

	/**
	 * Sets the estado escuela.
	 *
	 * @param estadoEscuela the estadoEscuela to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setEstadoEscuela(EstadoEscuela estadoEscuela) {
		this.estadoEscuela = estadoEscuela;
	}

	/**
	 * Gets the zona cimientos.
	 *
	 * @return the zona cimientos
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public ZonaCimientos getZonaCimientos() {
		return zonaCimientos;
	}

	/**
	 * Sets the zona cimientos.
	 *
	 * @param zonaCimientos the new zona cimientos
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setZonaCimientos(ZonaCimientos zonaCimientos) {
		this.zonaCimientos = zonaCimientos;
	}

	/**
	 * Gets the codigo unico escolar.
	 *
	 * @return the codigoUnicoEscolar
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Long getCodigoUnicoEscolar() {
		return codigoUnicoEscolar;
	}

	/**
	 * Sets the codigo unico escolar.
	 *
	 * @param codigoUnicoEscolar the codigoUnicoEscolar to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setCodigoUnicoEscolar(Long codigoUnicoEscolar) {
		this.codigoUnicoEscolar = codigoUnicoEscolar;
	}

	/**
	 * Gets the orientacion.
	 *
	 * @return the orientacion
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getOrientacion() {
		return orientacion;
	}

	/**
	 * Sets the orientacion.
	 *
	 * @param orientacion the orientacion to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setOrientacion(String orientacion) {
		this.orientacion = orientacion;
	}

	/**
	 * Gets the nivel atiende escuela.
	 *
	 * @return the nivelAtiendeEscuela
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public NivelEscuela getNivelAtiendeEscuela() {
		return nivelAtiendeEscuela;
	}

	/**
	 * Sets the nivel atiende escuela.
	 *
	 * @param nivelAtiendeEscuela the nivelAtiendeEscuela to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setNivelAtiendeEscuela(NivelEscuela nivelAtiendeEscuela) {
		this.nivelAtiendeEscuela = nivelAtiendeEscuela;
	}

	/**
	 * Gets the cantidad de anios.
	 *
	 * @return the cantidadDeAnios
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public AniosEscuela getCantidadDeAnios() {
		return cantidadDeAnios;
	}

	/**
	 * Sets the cantidad de anios.
	 *
	 * @param cantidadDeAnios the cantidadDeAnios to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setCantidadDeAnios(AniosEscuela cantidadDeAnios) {
		this.cantidadDeAnios = cantidadDeAnios;
	}

	/**
	 * Gets the dependencia.
	 *
	 * @return the dependencia
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Dependencia getDependencia() {
		return dependencia;
	}

	/**
	 * Sets the dependencia.
	 *
	 * @param dependencia the dependencia to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setDependencia(Dependencia dependencia) {
		this.dependencia = dependencia;
	}

	/**
	 * Gets the direccion calle.
	 *
	 * @return the direccionCalle
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getDireccionCalle() {
		return direccionCalle;
	}

	/**
	 * Sets the direccion calle.
	 *
	 * @param direccionCalle the direccionCalle to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setDireccionCalle(String direccionCalle) {
		this.direccionCalle = direccionCalle;
	}

	/**
	 * Gets the direccion numero.
	 *
	 * @return the direccionNumero
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Integer getDireccionNumero() {
		return direccionNumero;
	}

	/**
	 * Sets the direccion numero.
	 *
	 * @param direccionNumero the direccionNumero to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setDireccionNumero(Integer direccionNumero) {
		this.direccionNumero = direccionNumero;
	}

	/**
	 * Gets the codigo postal.
	 *
	 * @return the codigoPostal
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getCodigoPostal() {
		return codigoPostal;
	}

	/**
	 * Sets the codigo postal.
	 *
	 * @param codigoPostal the codigoPostal to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	/**
	 * Gets the barrio.
	 *
	 * @return the barrio
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getBarrio() {
		return barrio;
	}

	/**
	 * Sets the barrio.
	 *
	 * @param barrio the barrio to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setBarrio(String barrio) {
		this.barrio = barrio;
	}

	/**
	 * Gets the telefono1.
	 *
	 * @return the telefono1
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getTelefono1() {
		return telefono1;
	}

	/**
	 * Sets the telefono1.
	 *
	 * @param telefono1 the telefono1 to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setTelefono1(String telefono1) {
		this.telefono1 = telefono1;
	}

	/**
	 * Gets the telefono2.
	 *
	 * @return the telefono2
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getTelefono2() {
		return telefono2;
	}

	/**
	 * Sets the telefono2.
	 *
	 * @param telefono2 the telefono2 to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setTelefono2(String telefono2) {
		this.telefono2 = telefono2;
	}

	/**
	 * Gets the mail.
	 *
	 * @return the mail
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getMail() {
		return mail;
	}

	/**
	 * Sets the mail.
	 *
	 * @param mail the mail to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setMail(String mail) {
		this.mail = mail;
	}

	/**
	 * Gets the director.
	 *
	 * @return the director
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getDirector() {
		return director;
	}

	/**
	 * Sets the director.
	 *
	 * @param director the director to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setDirector(String director) {
		this.director = director;
	}

	/**
	 * Gets the director celular.
	 *
	 * @return the directorCelular
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getDirectorCelular() {
		return directorCelular;
	}

	/**
	 * Sets the director celular.
	 *
	 * @param directorCelular the directorCelular to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setDirectorCelular(String directorCelular) {
		this.directorCelular = directorCelular;
	}

	/**
	 * Gets the director mail.
	 *
	 * @return the directorMail
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getDirectorMail() {
		return directorMail;
	}

	/**
	 * Sets the director mail.
	 *
	 * @param directorMail the directorMail to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setDirectorMail(String directorMail) {
		this.directorMail = directorMail;
	}

	/**
	 * Gets the secretario.
	 *
	 * @return the secretario
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getSecretario() {
		return secretario;
	}

	/**
	 * Sets the secretario.
	 *
	 * @param secretario the secretario to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setSecretario(String secretario) {
		this.secretario = secretario;
	}

	/**
	 * Gets the secretario celular.
	 *
	 * @return the secretarioCelular
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getSecretarioCelular() {
		return secretarioCelular;
	}

	/**
	 * Sets the secretario celular.
	 *
	 * @param secretarioCelular the secretarioCelular to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setSecretarioCelular(String secretarioCelular) {
		this.secretarioCelular = secretarioCelular;
	}

	/**
	 * Gets the secretario mail.
	 *
	 * @return the secretarioMail
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getSecretarioMail() {
		return secretarioMail;
	}

	/**
	 * Sets the secretario mail.
	 *
	 * @param secretarioMail the secretarioMail to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setSecretarioMail(String secretarioMail) {
		this.secretarioMail = secretarioMail;
	}

	/**
	 * Gets the responsable.
	 *
	 * @return the responsable
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getResponsable() {
		return responsable;
	}

	/**
	 * Sets the responsable.
	 *
	 * @param responsable the responsable to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	/**
	 * Gets the responsable celular.
	 *
	 * @return the responsableCelular
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getResponsableCelular() {
		return responsableCelular;
	}

	/**
	 * Sets the responsable celular.
	 *
	 * @param responsableCelular the responsableCelular to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setResponsableCelular(String responsableCelular) {
		this.responsableCelular = responsableCelular;
	}

	/**
	 * Gets the responsable mail.
	 *
	 * @return the responsableMail
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getResponsableMail() {
		return responsableMail;
	}

	/**
	 * Sets the responsable mail.
	 *
	 * @param responsableMail the responsableMail to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setResponsableMail(String responsableMail) {
		this.responsableMail = responsableMail;
	}

	/**
	 * Gets the rural.
	 *
	 * @return the rural
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Boolean getRural() {
		return rural;
	}

	/**
	 * Sets the rural.
	 *
	 * @param rural the rural to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setRural(Boolean rural) {
		this.rural = rural;
	}

	/**
	 * Gets the subsidio estatal.
	 *
	 * @return the subsidioEstatal
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Boolean getSubsidioEstatal() {
		return subsidioEstatal;
	}

	/**
	 * Sets the subsidio estatal.
	 *
	 * @param subsidioEstatal the subsidioEstatal to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setSubsidioEstatal(Boolean subsidioEstatal) {
		this.subsidioEstatal = subsidioEstatal;
	}

	/**
	 * Gets the motivo no seleccion.
	 *
	 * @return the motivoNoSeleccion
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getMotivoNoSeleccion() {
		return motivoNoSeleccion;
	}

	/**
	 * Sets the motivo no seleccion.
	 *
	 * @param motivoNoSeleccion the motivoNoSeleccion to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setMotivoNoSeleccion(String motivoNoSeleccion) {
		this.motivoNoSeleccion = motivoNoSeleccion;
	}

	/**
	 * Gets the anio incorporacion.
	 *
	 * @return the anioIncorporacion
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Integer getAnioIncorporacion() {
		return anioIncorporacion;
	}

	/**
	 * Sets the anio incorporacion.
	 *
	 * @param anioIncorporacion the anioIncorporacion to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setAnioIncorporacion(Integer anioIncorporacion) {
		this.anioIncorporacion = anioIncorporacion;
	}

	/**
	 * Gets the programa.
	 *
	 * @return the programa
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Programa getPrograma() {
		return programa;
	}

	/**
	 * Sets the programa.
	 *
	 * @param programa the programa to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setPrograma(Programa programa) {
		this.programa = programa;
	}

	/**
	 * Gets the nombre programa.
	 *
	 * @return the nombrePrograma
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getNombrePrograma() {
		return nombrePrograma;
	}

	/**
	 * Sets the nombre programa.
	 *
	 * @param nombrePrograma the nombrePrograma to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setNombrePrograma(String nombrePrograma) {
		this.nombrePrograma = nombrePrograma;
	}

	/**
	 * Gets the modalidad trabajo escuela.
	 *
	 * @return the modalidadTrabajoEscuela
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public ModalidadTrabajoEscuela getModalidadTrabajoEscuela() {
		return modalidadTrabajoEscuela;
	}

	/**
	 * Sets the modalidad trabajo escuela.
	 *
	 * @param modalidadTrabajoEscuela the modalidadTrabajoEscuela to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setModalidadTrabajoEscuela(ModalidadTrabajoEscuela modalidadTrabajoEscuela) {
		this.modalidadTrabajoEscuela = modalidadTrabajoEscuela;
	}

	/**
	 * @return the modalidad
	 */
	public Modalidad getModalidad() {
		return modalidad;
	}

	/**
	 * @param modalidad the modalidad to set
	 */
	public void setModalidad(Modalidad modalidad) {
		this.modalidad = modalidad;
	}

	public Boolean getActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	public String getObjetivoProyecto() {
		return objetivoProyecto;
	}

	public void setObjetivoProyecto(String objetivoProyecto) {
		this.objetivoProyecto = objetivoProyecto;
	}

	public String getObsGenerales() {
		return obsGenerales;
	}

	public void setObsGenerales(String obsGenerales) {
		this.obsGenerales = obsGenerales;
	}

	public Integer getMatricula() {
		return matricula;
	}

	public void setMatricula(Integer matricula) {
		this.matricula = matricula;
	}

	public List<Turno> getTurno() {
		return turno;
	}

	public void setTurno(List<Turno> turno) {
		this.turno = turno;
	}

	public Float getIndicadorRepitencia() {
		return indicadorRepitencia;
	}

	public void setIndicadorRepitencia(Float indicadorRepitencia) {
		this.indicadorRepitencia = indicadorRepitencia;
	}

	public Float getIndicadorAbandono() {
		return indicadorAbandono;
	}

	public void setIndicadorAbandono(Float indicadorAbandono) {
		this.indicadorAbandono = indicadorAbandono;
	}

	public FaseProyecto getFaseProyecto() {
		return faseProyecto;
	}

	public void setFaseProyecto(FaseProyecto faseProyecto) {
		this.faseProyecto = faseProyecto;
	}

	public List<EspacioApoyo> getEspacioApoyo() {
		return espacioApoyo;
	}

	public void setEspacioApoyo(List<EspacioApoyo> espacioApoyo) {
		this.espacioApoyo = espacioApoyo;
	}

	public CicloPrograma getComienzoProyecto() {
		return comienzoProyecto;
	}

	public void setComienzoProyecto(CicloPrograma comienzoProyecto) {
		this.comienzoProyecto = comienzoProyecto;
	}

	public CicloPrograma getComienzoPBE() {
		return comienzoPBE;
	}

	public void setComienzoPBE(CicloPrograma comienzoPBE) {
		this.comienzoPBE = comienzoPBE;
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
	
	public Float getPorcentajeInasistencia() {
		return porcentajeInasistencia;
	}

	public void setPorcentajeInasistencia(Float porcentajeInasistencia) {
		this.porcentajeInasistencia = porcentajeInasistencia;
	}

	public String getBecadosActivos() {
		return becadosActivos;
	}

	public void setBecadosActivos(String becadosActivos) {
		this.becadosActivos = becadosActivos;
	}

	public String getEntrevistaLugar() {
		return entrevistaLugar;
	}

	public void setEntrevistaLugar(String entrevistaLugar) {
		this.entrevistaLugar = entrevistaLugar;
	}

	public String getEntrevistaProxima() {
		return entrevistaProxima;
	}

	public void setEntrevistaProxima(String entrevistaProxima) {
		this.entrevistaProxima = entrevistaProxima;
	}

	public String getConvocatoria() {
		return convocatoria;
	}

	public void setConvocatoria(String convocatoria) {
		this.convocatoria = convocatoria;
	}

	public String getBecados() {
		return becados;
	}

	public void setBecados(String becados) {
		this.becados = becados;
	}

	public String getEsal() {
		return esal;
	}

	public void setEsal(String esal) {
		this.esal = esal;
	}

	public String getEvge() {
		return evge;
	}

	public void setEvge(String evge) {
		this.evge = evge;
	}

	public String getHies() {
		return hies;
	}

	public void setHies(String hies) {
		this.hies = hies;
	}

	public Boolean getCcephe() {
		return ccephe;
	}

	public void setCcephe(Boolean ccephe) {
		this.ccephe = ccephe;
	}

	public DesplegadoEscuelaCED getCed() {
		return ced;
	}

	public void setCed(DesplegadoEscuelaCED ced) {
		this.ced = ced;
	}

	public DesplegadoEscuelaREFP getRefp() {
		return refp;
	}

	public void setRefp(DesplegadoEscuelaREFP refp) {
		this.refp = refp;
	}

	public Boolean getTcoo() {
		return tcoo;
	}

	public void setTcoo(Boolean tcoo) {
		this.tcoo = tcoo;
	}

	public String getDsoo() {
		return dsoo;
	}

	public void setDsoo(String dsoo) {
		this.dsoo = dsoo;
	}

	public DesplegadoEscuelaAccesibilidad getAccesibilidad() {
		return accesibilidad;
	}

	public void setAccesibilidad(DesplegadoEscuelaAccesibilidad accesibilidad) {
		this.accesibilidad = accesibilidad;
	}

	public DesplegadoEscuelaProyeccionPFE getProyeccionPFE() {
		return proyeccionPFE;
	}

	public void setProyeccionPFE(DesplegadoEscuelaProyeccionPFE proyeccionPFE) {
		this.proyeccionPFE = proyeccionPFE;
	}

	public DesplegadoEscuelaECTAES getEctaes() {
		return ectaes;
	}

	public void setEctaes(DesplegadoEscuelaECTAES ectaes) {
		this.ectaes = ectaes;
	}

	public DesplegadoEscuela getEddes() {
		return eddes;
	}

	public void setEddes(DesplegadoEscuela eddes) {
		this.eddes = eddes;
	}

	public DesplegadoEscuela getEdfea() {
		return edfea;
	}

	public void setEdfea(DesplegadoEscuela edfea) {
		this.edfea = edfea;
	}

	public DesplegadoEscuela getEdbis() {
		return edbis;
	}

	public void setEdbis(DesplegadoEscuela edbis) {
		this.edbis = edbis;
	}

	public DesplegadoEscuela getEdccpa() {
		return edccpa;
	}

	public void setEdccpa(DesplegadoEscuela edccpa) {
		this.edccpa = edccpa;
	}

	public DesplegadoEscuela getRaeea() {
		return raeea;
	}

	public void setRaeea(DesplegadoEscuela raeea) {
		this.raeea = raeea;
	}

	public DesplegadoEscuela getEpep() {
		return epep;
	}

	public void setEpep(DesplegadoEscuela epep) {
		this.epep = epep;
	}

	public DesplegadoEscuelaSINO getErsb() {
		return ersb;
	}

	public void setErsb(DesplegadoEscuelaSINO ersb) {
		this.ersb = ersb;
	}

	

	public DesplegadoEscuela getEcdPFE() {
		return ecdPFE;
	}

	public void setEcdPFE(DesplegadoEscuela ecdPFE) {
		this.ecdPFE = ecdPFE;
	}

	public Integer getCd1() {
		return cd1;
	}

	public void setCd1(Integer cd1) {
		this.cd1 = cd1;
	}

	public Integer getCd2() {
		return cd2;
	}

	public void setCd2(Integer cd2) {
		this.cd2 = cd2;
	}

	public Integer getCd3() {
		return cd3;
	}

	public void setCd3(Integer cd3) {
		this.cd3 = cd3;
	}

	public Integer getCd4() {
		return cd4;
	}

	public void setCd4(Integer cd4) {
		this.cd4 = cd4;
	}

	public Integer getCd5() {
		return cd5;
	}

	public void setCd5(Integer cd5) {
		this.cd5 = cd5;
	}

	public Integer getCd6() {
		return cd6;
	}

	public void setCd6(Integer cd6) {
		this.cd6 = cd6;
	}

	public Integer getCd7() {
		return cd7;
	}

	public void setCd7(Integer cd7) {
		this.cd7 = cd7;
	}

	public Integer getMat1() {
		return mat1;
	}

	public void setMat1(Integer mat1) {
		this.mat1 = mat1;
	}

	public Integer getMat2() {
		return mat2;
	}

	public void setMat2(Integer mat2) {
		this.mat2 = mat2;
	}

	public Integer getMat3() {
		return mat3;
	}

	public void setMat3(Integer mat3) {
		this.mat3 = mat3;
	}

	public Integer getMat4() {
		return mat4;
	}

	public void setMat4(Integer mat4) {
		this.mat4 = mat4;
	}

	public Integer getMat5() {
		return mat5;
	}

	public void setMat5(Integer mat5) {
		this.mat5 = mat5;
	}

	public Integer getMat6() {
		return mat6;
	}

	public void setMat6(Integer mat6) {
		this.mat6 = mat6;
	}

	public Integer getMat7() {
		return mat7;
	}

	public void setMat7(Integer mat7) {
		this.mat7 = mat7;
	}

	public Integer getRep1() {
		return rep1;
	}

	public void setRep1(Integer rep1) {
		this.rep1 = rep1;
	}

	public Integer getRep2() {
		return rep2;
	}

	public void setRep2(Integer rep2) {
		this.rep2 = rep2;
	}

	public Integer getRep3() {
		return rep3;
	}

	public void setRep3(Integer rep3) {
		this.rep3 = rep3;
	}

	public Integer getRep4() {
		return rep4;
	}

	public void setRep4(Integer rep4) {
		this.rep4 = rep4;
	}

	public Integer getRep5() {
		return rep5;
	}

	public void setRep5(Integer rep5) {
		this.rep5 = rep5;
	}

	public Integer getRep6() {
		return rep6;
	}

	public void setRep6(Integer rep6) {
		this.rep6 = rep6;
	}

	public Integer getRep7() {
		return rep7;
	}

	public void setRep7(Integer rep7) {
		this.rep7 = rep7;
	}

	public Integer getAb1() {
		return ab1;
	}

	public void setAb1(Integer ab1) {
		this.ab1 = ab1;
	}

	public Integer getAb2() {
		return ab2;
	}

	public void setAb2(Integer ab2) {
		this.ab2 = ab2;
	}

	public Integer getAb3() {
		return ab3;
	}

	public void setAb3(Integer ab3) {
		this.ab3 = ab3;
	}

	public Integer getAb4() {
		return ab4;
	}

	public void setAb4(Integer ab4) {
		this.ab4 = ab4;
	}

	public Integer getAb5() {
		return ab5;
	}

	public void setAb5(Integer ab5) {
		this.ab5 = ab5;
	}

	public Integer getAb6() {
		return ab6;
	}

	public void setAb6(Integer ab6) {
		this.ab6 = ab6;
	}

	public Integer getAb7() {
		return ab7;
	}

	public void setAb7(Integer ab7) {
		this.ab7 = ab7;
	}

	public DesplegadoEscuelaSINO getEudbe() {
		return eudbe;
	}

	public void setEudbe(DesplegadoEscuelaSINO eudbe) {
		this.eudbe = eudbe;
	}

	public DesplegadoEscuelaSINO getTpacl() {
		return tpacl;
	}

	public void setTpacl(DesplegadoEscuelaSINO tpacl) {
		this.tpacl = tpacl;
	}

	public DesplegadoEscuelaSINO getSplftp() {
		return splftp;
	}

	public void setSplftp(DesplegadoEscuelaSINO splftp) {
		this.splftp = splftp;
	}

	public DesplegadoEscuelaSINO getEuscp() {
		return euscp;
	}

	public void setEuscp(DesplegadoEscuelaSINO euscp) {
		this.euscp = euscp;
	}

	public List<NecesidadesEscuela> getNecesidadesEscuela() {
		return necesidadesEscuela;
	}

	public void setNecesidadesEscuela(List<NecesidadesEscuela> necesidadesEscuela) {
		this.necesidadesEscuela = necesidadesEscuela;
	}

	public Integer getMi1() {
		return mi1;
	}

	public void setMi1(Integer mi1) {
		this.mi1 = mi1;
	}

	public Integer getEn1() {
		return en1;
	}

	public void setEn1(Integer en1) {
		this.en1 = en1;
	}

	public Integer getScp1() {
		return scp1;
	}

	public void setScp1(Integer scp1) {
		this.scp1 = scp1;
	}

	public Integer getSsp1() {
		return ssp1;
	}

	public void setSsp1(Integer ssp1) {
		this.ssp1 = ssp1;
	}

	public Integer getMf1() {
		return mf1;
	}

	public void setMf1(Integer mf1) {
		this.mf1 = mf1;
	}

	public Integer getPudc1() {
		return pudc1;
	}

	public void setPudc1(Integer pudc1) {
		this.pudc1 = pudc1;
	}

	public Integer getPcf1() {
		return pcf1;
	}

	public void setPcf1(Integer pcf1) {
		this.pcf1 = pcf1;
	}

	public Integer getNp1() {
		return np1;
	}

	public void setNp1(Integer np1) {
		this.np1 = np1;
	}

	public Integer getMi2() {
		return mi2;
	}

	public void setMi2(Integer mi2) {
		this.mi2 = mi2;
	}

	public Integer getEn2() {
		return en2;
	}

	public void setEn2(Integer en2) {
		this.en2 = en2;
	}

	public Integer getScp2() {
		return scp2;
	}

	public void setScp2(Integer scp2) {
		this.scp2 = scp2;
	}

	public Integer getSsp2() {
		return ssp2;
	}

	public void setSsp2(Integer ssp2) {
		this.ssp2 = ssp2;
	}

	public Integer getMf2() {
		return mf2;
	}

	public void setMf2(Integer mf2) {
		this.mf2 = mf2;
	}

	public Integer getPudc2() {
		return pudc2;
	}

	public void setPudc2(Integer pudc2) {
		this.pudc2 = pudc2;
	}

	public Integer getPcf2() {
		return pcf2;
	}

	public void setPcf2(Integer pcf2) {
		this.pcf2 = pcf2;
	}

	public Integer getNp2() {
		return np2;
	}

	public void setNp2(Integer np2) {
		this.np2 = np2;
	}

	public Integer getMi3() {
		return mi3;
	}

	public void setMi3(Integer mi3) {
		this.mi3 = mi3;
	}

	public Integer getEn3() {
		return en3;
	}

	public void setEn3(Integer en3) {
		this.en3 = en3;
	}

	public Integer getScp3() {
		return scp3;
	}

	public void setScp3(Integer scp3) {
		this.scp3 = scp3;
	}

	public Integer getSsp3() {
		return ssp3;
	}

	public void setSsp3(Integer ssp3) {
		this.ssp3 = ssp3;
	}

	public Integer getMf3() {
		return mf3;
	}

	public void setMf3(Integer mf3) {
		this.mf3 = mf3;
	}

	public Integer getPudc3() {
		return pudc3;
	}

	public void setPudc3(Integer pudc3) {
		this.pudc3 = pudc3;
	}

	public Integer getPcf3() {
		return pcf3;
	}

	public void setPcf3(Integer pcf3) {
		this.pcf3 = pcf3;
	}

	public Integer getNp3() {
		return np3;
	}

	public void setNp3(Integer np3) {
		this.np3 = np3;
	}

	public Integer getMi4() {
		return mi4;
	}

	public void setMi4(Integer mi4) {
		this.mi4 = mi4;
	}

	public Integer getEn4() {
		return en4;
	}

	public void setEn4(Integer en4) {
		this.en4 = en4;
	}

	public Integer getScp4() {
		return scp4;
	}

	public void setScp4(Integer scp4) {
		this.scp4 = scp4;
	}

	public Integer getSsp4() {
		return ssp4;
	}

	public void setSsp4(Integer ssp4) {
		this.ssp4 = ssp4;
	}

	public Integer getMf4() {
		return mf4;
	}

	public void setMf4(Integer mf4) {
		this.mf4 = mf4;
	}

	public Integer getPudc4() {
		return pudc4;
	}

	public void setPudc4(Integer pudc4) {
		this.pudc4 = pudc4;
	}

	public Integer getPcf4() {
		return pcf4;
	}

	public void setPcf4(Integer pcf4) {
		this.pcf4 = pcf4;
	}

	public Integer getNp4() {
		return np4;
	}

	public void setNp4(Integer np4) {
		this.np4 = np4;
	}

	public Integer getMi5() {
		return mi5;
	}

	public void setMi5(Integer mi5) {
		this.mi5 = mi5;
	}

	public Integer getEn5() {
		return en5;
	}

	public void setEn5(Integer en5) {
		this.en5 = en5;
	}

	public Integer getScp5() {
		return scp5;
	}

	public void setScp5(Integer scp5) {
		this.scp5 = scp5;
	}

	public Integer getSsp5() {
		return ssp5;
	}

	public void setSsp5(Integer ssp5) {
		this.ssp5 = ssp5;
	}

	public Integer getMf5() {
		return mf5;
	}

	public void setMf5(Integer mf5) {
		this.mf5 = mf5;
	}

	public Integer getPudc5() {
		return pudc5;
	}

	public void setPudc5(Integer pudc5) {
		this.pudc5 = pudc5;
	}

	public Integer getPcf5() {
		return pcf5;
	}

	public void setPcf5(Integer pcf5) {
		this.pcf5 = pcf5;
	}

	public Integer getNp5() {
		return np5;
	}

	public void setNp5(Integer np5) {
		this.np5 = np5;
	}

	public Integer getMi6() {
		return mi6;
	}

	public void setMi6(Integer mi6) {
		this.mi6 = mi6;
	}

	public Integer getEn6() {
		return en6;
	}

	public void setEn6(Integer en6) {
		this.en6 = en6;
	}

	public Integer getScp6() {
		return scp6;
	}

	public void setScp6(Integer scp6) {
		this.scp6 = scp6;
	}

	public Integer getSsp6() {
		return ssp6;
	}

	public void setSsp6(Integer ssp6) {
		this.ssp6 = ssp6;
	}

	public Integer getMf6() {
		return mf6;
	}

	public void setMf6(Integer mf6) {
		this.mf6 = mf6;
	}

	public Integer getPudc6() {
		return pudc6;
	}

	public void setPudc6(Integer pudc6) {
		this.pudc6 = pudc6;
	}

	public Integer getPcf6() {
		return pcf6;
	}

	public void setPcf6(Integer pcf6) {
		this.pcf6 = pcf6;
	}

	public Integer getNp6() {
		return np6;
	}

	public void setNp6(Integer np6) {
		this.np6 = np6;
	}

	public Integer getMi7() {
		return mi7;
	}

	public void setMi7(Integer mi7) {
		this.mi7 = mi7;
	}

	public Integer getEn7() {
		return en7;
	}

	public void setEn7(Integer en7) {
		this.en7 = en7;
	}

	public Integer getScp7() {
		return scp7;
	}

	public void setScp7(Integer scp7) {
		this.scp7 = scp7;
	}

	public Integer getSsp7() {
		return ssp7;
	}

	public void setSsp7(Integer ssp7) {
		this.ssp7 = ssp7;
	}

	public Integer getMf7() {
		return mf7;
	}

	public void setMf7(Integer mf7) {
		this.mf7 = mf7;
	}

	public Integer getPudc7() {
		return pudc7;
	}

	public void setPudc7(Integer pudc7) {
		this.pudc7 = pudc7;
	}

	public Integer getPcf7() {
		return pcf7;
	}

	public void setPcf7(Integer pcf7) {
		this.pcf7 = pcf7;
	}

	public Integer getNp7() {
		return np7;
	}

	public void setNp7(Integer np7) {
		this.np7 = np7;
	}

	public Integer getTotalDocentes() {
		return totalDocentes;
	}

	public void setTotalDocentes(Integer totalDocentes) {
		this.totalDocentes = totalDocentes;
	}

	public Integer getTotalPreceptores() {
		return totalPreceptores;
	}

	public void setTotalPreceptores(Integer totalPreceptores) {
		this.totalPreceptores = totalPreceptores;
	}

	public Integer getTotalPersonal() {
		return totalPersonal;
	}

	public void setTotalPersonal(Integer totalPersonal) {
		this.totalPersonal = totalPersonal;
	}

	public String getMayorInformacion() {
		return mayorInformacion;
	}

	public void setMayorInformacion(String mayorInformacion) {
		this.mayorInformacion = mayorInformacion;
	}

	public Boolean getReferenteSiNo() {
		return referenteSiNo;
	}

	public void setReferenteSiNo(Boolean referenteSiNo) {
		this.referenteSiNo = referenteSiNo;
	}

	public String getReferenteAB() {
		return referenteAB;
	}

	public void setReferenteAB(String referenteAB) {
		this.referenteAB = referenteAB;
	}

	public String getReferenteABCelular() {
		return referenteABCelular;
	}

	public void setReferenteABCelular(String referenteABCelular) {
		this.referenteABCelular = referenteABCelular;
	}

	public String getReferenteABMail() {
		return referenteABMail;
	}

	public void setReferenteABMail(String referenteABMail) {
		this.referenteABMail = referenteABMail;
	}

	public String getDescripcionEscuela() {
		return descripcionEscuela;
	}

	public void setDescripcionEscuela(String descripcionEscuela) {
		this.descripcionEscuela = descripcionEscuela;
	}

	public Boolean getIs2030() {
		return is2030;
	}

	public void setIs2030(Boolean is2030) {
		this.is2030 = is2030;
	}

	public String getOtrosEspacios() {
		return otrosEspacios;
	}

	public void setOtrosEspacios(String otrosEspacios) {
		this.otrosEspacios = otrosEspacios;
	}

	public List<NivelEscuela> getNivelesAtiendeEscuela() {
		return nivelesAtiendeEscuela;
	}

	public void setNivelesAtiendeEscuela(List<NivelEscuela> nivelesAtiendeEscuela) {
		this.nivelesAtiendeEscuela = nivelesAtiendeEscuela;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
