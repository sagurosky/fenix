/**
 * 
 */
package org.cimientos.intranet.modelo.perfilRR;

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

import org.cimientos.intranet.modelo.evento.Evento;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.modelo.usuario.Recordatorio;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * @author nlopez
 *
 */

@Entity
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class PerfilRR implements Serializable{

	private Boolean activo;
	
	@Id
	@GeneratedValue
	private Long idPerfilRR;
	
	@OneToOne(cascade=CascadeType.ALL)
	private Persona datosPersonales;
		
	@ManyToMany
	@JoinTable(name="PerfilRR_Zona")
	private List<ZonaCimientos> zona;
	
	@OneToMany
	@JoinColumn(name="rrIdPerfil")
	private List<PerfilEA> eas;
	
	@OneToMany
	@JoinColumn(name="rr_id")
	private List<Recordatorio> recordatorios;
	
	@OneToMany(fetch=FetchType.LAZY)
	private List<Evento> historial;
	
	
	public PerfilRR(){}
	
	public Boolean getActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	/**
	 * @return the idPerfilRR
	 */
	public Long getIdPerfilRR() {
		return idPerfilRR;
	}

	/**
	 * @param idPerfilRR the idPerfilRR to set
	 */
	public void setIdPerfilRR(Long idPerfilRR) {
		this.idPerfilRR = idPerfilRR;
	}

	/**
	 * @return the datosPersonales
	 */
	public Persona getDatosPersonales() {
		return datosPersonales;
	}

	/**
	 * @param datosPersonales the datosPersonales to set
	 */
	public void setDatosPersonales(Persona datosPersonales) {
		this.datosPersonales = datosPersonales;
	}

	/**
	 * @return the zonas
	 */
	public List<ZonaCimientos> getZona() {
		return zona;
	}

	/**
	 * @param zona the zona to set
	 */
	public void setZona(List<ZonaCimientos> zonas) {
		this.zona = zonas;
	}

	
	public List<Recordatorio> getRecordatorios() {
		return recordatorios;
	}

	public void setRecordatorios(List<Recordatorio> recordatorios) {
		this.recordatorios = recordatorios;
	}

	/**
	 * @return the eas
	 */
	public List<PerfilEA> getEas() {
		return eas;
	}

	/**
	 * @param eas the eas to set
	 */
	public void setEas(List<PerfilEA> eas) {
		this.eas = eas;
	}

	/**
	 * @return the historial
	 */
	public List<Evento> getHistorial() {
		return historial;
	}

	/**
	 * @param historial the historial to set
	 */
	public void setHistorial(List<Evento> historial) {
		this.historial = historial;
	}

	/**
	 * Retorna todos sus EAs que tengan al menos un alumno asignado
	 * @return
	 */
	public List<PerfilEA> obtenerEASDisponibles() {
		List<PerfilEA> eas = new ArrayList<PerfilEA>();
		for (PerfilEA perfilEA : this.getEas()) {
			if(perfilEA.getBecados().size() >= 0 && perfilEA.isActivo())
				eas.add(perfilEA);
		}
		return eas;
	}

	/**
	 * @param zonaHard
	 */
	public void agregarZona(ZonaCimientos zona) {
		if(this.zona == null){
			this.zona = new ArrayList<ZonaCimientos>();
		}
		this.zona.add(zona);
		
	}
	
	
}
