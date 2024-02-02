package org.cimientos.intranet.modelo.perfilEA;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.evento.Evento;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.Entrevista;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.modelo.usuario.Recordatorio;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class PerfilEA implements Serializable{

	private Boolean activo;
	
	@Id
	@GeneratedValue
	private Long idPerfilEA;
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	private Persona datosPersonales;	
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="perfil_ea_id")
	private List<PerfilAlumno> becados;
	
	@ManyToMany
	@JoinTable(name="PerfilEA_Zona")
	private List<ZonaCimientos> zona;
	
	@OneToMany(fetch=FetchType.LAZY)
	private List<Evento> historial;
	
	@OneToMany(fetch=FetchType.LAZY)
	private List<Entrevista> historialEntrevistas;
	
	@OneToMany
	@JoinColumn(name="ea_id")
	private List<Recordatorio> recordatorios;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="rrIdPerfil")
	private PerfilRR rr;
	
	
	public Boolean isActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	public PerfilEA(){
		becados = new ArrayList<PerfilAlumno>();
		zona = new ArrayList<ZonaCimientos>();
		historial = new ArrayList<Evento>();
	}
	
	public Long getIdPerfilEA() {
		return idPerfilEA;
	}

	public void setIdPerfilEA(Long idPerfilEA) {
		this.idPerfilEA = idPerfilEA;
	}

	public Persona getDatosPersonales() {
		return datosPersonales;
	}

	public void setDatosPersonales(Persona datosPersonales) {
		this.datosPersonales = datosPersonales;
	}

	public List<PerfilAlumno> getBecados() {
		return becados;
	}

	public void setBecados(List<PerfilAlumno> becados) {
		this.becados = becados;
	}

	public List<ZonaCimientos> getZona() {
		return zona;
	}

	
	public List<Recordatorio> getRecordatorios() {
		return recordatorios;
	}


	public void setRecordatorios(List<Recordatorio> recordatorios) {
		this.recordatorios = recordatorios;
	}


	public void setZona(List<ZonaCimientos> zona) {
		this.zona = zona;
	}

	public List<Evento> getHistorial() {
		return historial;
	}

	public void setHistorial(List<Evento> historial) {
		this.historial = historial;
	}


	public PerfilRR getRr() {
		return rr;
	}


	public void setRr(PerfilRR rr) {
		this.rr = rr;
	}


	/**
	 * Retorna todos sus becados disponibles en el ciclo dado para el panel de control
	 * @param ciclo 
	 * @return
	 */
	public List<PerfilAlumno> obtenerBecadosDisponibles(CicloPrograma ciclo) {
		List<PerfilAlumno> alumnos = new ArrayList<PerfilAlumno>();
		for (PerfilAlumno a : this.getBecados()) {
			//FIXME ver!!
			if(!a.getEstadoAlumno().equals(EstadoAlumno.CESADO) && a.getBeca() != null && a.getBeca().getCiclo().getId().equals(ciclo.getId()))			
				alumnos.add(a);
		}
		return alumnos;
	}


	/**
	 * @param perfilAlumno
	 */
	public void agregarBecado(PerfilAlumno perfilAlumno) {
		if(becados == null){
			becados = new ArrayList<PerfilAlumno>();
		}
		becados.add(perfilAlumno);
	}


	/**
	 * @param zonaCimientos
	 */
	public void agregarZona(ZonaCimientos zonaCimientos) {
		if(zona == null){
			zona = new ArrayList<ZonaCimientos>();
		}
		if(!zona.contains(zonaCimientos)){
			zona.add(zonaCimientos);	
		}
		
	}

	/**
	 * @return the historialEntrevistas
	 */
	public List<Entrevista> getHistorialEntrevistas() {
		return historialEntrevistas;
	}

	/**
	 * @param historialEntrevistas the historialEntrevistas to set
	 */
	public void setHistorialEntrevistas(List<Entrevista> historialEntrevistas) {
		this.historialEntrevistas = historialEntrevistas;
	}

	/**
	 * @return the activo
	 */
	public Boolean getActivo() {
		return activo;
	}

	
}
