package org.cimientos.intranet.modelo.informe;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaIndividual;
import org.hibernate.annotations.CollectionOfElements;

import com.cimientos.intranet.enumerativos.entrevista.DetalleGastos;

/**
 * 
 * @author jrios
 *
 */
 
@Entity
@DiscriminatorValue("informeis3")
public class InformeIS3 extends Informe {

	@OneToOne
	private EntrevistaIndividual ei;
	
	private Integer edad;
		
	private Integer materiasAprobadas;
	
	private Integer materiasDesaprobadas;
	
	private Float inasistencias;
	
	@Column(length=10000)
	private String actividadAcompanamiento;
	
	@Column(length=10000)
	private String suspensiones;
	
	private String suspensionesPeriodo;
	
	private Integer suspensionesCantidad;	
	
	@Column(length=10000)
	private String utilizacionBeca;
	
	private String evalRenovacionBeca;
	
	@Column(length=10000)
	private String motivoNoRenovacion;
	
	@Column(length=10000)
	private String situacionRenovacion;
	
	private String proyAnioProximo;
	
	@Column(length=10000)
	private String comentarios;
	
	@Column(length=1000)
	private String mensajePadrino;
	
	@Column(length=1000)
	private String materiasInteres;
	
	@Column(length=1000)
	private String materiasCuestan;
	
	@CollectionOfElements
	@JoinTable(name="detalle_gastos_is3")
	@Enumerated(EnumType.ORDINAL)
	private List<DetalleGastos> detalleGastos;
	
	//2018
	private Integer cantidadBecados;		
	private String sarpepe;
	private String hsTrabajarAño;
	private String osme;
	private String qtam;
	
	
	
	//2021
	private String alo;
	
	//2022
	private String tarang;
	private String paa;
	private String vtepa;
	private String vtepb;
	private String vtepc;
	private String vtepd;
	private String vtepe;
	private String vtepf;
	private String vtepg;
	private String vteph;
	private String vtepi;
	private String iatarni ;
	private String mp;
	private String sus;
	private String ige;
	private String estadoIS3;
	
	
	
	
	
	
	
	
	public String getEstadoIS3() {
		return estadoIS3;
	}

	public void setEstadoIS3(String estadoIS3) {
		this.estadoIS3 = estadoIS3;
	}

	public String getTarang() {
		return tarang;
	}

	public void setTarang(String tarang) {
		this.tarang = tarang;
	}

	public String getPaa() {
		return paa;
	}

	public void setPaa(String paa) {
		this.paa = paa;
	}

	public String getVtepa() {
		return vtepa;
	}

	public void setVtepa(String vtepa) {
		this.vtepa = vtepa;
	}

	public String getVtepb() {
		return vtepb;
	}

	public void setVtepb(String vtepb) {
		this.vtepb = vtepb;
	}

	public String getVtepc() {
		return vtepc;
	}

	public void setVtepc(String vtepc) {
		this.vtepc = vtepc;
	}

	public String getVtepd() {
		return vtepd;
	}

	public void setVtepd(String vtepd) {
		this.vtepd = vtepd;
	}

	public String getVtepe() {
		return vtepe;
	}

	public void setVtepe(String vtepe) {
		this.vtepe = vtepe;
	}

	public String getVtepf() {
		return vtepf;
	}

	public void setVtepf(String vtepf) {
		this.vtepf = vtepf;
	}

	public String getVtepg() {
		return vtepg;
	}

	public void setVtepg(String vtepg) {
		this.vtepg = vtepg;
	}

	public String getVteph() {
		return vteph;
	}

	public void setVteph(String vteph) {
		this.vteph = vteph;
	}

	public String getVtepi() {
		return vtepi;
	}

	public void setVtepi(String vtepi) {
		this.vtepi = vtepi;
	}

	public String getIatarni() {
		return iatarni;
	}

	public void setIatarni(String iatarni) {
		this.iatarni = iatarni;
	}

	public String getMp() {
		return mp;
	}

	public void setMp(String mp) {
		this.mp = mp;
	}

	public String getSus() {
		return sus;
	}

	public void setSus(String sus) {
		this.sus = sus;
	}

	public String getIge() {
		return ige;
	}

	public void setIge(String ige) {
		this.ige = ige;
	}

	public String getAlo() {
		return alo;
	}

	public void setAlo(String alo) {
		this.alo = alo;
	}

	public String getQtam() {
		return qtam;
	}

	public void setQtam(String qtam) {
		this.qtam = qtam;
	}

	public String getOsme() {
		return osme;
	}

	public void setOsme(String osme) {
		this.osme = osme;
	}

	public String getHsTrabajarAño() {
		return hsTrabajarAño;
	}

	public void setHsTrabajarAño(String hsTrabajarAño) {
		this.hsTrabajarAño = hsTrabajarAño;
	}

	public String getSarpepe() {
		return sarpepe;
	}

	public void setSarpepe(String sarpepe) {
		this.sarpepe = sarpepe;
	}

	public Integer getCantidadBecados() {
		return cantidadBecados;
	}

	public void setCantidadBecados(Integer cantidadBecados) {
		this.cantidadBecados = cantidadBecados;
	}

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edad) {
		this.edad = edad;
	}
	
	public Integer getMateriasAprobadas() {
		return materiasAprobadas;
	}

	public void setMateriasAprobadas(Integer materiasAprobadas) {
		this.materiasAprobadas = materiasAprobadas;
	}

	public Integer getMateriasDesaprobadas() {
		return materiasDesaprobadas;
	}

	public void setMateriasDesaprobadas(Integer materiasDesaprobadas) {
		this.materiasDesaprobadas = materiasDesaprobadas;
	}


	public Float getInasistencias() {
		return inasistencias;
	}

	public void setInasistencias(Float inasistencias) {
		this.inasistencias = inasistencias;
	}

	public String getActividadAcompanamiento() {
		return actividadAcompanamiento;
	}

	public void setActividadAcompanamiento(String actividadAcompanamiento) {
		this.actividadAcompanamiento = actividadAcompanamiento;
	}

	public String getUtilizacionBeca() {
		return utilizacionBeca;
	}

	public void setUtilizacionBeca(String utilizacionBeca) {
		this.utilizacionBeca = utilizacionBeca;
	}
	
	public String getComentarios() {
		return comentarios;
	}

	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	public EntrevistaIndividual getEi() {
		return ei;
	}

	public void setEi(EntrevistaIndividual ei) {
		this.ei = ei;
	}

	public String getSuspensiones() {
		return suspensiones;
	}

	public void setSuspensiones(String suspensiones) {
		this.suspensiones = suspensiones;
	}


	public String getEvalRenovacionBeca() {
		return evalRenovacionBeca;
	}

	public void setEvalRenovacionBeca(String evalRenovacionBeca) {
		this.evalRenovacionBeca = evalRenovacionBeca;
	}

	public String getMotivoNoRenovacion() {
		return motivoNoRenovacion;
	}

	public void setMotivoNoRenovacion(String motivoNoRenovacion) {
		this.motivoNoRenovacion = motivoNoRenovacion;
	}	

	public String getProyAnioProximo() {
		return proyAnioProximo;
	}

	public void setProyAnioProximo(String proyAnioProximo) {
		this.proyAnioProximo = proyAnioProximo;
	}

	public String getSituacionRenovacion() {
		return situacionRenovacion;
	}

	public void setSituacionRenovacion(String situacionRenovacion) {
		this.situacionRenovacion = situacionRenovacion;
	}

	@Override
	public String dameUrlVer() {
		return "/informeIS3/verInformeIS3General.do?idInformeIS3=";
	}

	public String getSuspensionesPeriodo() {
		return suspensionesPeriodo;
	}

	public void setSuspensionesPeriodo(String suspensionesPeriodo) {
		this.suspensionesPeriodo = suspensionesPeriodo;
	}
	
	public Integer getSuspensionesCantidad() {
		return suspensionesCantidad;
	}

	public void setSuspensionesCantidad(Integer suspensionesCantidad) {
		this.suspensionesCantidad = suspensionesCantidad;
	}

	public String getMensajePadrino() {
		return mensajePadrino;
	}

	public void setMensajePadrino(String mensajePadrino) {
		this.mensajePadrino = mensajePadrino;
	}

	public String getMateriasInteres() {
		return materiasInteres;
	}

	public void setMateriasInteres(String materiasInteres) {
		this.materiasInteres = materiasInteres;
	}

	public String getMateriasCuestan() {
		return materiasCuestan;
	}

	public void setMateriasCuestan(String materiasCuestan) {
		this.materiasCuestan = materiasCuestan;
	}

	public List<DetalleGastos> getDetalleGastos() {
		return detalleGastos;
	}

	public void setDetalleGastos(List<DetalleGastos> detalleGastos) {
		this.detalleGastos = detalleGastos;
	}	
}
