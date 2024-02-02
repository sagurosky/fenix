package org.cimientos.intranet.modelo.pbe.evento.entrevistas;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

import com.cimientos.intranet.enumerativos.RecomendacionesTS;

@Entity
@DiscriminatorValue("informesa")
public class InformeSA extends Informe {
	
	@OneToOne
	private ZonaCimientos zonaCimientos;
	
	private String observIngresoEgreso;
	
	private String observGenerales;
	
	@Enumerated(EnumType.ORDINAL)
	private RecomendacionesTS recomendaciones;
	
	private String observSobreRA;
	
	private String obserGenerales2;
	
	@Enumerated(EnumType.ORDINAL)
	private RecomendacionesTS recomendaciones2;
	
	private String observIngresoEgreso2;
	
	private String observSobreRA2;
	
	private String obserGenerales3;

	@Enumerated(EnumType.ORDINAL)
	private RecomendacionesTS recomendaciones3;
	
	


	public ZonaCimientos getZonaCimientos() {
		return zonaCimientos;
	}

	public void setZonaCimientos(ZonaCimientos zonaCimientos) {
		this.zonaCimientos = zonaCimientos;
	}

	public String getObservIngresoEgreso() {
		return observIngresoEgreso;
	}

	public void setObservIngresoEgreso(String observIngresoEgreso) {
		this.observIngresoEgreso = observIngresoEgreso;
	}

	public String getObservGenerales() {
		return observGenerales;
	}

	public void setObservGenerales(String observGenerales) {
		this.observGenerales = observGenerales;
	}

	public String getObservSobreRA() {
		return observSobreRA;
	}

	public void setObservSobreRA(String observSobreRA) {
		this.observSobreRA = observSobreRA;
	}

	public String getObserGenerales2() {
		return obserGenerales2;
	}

	public void setObserGenerales2(String obserGenerales2) {
		this.obserGenerales2 = obserGenerales2;
	}

	public String getObservIngresoEgreso2() {
		return observIngresoEgreso2;
	}

	public void setObservIngresoEgreso2(String observIngresoEgreso2) {
		this.observIngresoEgreso2 = observIngresoEgreso2;
	}

	public String getObservSobreRA2() {
		return observSobreRA2;
	}

	public void setObservSobreRA2(String observSobreRA2) {
		this.observSobreRA2 = observSobreRA2;
	}

	public String getObserGenerales3() {
		return obserGenerales3;
	}

	public void setObserGenerales3(String obserGenerales3) {
		this.obserGenerales3 = obserGenerales3;
	}

	public RecomendacionesTS getRecomendaciones() {
		return recomendaciones;
	}

	public void setRecomendaciones(RecomendacionesTS recomendaciones) {
		this.recomendaciones = recomendaciones;
	}

	public RecomendacionesTS getRecomendaciones2() {
		return recomendaciones2;
	}

	public void setRecomendaciones2(RecomendacionesTS recomendaciones2) {
		this.recomendaciones2 = recomendaciones2;
	}

	public RecomendacionesTS getRecomendaciones3() {
		return recomendaciones3;
	}

	public void setRecomendaciones3(RecomendacionesTS recomendaciones3) {
		this.recomendaciones3 = recomendaciones3;
	}

	@Override
	public String dameUrlVer() {
		//No hace nada, nunca llega aca!
		return null;
	}


	
}
