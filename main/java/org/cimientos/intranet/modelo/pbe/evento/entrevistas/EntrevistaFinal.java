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
@DiscriminatorValue("final")
public class EntrevistaFinal extends EntrevistaIndividual{
	
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
	
	//@Column(length=10000)
	//private String alo;
	
	@Column(length=5)
	private String paev;
	
	
	
	
	

	//public String getAlo() {
	//	return alo;
	//}

	//public void setAlo(String alo) {
	//	this.alo = alo;
	//}

	public String getPaev() {
		return paev;
	}

	public void setPaev(String paev) {
		this.paev = paev;
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
