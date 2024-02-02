package org.cimientos.intranet.modelo.informe;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToMany;

import javax.persistence.OneToOne;


import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaIndividual;

import com.cimientos.intranet.enumerativos.EnumPBE;
import com.cimientos.intranet.enumerativos.Esfuerzo;
import com.cimientos.intranet.enumerativos.entrevista.Compromiso;

/**
 * @author msagarduy
 *
 */

@Entity
@DiscriminatorValue("informe_cesacion")
public class InformeCesacion extends Informe
{

	@OneToOne
	private EntrevistaIndividual ei;
	
	@Column(length=10000)
	private String mesCesacion;

	private Integer materiasAprobadas;
	
	private Integer materiasDesaprobadas;
	
	private Float inasistencias;
	
	@Column(length=10000)
	private String actividadAcompanamiento;

	@Column(length=10000)
	private String comentariosCesacion;
	
	@Enumerated(EnumType.ORDINAL)
	private Esfuerzo esfuerzo;
	
	@Enumerated(EnumType.ORDINAL)
	private Compromiso compromisoEscolaridad;
	
	@Enumerated(EnumType.ORDINAL)
	private Compromiso compromisoEscolaridadPBE;
	
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "compromiso_ra_cesacion")
	private Compromiso compromisoRa;
	
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "compromiso_rapbe_ic")
	private Compromiso compromisoRaPBE;
	
	@Enumerated(EnumType.ORDINAL)
	private EnumPBE asistenciaBecadoAEntrevista;
	
	@Enumerated(EnumType.ORDINAL)
	private EnumPBE asistenciaRAEntrevista;
	
	@Enumerated(EnumType.ORDINAL)
	private EnumPBE presentacionMaterial;
	
	@Column(length=10000)
	private String motivoCesacion;
	
	@Column(length=10000)
	private String detalle;
	
	@Enumerated(EnumType.ORDINAL)
	private EnumPBE conducta;
	
	@Column(length=10000)
	private String comentarios;
	
	private Integer edad;
	
	@Column(length=10000)
	private String detallePagosSuspendidos;

	@Column(length=10000)
	private String obsBoletin;
	
	@ManyToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
	private List<Boletin> boletinCiclo;
	
	private Boolean datosEstimadosCheck;
	
	private Boolean incluirBoletinCheck;
	
	@OneToOne
	private Boletin boletinActual;
	
	
	

	
	
	

	public Boletin getBoletinActual() {
		return boletinActual;
	}

	public void setBoletinActual(Boletin boletinActual) {
		this.boletinActual = boletinActual;
	}

	public EntrevistaIndividual getEi() {
		return ei;
	}
	
	public void setEi(EntrevistaIndividual ei) {
		this.ei = ei;
	}
	
	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edad) {
		this.edad = edad;
	}

	
	public String getMesCesacion() {
		return mesCesacion;
	}

	public void setMesCesacion(String mesCesacion) {
		this.mesCesacion = mesCesacion;
	}

	public EnumPBE getAsistenciaBecadoAEntrevista() {
		return asistenciaBecadoAEntrevista;
	}

	public void setAsistenciaBecadoAEntrevista(EnumPBE asistenciaBecadoAEntrevista) {
		this.asistenciaBecadoAEntrevista = asistenciaBecadoAEntrevista;
	}

	public EnumPBE getAsistenciaRAEntrevista() {
		return asistenciaRAEntrevista;
	}

	public void setAsistenciaRAEntrevista(EnumPBE asistenciaRAEntrevista) {
		this.asistenciaRAEntrevista = asistenciaRAEntrevista;
	}

	public EnumPBE getPresentacionMaterial() {
		return presentacionMaterial;
	}

	public void setPresentacionMaterial(EnumPBE presentacionMaterial) {
		this.presentacionMaterial = presentacionMaterial;
	}


	public Esfuerzo getEsfuerzo() {
		return esfuerzo;
	}

	public void setEsfuerzo(Esfuerzo esfuerzo) {
		this.esfuerzo = esfuerzo;
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

	public EnumPBE getConducta() {
		return conducta;
	}

	public void setConducta(EnumPBE conducta) {
		this.conducta = conducta;
	}

	public String getComentariosCesacion() {
		return comentariosCesacion;
	}

	public void setComentariosCesacion(String comentariosCesacion) {
		this.comentariosCesacion = comentariosCesacion;
	}


	public String getMotivoCesacion() {
		return motivoCesacion;
	}

	public void setMotivoCesacion(String motivoCesacion) {
		this.motivoCesacion = motivoCesacion;
	}

	public Compromiso getCompromisoEscolaridad() {
		return compromisoEscolaridad;
	}

	public void setCompromisoEscolaridad(Compromiso compromisoEscolaridad) {
		this.compromisoEscolaridad = compromisoEscolaridad;
	}

	

	public Compromiso getCompromisoEscolaridadPBE() {
		return compromisoEscolaridadPBE;
	}

	public void setCompromisoEscolaridadPBE(Compromiso compromisoEscolaridadPBE) {
		this.compromisoEscolaridadPBE = compromisoEscolaridadPBE;
	}

	public Compromiso getCompromisoRa() {
		return compromisoRa;
	}

	public void setCompromisoRa(Compromiso compromisoRa) {
		this.compromisoRa = compromisoRa;
	}

	public Compromiso getCompromisoRaPBE() {
		return compromisoRaPBE;
	}

	public void setCompromisoRaPBE(Compromiso compromisoRaPBE) {
		this.compromisoRaPBE = compromisoRaPBE;
	}

	@Override
	public String dameUrlVer() {
		//No hace nada, nunca llega aca!
		return null;
	}

	public String getDetallePagosSuspendidos() {
		return detallePagosSuspendidos;
	}

	public void setDetallePagosSuspendidos(String detallePagosSuspendidos) {
		this.detallePagosSuspendidos = detallePagosSuspendidos;
	}

	public String getObsBoletin() {
		return obsBoletin;
	}

	public void setObsBoletin(String obsBoletin) {
		this.obsBoletin = obsBoletin;
	}

	public Boolean getDatosEstimadosCheck() {
		return datosEstimadosCheck;
	}

	public void setDatosEstimadosCheck(Boolean datosEstimadosCheck) {
		this.datosEstimadosCheck = datosEstimadosCheck;
	}
	
	public Boolean getIncluirBoletinCheck(){
		return incluirBoletinCheck;
	}

	public void setIncluirBoletinCheck(Boolean incluirBoletinCheck) {
		this.incluirBoletinCheck = incluirBoletinCheck;
	}

	public List<Boletin> getBoletinCiclo() {
		return boletinCiclo;
	}

	public void setBoletinCiclo(List<Boletin> boletinCiclo) {
		this.boletinCiclo = boletinCiclo;
	}
}
