package org.cimientos.intranet.modelo.pbe.evento.entrevistas;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.hibernate.annotations.CollectionOfElements;

import com.cimientos.intranet.enumerativos.entrevista.ContenidosTrabajarEnElAnio;

@Entity
@DiscriminatorValue("grupal")
public class EntrevistaGrupal extends Entrevista {
	
	@OneToOne
	private ZonaCimientos zonaCimientos;
	
	@OneToMany
	@JoinColumn(name="entrevistaGrupal_id")
	private List<EntrevistaIndividual> entrevistasIndividuales;
	
	
	
	
	@Column(length=10000)
	private String objetivoEncuentro;
	
	@Column(length=10000)
	private String temasDesarrollados;
	
	@Column(length=10000)
	private String observacionesGrupal;
	
	private String motivoInasistencia;
	
	
	
	
	
	
	public String getMotivoInasistencia() {
		return motivoInasistencia;
	}

	public void setMotivoInasistencia(String motivoInasistencia) {
		this.motivoInasistencia = motivoInasistencia;
	}

	public String getObservacionesGrupal() {
		return observacionesGrupal;
	}

	public void setObservacionesGrupal(String observacionesGrupal) {
		this.observacionesGrupal = observacionesGrupal;
	}

	//2019
	@Column(length=30)
	private String op1;
	
	@Column(length=30)
	private String op2;
	
	@Column(length=30)
	private String op3;
	
	@Column(length=30)
	private String op4;
	
	@Column(length=30)
	private String op5;
	
	@Column(length=30)
	private String op6;
	
	@Column(length=30)
	private String tipoEncuentro;
	
	@Column(length=100)
	private String op;
	
	
	
	

	
	
	

	

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getOp5() {
		return op5;
	}

	public void setOp5(String op5) {
		this.op5 = op5;
	}

	public String getOp6() {
		return op6;
	}

	public void setOp6(String op6) {
		this.op6 = op6;
	}

	public String getOp4() {
		return op4;
	}

	public void setOp4(String op4) {
		this.op4 = op4;
	}

	public String getOp1() {
		return op1;
	}

	public void setOp1(String op1) {
		this.op1 = op1;
	}

	public String getOp2() {
		return op2;
	}

	public void setOp2(String op2) {
		this.op2 = op2;
	}

	public String getOp3() {
		return op3;
	}

	public void setOp3(String op3) {
		this.op3 = op3;
	}

	public String getTipoEncuentro() {
		return tipoEncuentro;
	}

	public void setTipoEncuentro(String tipoEncuentro) {
		this.tipoEncuentro = tipoEncuentro;
	}

	public ZonaCimientos getZonaCimientos() {
		return zonaCimientos;
	}

	public void setZonaCimientos(ZonaCimientos zonaCimientos) {
		this.zonaCimientos = zonaCimientos;
	}



	public String getObjetivoEncuentro() {
		return objetivoEncuentro;
	}

	public void setObjetivoEncuentro(String objetivoEncuentro) {
		this.objetivoEncuentro = objetivoEncuentro;
	}

	public String getTemasDesarrollados() {
		return temasDesarrollados;
	}

	public void setTemasDesarrollados(String temasDesarrollados) {
		this.temasDesarrollados = temasDesarrollados;
	}

	/**
	 * @return the entrevistasIndividuales
	 */
	public List<EntrevistaIndividual> getEntrevistasIndividuales() {
		return entrevistasIndividuales;
	}

	/**
	 * @param entrevistasIndividuales the entrevistasIndividuales to set
	 */
	public void setEntrevistasIndividuales(
			List<EntrevistaIndividual> entrevistasIndividuales) {
		this.entrevistasIndividuales = entrevistasIndividuales;
	}

	@Override
	public boolean esFinal() {
		return false;
	}
	
	public String getPeriodo(){	
		if(!getEntrevistasIndividuales().isEmpty())
			return getEntrevistasIndividuales().get(0).getPeriodoDePago().getNombre();
		else
			return null;
	}

}
