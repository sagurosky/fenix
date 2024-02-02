/**
 * 
 */
package org.cimientos.intranet.modelo.informe;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.FichaFamiliar;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.seleccion.BoletinSeleccion;
import org.hibernate.annotations.CollectionOfElements;

import com.cimientos.intranet.enumerativos.EspacioApoyo;


/**
 * @author msagarduy
 *
 */
@Entity
@DiscriminatorValue("ficha_presentacion")
public class FichaPresentacion extends Informe {
	
	
	private Integer edad;
	
	//Datos del responsable adulto
	@OneToOne 
	private ResponsableAdulto ra1;
	
	
	@OneToMany
	@JoinColumn(name="fichaPresentacion_id")
	private List<FichaFamiliar> convivientes;
	
	@Column(length=10000)
	private String comentarios;

	@Column(length=500)
	private String materiasInteres;
	
	@ManyToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
	private List<BoletinSeleccion> boletinSeleccions;
	
	private Boolean incluirBoletinCheck;
	
	private Boolean fpPorReasignacion;
	
	private Boolean repitio;
	
	private Boolean abandono;
	
	@Column(length=500)
	private String materiasMasCuesta;
	@Column(length=500)
	private String tiempoLibre;
	@Column(length=1000)
	private String cuandoTermine;
	@Column(length=1000)
	private String escuelaObservaciones;
	@Column(length=1000)
	private String escuelaEspacioApoyo;
	
	@Column(length=10000)
	private String observacionesGenerales;
	
	@Column(length=10000)
	private String situacionEscolar;
	
	//2021
	@Column(length=1000)
	private String vosMismo;
	
	private String realizadoVacaciones;
	
	private String incorporacion;
	
	private String observacionesNoIncorporacion;
	
	private String propositoAnual;
	
	
	
	
	
	
	public String getPropositoAnual() {
		return propositoAnual;
	}

	public void setPropositoAnual(String propositoAnual) {
		this.propositoAnual = propositoAnual;
	}

	public String getObservacionesNoIncorporacion() {
		return observacionesNoIncorporacion;
	}

	public void setObservacionesNoIncorporacion(String observacionesNoIncorporacion) {
		this.observacionesNoIncorporacion = observacionesNoIncorporacion;
	}

	public String getIncorporacion() {
		return incorporacion;
	}

	public void setIncorporacion(String incorporacion) {
		this.incorporacion = incorporacion;
	}

	public String getSituacionEscolar() {
		return situacionEscolar;
	}

	public void setSituacionEscolar(String situacionEscolar) {
		this.situacionEscolar = situacionEscolar;
	}

	@CollectionOfElements
	@JoinTable(name="espacio_apoyo_escuela")
	@Enumerated(EnumType.ORDINAL)
	private List<EspacioApoyo> espacioApoyo;
	
	
	
	
	
	
	public String getObservacionesGenerales() {
		return observacionesGenerales;
	}

	public void setObservacionesGenerales(String observacionesGenerales) {
		this.observacionesGenerales = observacionesGenerales;
	}

	public String getRealizadoVacaciones() {
		return realizadoVacaciones;
	}

	public void setRealizadoVacaciones(String realizadoVacaciones) {
		this.realizadoVacaciones = realizadoVacaciones;
	}

	public ResponsableAdulto getRa1() {
		return ra1;
	}

	public void setRa1(ResponsableAdulto ra1) {
		this.ra1 = ra1;
	}

	public List<FichaFamiliar> getConvivientes() {
		return convivientes;
	}

	public void setConvivientes(List<FichaFamiliar> convivientes) {
		this.convivientes = convivientes;
	}

	public String getComentarios() {
		return comentarios;
	}

	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edad) {
		this.edad = edad;
	}

	@Override
	public String dameUrlVer() {
		//No hace nada, nunca llega aca!
		return null;
	}

	public String getMateriasInteres() {
		return materiasInteres;
	}

	public void setMateriasInteres(String materiasInteres) {
		this.materiasInteres = materiasInteres;
	}

	public List<BoletinSeleccion> getBoletinSeleccions() {
		return boletinSeleccions;
	}

	public void setBoletinSeleccions(List<BoletinSeleccion> boletinSeleccions) 
	{
		this.boletinSeleccions = boletinSeleccions;
	}

	public Boolean getIncluirBoletinCheck(){
		return incluirBoletinCheck;
	}

	public void setIncluirBoletinCheck(Boolean incluirBoletinCheck) {
		this.incluirBoletinCheck = incluirBoletinCheck;
	}

	public Boolean getFpPorReasignacion() {
		return fpPorReasignacion;
	}

	public void setFpPorReasignacion(Boolean fpPorReasignacion) {
		this.fpPorReasignacion = fpPorReasignacion;
	}

	public Boolean getRepitio() {
		return repitio;
	}

	public void setRepitio(Boolean repitio) {
		this.repitio = repitio;
	}

	public Boolean getAbandono() {
		return abandono;
	}

	public void setAbandono(Boolean abandono) {
		this.abandono = abandono;
	}

	public List<EspacioApoyo> getEspacioApoyo() {
		return espacioApoyo;
	}

	public void setEspacioApoyo(List<EspacioApoyo> espacioApoyo) {
		this.espacioApoyo = espacioApoyo;
	}


	public String getTiempoLibre() {
		return tiempoLibre;
	}

	public void setTiempoLibre(String tiempoLibre) {
		this.tiempoLibre = tiempoLibre;
	}

	public String getCuandoTermine() {
		return cuandoTermine;
	}

	public void setCuandoTermine(String cuandoTermine) {
		this.cuandoTermine = cuandoTermine;
	}

	public String getMateriasMasCuesta() {
		return materiasMasCuesta;
	}

	public void setMateriasMasCuesta(String materiasMasCuesta) {
		this.materiasMasCuesta = materiasMasCuesta;
	}

	public String getEscuelaObservaciones() {
		return escuelaObservaciones;
	}

	public void setEscuelaObservaciones(String escuelaObservaciones) {
		this.escuelaObservaciones = escuelaObservaciones;
	}

	public String getEscuelaEspacioApoyo() {
		return escuelaEspacioApoyo;
	}

	public void setEscuelaEspacioApoyo(String escuelaEspacioApoyo) {
		this.escuelaEspacioApoyo = escuelaEspacioApoyo;
	}

	public String getVosMismo() {
		return vosMismo;
	}

	public void setVosMismo(String vosMismo) {
		this.vosMismo = vosMismo;
	}

	
	
	
	
	
}
