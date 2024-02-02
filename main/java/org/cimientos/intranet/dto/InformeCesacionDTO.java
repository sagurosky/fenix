package org.cimientos.intranet.dto;

import java.util.ArrayList;
import java.util.List;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import com.cimientos.intranet.dto.*;


public class InformeCesacionDTO {

	private String alumno;
	
	/** The date. */
	private String fechaNacimiento;
	
	private String edad;
	
	private String anioActual;
	
	private String ea;
	
	private String fechaAlta;
	
	private String localidad;
	
	private String responsable;

	private String anio;
	
	private String escuela;
	
	private String escuelaLocalidad;
	
	private String padrino;

	private String datosEstimadosBoletin;
	
	private String compromisoAlumno;
	
	private String esfuerzo;
	
	private String conducta;
	
	private String compromisoRa;
	
	private String asistenciaBecadoAEntrevista;
	
	private String presentacionMaterial;
	
	private String asistenciaRAEntrevista;
	
	private String actividadAcompanamiento;
	
	private String detalle;
	
	private String mesCesacion;
	
	private String motivoCesacion;
	
	private String fechaPBE;
	
	private String comentarios;
	
	private String comentariosCesacion;
	
	private String observaciones;
	
	private String pathImg;
	
	private String inasistenciasPrimerTrimestre;
	
	private String inasistenciasSegundoTrimestre;
	
	private String inasistenciasTercerTrimestre;
	
	private String inasistenciasFinal;
	
	private String totalDiasPrimero;
	
	private String totalDiasSeg;
	
	private String totalDiasTerc;
	
	private String totalDiasFinal;
	
	private List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
	
	private String suspensiones;
	
	private String relacion;
	
	private List<MateriaDTO> previas = new ArrayList<MateriaDTO>();
	
	private String  fechaReincorporacionPBE;
	
	
	//2018
	private String mailEA;
	
	
	
	public String getMailEA() {
		return mailEA;
	}

	public void setMailEA(String mailEA) {
		this.mailEA = mailEA;
	}

	public String getFechaPBE() {
		return fechaPBE;
	}

	public void setFechaPBE(String fechaPBE) {
		this.fechaPBE = fechaPBE;
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

	public String getEscuela() {
		return escuela;
	}

	public void setEscuela(String escuela) {
		this.escuela = escuela;
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

	public String getDatosEstimadosBoletin() {
		return datosEstimadosBoletin;
	}

	public void setDatosEstimadosBoletin(String datosEstimadosBoletin) {
		this.datosEstimadosBoletin = datosEstimadosBoletin;
	}

	public String getCompromisoAlumno() {
		return compromisoAlumno;
	}

	public void setCompromisoAlumno(String compromisoAlumno) {
		this.compromisoAlumno = compromisoAlumno;
	}

	public String getEsfuerzo() {
		return esfuerzo;
	}

	public void setEsfuerzo(String esfuerzo) {
		this.esfuerzo = esfuerzo;
	}

	public String getConducta() {
		return conducta;
	}

	public void setConducta(String conducta) {
		this.conducta = conducta;
	}

	public String getCompromisoRa() {
		return compromisoRa;
	}

	public void setCompromisoRa(String compromisoRa) {
		this.compromisoRa = compromisoRa;
	}

	public String getAsistenciaBecadoAEntrevista() {
		return asistenciaBecadoAEntrevista;
	}

	public void setAsistenciaBecadoAEntrevista(String asistenciaBecadoAEntrevista) {
		this.asistenciaBecadoAEntrevista = asistenciaBecadoAEntrevista;
	}

	public String getPresentacionMaterial() {
		return presentacionMaterial;
	}

	public void setPresentacionMaterial(String presentacionMaterial) {
		this.presentacionMaterial = presentacionMaterial;
	}

	public String getAsistenciaRAEntrevista() {
		return asistenciaRAEntrevista;
	}

	public void setAsistenciaRAEntrevista(String asistenciaRAEntrevista) {
		this.asistenciaRAEntrevista = asistenciaRAEntrevista;
	}

	public String getActividadAcompanamiento() {
		return actividadAcompanamiento;
	}

	public void setActividadAcompanamiento(String actividadAcompanamiento) {
		this.actividadAcompanamiento = actividadAcompanamiento;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	public String getMesCesacion() {
		return mesCesacion;
	}

	public void setMesCesacion(String mesCesacion) {
		this.mesCesacion = mesCesacion;
	}

	public String getMotivoCesacion() {
		return motivoCesacion;
	}

	public void setMotivoCesacion(String motivoCesacion) {
		this.motivoCesacion = motivoCesacion;
	}

	public String getComentarios() {
		return comentarios;
	}

	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
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

	public String getAnioActual() {
		return anioActual;
	}

	public void setAnioActual(String anioActual) {
		this.anioActual = anioActual;
	}
	
	public JRDataSource getBoletin()   
    {       
        return new JRBeanCollectionDataSource(materias);   
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

	public List<MateriaDTO> getMaterias() {
		return materias;
	}

	public void setMaterias(List<MateriaDTO> materias) {
		this.materias = materias;
	}

	public String getSuspensiones() {
		return suspensiones;
	}

	public void setSuspensiones(String suspensiones) {
		this.suspensiones = suspensiones;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getComentariosCesacion() {
		return comentariosCesacion;
	}

	public void setComentariosCesacion(String comentariosCesacion) {
		this.comentariosCesacion = comentariosCesacion;
	}

	public String getRelacion() {
		return relacion;
	}

	public void setRelacion(String relacion) {
		this.relacion = relacion;
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

	public String getFechaReincorporacionPBE() {
		return fechaReincorporacionPBE;
	}

	public void setFechaReincorporacionPBE(String fechaReincorporacionPBE) {
		this.fechaReincorporacionPBE = fechaReincorporacionPBE;
	}
	
}
