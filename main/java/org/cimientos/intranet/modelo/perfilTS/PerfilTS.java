package org.cimientos.intranet.modelo.perfilTS;
	
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.evento.Evento;
import org.cimientos.intranet.modelo.pbe.evento.acompanamiento.EventoEntrevistaTS;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

/**
 * PerfilTS
 * 		Esta clase es el bean de PerfilTS.
 * @author Nicolas Lopez
 *
 */

@Entity

public class PerfilTS implements Serializable{

	@Id
	@GeneratedValue
	private Long idPerfilTS;
	
	@OneToOne(cascade=CascadeType.ALL)
	private Persona datosPersonales;
	
	@OneToMany	
	private List<EventoEntrevistaTS> asignaciones;
	
	@ManyToMany
	private List<ZonaCimientos> zonas;
	
	@OneToMany
	private List<Evento> historial;
	private Boolean activo;
	
	public Long getIdPerfilTS() {
		return idPerfilTS;
	}

	public void setIdPerfilTS(Long idPerfilTS) {
		this.idPerfilTS = idPerfilTS;
	}

	public Persona getDatosPersonales() {
		return datosPersonales;
	}

	public void setDatosPersonales(Persona datosPersonales) {
		this.datosPersonales = datosPersonales;
	}

	public List<EventoEntrevistaTS> getAsignaciones() {
		return asignaciones;
	}

	public void setAsignaciones(List<EventoEntrevistaTS> asignaciones) {
		this.asignaciones = asignaciones;
	}

	public List<ZonaCimientos> getZonas() {
		return zonas;
	}

	public void setZonas(List<ZonaCimientos> zonas) {
		this.zonas = zonas;
	}

	public List<Evento> getHistorial() {
		return historial;
	}

	public void setHistorial(List<Evento> historial) {
		this.historial = historial;
	}

	public Boolean getActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	public void agregarZona(ZonaCimientos zona) {
		if(this.zonas == null){
			this.zonas = new ArrayList<ZonaCimientos>();
		}
		this.zonas.add(zona);
	}
		
}
