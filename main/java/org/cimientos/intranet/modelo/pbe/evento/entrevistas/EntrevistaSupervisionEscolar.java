package org.cimientos.intranet.modelo.pbe.evento.entrevistas;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.evento.Evento;
import org.cimientos.intranet.modelo.supervisorescolar.SupervisorEscolar;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

@Entity
public class EntrevistaSupervisionEscolar extends Evento{

		
	private Date fecha;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	private ZonaCimientos zona;
	
	private String nivelEducativo;
	
	private String equipoDirectivo;
	
	private String socioEconomicoMatricula;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	private SupervisorEscolar supervisorEscolar;
		
	

	public Date getFecha() {
		return fecha;
	}


	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}


	public ZonaCimientos getZona() {
		return zona;
	}


	public void setZona(ZonaCimientos zona) {
		this.zona = zona;
	}


	public String getNivelEducativo() {
		return nivelEducativo;
	}
	
	
	public void setNivelEducativo(String nivelEducativo) {
		this.nivelEducativo = nivelEducativo;
	}
	
	
	public String getEquipoDirectivo() {
		return equipoDirectivo;
	}
	
	
	public void setEquipoDirectivo(String equipoDirectivo) {
		this.equipoDirectivo = equipoDirectivo;
	}


	public String getSocioEconomicoMatricula() {
		return socioEconomicoMatricula;
	}


	public void setSocioEconomicoMatricula(String socioEconomicoMatricula) {
		this.socioEconomicoMatricula = socioEconomicoMatricula;
	}


	public SupervisorEscolar getSupervisorEscolar() {
		return supervisorEscolar;
	}


	public void setSupervisorEscolar(SupervisorEscolar supervisorEscolar) {
		this.supervisorEscolar = supervisorEscolar;
	}
	
	

}
