/**
 * 
 */
package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.List;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import com.cimientos.intranet.dto.MateriaDTO;

/**
 * @author plabaronnie
 *
 */
public class InformeIS1DTO {
	

	private String fechaAlta;
	
	private String cicloLectivo;
	
	private String ea;
	
	private String alumno;
	
	private String fechaNacimiento;
	
	private String fechaPBE;
	
	private String edad;
	
	private String localidad;
	
	private String responsable;
	
	private String anio;
	
	private String escuela;
	
	private String escuelaLocalidad;
	
	private String padrino;
	
	private String inasistenciasPrimerTrimestre;
	
	private String inasistenciasSegundoTrimestre;
	
	private String inasistenciasTercerTrimestre;
	
	private String inasistenciasFinal;
	
	private String escolaridadCompromisoAnterior;
	
	private String totalDiasPrimero;
	
	private String totalDiasSeg;
	
	private String totalDiasTerc;
	
	private String totalDiasFinal;
	
	private String propositoAnioComienza;
	
	private String actividadesVacaciones;
	
	private String expectativasRA;
	
	private String utilizacionBeca;
	
	private String observacionesEntrevistaRenovacion; 
	
	private List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
	
	private String pathImg;
	
	private String informacionSuspension;
	
	private String relacion;
	
	private String situacionEscolar;
	
	private String estadoRenovacion;
	
	private String propositoAnioComienzaList;
	
	private String gustosTiempoLibre;
	
	private String anioEscolar;
	
	private String anioEgreso;
	
	private String eae;
	
	private List<MateriaDTO> previas = new ArrayList<MateriaDTO>();
	
	//2018
	
	private String informacionEscuela;
	private String espacioEscuela;
	private String hSE;
	private String mailEA;
	
	//2021
	private String titulo;
	private String footer;
	private String foto;
	private String observacionesExcepcion;
	private String matriculaTotal;
	private String orientacion;
	private String descripcionEscuela;
	private String anioIncorporacion;
	
	
	
	
	
	

	public String getAnioIncorporacion() {
		return anioIncorporacion;
	}

	public void setAnioIncorporacion(String anioIncorporacion) {
		this.anioIncorporacion = anioIncorporacion;
	}

	public String getMatriculaTotal() {
		return matriculaTotal;
	}

	public void setMatriculaTotal(String matriculaTotal) {
		this.matriculaTotal = matriculaTotal;
	}

	public String getOrientacion() {
		return orientacion;
	}

	public void setOrientacion(String orientacion) {
		this.orientacion = orientacion;
	}

	public String getDescripcionEscuela() {
		return descripcionEscuela;
	}

	public void setDescripcionEscuela(String descripcionEscuela) {
		this.descripcionEscuela = descripcionEscuela;
	}

	public String getObservacionesExcepcion() {
		return observacionesExcepcion;
	}

	public void setObservacionesExcepcion(String observacionesExcepcion) {
		this.observacionesExcepcion = observacionesExcepcion;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getFooter() {
		return footer;
	}

	public void setFooter(String footer) {
		this.footer = footer;
	}

	public String getMailEA() {
		return mailEA;
	}

	public void setMailEA(String mailEA) {
		this.mailEA = mailEA;
	}

		public String getInformacionEscuela() {
		return informacionEscuela;
	}

	public void setInformacionEscuela(String informacionEscuela) {
		this.informacionEscuela = informacionEscuela;
	}

	public String getEspacioEscuela() {
		return espacioEscuela;
	}

	public void setEspacioEscuela(String espacioEscuela) {
		this.espacioEscuela = espacioEscuela;
	}

	public String gethSE() {
		return hSE;
	}

	public void sethSE(String hSE) {
		this.hSE = hSE;
	}

		public String getEae() {
		return eae;
	}

	public void setEae(String eae) {
		this.eae = eae;
	}

		/**
	 * @return the cicloLectivo
	 */
	public String getCicloLectivo() {
		return cicloLectivo;
	}

	/**
	 * @param cicloLectivo the cicloLectivo to set
	 */
	public void setCicloLectivo(String cicloLectivo) {
		this.cicloLectivo = cicloLectivo;
	}

	
	public String getFechaPBE() {
		return fechaPBE;
	}

	public void setFechaPBE(String fechaPBE) {
		this.fechaPBE = fechaPBE;
	}

	/**
	 * @return the fechaNacimiento
	 */
	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	/**
	 * @param fechaNacimiento the fechaNacimiento to set
	 */
	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	/**
	 * @return the edad
	 */
	public String getEdad() {
		return edad;
	}

	/**
	 * @param edad the edad to set
	 */
	public void setEdad(String edad) {
		this.edad = edad;
	}

	/**
	 * @return the localidad
	 */
	public String getLocalidad() {
		return localidad;
	}

	/**
	 * @param localidad the localidad to set
	 */
	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	

	public String getAlumno() {
		//System.out.println(alumno);
		return alumno;
		
	}

	public void setAlumno(String alumno) {
		//System.out.println(alumno);
		this.alumno = alumno;
	}

	public String getResponsable() {
		return responsable;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	/**
	 * @return the anio
	 */
	public String getAnio() {
		return anio;
	}

	/**
	 * @param anio the anio to set
	 */
	public void setAnio(String anio) {
		this.anio = anio;
	}

	/**
	 * @return the escuela
	 */
	public String getEscuela() {
		return escuela;
	}

	/**
	 * @param escuela the escuela to set
	 */
	public void setEscuela(String escuela) {
		this.escuela = escuela;
	}

	/**
	 * @return the escuelaLocalidad
	 */
	public String getEscuelaLocalidad() {
		return escuelaLocalidad;
	}

	/**
	 * @param escuelaLocalidad the escuelaLocalidad to set
	 */
	public void setEscuelaLocalidad(String escuelaLocalidad) {
		this.escuelaLocalidad = escuelaLocalidad;
	}
	/**
	 * @return the padrino
	 */
	public String getPadrino() {
		return padrino;
	}

	/**
	 * @param padrino the padrino to set
	 */
	public void setPadrino(String padrino) {
		this.padrino = padrino;
	}
	
	/**
	 * @return
	 */
	public String getInasistenciasPrimerTrimestre() {
		return inasistenciasPrimerTrimestre;
	}

	/**
	 * @param inasistenciasPrimerTrimestre
	 */
	public void setInasistenciasPrimerTrimestre(String inasistenciasPrimerTrimestre) {
		this.inasistenciasPrimerTrimestre = inasistenciasPrimerTrimestre;
	}

	/**
	 * @return
	 */
	public String getInasistenciasSegundoTrimestre() {
		return inasistenciasSegundoTrimestre;
	}

	/**
	 * @param inasistenciasSegundoTrimestre
	 */
	public void setInasistenciasSegundoTrimestre(
			String inasistenciasSegundoTrimestre) {
		this.inasistenciasSegundoTrimestre = inasistenciasSegundoTrimestre;
	}

	/**
	 * @return
	 */
	public String getInasistenciasTercerTrimestre() {
		return inasistenciasTercerTrimestre;
	}

	/**
	 * @param inasistenciasTercerTrimestre
	 */
	public void setInasistenciasTercerTrimestre(String inasistenciasTercerTrimestre) {
		this.inasistenciasTercerTrimestre = inasistenciasTercerTrimestre;
	}

	/**
	 * @return the escolaridadCompromisoAnterior
	 */
	public String getEscolaridadCompromisoAnterior() {
		return escolaridadCompromisoAnterior;
	}

	/**
	 * @param escolaridadCompromisoAnterior the escolaridadCompromisoAnterior to set
	 */
	public void setEscolaridadCompromisoAnterior(
			String escolaridadCompromisoAnterior) {
		this.escolaridadCompromisoAnterior = escolaridadCompromisoAnterior;
	}

	/**
	 * @return the propositoAnioComienza
	 */
	public String getPropositoAnioComienza() {
		return propositoAnioComienza;
	}

	/**
	 * @param propositoAnioComienza the propositoAnioComienza to set
	 */
	public void setPropositoAnioComienza(String propositoAnioComienza) {
		this.propositoAnioComienza = propositoAnioComienza;
	}

	/**
	 * @return the actividadesVacaciones
	 */
	public String getActividadesVacaciones() {
		return actividadesVacaciones;
	}

	/**
	 * @param actividadesVacaciones the actividadesVacaciones to set
	 */
	public void setActividadesVacaciones(String actividadesVacaciones) {
		this.actividadesVacaciones = actividadesVacaciones;
	}

	/**
	 * @return the expectativasRA
	 */
	public String getExpectativasRA() {
		return expectativasRA;
	}

	/**
	 * @param expectativasRA the expectativasRA to set
	 */
	public void setExpectativasRA(String expectativasRA) {
		this.expectativasRA = expectativasRA;
	}

	/**
	 * @return the utilizacionBeca
	 */
	public String getUtilizacionBeca() {
		return utilizacionBeca;
	}

	/**
	 * @param utilizacionBeca the utilizacionBeca to set
	 */
	public void setUtilizacionBeca(String utilizacionBeca) {
		this.utilizacionBeca = utilizacionBeca;
	}
	
	/**
	 * @return the fechaAlta
	 */
	public String getFechaAlta() {
		return fechaAlta;
	}

	/**
	 * @param fechaAlta the fechaAlta to set
	 */
	public void setFechaAlta(String fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	/**
	 * @return the observacionesEntrevistaRenovacion
	 */
	public String getObservacionesEntrevistaRenovacion() {
		return observacionesEntrevistaRenovacion;
	}

	/**
	 * @param observacionesEntrevistaRenovacion the observacionesEntrevistaRenovacion to set
	 */
	public void setObservacionesEntrevistaRenovacion(
			String observacionesEntrevistaRenovacion) {
		this.observacionesEntrevistaRenovacion = observacionesEntrevistaRenovacion;
	}



	public String getEa() {
		return ea;
	}

	public void setEa(String ea) {
		this.ea = ea;
	}

	public String getPathImg() {
		return pathImg;
	}

	public void setPathImg(String pathImg) {
		this.pathImg = pathImg;
	}

	public List<MateriaDTO> getMateriasDto() {
		return materias;
	}

	public void setMateriasDto(List<MateriaDTO> materias) {
		this.materias = materias;
	}
	
	public JRDataSource getMaterias()   
    {       
        return new JRBeanCollectionDataSource(materias);   
    }

	public String getInasistenciasFinal() {
		return inasistenciasFinal;
	}

	public void setInasistenciasFinal(String inasistenciasFinal) {
		this.inasistenciasFinal = inasistenciasFinal;
	}

	public String getTotalDiasPrimero() {
		return totalDiasPrimero;
	}

	public void setTotalDiasPrimero(String totalDiasPrimero) {
		this.totalDiasPrimero = totalDiasPrimero;
	}

	public String getTotalDiasSeg() {
		return totalDiasSeg;
	}

	public void setTotalDiasSeg(String totalDiasSeg) {
		this.totalDiasSeg = totalDiasSeg;
	}

	public String getTotalDiasTerc() {
		return totalDiasTerc;
	}

	public void setTotalDiasTerc(String totalDiasTerc) {
		this.totalDiasTerc = totalDiasTerc;
	}

	public String getTotalDiasFinal() {
		return totalDiasFinal;
	}

	public void setTotalDiasFinal(String totalDiasFinal) {
		this.totalDiasFinal = totalDiasFinal;
	}

	public String getInformacionSuspension() {
		return informacionSuspension;
	}

	public void setInformacionSuspension(String informacionSuspension) {
		this.informacionSuspension = informacionSuspension;
	}

	public String getRelacion() {
		return relacion;
	}

	public void setRelacion(String relacion) {
		this.relacion = relacion;
	}

	public String getSituacionEscolar() {
		return situacionEscolar;
	}

	public void setSituacionEscolar(String situacionEscolar) {
		this.situacionEscolar = situacionEscolar;
	}

	public String getEstadoRenovacion() {
		return estadoRenovacion;
	}

	public void setEstadoRenovacion(String estadoRenovacion) {
		this.estadoRenovacion = estadoRenovacion;
	}

	public String getPropositoAnioComienzaList() {
		return propositoAnioComienzaList;
	}

	public void setPropositoAnioComienzaList(String propositoAnioComienzaList) {
		this.propositoAnioComienzaList = propositoAnioComienzaList;
	}

	public String getGustosTiempoLibre() {
		return gustosTiempoLibre;
	}

	public void setGustosTiempoLibre(String gustosTiempoLibre) {
		this.gustosTiempoLibre = gustosTiempoLibre;
	}

	public List<MateriaDTO> getPreviasDTO() {
		return previas;
	}

	public void setPreviasDTO(List<MateriaDTO> previas) {
		this.previas = previas;
	} 
	
	public JRDataSource getPrevias(){       
        return new JRBeanCollectionDataSource(previas);   
    }
	
public String getAnioEgreso() {
		
		//long posibleAnioEgreso=0;
		//long anioAdicional=0;
		//if (is2.getAnioAdicional()=="No"){
		//	anioAdicional=1;
		//}
		//posibleAnioEgreso=7-anioAdicional-Long.parseLong(this.anio.substring(0, 1));
		//posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+posibleAnioEgreso;	
		//this.anioEgreso=String.valueOf(posibleAnioEgreso);
		//System.out.println(this.anioEgreso);
		
		return anioEgreso;
	}

public void setAnioEgreso(long anioEgreso,boolean anioAdicional) {		
	long posibleAnioEgreso=0;
	if (anioAdicional!=false){
		//System.out.println("con año adicional");
		if(this.eae.equals("7/5")){
			if (this.anio.equals("7º primaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+6;
			}
			if (this.anio.equals("1º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+5;
			}
			if (this.anio.equals("2º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+4;
			}
			if (this.anio.equals("3º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+3;
			}
			if (this.anio.equals("4º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+2;
			}
			if (this.anio.equals("5º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+1;
			}
			if (this.anio.equals("6º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+0;
			}
		}
		if(this.eae.equals("6/6")){				
			if (this.anio.equals("1º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+6;
			}
			if (this.anio.equals("2º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+5;
			}
			if (this.anio.equals("3º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+4;
			}
			if (this.anio.equals("4º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+3;
			}
			if (this.anio.equals("5º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+2;
			}
			if (this.anio.equals("6º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+1;
			}
			if (this.anio.equals("7º técnica")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+0;
			}
		}
	}
	else{
		//System.out.println("sin año adicional");
		if(this.eae.equals("7/5")){
			if (this.anio.equals("7º primaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+5;
			}
			if (this.anio.equals("1º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+4;
			}
			if (this.anio.equals("2º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+3;
			}
			if (this.anio.equals("3º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+2;
			}
			if (this.anio.equals("4º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+1;
			}
			if (this.anio.equals("5º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+0;
			}
		}
		if(this.eae.equals("6/6")){				
			if (this.anio.equals("1º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+5;
			}
			if (this.anio.equals("2º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+4;
			}
			if (this.anio.equals("3º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+3;
			}
			if (this.anio.equals("4º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+2;
			}
			if (this.anio.equals("5º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+1;
			}
			if (this.anio.equals("6º secundaria")){
				posibleAnioEgreso=Long.parseLong(this.cicloLectivo)+0;
			}
		}
		
	}
	this.anioEgreso=String.valueOf(posibleAnioEgreso);
	//System.out.println(this.anioEgreso);
}

}
