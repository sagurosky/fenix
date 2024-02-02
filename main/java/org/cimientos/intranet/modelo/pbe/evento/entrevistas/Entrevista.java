package org.cimientos.intranet.modelo.pbe.evento.entrevistas;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;

import com.cimientos.intranet.enumerativos.entrevista.EstadoEntrevista;

@Entity
@Table (name="entrevista")
@Inheritance (strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn (name="tipo", discriminatorType=DiscriminatorType.STRING)
@DiscriminatorValue("entrevista")
public abstract class Entrevista{
	
	/** The id evento. */
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	private Long id;
	
	@Column (name = "tipo", insertable = false, updatable = false)
	private String tipo = null;
	
	@OneToOne
	private PerfilEA ea;
	
	@OneToOne
	private PerfilRR rr;
	
	private Date fechaCarga;
	
	private Date fechaEntrevista;	
	
	@OneToOne //(cascade = CascadeType.ALL)
	private Escuela lugarEntrevista;
	
	private boolean rendicionGastos;
	
	private String estadoFormulario;
	
	@Column(length=10000)
	private String observacionesGenerales;
	
	private String cargadorEntrevista;
	
	private boolean pagaEntrevista;
	
	private String nroCtesPlataformaContable;
	
	private String motivoNoConvocatoria;
	
	
	//2018
	private String tipoEncuentroAcompanamiento;
	
	private String motivoInasistenciaR;
	
	private String inasistenciasPeriodo;
	
	private String propositoAnual;
	
	private String hsTrabajarAño;
	
	private String contenidosTrabajarDuranteAnio;
	
	@Column(length=10000)
	private String observacionesSR;
	
	// 2018
	
	private String cpaEA;
	@Column(length=10000)
	private String ossr;
	@Column(length=10000)
	private String osme;
	@Column(length=10000)
	private String osare;
	
	
	// entrevista julio
	@Column(length=50)
	private String ecabp;
	@Column(length=50)
	private String vcrae;	
	
	private boolean usasteFichero;
	private boolean brujula;
	private boolean tma;
	@Column(length=10000)
	private String qtam;
	
	@Column(length=50)
	private String sarpepe;
	@Column(length=50)
	private String te;	
	@Column(length=10000)
	private String ie;
	private boolean cv;
	
	
	//2019
	private String motivoAusenciaRa2;
	private String masDeUnEncuentro;
	
	
	
	
	
	
	public String getMasDeUnEncuentro() {
		return masDeUnEncuentro;
	}

	public void setMasDeUnEncuentro(String masDeUnEncuentro) {
		this.masDeUnEncuentro = masDeUnEncuentro;
	}

	public String getMotivoAusenciaRa2() {
		return motivoAusenciaRa2;
	}

	public void setMotivoAusenciaRA2(String motivoAusenciaRa2) {
		this.motivoAusenciaRa2 = motivoAusenciaRa2;
	}

	public String getSarpepe() {
		return sarpepe;
	}

	public void setSarpepe(String sarpepe) {
		this.sarpepe = sarpepe;
	}

	public String getTe() {
		return te;
	}

	public void setTe(String te) {
		this.te = te;
	}

	

	public String getIe() {
		return ie;
	}

	public void setIe(String ie) {
		this.ie = ie;
	}

	public boolean isCv() {
		return cv;
	}

	public void setCv(boolean cv) {
		this.cv = cv;
	}

	

	public boolean isUsasteFichero() {
		return usasteFichero;
	}

	public void setUsasteFichero(boolean usasteFichero) {
		this.usasteFichero = usasteFichero;
	}

	public String getQtam() {
		return qtam;
	}

	public void setQtam(String qtam) {
		this.qtam = qtam;
	}

	public String getEcabp() {
		return ecabp;
	}

	public void setEcabp(String ecabp) {
		this.ecabp = ecabp;
	}

	public String getVcrae() {
		return vcrae;
	}

	public void setVcrae(String vcrae) {
		this.vcrae = vcrae;
	}

	

	public String getOssr() {
		return ossr;
	}

	public void setOssr(String ossr) {
		this.ossr = ossr;
	}

	public String getOsme() {
		return osme;
	}

	public void setOsme(String osme) {
		this.osme = osme;
	}

	public String getOsare() {
		return osare;
	}

	public void setOsare(String osare) {
		this.osare = osare;
	}

	public String getCpaEA() {
		return cpaEA;
	}

	public void setCpaEA(String cpaEA) {
		this.cpaEA = cpaEA;
	}

	public String getMotivoNoConvocatoria() {
		return motivoNoConvocatoria;
	}

	public void setMotivoNoConvocatoria(String motivoNoConvocatoria) {
		this.motivoNoConvocatoria = motivoNoConvocatoria;
	}

	@Enumerated(EnumType.ORDINAL)
	private EstadoEntrevista estadoEntrevista;

	@OneToOne(cascade=CascadeType.ALL)
	private ExportacionEspecial exportacionEspecial;
	
	public EstadoEntrevista getEstadoEntrevista() {
		return estadoEntrevista;
	}

	public void setEstadoEntrevista(EstadoEntrevista estadoEntrevista) {
		this.estadoEntrevista = estadoEntrevista;
	}

	public Date getFechaCarga() {
		return fechaCarga;
	}

	public void setFechaCarga(Date fechaCarga) {
		this.fechaCarga = fechaCarga;
	}

	public Date getFechaEntrevista() {
		return fechaEntrevista;
	}

	public void setFechaEntrevista(Date fechaEntrevista) {
		this.fechaEntrevista = fechaEntrevista;
	}


	public Escuela getLugarEntrevista() {
		return lugarEntrevista;
	}

	public void setLugarEntrevista(Escuela lugarEntrevista) {
		this.lugarEntrevista = lugarEntrevista;
	}



	public boolean isRendicionGastos() {
		return rendicionGastos;
	}

	public void setRendicionGastos(boolean rendicionGastos) {
		this.rendicionGastos = rendicionGastos;
	}


	public String getEstadoFormulario() {
		return estadoFormulario;
	}

	public void setEstadoFormulario(String estadoFormulario) {
		this.estadoFormulario = estadoFormulario;
	}

	public String getObservacionesGenerales() {
		return observacionesGenerales;
	}

	public void setObservacionesGenerales(String observacionesGenerales) {
		this.observacionesGenerales = observacionesGenerales;
	}

	public String getCargadorEntrevista() {
		return cargadorEntrevista;
	}

	public void setCargadorEntrevista(String cargadorEntrevista) {
		this.cargadorEntrevista = cargadorEntrevista;
	}

	public boolean isPagaEntrevista() {
		return pagaEntrevista;
	}

	public void setPagaEntrevista(boolean pagaEntrevista) {
		this.pagaEntrevista = pagaEntrevista;
	}

	public PerfilEA getEa() {
		return ea;
	}

	public void setEa(PerfilEA ea) {
		this.ea = ea;
	}

	public PerfilRR getRr() {
		return rr;
	}

	public void setRr(PerfilRR rr) {
		this.rr = rr;
	}
	
	//Implementado en las subclases
	public abstract boolean esFinal();

	/**
	 * @return the exportacionEspecial
	 */
	public ExportacionEspecial getExportacionEspecial() {
		return exportacionEspecial;
	}

	/**
	 * @param exportacionEspecial the exportacionEspecial to set
	 */
	public void setExportacionEspecial(ExportacionEspecial exportacionEspecial) {
		this.exportacionEspecial = exportacionEspecial;
	}


	/**
	 * @return the tipo
	 */
	public String getTipo() {
		return tipo;
	}

	/**
	 * @param tipo the tipo to set
	 */
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}
	
	@Override
	public boolean equals(Object ent) {
		return (this.id != null) && this.id.equals(((Entrevista) ent).getId());
	}

	public String getNroCtesPlataformaContable() {
		return nroCtesPlataformaContable;
	}

	public void setNroCtesPlataformaContable(String nroCtesPlataformaContable) {
		this.nroCtesPlataformaContable = nroCtesPlataformaContable;
	}

	public String getTipoEncuentroAcompanamiento() {
		return tipoEncuentroAcompanamiento;
	}

	public void setTipoEncuentroAcompanamiento(String tipoEncuentroAcompanamiento) {
		this.tipoEncuentroAcompanamiento = tipoEncuentroAcompanamiento;
	}

	public String getMotivoInasistenciaR() {
		return motivoInasistenciaR;
	}

	public void setMotivoInasistenciaR(String motivoInasistenciaR) {
		this.motivoInasistenciaR = motivoInasistenciaR;
	}

	public String getInasistenciasPeriodo() {
		return inasistenciasPeriodo;
	}

	public void setInasistenciasPeriodo(String inasistenciasPeriodo) {
		this.inasistenciasPeriodo = inasistenciasPeriodo;
	}

	public String getPropositoAnual() {
		return propositoAnual;
	}

	public void setPropositoAnual(String propositoAnual) {
		this.propositoAnual = propositoAnual;
	}

	public String getHsTrabajarAño() {
		return hsTrabajarAño;
	}

	public void setHsTrabajarAño(String hsTrabajarAño) {
		this.hsTrabajarAño = hsTrabajarAño;
	}

	public String getContenidosTrabajarDuranteAnio() {
		return contenidosTrabajarDuranteAnio;
	}

	public void setContenidosTrabajarDuranteAnio(
			String contenidosTrabajarDuranteAnio) {
		this.contenidosTrabajarDuranteAnio = contenidosTrabajarDuranteAnio;
	}

	public String getObservacionesSR() {
		return observacionesSR;
	}

	public void setObservacionesSR(String observacionesSR) {
		this.observacionesSR = observacionesSR;
	}

	public boolean isBrujula() {
		return brujula;
	}

	public void setBrujula(boolean brujula) {
		this.brujula = brujula;
	}

	public boolean isTma() {
		return tma;
	}

	public void setTma(boolean tma) {
		this.tma = tma;
	}

	
}
