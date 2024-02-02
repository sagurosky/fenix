package org.cimientos.intranet.dto;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.web.controller.MateriaPreviaDTO;

import com.cimientos.intranet.dto.MateriaDTO;

public class BoletinDTO {

	private Long idAlumno;

	private String apellidoAlumno;
	
	private String nombreAlumno;	
	
	private String dni;
	
	private String fechaNacimiento;
	
	private Integer edad;
	
	private String anioEscolar;
	
	private String anioAdicional;
	
	private Long idEscuela;
	
	private String escuelaNombre;
	
	private String escuelaLocalidad;
	
	private String responsable;
	
	private String vinculo;
	
	private String fechaPBE;	
	
	private String fechaReincorporacionPBE;
	
	private String rr;
	
	private String ea;
	
	private String tipoPadrino;
	
	private String padrino;
	
	private Boolean existeBoletin;
	
	private String cicloBoletin;
	
	private String anioEscolarBoletin;
	
	private List<MateriaDTO> materias = new ArrayList<MateriaDTO>();	
	
	private List<MateriaDTO> previas = new ArrayList<MateriaDTO>();
	
	private List<Boletin> boletin = new ArrayList<Boletin>();
	
	private List<MateriaPreviaDTO> materiasPrevias = new ArrayList<MateriaPreviaDTO>();
	
	private String conductaB;
	
	private String diasHabiles;
	
	private Float diasHabilesFinales;
	
	private String inasistencias;
	
	private Float inasistencasFinales;
	
	private String eae;
	
	

	
	
	public String getEae() {
		return eae;
	}

	public void setEae(String eae) {
		this.eae = eae;
	}

	public List<MateriaDTO> getPreviasDTO() {
		return previas;
	}

	public void setPreviasDTO(List<MateriaDTO> previas) {
		this.previas = previas;
	} 
	
	public List<MateriaPreviaDTO> getMateriasPrevias() {
		return materiasPrevias;
	}

	public void setMateriasPrevias(List<MateriaPreviaDTO> materiasPrevias) {
		this.materiasPrevias = materiasPrevias;
	}

	public List<MateriaDTO> getMaterias() {
		return materias;
	}

	public void setMaterias(List<MateriaDTO> materias) {
		this.materias = materias;
	}
	
	public List<Boletin> getBoletin() {
		return boletin;
	}

	public void setBoletin(List<Boletin> boletin) {
		this.boletin = boletin;
	}	

	public List<MateriaDTO> getMateriasDto() {
		return materias;
	}

	public void setMateriasDto(List<MateriaDTO> materias) {
		this.materias = materias;
	}

	public Long getIdAlumno() {
		return idAlumno;
	}

	public void setIdAlumno(Long idAlumno) {
		this.idAlumno = idAlumno;
	}

	public String getApellidoAlumno() {
		return apellidoAlumno;
	}

	public void setApellidoAlumno(String apellidoAlumno) {
		this.apellidoAlumno = apellidoAlumno;
	}

	public String getNombreAlumno() {
		return nombreAlumno;
	}

	public void setNombreAlumno(String nombreAlumno) {
		this.nombreAlumno = nombreAlumno;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edad) {
		this.edad = edad;
	}

	public String getAnioEscolar() {
		return anioEscolar;
	}

	public void setAnioEscolar(String anioEscolar) {
		this.anioEscolar = anioEscolar;
	}

	public String getAnioAdicional() {
		return anioAdicional;
	}

	public void setAnioAdicional(String anioAdicional) {
		this.anioAdicional = anioAdicional;
	}

	public String getEscuelaNombre() {
		return escuelaNombre;
	}

	public void setEscuelaNombre(String escuelaNombre) {
		this.escuelaNombre = escuelaNombre;
	}

	public String getEscuelaLocalidad() {
		return escuelaLocalidad;
	}

	public void setEscuelaLocalidad(String escuelaLocalidad) {
		this.escuelaLocalidad = escuelaLocalidad;
	}

	public String getResponsable() {
		return responsable;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	public String getVinculo() {
		return vinculo;
	}

	public void setVinculo(String vinculo) {
		this.vinculo = vinculo;
	}

	public String getFechaPBE() {
		return fechaPBE;
	}

	public void setFechaPBE(String fechaPBE) {
		this.fechaPBE = fechaPBE;
	}

	public String getFechaReincorporacionPBE() {
		return fechaReincorporacionPBE;
	}

	public void setFechaReincorporacionPBE(String fechaReincorporacionPBE) {
		this.fechaReincorporacionPBE = fechaReincorporacionPBE;
	}

	public String getRr() {
		return rr;
	}

	public void setRr(String rr) {
		this.rr = rr;
	}

	public String getEa() {
		return ea;
	}

	public void setEa(String ea) {
		this.ea = ea;
	}

	public String getTipoPadrino() {
		return tipoPadrino;
	}

	public void setTipoPadrino(String tipoPadrino) {
		this.tipoPadrino = tipoPadrino;
	}

	public String getPadrino() {
		return padrino;
	}

	public void setPadrino(String padrino) {
		this.padrino = padrino;
	}

	public Boolean getExisteBoletin() {
		return existeBoletin;
	}

	public void setExisteBoletin(Boolean existeBoletin) {
		this.existeBoletin = existeBoletin;
	}

	public String getCicloBoletin() {
		return cicloBoletin;
	}

	public void setCicloBoletin(String cicloBoletin) {
		this.cicloBoletin = cicloBoletin;
	}

	public String getAnioEscolarBoletin() {
		return anioEscolarBoletin;
	}

	public void setAnioEscolarBoletin(String anioEscolarBoletin) {
		this.anioEscolarBoletin = anioEscolarBoletin;
	}

	public List<MateriaDTO> getPrevias() {
		return previas;
	}

	public void setPrevias(List<MateriaDTO> previas) {
		this.previas = previas;
	}

	public String getConductaB() {
		return conductaB;
	}

	public void setConductaB(String conductaB) {
		this.conductaB = conductaB;
	}

	public String getDiasHabiles() {
		return diasHabiles;
	}

	public void setDiasHabiles(String diasHabiles) {
		this.diasHabiles = diasHabiles;
	}

	public Float getDiasHabilesFinales() {
		return diasHabilesFinales;
	}

	public void setDiasHabilesFinales(Float diasHabilesFinales) {
		this.diasHabilesFinales = diasHabilesFinales;
	}

	public String getInasistencias() {
		return inasistencias;
	}

	public void setInasistencias(String inasistencias) {
		this.inasistencias = inasistencias;
	}

	public Float getInasistencasFinales() {
		return inasistencasFinales;
	}

	public void setInasistencasFinales(Float inasistencasFinales) {
		this.inasistencasFinales = inasistencasFinales;
	}

	public Long getIdEscuela() {
		return idEscuela;
	}

	public void setIdEscuela(Long idEscuela) {
		this.idEscuela = idEscuela;
	}
	
	
}
