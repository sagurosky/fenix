package org.cimientos.intranet.modelo.pbe.evento.entrevistas;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import com.cimientos.intranet.enumerativos.ProyeccionAnioProximo;
import com.cimientos.intranet.enumerativos.entrevista.EvaluacionRenovacionFinal;


@Entity
@DiscriminatorValue("febrero")
public class EntrevistaFebrero extends EntrevistaIndividual{
	
	@Column(length=10000)
	private String materiasRendirDiciembre;
	
	@Column(length=10000)
	private String materiasRendirFebMarzo;
	
	private boolean autoEvaluacionBecado;
	
	
	@Column(length=10000)
	private String cambioEscuelaProxAnio;
	
	@Column(length=10000)
	private String aislsdrs;
	
	@Column(length=10000)
	private String modCursaProxAnio;
	
	@Enumerated(EnumType.ORDINAL)
	private ProyeccionAnioProximo proyAnioProximo;
	
	private Date fechaEntrevFebMarzo;
	
	@Column(length=10000)
	private String evaluacionProposito;

	@Enumerated(EnumType.ORDINAL)
	private EvaluacionRenovacionFinal evaluacionRenovacionFinal;
	
	
	@Column(length=20)
	private String sea;
	
	@Column(length=10000)
	private String planAccion;
	
	@Column(length=3)
	private String cup;
	
	@Column(length=3)
	private String wifi;
	
	@Column(length=3)
	private String pc;
	
	@Column(length=3)
	private String epaev;
	
	@Column(length=10000)
	private String detallarAcreditacion;
	
	@Column(length=10000)
	private String referenteEscolar;
	
	@Column(length=100)
	private String spe;
	
	@Column(length=100)
	private String rae;
	

	
	
	
	public String getRae() {
		return rae;
	}

	public void setRae(String rae) {
		this.rae = rae;
	}

	public String getSea() {
		return sea;
	}

	public void setSea(String sea) {
		this.sea = sea;
	}

	public String getPlanAccion() {
		return planAccion;
	}

	public void setPlanAccion(String planAccion) {
		this.planAccion = planAccion;
	}

	public String getCup() {
		return cup;
	}

	public void setCup(String cup) {
		this.cup = cup;
	}

	public String getWifi() {
		return wifi;
	}

	public void setWifi(String wifi) {
		this.wifi = wifi;
	}

	public String getPc() {
		return pc;
	}

	public void setPc(String pc) {
		this.pc = pc;
	}

	public String getEpaev() {
		return epaev;
	}

	public void setEpaev(String epaev) {
		this.epaev = epaev;
	}

	public String getDetallarAcreditacion() {
		return detallarAcreditacion;
	}

	public void setDetallarAcreditacion(String detallarAcreditacion) {
		this.detallarAcreditacion = detallarAcreditacion;
	}

	public String getReferenteEscolar() {
		return referenteEscolar;
	}

	public void setReferenteEscolar(String referenteEscolar) {
		this.referenteEscolar = referenteEscolar;
	}

	public String getSpe() {
		return spe;
	}

	public void setSpe(String spe) {
		this.spe = spe;
	}
	
	
	public String getAislsdrs() {
		return aislsdrs;
	}

	public void setAislsdrs(String aislsdrs) {
		this.aislsdrs = aislsdrs;
	}

	public EvaluacionRenovacionFinal getEvaluacionRenovacionFinal() {
		return evaluacionRenovacionFinal;
	}

	public void setEvaluacionRenovacionFinal(
			EvaluacionRenovacionFinal evaluacionRenovacionFinal) {
		this.evaluacionRenovacionFinal = evaluacionRenovacionFinal;
	}

	public String getEvaluacionProposito() {
		return evaluacionProposito;
	}

	public void setEvaluacionProposito(String evaluacionProposito) {
		this.evaluacionProposito = evaluacionProposito;
	}

	public String getMateriasRendirDiciembre() {
		return materiasRendirDiciembre;
	}

	public void setMateriasRendirDiciembre(String materiasRendirDiciembre) {
		this.materiasRendirDiciembre = materiasRendirDiciembre;
	}

	public boolean isAutoEvaluacionBecado() {
		return autoEvaluacionBecado;
	}

	public void setAutoEvaluacionBecado(boolean autoEvaluacionBecado) {
		this.autoEvaluacionBecado = autoEvaluacionBecado;
	}

	public String getMateriasRendirFebMarzo() {
		return materiasRendirFebMarzo;
	}

	public void setMateriasRendirFebMarzo(String materiasRendirFebMarzo) {
		this.materiasRendirFebMarzo = materiasRendirFebMarzo;
	}

	public String getCambioEscuelaProxAnio() {
		return cambioEscuelaProxAnio;
	}

	public void setCambioEscuelaProxAnio(String cambioEscuelaProxAnio) {
		this.cambioEscuelaProxAnio = cambioEscuelaProxAnio;
	}

	public String getModCursaProxAnio() {
		return modCursaProxAnio;
	}

	public void setModCursaProxAnio(String modCursaProxAnio) {
		this.modCursaProxAnio = modCursaProxAnio;
	}

	public ProyeccionAnioProximo getProyAnioProximo() {
		return proyAnioProximo;
	}

	public void setProyAnioProximo(ProyeccionAnioProximo proyAnioProximo) {
		this.proyAnioProximo = proyAnioProximo;
	}

	public Date getFechaEntrevFebMarzo() {
		return fechaEntrevFebMarzo;
	}

	public void setFechaEntrevFebMarzo(Date fechaEntrevFebMarzo) {
		this.fechaEntrevFebMarzo = fechaEntrevFebMarzo;
	}

	@Override
	public boolean esFinal() {
		return true;
	}

	
	
	

	/**
	 * Retorna true si en una entrevista final se cobra beca.
	 * @return
	 */
	public boolean isCobraBeca(){
		return super.isCobraBeca() && !this.getEvaluacionRenovacionFinal().equals(EvaluacionRenovacionFinal.NO_RENUEVA)
				&& !this.getEvaluacionRenovacionFinal().equals(EvaluacionRenovacionFinal.PENDIENTE);
	}
}
