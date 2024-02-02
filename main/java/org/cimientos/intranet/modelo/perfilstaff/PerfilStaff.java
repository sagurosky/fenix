package org.cimientos.intranet.modelo.perfilstaff;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.EstadoCuenta;
import org.cimientos.intranet.modelo.Parametro;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.evento.Evento;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.sucursalBanco.SucursalBanco;

import com.cimientos.intranet.enumerativos.CargaHoraria;
import com.cimientos.intranet.enumerativos.Equipo;
import com.cimientos.intranet.enumerativos.ModalidadContratacion;
import com.cimientos.intranet.enumerativos.TipoDni;


@Entity

public class PerfilStaff implements Serializable{
	
	@Id
	@GeneratedValue
	private Long id;
	
	@OneToOne(cascade=CascadeType.ALL)
	private Persona datosPersonales;
		
	private Long legajo;
	
	private Boolean activo;
	
	private String mailCimientos;
	
	private Date fechaIngreso;

	@Enumerated(EnumType.ORDINAL)
	private ModalidadContratacion modalidadContratacion;

	private float montoIngreso;
	
	private Date fechaBaja;
	
	@Enumerated(EnumType.ORDINAL)
	private CargaHoraria cargaHoraria;
	
	@Enumerated(EnumType.ORDINAL)
	private Equipo equipo;
	
	private String titularCuenta;
	
	private String cuilTitularCuenta;
	
	@ManyToOne
	private Banco banco;
	
	private String nroCuenta;
	
	private long cbu;
	
	@OneToMany (cascade=CascadeType.ALL)
	@JoinColumn(name="idEvento")
	private List<Evento> historial;
	
	private boolean solicitudCuenta;
	
	@ManyToOne
	private SucursalBanco sucursal;
	
	@Enumerated(EnumType.ORDINAL)
	private TipoDni idTipoDni;
	
	private String nacionalidad;
	
	private String calle;
	
	private String nroCalle;
	
	private String piso;
	
	private String codigoPostal;
	
	private String sucursalPago;
	
	private String dpto;

	private Date fechaExportacion;
	
	private String motivoFallidoCuenta;
	
	private String dedicacion;
	
	@Enumerated(EnumType.ORDINAL)
	private EstadoCuenta estadoCuenta;
	
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

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Persona getDatosPersonales() {
		return datosPersonales;
	}
	
	public void setDatosPersonales(Persona datosPersonales) {
		this.datosPersonales = datosPersonales;
	}
	
	public Long getLegajo() {
		return legajo;
	}
	
	public void setLegajo(Long legajo) {
		this.legajo = legajo;
	}
	
	public Boolean isActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	public String getMailCimientos() {
		return mailCimientos;
	}
	
	public ModalidadContratacion getModalidadContratacion() {
		return modalidadContratacion;
	}

	public void setModalidadContratacion(ModalidadContratacion modalidadContratacion) {
		this.modalidadContratacion = modalidadContratacion;
	}

	public void setMailCimientos(String mailCimientos) {
		this.mailCimientos = mailCimientos;
	}
	
	public Date getFechaIngreso() {
		return fechaIngreso;
	}
	
	public void setFechaIngreso(Date fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}
		
	public float getMontoIngreso() {
		return montoIngreso;
	}
	
	public void setMontoIngreso(float montoIngreso) {
		this.montoIngreso = montoIngreso;
	}
	
	public Date getFechaBaja() {
		return fechaBaja;
	}
	
	public void setFechaBaja(Date fechaBaja) {
		this.fechaBaja = fechaBaja;
	}
	
	public CargaHoraria getCargaHoraria() {
		return cargaHoraria;
	}
	
	public void setCargaHoraria(CargaHoraria cargaHoraria) {
		this.cargaHoraria = cargaHoraria;
	}
	
	public Equipo getEquipo() {
		return equipo;
	}
	
	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}
	
	public String getTitularCuenta() {
		return titularCuenta;
	}
	
	public void setTitularCuenta(String titularCuenta) {
		this.titularCuenta = titularCuenta;
	}
	
	public String getCuilTitularCuenta() {
		return cuilTitularCuenta;
	}
	
	public void setCuilTitularCuenta(String cuilTitularCuenta) {
		this.cuilTitularCuenta = cuilTitularCuenta;
	}
	
	public Banco getBanco() {
		return banco;
	}
	
	public void setBanco(Banco banco) {
		this.banco = banco;
	}
	
	public String getNroCuenta() {
		return nroCuenta;
	}
	
	public void setNroCuenta(String nroCuenta) {
		this.nroCuenta = nroCuenta;
	}
	
	public long getCbu() {
		return cbu;
	}
	
	public void setCbu(long cbu) {
		this.cbu = cbu;
	}
	
	public List<Evento> getHistorial() {
		return historial;
	}
	
	public void setHistorial(List<Evento> historial) {
		this.historial = historial;
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
	 * @return the sucursal
	 */
	public SucursalBanco getSucursal() {
		return sucursal;
	}

	/**
	 * @param sucursal the sucursal to set
	 */
	public void setSucursal(SucursalBanco sucursal) {
		this.sucursal = sucursal;
	}

	/**
	 * @return the idTipoDni
	 */
	public TipoDni getIdTipoDni() {
		return idTipoDni;
	}

	/**
	 * @param idTipoDni the idTipoDni to set
	 */
	public void setIdTipoDni(TipoDni idTipoDni) {
		this.idTipoDni = idTipoDni;
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

	public Boolean getActivo() {
		return activo;
	}

	public String getDedicacion() {
		return dedicacion;
	}

	public void setDedicacion(String dedicacion) {
		this.dedicacion = dedicacion;
	}
	
	
}