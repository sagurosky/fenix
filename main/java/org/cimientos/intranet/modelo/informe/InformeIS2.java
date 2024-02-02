/**
 * 
 */
package org.cimientos.intranet.modelo.informe;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.Boletin;

import com.cimientos.intranet.enumerativos.EnumPBE;


/**
 * 
 * @author jrios
 *
 */
 
@Entity
@DiscriminatorValue("informeis2")
public class InformeIS2 extends Informe {

		
	@Enumerated(EnumType.ORDINAL)
	private EnumPBE compromisoAlumno;
	
	@Enumerated(EnumType.ORDINAL)
	private EnumPBE esfuerzo;
	
	@Enumerated(EnumType.ORDINAL)
	private EnumPBE conducta;
		
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "compromiso_ra_is2")
	private EnumPBE compromisoRA;
	
	@Enumerated(EnumType.ORDINAL)
	private EnumPBE asistenciaBecadoAEntrevistaPBE;
	
	@Enumerated(EnumType.ORDINAL)
	private EnumPBE presentacionMaterialPBE;
	
	@Enumerated(EnumType.ORDINAL)
	private EnumPBE compromisoAlumnoPBE;
	
	@Enumerated(EnumType.ORDINAL)
	private EnumPBE asistenciaRAEntrevistaPBE;

	@Enumerated(EnumType.ORDINAL)
	@Column(name = "compromiso_rapbe_is2")
	private EnumPBE compromisoRaPBE;
	
	private Integer edad;
		
	private Integer materiasAprobadas;
	
	private Integer materiasDesaprobadas;
	
	private Float inasistencias;
	
	@Column(length=10000)
	private String obsBoletin;
	
	@Column(length=10000)
	private String actividadAcompanamiento;
	
	@Column(length=10000)
	private String utilizacionBeca;
	
	@Column(length=10000)
	private String obsPersonales;
	
	@Column(length=10000)
	private String obsFamiliares;
	
	@Column(length=10000)
	private String obsGenerales;
	
	@Column(length=10000)
	private String comentarios;
	
	@Column(length=10000)
	private String detalle;
	
	@Column(length=10000)
	private String suspensionesBeca;
	
	private Integer cantidadBecados;
	
	@Column(length=1000)
	private String mensajePadrino;
	
	@Column(length=1000)
	private String materiasInteres;
	
	@Column(length=1000)
	private String materiasCuestan;
	
	@Column(length=10000)
	private String qtam;
	
	@Column(length=50)
	private String hsTrabajarAño;
	
	@Column(length=50)
	private String sarpepe;
	
	@OneToOne
	private Boletin boletinActual;
	
	private Boolean incluirBoletinCheck;
	
	@Column(length=10000)
	private String osme;
	
	@Column(length=10000)
	private String propositoAnual;
	
	@Column(length=10000)
	private String iamp;
	
	//2022
	
	//2022
		@Column(length=10000)
		private String tarang;
		@Column(length=10000)
		private String paa;
		@Column(length=20)
		private String vtepa;
		@Column(length=20)
		private String vtepb;
		@Column(length=20)
		private String vtepc;
		@Column(length=20)
		private String vtepd;
		@Column(length=20)
		private String vtepe;
		@Column(length=20)
		private String vtepf;
		@Column(length=20)
		private String vtepg;
		@Column(length=20)
		private String vteph;
		@Column(length=20)
		private String vtepi;
		@Column(length=10000)
		private String iatarni;
		@Column(length=10000)
		private String mp;
		@Column(length=20)
		private String sus;
		@Column(length=10000)
		private String ige;
	
	
	//2023
		private Long cantidadBecadosIS2;
		private Long cantidadTotalBecadosIS2;
		
		
		
	
		

	public Long getCantidadTotalBecadosIS2() {
			return cantidadTotalBecadosIS2;
		}

		public void setCantidadTotalBecadosIS2(Long cantidadTotalBecadosIS2) {
			this.cantidadTotalBecadosIS2 = cantidadTotalBecadosIS2;
		}

	public Long getCantidadBecadosIS2() {
			return cantidadBecadosIS2;
		}

		public void setCantidadBecadosIS2(Long cantidadBecadosIS2) {
			this.cantidadBecadosIS2 = cantidadBecadosIS2;
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

	public String getPropositoAnual() {
		return propositoAnual;
	}

	public void setPropositoAnual(String propositoAnual) {
		this.propositoAnual = propositoAnual;
	}

	public String getIamp() {
		return iamp;
	}

	public void setIamp(String iamp) {
		this.iamp = iamp;
	}

	public String getQtam() {
	return qtam;
	}

	public void setQtam(String qtam) {
		this.qtam = qtam;
	}

	public EnumPBE getCompromisoAlumno() {
		return compromisoAlumno;
	}

	public void setCompromisoAlumno(EnumPBE compromisoAlumno) {
		this.compromisoAlumno = compromisoAlumno;
	}

	public EnumPBE getEsfuerzo() {
		return esfuerzo;
	}

	public void setEsfuerzo(EnumPBE esfuerzo) {
		this.esfuerzo = esfuerzo;
	}

	public EnumPBE getConducta() {
		return conducta;
	}

	public void setConducta(EnumPBE conducta) {
		this.conducta = conducta;
	}

	public EnumPBE getCompromisoRA() {
		return compromisoRA;
	}

	public void setCompromisoRA(EnumPBE compromisoRA) {
		this.compromisoRA = compromisoRA;
	}

	public EnumPBE getAsistenciaBecadoAEntrevistaPBE() {
		return asistenciaBecadoAEntrevistaPBE;
	}

	public void setAsistenciaBecadoAEntrevistaPBE(
			EnumPBE asistenciaBecadoAEntrevistaPBE) {
		this.asistenciaBecadoAEntrevistaPBE = asistenciaBecadoAEntrevistaPBE;
	}

	public EnumPBE getPresentacionMaterialPBE() {
		return presentacionMaterialPBE;
	}

	public void setPresentacionMaterialPBE(EnumPBE presentacionMaterialPBE) {
		this.presentacionMaterialPBE = presentacionMaterialPBE;
	}

	public EnumPBE getCompromisoAlumnoPBE() {
		return compromisoAlumnoPBE;
	}

	public void setCompromisoAlumnoPBE(EnumPBE compromisoAlumnoPBE) {
		this.compromisoAlumnoPBE = compromisoAlumnoPBE;
	}

	public EnumPBE getAsistenciaRAEntrevistaPBE() {
		return asistenciaRAEntrevistaPBE;
	}

	public void setAsistenciaRAEntrevistaPBE(EnumPBE asistenciaRAEntrevistaPBE) {
		this.asistenciaRAEntrevistaPBE = asistenciaRAEntrevistaPBE;
	}

	public EnumPBE getCompromisoRaPBE() {
		return compromisoRaPBE;
	}

	public void setCompromisoRaPBE(EnumPBE compromisoRaPBE) {
		this.compromisoRaPBE = compromisoRaPBE;
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

	public String getObsPersonales() {
		return obsPersonales;
	}

	public void setObsPersonales(String obsPersonales) {
		this.obsPersonales = obsPersonales;
	}

	public String getObsFamiliares() {
		return obsFamiliares;
	}

	public void setObsFamiliares(String obsFamiliares) {
		this.obsFamiliares = obsFamiliares;
	}

	public String getObsGenerales() {
		return obsGenerales;
	}

	public void setObsGenerales(String obsGenerales) {
		this.obsGenerales = obsGenerales;
	}

	public String getComentarios() {
		return comentarios;
	}

	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	public String getObsBoletin() {
		return obsBoletin;
	}

	public void setObsBoletin(String obsBoletin) {
		this.obsBoletin = obsBoletin;
	}

	public String getSuspensionesBeca() {
		return suspensionesBeca;
	}

	public void setSuspensionesBeca(String suspensionesBeca) {
		this.suspensionesBeca = suspensionesBeca;
	}

	@Override
	public String dameUrlVer() {
		return "/informeIS2/verDetalleIS2.do?idAlumno=";
	}	
	
	/**
	 * @return the cantidadBecados
	 */
	public Integer getCantidadBecados() {
		return cantidadBecados;
	}

	/**
	 * @param cantidadBecados the cantidadBecados to set
	 */
	public void setCantidadBecados(Integer cantidadBecados) {
		this.cantidadBecados = cantidadBecados;
	}
	
	/**
	 * @return the mensajePadrino
	 */
	public String getMensajePadrino() {
		return mensajePadrino;
	}

	/**
	 * @param mensajePadrino the mensajePadrino to set
	 */
	public void setMensajePadrino(String mensajePadrino) {
		this.mensajePadrino = mensajePadrino;
	}
	/**
	 * @return the materiasInteres
	 */
	public String getMateriasInteres() {
		return materiasInteres;
	}

	/**
	 * @param materiasInteres the materiasInteres to set
	 */
	public void setMateriasInteres(String materiasInteres) {
		this.materiasInteres = materiasInteres;
	}

	/**
	 * @return the materiasCuestan
	 */
	public String getMateriasCuestan() {
		return materiasCuestan;
	}

	/**
	 * @param materiasCuestan the materiasCuestan to set
	 */
	public void setMateriasCuestan(String materiasCuestan) {
		this.materiasCuestan = materiasCuestan;
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

	public Boletin getBoletinActual() {
		return boletinActual;
	}

	public void setBoletinActual(Boletin boletinActual) {
		this.boletinActual = boletinActual;
	}

	public Boolean getIncluirBoletinCheck() {
		return incluirBoletinCheck;
	}

	public void setIncluirBoletinCheck(Boolean incluirBoletinCheck) {
		this.incluirBoletinCheck = incluirBoletinCheck;
	}

	public String getOsme() {
		return osme;
	}

	public void setOsme(String osme) {
		this.osme = osme;
	}


	
	
}
