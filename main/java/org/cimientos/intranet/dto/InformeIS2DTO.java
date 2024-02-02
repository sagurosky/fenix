package org.cimientos.intranet.dto;

import java.util.ArrayList;
import java.util.List;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import com.cimientos.intranet.dto.MateriaDTO;


/**
 * @author msagarduy
 *
 */
public class InformeIS2DTO {
	
	private String anioActual;
	
	private String cicloLectivo;
	
	/** The date. */
	private String fechaNacimiento;
	
	private String alumno;
	
	private String edad;
	
	private String fechaAlta;
	
	private String localidad;
	
	private String responsable;

	private String anio;
	
	private String ea;

	private String escuelaLocalidad;
	
	private String padrino;
	
	private String actividadAcompanamiento;
		
	private String fechaPBE;	
	
	private String pathImg;
	
	private String relacion;
	
	private String imagenCiclo;
	
	private String foto;
	
	private String titulo;
	
	private String nombreEscuela;
	
	private String implementacionPrograma;
	
	private String matriculaTotal;
	
	private String porcentajeInasistencia;
	
	private String textoEscuela;
	
	private String modalidadTrabajoEscuela;
	
	private String cantidadBecados;
	
	private String pathImgEscuela;
	
	private String mensajePadrino;
	
	private String materiasDesaprobadas;
	
	private String inasistencias;

	private String primerMateriaInteres;
	
	private String segundaMateriaInteres;
	
	private String tercerMateriaInteres;
	
	private String primerMateriaCuesta;
		
	private String segundaMateriaCuesta; 
	
	private String tercerMateriaCuesta;
	
	private String  fechaReincorporacionPBE;
	
	private String anioEgreso;
	
	private String eae;
	
	private String mailEA;
	
	private String hsTrabajarAño;
	
	private String sarpepe;
	
	private String qtam;
	
	private String osme;
	
	private List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
	
	private List<MateriaDTO> previas = new ArrayList<MateriaDTO>();
	
	private String inasistenciasPrimerTrimestre;
	
	private String inasistenciasSegundoTrimestre;
	
	private String inasistenciasTercerTrimestre;
	
	private String inasistenciasFinal;
	
	private String totalDiasPrimero;
	
	private String totalDiasSeg;
	
	private String totalDiasTerc;
	
	private String totalDiasFinal;
	
	private String footer;
	
	private String incluirBoletin;
	
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
	private String ige;
	private String iatarni;
	private String cantidadBecadosIS2;
	private String cantidadTotalBecadosIS2;
	
	
	

	

	public String getCantidadTotalBecadosIS2() {
		return cantidadTotalBecadosIS2;
	}

	public void setCantidadTotalBecadosIS2(String cantidadTotalBecadosIS2) {
		this.cantidadTotalBecadosIS2 = cantidadTotalBecadosIS2;
	}

	public String getCantidadBecadosIS2() {
		return cantidadBecadosIS2;
	}

	public void setCantidadBecadosIS2(String cantidadBecadosIS2) {
		this.cantidadBecadosIS2 = cantidadBecadosIS2;
	}

	public String getIatarni() {
		return iatarni;
	}

	public void setIatarni(String iatarni) {
		this.iatarni = iatarni;
	}

	public String getIge() {
		return ige;
	}

	public void setIge(String ige) {
		this.ige = ige;
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

	public String getPaa() {
		return paa;
	}

	public void setPaa(String paa) {
		this.paa = paa;
	}

	public String getTarang() {
		return tarang;
	}

	public void setTarang(String tarang) {
		this.tarang = tarang;
	}

	public String getIncluirBoletin() {
		return incluirBoletin;
	}

	public void setIncluirBoletin(String incluirBoletin) {
		this.incluirBoletin = incluirBoletin;
	}

	public String getFooter() {
		return footer;
	}

	public void setFooter(String footer) {
		this.footer = footer;
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

	public String getInasistenciasPrimerTrimestre() {
		return inasistenciasPrimerTrimestre;
	}

	public void setInasistenciasPrimerTrimestre(String inasistenciasPrimerTrimestre) {
		this.inasistenciasPrimerTrimestre = inasistenciasPrimerTrimestre;
	}

	public String getInasistenciasSegundoTrimestre() {
		return inasistenciasSegundoTrimestre;
	}

	public void setInasistenciasSegundoTrimestre(
			String inasistenciasSegundoTrimestre) {
		this.inasistenciasSegundoTrimestre = inasistenciasSegundoTrimestre;
	}

	public String getInasistenciasTercerTrimestre() {
		return inasistenciasTercerTrimestre;
	}

	public void setInasistenciasTercerTrimestre(String inasistenciasTercerTrimestre) {
		this.inasistenciasTercerTrimestre = inasistenciasTercerTrimestre;
	}

	public String getInasistenciasFinal() {
		return inasistenciasFinal;
	}

	public void setInasistenciasFinal(String inasistenciasFinal) {
		this.inasistenciasFinal = inasistenciasFinal;
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

	public void setAnioEgreso(String anioEgreso) {
		this.anioEgreso = anioEgreso;
	}

	public String getMailEA() {
		return mailEA;
	}

	public void setMailEA(String mailEA) {
		this.mailEA = mailEA;
	}

	public String getEae() {
		return eae;
	}

	public void setEae(String eae) {
		this.eae = eae;
	}

	public String getAnioActual() {
		return anioActual;
	}

	public void setAnioActual(String anioActual) {
		this.anioActual = anioActual;
	}

	public String getFechaPBE() {
		return fechaPBE;
	}

	public void setFechaPBE(String fechaPBE) {
		this.fechaPBE = fechaPBE;
	}

	public String getNombre() {
		return alumno;
	}

	public void setNombre(String nombre) {
		this.alumno = nombre;
	}

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getEdad() {
		return edad;
	}

	public void setEdad(String edad) {
		this.edad = edad;
	}

	public String getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(String fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}


	public String getAlumno() {
		return alumno;
	}

	public void setAlumno(String alumno) {
		this.alumno = alumno;
	}

	public String getResponsable() {
		return responsable;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	public String getAnio() {
		return anio;
	}

	public void setAnio(String anio) {
		this.anio = anio;
	}

	public String getEscuelaLocalidad() {
		return escuelaLocalidad;
	}

	public void setEscuelaLocalidad(String escuelaLocalidad) {
		this.escuelaLocalidad = escuelaLocalidad;
	}

	public String getPadrino() {
		return padrino;
	}

	public void setPadrino(String padrino) {
		this.padrino = padrino;
	}	

	public String getActividadAcompanamiento() {
		return actividadAcompanamiento;
	}

	public void setActividadAcompanamiento(String actividadAcompanamiento) {
		this.actividadAcompanamiento = actividadAcompanamiento;
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

	public String getCicloLectivo() {
		return cicloLectivo;
	}

	public void setCicloLectivo(String cicloLectivo) {
		this.cicloLectivo = cicloLectivo;
	}	

	public String getRelacion() {
		return relacion;
	}

	public void setRelacion(String relacion) {
		this.relacion = relacion;
	}

	public String getImagenCiclo() {
		return imagenCiclo;
	}

	public void setImagenCiclo(String imagenCiclo) {
		this.imagenCiclo = imagenCiclo;
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

	public String getNombreEscuela() {
		return nombreEscuela;
	}

	public void setNombreEscuela(String nombreEscuela) {
		this.nombreEscuela = nombreEscuela;
	}

	public String getCantidadBecados() {
		return cantidadBecados;
	}

	public void setCantidadBecados(String cantidadBecados) {
		this.cantidadBecados = cantidadBecados;
	}

		public String getImplementacionPrograma() {
		return implementacionPrograma;
	}

	public void setImplementacionPrograma(String implementacionPrograma) {
		this.implementacionPrograma = implementacionPrograma;
	}

	public String getMatriculaTotal() {
		return matriculaTotal;
	}

	public void setMatriculaTotal(String matriculaTotal) {
		this.matriculaTotal = matriculaTotal;
	}

	public String getPorcentajeInasistencia() {
		return porcentajeInasistencia;
	}

	public void setPorcentajeInasistencia(String porcentajeInasistencia) {
		this.porcentajeInasistencia = porcentajeInasistencia;
	}

	public String getTextoEscuela() {
		return textoEscuela;
	}

	public void setTextoEscuela(String textoEscuela) {
		this.textoEscuela = textoEscuela;
	}
	
	public String getModalidadTrabajoEscuela() {
		return modalidadTrabajoEscuela;
	}

	public void setModalidadTrabajoEscuela(String modalidadTrabajoEscuela) {
		this.modalidadTrabajoEscuela = modalidadTrabajoEscuela;
	}

	public String getPathImgEscuela() {
		return pathImgEscuela;
	}

	public void setPathImgEscuela(String pathImgEscuela) {
		this.pathImgEscuela = pathImgEscuela;
	}
	
	public String getMensajePadrino() {
		return mensajePadrino;
	}
	
	public void setMensajePadrino(String mensajePadrino) {
		this.mensajePadrino = mensajePadrino;
	}

		public String getMateriasDesaprobadas() {
		return materiasDesaprobadas;
	}

	public void setMateriasDesaprobadas(String materiasAprobadas) {
		this.materiasDesaprobadas = materiasAprobadas;
	}
	
	public String getInasistencias() {
		return inasistencias;
	}
	
	public void setInasistencias(String inasistencias) {
		this.inasistencias = inasistencias;
	}

	public String getPrimerMateriaInteres() {
		return primerMateriaInteres;
	}
	
	public void setPrimerMateriaInteres(String primerMateriaInteres) {
		this.primerMateriaInteres = primerMateriaInteres;
	}

	public String getSegundaMateriaInteres() {
		return segundaMateriaInteres;
	}

	public void setSegundaMateriaInteres(String segundaMateriaInteres) {
		this.segundaMateriaInteres = segundaMateriaInteres;
	}
	
	public String getTercerMateriaInteres() {
		return tercerMateriaInteres;
	}

	
	public void setTercerMateriaInteres(String tercerMateriaInteres) {
		this.tercerMateriaInteres = tercerMateriaInteres;
	}
	
	public String getPrimerMateriaCuesta() {
		return primerMateriaCuesta;
	}
	
	public void setPrimerMateriaCuesta(String primerMateriaCuesta) {
		this.primerMateriaCuesta = primerMateriaCuesta;
	}
	
	public String getSegundaMateriaCuesta() {
		return segundaMateriaCuesta;
	}

	public void setSegundaMateriaCuesta(String segundaMateriaCuesta) {
		this.segundaMateriaCuesta = segundaMateriaCuesta;
	}
	
	public String getTercerMateriaCuesta() {
		return tercerMateriaCuesta;
	}
	
	public void setTercerMateriaCuesta(String terceraMateriaCuesta) {
		this.tercerMateriaCuesta = terceraMateriaCuesta;
	}

	public String getFechaReincorporacionPBE() {
		return fechaReincorporacionPBE;
	}

	public void setFechaReincorporacionPBE(String fechaReincorporacionPBE) {
		this.fechaReincorporacionPBE = fechaReincorporacionPBE;
	}

	public String getAnioEgreso() {			
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
