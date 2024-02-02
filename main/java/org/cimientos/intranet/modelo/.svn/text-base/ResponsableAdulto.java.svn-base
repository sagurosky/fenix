package org.cimientos.intranet.modelo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.sucursalBanco.SucursalBanco;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.hibernate.annotations.Where;

import com.cimientos.intranet.enumerativos.EstadoCivil;
import com.cimientos.intranet.enumerativos.TipoAfyp;
import com.cimientos.intranet.enumerativos.TipoDni;
import com.cimientos.intranet.enumerativos.Vinculo;
import com.cimientos.intranet.enumerativos.entrevista.Compromiso;
import com.cimientos.intranet.enumerativos.entrevista.CompromisoPBE;
import com.cimientos.intranet.enumerativos.entrevista.Entrevistador;
import com.cimientos.intranet.enumerativos.entrevista.RelacionVivienda;

/**
 * Responsable
 * @author msagarduy
 *
 */
@Entity
@Where(clause = "activo = 1")
public  class ResponsableAdulto implements Serializable{
	
	@Id
	@GeneratedValue
	private Long id;

	private boolean activo;
	
	private String nombre;
	
	private String apellido;
	
	private Integer dni;
	
	private Date fechaNacimiento;
	
	private boolean sexo;
	
	private Boolean noAsisteEntrevista;
		
	@OneToOne
	private Banco banco;
	
	@OneToOne(cascade = {CascadeType.PERSIST})
	private PerfilAlumno idAlumno;
	
	
	@OneToOne (cascade = {CascadeType.PERSIST})
	private Localidad idLocalidad;
		
	@Enumerated(EnumType.ORDINAL)
	private TipoDni idTipoDni;
	
	@Enumerated(EnumType.ORDINAL)
	private EstadoCivil idEstadoCivil;
	
	@Enumerated(EnumType.ORDINAL)
	private TipoAfyp idTipoAfyp;
	
	@Enumerated(EnumType.ORDINAL)
	private Vinculo idVinculo;
	
	@Enumerated(EnumType.ORDINAL)
	private RelacionVivienda idRelacionVivienda;
	
	@Enumerated(EnumType.ORDINAL)
	private Compromiso idCompromiso;
	
	@Enumerated(EnumType.ORDINAL)
	private CompromisoPBE idCompromisoPBE;
	
	@Enumerated(EnumType.ORDINAL)
	private CompromisoPBE idAptoComoRA;
	
	//@Enumerated(EnumType.ORDINAL)
	//private Entrevistador idEntrevistador;

	private String idEntrevistador;
	
	private String cuilCuit;
	
	private String direccion;
	
	private String telefono;
	
	private String telefono1;
	
	private String telefono2;
	
	private String celular;
	
	private String mail;
	
	private String observaciones;

	private String nroCuenta;
	
	private Integer ingresos;
	
	private String contactoTelefono1;	
	
	private String contactoTelefono2;
	
	private String entreCalles;
	
	private String egresosTotales;
	@Column(length=1000)
	private String informacionComplementaria;
	@Column(length=1000)
	private String percepcionesSobreRA;
	@Column(length=1000)
	private String observacionesParaTS;
	
	private boolean solicitudCuenta;
	
	private String nacionalidad;
	
	private String calle;
	
	private String nroCalle;
	
	private String piso;
	
	private String codigoPostal;
	
	private String sucursalPago;
	
	private Long legajo;
	
	private String dpto;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	private SucursalBanco sucursalBanco;
	private Date fechaExportacion;
	
	@Enumerated(EnumType.ORDINAL)
	private EstadoCuenta estadoCuenta;
	
	private String motivoFallidoCuenta;
	
	//Esta fecha se setea cuando se inactiva una cuenta de un RA
	private Date fechaInactivo;
	
	/**
	 * Constructor creado para hibernate
	 *
	 * @since 14-feb-2011
	 * @author cfigueroa
	 */
	public ResponsableAdulto (){};
	/**
	 * Constructo creado para copiar los datos de {@link ResponsableAdultoSeleccion} en {@link ResponsableAdulto}
	 *   
	 *
	 * @param alumnoSeleccion the alumno seleccion
	 * @since 14-feb-2011
	 * @author cfigueroa
	 */
	public ResponsableAdulto( ResponsableAdultoSeleccion responsableAdulto){
		this.activo = responsableAdulto.isActivo();
		this.apellido = responsableAdulto.getApellido();
		this.banco = responsableAdulto.getBanco();
		this.calle = responsableAdulto.getCalle();
		this.celular = responsableAdulto.getCelular();
		this.codigoPostal = responsableAdulto.getCodigoPostal();
		this.contactoTelefono1 = responsableAdulto.getContactoTelefono1();
		this.contactoTelefono2 = responsableAdulto.getContactoTelefono2();
		this.cuilCuit = responsableAdulto.getCuilCuit();
		this.direccion = responsableAdulto.getDireccion();
		this.idLocalidad = responsableAdulto.getIdLocalidad();
		this.idTipoDni = responsableAdulto.getIdTipoDni();
		this.noAsisteEntrevista = responsableAdulto.getNoAsisteEntrevista();
		this.dni = responsableAdulto.getDni();
		this.dpto = responsableAdulto.getDpto();
		this.egresosTotales = responsableAdulto.getEgresosTotales();
		this.entreCalles = responsableAdulto.getEntreCalles();
		this.fechaNacimiento = responsableAdulto.getFechaNacimiento();
		this.idAptoComoRA = responsableAdulto.getIdAptoComoRA();
		this.idEstadoCivil = responsableAdulto.getIdEstadoCivil();
		this.idVinculo = responsableAdulto.getIdVinculo();
		this.informacionComplementaria = responsableAdulto.getInformacionComplementaria();
		this.nacionalidad = responsableAdulto.getNacionalidad();
		this.nombre = responsableAdulto.getNombre();
		this.nroCalle = responsableAdulto.getNroCalle();
		this.telefono = responsableAdulto.getTelefono();
		this.telefono1 = responsableAdulto.getTelefono1();
		this.telefono2 = responsableAdulto.getTelefono2();
		this.observaciones = responsableAdulto.getObservaciones();
		this.observacionesParaTS = responsableAdulto.getObservacionesParaTS();
		this.piso = responsableAdulto.getPiso();
		this.sexo = responsableAdulto.getSexo();
		this.sucursalBanco = responsableAdulto.getSucursalBanco();
		this.percepcionesSobreRA = responsableAdulto.getPercepcionesSobreRA();
		this.idAptoComoRA = responsableAdulto.getIdAptoComoRA();
		this.idCompromiso = responsableAdulto.getIdCompromiso();
		this.idCompromisoPBE = responsableAdulto.getIdCompromisoPBE();
		this.idRelacionVivienda = responsableAdulto.getIdRelacionVivienda();
		this.estadoCuenta = null;
		this.idEntrevistador=responsableAdulto.getIdEntrevistador();
		
	}
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}


	public EstadoCivil getIdEstadoCivil() {
		return idEstadoCivil;
	}

	public void setIdEstadoCivil(EstadoCivil idEstadoCivil) {
		this.idEstadoCivil = idEstadoCivil;
	}

	public Banco getBanco() {
		return banco;
	}

	public void setBanco(Banco banco) {
		this.banco = banco;
	}
	
	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public Integer getDni() {
		return dni;
	}

	public void setDni(Integer dni) {
		this.dni = dni;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public PerfilAlumno getIdAlumno() {
		return idAlumno;
	}

	public void setIdAlumno(PerfilAlumno idAlumno) {
		this.idAlumno = idAlumno;
	}


	public TipoDni getIdTipoDni() {
		return idTipoDni;
	}

	public void setIdTipoDni(TipoDni idTipoDni) {
		this.idTipoDni = idTipoDni;
	}

	public TipoAfyp getIdTipoAfyp() {
		return idTipoAfyp;
	}

	public void setIdTipoAfyp(TipoAfyp idTipoAfyp) {
		this.idTipoAfyp = idTipoAfyp;
	}

	public Vinculo getIdVinculo() {
		return idVinculo;
	}

	public void setIdVinculo(Vinculo idVinculo) {
		this.idVinculo = idVinculo;
	}

	public boolean getSexo() {
		return sexo;
	}

	public void setSexo(boolean sexo) {
		this.sexo = sexo;
	}

	

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono1() {
		return telefono1;
	}

	public void setTelefono1(String telefono1) {
		this.telefono1 = telefono1;
	}

	public String getTelefono() {
		return telefono;
	}
	
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	public String getTelefono2() {
		return telefono2;
	}

	public void setTelefono2(String telefono2) {
		this.telefono2 = telefono2;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getNroCuenta() {
		return nroCuenta;
	}

	public void setNroCuenta(String nroCuenta) {
		this.nroCuenta = nroCuenta;
	}

	public Integer getIngresos() {
		return ingresos;
	}

	public void setIngresos(Integer ingresos) {
		this.ingresos = ingresos;
	}

	public Localidad getIdLocalidad() {
		return idLocalidad;
	}

	public void setIdLocalidad(Localidad idLocalidad) {
		this.idLocalidad = idLocalidad;
	}


	/**
	 * @return the idRelacionVivienda
	 */
	public RelacionVivienda getIdRelacionVivienda() {
		return idRelacionVivienda;
	}

	/**
	 * @param idRelacionVivienda the idRelacionVivienda to set
	 */
	public void setIdRelacionVivienda(RelacionVivienda idRelacionVivienda) {
		this.idRelacionVivienda = idRelacionVivienda;
	}

	/**
	 * @return the idCompromiso
	 */
	public Compromiso getIdCompromiso() {
		return idCompromiso;
	}

	/**
	 * @param idCompromiso the idCompromiso to set
	 */
	public void setIdCompromiso(Compromiso idCompromiso) {
		this.idCompromiso = idCompromiso;
	}

	/**
	 * @return the idCompromisoPBE
	 */
	public CompromisoPBE getIdCompromisoPBE() {
		return idCompromisoPBE;
	}

	/**
	 * @param idCompromisoPBE the idCompromisoPBE to set
	 */
	public void setIdCompromisoPBE(CompromisoPBE idCompromisoPBE) {
		this.idCompromisoPBE = idCompromisoPBE;
	}

	/**
	 * @return the idAptoComoRA
	 */
	public CompromisoPBE getIdAptoComoRA() {
		return idAptoComoRA;
	}

	/**
	 * @param idAptoComoRA the idAptoComoRA to set
	 */
	public void setIdAptoComoRA(CompromisoPBE idAptoComoRA) {
		this.idAptoComoRA = idAptoComoRA;
	}

	/**
	 * @return the idEntrevistador
	 */
	public String getIdEntrevistador() {
		return idEntrevistador;
	}

	/**
	 * @param idEntrevistador the idEntrevistador to set
	 */
	public void setIdEntrevistador(String idEntrevistador) {
		this.idEntrevistador = idEntrevistador;
	}

	/**
	 * @return the cuilCuit
	 */
	public String getCuilCuit() {
		return cuilCuit;
	}

	/**
	 * @param cuilCuit the cuilCuit to set
	 */
	public void setCuilCuit(String cuilCuit) {
		this.cuilCuit = cuilCuit;
	}

	/**
	 * @return the contactoTelefono1
	 */
	public String getContactoTelefono1() {
		return contactoTelefono1;
	}

	/**
	 * @param contactoTelefono1 the contactoTelefono1 to set
	 */
	public void setContactoTelefono1(String contactoTelefono1) {
		this.contactoTelefono1 = contactoTelefono1;
	}

	/**
	 * @return the contactoTelefono2
	 */
	public String getContactoTelefono2() {
		return contactoTelefono2;
	}

	/**
	 * @param contactoTelefono2 the contactoTelefono2 to set
	 */
	public void setContactoTelefono2(String contactoTelefono2) {
		this.contactoTelefono2 = contactoTelefono2;
	}

	/**
	 * @return the entreCalles
	 */
	public String getEntreCalles() {
		return entreCalles;
	}

	/**
	 * @param entreCalles the entreCalles to set
	 */
	public void setEntreCalles(String entreCalles) {
		this.entreCalles = entreCalles;
	}

	/**
	 * @return the egresosTotales
	 */
	public String getEgresosTotales() {
		return egresosTotales;
	}

	/**
	 * @param egresosTotales the egresosTotales to set
	 */
	public void setEgresosTotales(String egresosTotales) {
		this.egresosTotales = egresosTotales;
	}

	/**
	 * @return the informacionComplementaria
	 */
	public String getInformacionComplementaria() {
		return informacionComplementaria;
	}

	/**
	 * @param informacionComplementaria the informacionComplementaria to set
	 */
	public void setInformacionComplementaria(String informacionComplementaria) {
		this.informacionComplementaria = informacionComplementaria;
	}

	/**
	 * @return the percepcionesSobreRA
	 */
	public String getPercepcionesSobreRA() {
		return percepcionesSobreRA;
	}

	/**
	 * @param percepcionesSobreRA the percepcionesSobreRA to set
	 */
	public void setPercepcionesSobreRA(String percepcionesSobreRA) {
		this.percepcionesSobreRA = percepcionesSobreRA;
	}

	/**
	 * @return the observacionesParaTS
	 */
	public String getObservacionesParaTS() {
		return observacionesParaTS;
	}

	/**
	 * @param observacionesParaTS the observacionesParaTS to set
	 */
	public void setObservacionesParaTS(String observacionesParaTS) {
		this.observacionesParaTS = observacionesParaTS;
	}

	/**
	 * @return the solicitudCuenta
	 */
	public boolean isSolicitudCuenta() {
		return solicitudCuenta;
	}

	/**
	 * @param solicitudCuenta the solicitudCuenta to set
	 */
	public void setSolicitudCuenta(boolean solicitudCuenta) {
		this.solicitudCuenta = solicitudCuenta;
	}

	/**
	 * @return the nacionalidad
	 */
	public String getNacionalidad() {
		return nacionalidad;
	}

	/**
	 * @param nacionalidad the nacionalidad to set
	 */
	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}

	/**
	 * @return the calle
	 */
	public String getCalle() {
		return calle;
	}

	/**
	 * @param calle the calle to set
	 */
	public void setCalle(String calle) {
		this.calle = calle;
	}

	/**
	 * @return the nroCalle
	 */
	public String getNroCalle() {
		return nroCalle;
	}

	/**
	 * @param nroCalle the nroCalle to set
	 */
	public void setNroCalle(String nroCalle) {
		this.nroCalle = nroCalle;
	}

	/**
	 * @return the piso
	 */
	public String getPiso() {
		return piso;
	}

	/**
	 * @param piso the piso to set
	 */
	public void setPiso(String piso) {
		this.piso = piso;
	}

	/**
	 * @return the codigoPostal
	 */
	public String getCodigoPostal() {
		return codigoPostal;
	}

	/**
	 * @param codigoPostal the codigoPostal to set
	 */
	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	/**
	 * @return the sucursalPago
	 */
	public String getSucursalPago() {
		return sucursalPago;
	}

	/**
	 * @param sucursalPago the sucursalPago to set
	 */
	public void setSucursalPago(String sucursalPago) {
		this.sucursalPago = sucursalPago;
	}

	/**
	 * @return the legajo
	 */
	public Long getLegajo() {
		return legajo;
	}

	/**
	 * @param legajo the legajo to set
	 */
	public void setLegajo(Long legajo) {
		this.legajo = legajo;
	}

	/**
	 * @return the dpto
	 */
	public String getDpto() {
		return dpto;
	}

	/**
	 * @param dpto the dpto to set
	 */
	public void setDpto(String dpto) {
		this.dpto = dpto;
	}

	public SucursalBanco getSucursalBanco() {
		return sucursalBanco;
	}

	public void setSucursalBanco(SucursalBanco sucursalBanco) {
		this.sucursalBanco = sucursalBanco;
	}

	/**
	 * @return the fechaExportacion
	 */
	public Date getFechaExportacion() {
		return fechaExportacion;
	}

	/**
	 * @param fechaExportacion the fechaExportacion to set
	 */
	public void setFechaExportacion(Date fechaExportacion) {
		this.fechaExportacion = fechaExportacion;
	}

	/**
	 * @return the estadoCuenta
	 */
	public EstadoCuenta getEstadoCuenta() {
		return estadoCuenta;
	}

	/**
	 * @param estadoCuenta the estadoCuenta to set
	 */
	public void setEstadoCuenta(EstadoCuenta estadoCuenta) {
		this.estadoCuenta = estadoCuenta;
	}

	/**
	 * @return the motivoFallidoCuenta
	 */
	public String getMotivoFallidoCuenta() {
		return motivoFallidoCuenta;
	}

	/**
	 * @param motivoFallidoCuenta the motivoFallidoCuenta to set
	 */
	public void setMotivoFallidoCuenta(String motivoFallidoCuenta) {
		this.motivoFallidoCuenta = motivoFallidoCuenta;
	}
	
	public Boolean getNoAsisteEntrevista() {
		return noAsisteEntrevista;
	}
	public void setNoAsisteEntrevista(Boolean noAsisteEntrevista) {
		this.noAsisteEntrevista = noAsisteEntrevista;
	}
	public Date getFechaInactivo() {
		return fechaInactivo;
	}
	public void setFechaInactivo(Date fechaInactivo) {
		this.fechaInactivo = fechaInactivo;
	}
	
}
