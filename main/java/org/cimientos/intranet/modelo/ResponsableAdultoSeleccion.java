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
import org.cimientos.intranet.modelo.sucursalBanco.SucursalBanco;
import org.cimientos.intranet.modelo.ubicacion.Localidad;

import com.cimientos.intranet.enumerativos.EstadoCivil;
import com.cimientos.intranet.enumerativos.TipoAfyp;
import com.cimientos.intranet.enumerativos.TipoDni;
import com.cimientos.intranet.enumerativos.Vinculo;
import com.cimientos.intranet.enumerativos.entrevista.Compromiso;
import com.cimientos.intranet.enumerativos.entrevista.CompromisoPBE;
import com.cimientos.intranet.enumerativos.entrevista.Entrevistador;
import com.cimientos.intranet.enumerativos.entrevista.RelacionVivienda;


/**
 * Esta clase se utilza solo para tener un registro de todos los datos del alumno cargados en la entrevista seleccion
 */
@Entity
public class ResponsableAdultoSeleccion  implements Serializable{
	
	/** The id. */
	@Id
	@GeneratedValue
	private Long id;

	/** The activo. */
	private boolean activo;
	
	/** The nombre. */
	private String nombre;
	
	/** The apellido. */
	private String apellido;
	
	/** The dni. */
	private Integer dni;
	
	/** The fecha nacimiento. */
	private Date fechaNacimiento;
	
	/** The sexo. */
	private boolean sexo;
	
	private Boolean noAsisteEntrevista;

	/** The banco. */
	@OneToOne
	private Banco banco;
	
	/** The sucursal. */
	@OneToOne
	private SucursalBanco sucursal;
	
	/** The id localidad. */
	@OneToOne (cascade = {CascadeType.PERSIST})
	private Localidad idLocalidad;
		
	/** The id tipo dni. */
	@Enumerated(EnumType.ORDINAL)
	private TipoDni idTipoDni;
	
	/** The id estado civil. */
	@Enumerated(EnumType.ORDINAL)
	private EstadoCivil idEstadoCivil;
	
	/** The id tipo afyp. */
	@Enumerated(EnumType.ORDINAL)
	private TipoAfyp idTipoAfyp;
	
	/** The id vinculo. */
	@Enumerated(EnumType.ORDINAL)
	private Vinculo idVinculo;
	
	/** The id relacion vivienda. */
	@Enumerated(EnumType.ORDINAL)
	private RelacionVivienda idRelacionVivienda;
	
	/** The id compromiso. */
	@Enumerated(EnumType.ORDINAL)
	private Compromiso idCompromiso;
	
	/** The id compromiso pbe. */
	@Enumerated(EnumType.ORDINAL)
	private CompromisoPBE idCompromisoPBE;
	
	/** The id apto como ra. */
	@Enumerated(EnumType.ORDINAL)
	private CompromisoPBE idAptoComoRA;
	
	/** The id entrevistador. */
	//@Enumerated(EnumType.ORDINAL)
	//private Entrevistador idEntrevistador;

	private String idEntrevistador;
	
	/** The cuil cuit. */
	private String cuilCuit;
	
	/** The direccion. */
	private String direccion;
	
	/** The telefono. */
	private String telefono;
	
	/** The telefono1. */
	private String telefono1;
	
	/** The telefono2. */
	private String telefono2;
	
	/** The celular. */
	private String celular;
	
	/** The mail. */
	private String mail;
	
	/** The observaciones. */
	@Column(length = 5000)
	private String observaciones;

	/** The nro cuenta. */
	private String nroCuenta;
	
	/** The ingresos. */
	private Integer ingresos;
	
	/** The contacto telefono1. */
	private String contactoTelefono1;	
	
	/** The contacto telefono2. */
	private String contactoTelefono2;
	
	/** The entre calles. */
	private String entreCalles;
	
	/** The egresos totales. */
	private String egresosTotales;
	
	/** The informacion complementaria. */
	@Column(length=1000)
	private String informacionComplementaria;
	
	/** The percepciones sobre ra. */
	@Column(length=1000)
	private String percepcionesSobreRA;
	
	/** The observaciones para ts. */
	@Column(length=1000)
	private String observacionesParaTS;
	
	
	/** The nacionalidad. */
	private String nacionalidad;
	
	/** The calle. */
	private String calle;
	
	/** The nro calle. */
	private String nroCalle;
	
	/** The piso. */
	private String piso;
	
	/** The codigo postal. */
	private String codigoPostal;
	

	
	/** The dpto. */
	private String dpto;
	
	/** The sucursal banco. */
	@OneToOne(cascade = CascadeType.PERSIST)
	private SucursalBanco sucursalBanco;
	

	
	
//	public ResponsableAdultoSeleccion(ResponsableAdulto responsable1) {
//		// TODO Auto-generated constructor stub
//	}
	public ResponsableAdultoSeleccion(){};
	public ResponsableAdultoSeleccion(ResponsableAdulto r) {
		if(r != null ){
			this.id = r.getId();
			this.activo = r.isActivo();
			this.nombre = r.getNombre();
			this.apellido = r.getApellido();
			this.dni = r.getDni();
			this.fechaNacimiento = r.getFechaNacimiento();
			this.sexo = r.getSexo();
			this.noAsisteEntrevista = r.getNoAsisteEntrevista();
			this.banco = r.getBanco();
			this.sucursal = r.getSucursalBanco();
			this.idLocalidad = r.getIdLocalidad();
			this.idTipoDni = r.getIdTipoDni();
			this.idEstadoCivil = r.getIdEstadoCivil();
			this.idTipoAfyp = r.getIdTipoAfyp();
			this.idVinculo = r.getIdVinculo();
			this.idRelacionVivienda = r.getIdRelacionVivienda();
			this.idCompromiso = r.getIdCompromiso();
			this.idCompromisoPBE = r.getIdAptoComoRA();
			this.idAptoComoRA = r.getIdAptoComoRA();
			this.idEntrevistador = r.getIdEntrevistador();			
			this.cuilCuit = r.getCuilCuit();
			this.direccion = r.getDireccion();
			this.telefono = r.getTelefono();
			this.telefono1 = r.getTelefono1();
			this.telefono2 = r.getTelefono2();
			this.celular = r.getCelular();
			this.mail = r.getMail();
			this.observaciones = r.getObservaciones();
			this.nroCuenta = r.getNroCuenta();
			this.ingresos = r.getIngresos();
			this.contactoTelefono1 = r.getContactoTelefono1();
			this.contactoTelefono2 = r.getContactoTelefono2();
			this.entreCalles = r.getEntreCalles();
			this.egresosTotales = r.getEgresosTotales();
			this.informacionComplementaria = r.getInformacionComplementaria();
			this.percepcionesSobreRA = r.getPercepcionesSobreRA();
			this.observacionesParaTS = r.getObservacionesParaTS();
			this.nacionalidad = r.getNacionalidad();
			this.calle = r.getCalle();
			this.nroCalle = r.getNroCalle();
			this.piso = r.getPiso();
			this.codigoPostal = r.getCodigoPostal();
			this.dpto = r.getDpto();
			this.sucursalBanco = r.getSucursalBanco();
			
		}
	}

	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Long getId() {
		return id;
	}


	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setId(Long id) {
		this.id = id;
	}


	/**
	 * Gets the id estado civil.
	 *
	 * @return the id estado civil
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public EstadoCivil getIdEstadoCivil() {
		return idEstadoCivil;
	}

	/**
	 * Sets the id estado civil.
	 *
	 * @param idEstadoCivil the new id estado civil
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setIdEstadoCivil(EstadoCivil idEstadoCivil) {
		this.idEstadoCivil = idEstadoCivil;
	}

	/**
	 * Gets the banco.
	 *
	 * @return the banco
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Banco getBanco() {
		return banco;
	}

	/**
	 * Sets the banco.
	 *
	 * @param banco the new banco
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setBanco(Banco banco) {
		this.banco = banco;
	}
	
	/**
	 * Checks if is activo.
	 *
	 * @return true, if is activo
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public boolean isActivo() {
		return activo;
	}

	/**
	 * Sets the activo.
	 *
	 * @param activo the new activo
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	/**
	 * Gets the sucursal.
	 *
	 * @return the sucursal
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public SucursalBanco getSucursal() {
		return sucursal;
	}

	/**
	 * Sets the sucursal.
	 *
	 * @param sucursal the new sucursal
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setSucursal(SucursalBanco sucursal) {
		this.sucursal = sucursal;
	}

	/**
	 * Gets the nombre.
	 *
	 * @return the nombre
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * Sets the nombre.
	 *
	 * @param nombre the new nombre
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * Gets the apellido.
	 *
	 * @return the apellido
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getApellido() {
		return apellido;
	}

	/**
	 * Sets the apellido.
	 *
	 * @param apellido the new apellido
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	/**
	 * Gets the dni.
	 *
	 * @return the dni
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Integer getDni() {
		return dni;
	}

	/**
	 * Sets the dni.
	 *
	 * @param dni the new dni
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setDni(Integer dni) {
		this.dni = dni;
	}

	/**
	 * Gets the fecha nacimiento.
	 *
	 * @return the fecha nacimiento
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	/**
	 * Sets the fecha nacimiento.
	 *
	 * @param fechaNacimiento the new fecha nacimiento
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	

	/**
	 * Gets the id tipo dni.
	 *
	 * @return the id tipo dni
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public TipoDni getIdTipoDni() {
		return idTipoDni;
	}

	/**
	 * Sets the id tipo dni.
	 *
	 * @param idTipoDni the new id tipo dni
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setIdTipoDni(TipoDni idTipoDni) {
		this.idTipoDni = idTipoDni;
	}

	/**
	 * Gets the id tipo afyp.
	 *
	 * @return the id tipo afyp
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public TipoAfyp getIdTipoAfyp() {
		return idTipoAfyp;
	}

	/**
	 * Sets the id tipo afyp.
	 *
	 * @param idTipoAfyp the new id tipo afyp
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setIdTipoAfyp(TipoAfyp idTipoAfyp) {
		this.idTipoAfyp = idTipoAfyp;
	}

	/**
	 * Gets the id vinculo.
	 *
	 * @return the id vinculo
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Vinculo getIdVinculo() {
		return idVinculo;
	}

	/**
	 * Sets the id vinculo.
	 *
	 * @param idVinculo the new id vinculo
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setIdVinculo(Vinculo idVinculo) {
		this.idVinculo = idVinculo;
	}

	/**
	 * Gets the sexo.
	 *
	 * @return the sexo
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public boolean getSexo() {
		return sexo;
	}

	/**
	 * Sets the sexo.
	 *
	 * @param sexo the new sexo
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setSexo(boolean sexo) {
		this.sexo = sexo;
	}

	

	/**
	 * Gets the direccion.
	 *
	 * @return the direccion
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getDireccion() {
		return direccion;
	}

	/**
	 * Sets the direccion.
	 *
	 * @param direccion the new direccion
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	/**
	 * Gets the telefono1.
	 *
	 * @return the telefono1
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getTelefono1() {
		return telefono1;
	}

	/**
	 * Sets the telefono1.
	 *
	 * @param telefono1 the new telefono1
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setTelefono1(String telefono1) {
		this.telefono1 = telefono1;
	}

	/**
	 * Gets the telefono2.
	 *
	 * @return the telefono2
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getTelefono2() {
		return telefono2;
	}

	/**
	 * Sets the telefono2.
	 *
	 * @param telefono2 the new telefono2
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setTelefono2(String telefono2) {
		this.telefono2 = telefono2;
	}

	/**
	 * Gets the celular.
	 *
	 * @return the celular
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getCelular() {
		return celular;
	}

	/**
	 * Sets the celular.
	 *
	 * @param celular the new celular
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setCelular(String celular) {
		this.celular = celular;
	}

	/**
	 * Gets the mail.
	 *
	 * @return the mail
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getMail() {
		return mail;
	}

	/**
	 * Sets the mail.
	 *
	 * @param mail the new mail
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setMail(String mail) {
		this.mail = mail;
	}

	/**
	 * Gets the observaciones.
	 *
	 * @return the observaciones
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getObservaciones() {
		return observaciones;
	}

	/**
	 * Sets the observaciones.
	 *
	 * @param observaciones the new observaciones
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	/**
	 * Gets the nro cuenta.
	 *
	 * @return the nro cuenta
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getNroCuenta() {
		return nroCuenta;
	}

	/**
	 * Sets the nro cuenta.
	 *
	 * @param nroCuenta the new nro cuenta
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setNroCuenta(String nroCuenta) {
		this.nroCuenta = nroCuenta;
	}

	/**
	 * Gets the ingresos.
	 *
	 * @return the ingresos
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Integer getIngresos() {
		return ingresos;
	}

	/**
	 * Sets the ingresos.
	 *
	 * @param ingresos the new ingresos
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setIngresos(Integer ingresos) {
		this.ingresos = ingresos;
	}

	/**
	 * Gets the id localidad.
	 *
	 * @return the id localidad
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Localidad getIdLocalidad() {
		return idLocalidad;
	}

	/**
	 * Sets the id localidad.
	 *
	 * @param idLocalidad the new id localidad
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setIdLocalidad(Localidad idLocalidad) {
		this.idLocalidad = idLocalidad;
	}


	/**
	 * Gets the id relacion vivienda.
	 *
	 * @return the idRelacionVivienda
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public RelacionVivienda getIdRelacionVivienda() {
		return idRelacionVivienda;
	}

	/**
	 * Sets the id relacion vivienda.
	 *
	 * @param idRelacionVivienda the idRelacionVivienda to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setIdRelacionVivienda(RelacionVivienda idRelacionVivienda) {
		this.idRelacionVivienda = idRelacionVivienda;
	}

	/**
	 * Gets the id compromiso.
	 *
	 * @return the idCompromiso
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Compromiso getIdCompromiso() {
		return idCompromiso;
	}

	/**
	 * Sets the id compromiso.
	 *
	 * @param idCompromiso the idCompromiso to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setIdCompromiso(Compromiso idCompromiso) {
		this.idCompromiso = idCompromiso;
	}

	/**
	 * Gets the id compromiso pbe.
	 *
	 * @return the idCompromisoPBE
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public CompromisoPBE getIdCompromisoPBE() {
		return idCompromisoPBE;
	}

	/**
	 * Sets the id compromiso pbe.
	 *
	 * @param idCompromisoPBE the idCompromisoPBE to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setIdCompromisoPBE(CompromisoPBE idCompromisoPBE) {
		this.idCompromisoPBE = idCompromisoPBE;
	}

	/**
	 * Gets the id apto como ra.
	 *
	 * @return the idAptoComoRA
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public CompromisoPBE getIdAptoComoRA() {
		return idAptoComoRA;
	}

	/**
	 * Sets the id apto como ra.
	 *
	 * @param idAptoComoRA the idAptoComoRA to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setIdAptoComoRA(CompromisoPBE idAptoComoRA) {
		this.idAptoComoRA = idAptoComoRA;
	}

	/**
	 * Gets the id entrevistador.
	 *
	 * @return the idEntrevistador
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getIdEntrevistador() {
		return idEntrevistador;
	}

	/**
	 * Sets the id entrevistador.
	 *
	 * @param idEntrevistador the idEntrevistador to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setIdEntrevistador(String idEntrevistador) {
		this.idEntrevistador = idEntrevistador;
	}

	/**
	 * Gets the cuil cuit.
	 *
	 * @return the cuilCuit
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getCuilCuit() {
		return cuilCuit;
	}

	/**
	 * Sets the cuil cuit.
	 *
	 * @param cuilCuit the cuilCuit to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setCuilCuit(String cuilCuit) {
		this.cuilCuit = cuilCuit;
	}

	/**
	 * Gets the contacto telefono1.
	 *
	 * @return the contactoTelefono1
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getContactoTelefono1() {
		return contactoTelefono1;
	}

	/**
	 * Sets the contacto telefono1.
	 *
	 * @param contactoTelefono1 the contactoTelefono1 to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setContactoTelefono1(String contactoTelefono1) {
		this.contactoTelefono1 = contactoTelefono1;
	}

	/**
	 * Gets the contacto telefono2.
	 *
	 * @return the contactoTelefono2
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getContactoTelefono2() {
		return contactoTelefono2;
	}

	/**
	 * Sets the contacto telefono2.
	 *
	 * @param contactoTelefono2 the contactoTelefono2 to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setContactoTelefono2(String contactoTelefono2) {
		this.contactoTelefono2 = contactoTelefono2;
	}

	/**
	 * Gets the entre calles.
	 *
	 * @return the entreCalles
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getEntreCalles() {
		return entreCalles;
	}

	/**
	 * Sets the entre calles.
	 *
	 * @param entreCalles the entreCalles to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setEntreCalles(String entreCalles) {
		this.entreCalles = entreCalles;
	}

	/**
	 * Gets the egresos totales.
	 *
	 * @return the egresosTotales
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getEgresosTotales() {
		return egresosTotales;
	}

	/**
	 * Sets the egresos totales.
	 *
	 * @param egresosTotales the egresosTotales to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setEgresosTotales(String egresosTotales) {
		this.egresosTotales = egresosTotales;
	}

	/**
	 * Gets the informacion complementaria.
	 *
	 * @return the informacionComplementaria
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getInformacionComplementaria() {
		return informacionComplementaria;
	}

	/**
	 * Sets the informacion complementaria.
	 *
	 * @param informacionComplementaria the informacionComplementaria to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setInformacionComplementaria(String informacionComplementaria) {
		this.informacionComplementaria = informacionComplementaria;
	}

	/**
	 * Gets the percepciones sobre ra.
	 *
	 * @return the percepcionesSobreRA
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getPercepcionesSobreRA() {
		return percepcionesSobreRA;
	}

	/**
	 * Sets the percepciones sobre ra.
	 *
	 * @param percepcionesSobreRA the percepcionesSobreRA to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setPercepcionesSobreRA(String percepcionesSobreRA) {
		this.percepcionesSobreRA = percepcionesSobreRA;
	}

	/**
	 * Gets the observaciones para ts.
	 *
	 * @return the observacionesParaTS
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getObservacionesParaTS() {
		return observacionesParaTS;
	}

	/**
	 * Sets the observaciones para ts.
	 *
	 * @param observacionesParaTS the observacionesParaTS to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setObservacionesParaTS(String observacionesParaTS) {
		this.observacionesParaTS = observacionesParaTS;
	}

	
	/**
	 * Gets the nacionalidad.
	 *
	 * @return the nacionalidad
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getNacionalidad() {
		return nacionalidad;
	}

	/**
	 * Sets the nacionalidad.
	 *
	 * @param nacionalidad the nacionalidad to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}

	/**
	 * Gets the calle.
	 *
	 * @return the calle
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getCalle() {
		return calle;
	}

	/**
	 * Sets the calle.
	 *
	 * @param calle the calle to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setCalle(String calle) {
		this.calle = calle;
	}

	/**
	 * Gets the nro calle.
	 *
	 * @return the nroCalle
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getNroCalle() {
		return nroCalle;
	}

	/**
	 * Sets the nro calle.
	 *
	 * @param nroCalle the nroCalle to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setNroCalle(String nroCalle) {
		this.nroCalle = nroCalle;
	}

	/**
	 * Gets the piso.
	 *
	 * @return the piso
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getPiso() {
		return piso;
	}

	/**
	 * Sets the piso.
	 *
	 * @param piso the piso to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setPiso(String piso) {
		this.piso = piso;
	}

	/**
	 * Gets the codigo postal.
	 *
	 * @return the codigoPostal
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getCodigoPostal() {
		return codigoPostal;
	}

	/**
	 * Sets the codigo postal.
	 *
	 * @param codigoPostal the codigoPostal to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	


	/**
	 * Gets the dpto.
	 *
	 * @return the dpto
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public String getDpto() {
		return dpto;
	}

	/**
	 * Sets the dpto.
	 *
	 * @param dpto the dpto to set
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setDpto(String dpto) {
		this.dpto = dpto;
	}

	/**
	 * Gets the sucursal banco.
	 *
	 * @return the sucursal banco
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public SucursalBanco getSucursalBanco() {
		return sucursalBanco;
	}

	/**
	 * Sets the sucursal banco.
	 *
	 * @param sucursalBanco the new sucursal banco
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setSucursalBanco(SucursalBanco sucursalBanco) {
		this.sucursalBanco = sucursalBanco;
	}

	public Boolean getNoAsisteEntrevista() {
		return noAsisteEntrevista;
	}

	public void setNoAsisteEntrevista(Boolean noAsisteEntrevista) {
		this.noAsisteEntrevista = noAsisteEntrevista;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	
}
