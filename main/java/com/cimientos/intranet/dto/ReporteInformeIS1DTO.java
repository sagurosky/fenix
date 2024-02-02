package com.cimientos.intranet.dto;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.web.controller.MateriaPreviaDTO;






public class ReporteInformeIS1DTO{

	private Long id;
	
	private String tipoInforme;
	
	private String cicloActual;
	
	private String estadoInforme;	
	
	private String fechaUltimoCambioEstado;
	
	private String fechaEnvio;
	
	private String tipoPadrino;
	
	private String padrino;
	
	private String contacto;
	
	private String mail;
	
	private Long idAlumno; 	
	
	private String apellidoAlumno;
	
	private String nombreAlumno;	
	
	private String dni;
	
	private String fechaNacimiento;
	
	private String edad;
	
	private String localidad;
	
	private String anioEscolar;
	
	private String anioAdicional;
	
	private String escuelaNombre;
	
	private String escuelaLocalidad;
	
	private String responsable;
	
	private String vinculo;
	
	private String fechaPBE;
	
	private String rr;
	
	private String ea;
	
	private String propositoAnioComienza;
	
	private String tiempoLibreGusta;
	
	private Boletin boletinAnioAnterior;
	
	private String conducta;
	
	private String diasHabiles;
	
	private Float diasHabilesFinales;
	
	private String inasistencias;
	
	private Float inasistencasFinales;
	
	private Long nroCtesPlataformaContable;
	
	private List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
	
	//private List<MateriaPreviaDTO> materiasPrevias = new ArrayList<MateriaPreviaDTO>();
	
	private List<MateriaDTO> previas = new ArrayList<MateriaDTO>();
	
	private String fechaUltimaModificacion;
	
	private String eae;
	
	private String infoEscuela;
	private String espacioEscuela;
	private String proposito;
	private String habiliaddes;
	
	private String observacionesExcepcion;
	
	
	
	
	
	
	public String getObservacionesExcepcion() {
		return observacionesExcepcion;
	}

	public void setObservacionesExcepcion(String observacionesExcepcion) {
		this.observacionesExcepcion = observacionesExcepcion;
	}

	public String getEae() {
		return eae;
	}

	public void setEae(String eae) {
		this.eae = eae;
	}

	public String getFechaUltimaModificacion() {
		return fechaUltimaModificacion;
	}

	public void setFechaUltimaModificacion(String fechaUltimaModificacion) {
		this.fechaUltimaModificacion = fechaUltimaModificacion;
	}
	
	
	public List<MateriaDTO> getPreviasDTO() {
		return previas;
	}

	public void setPreviasDTO(List<MateriaDTO> previas) {
		this.previas = previas;
	} 
	
	
	
	
	public List<MateriaDTO> getMaterias() {
		return materias;
	}

	public void setMaterias(List<MateriaDTO> materias) {
		this.materias = materias;
	}

	
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTipoInforme() {
		return tipoInforme;
	}

	public void setTipoInforme(String tipoInforme) {
		this.tipoInforme = tipoInforme;
	}

	public String getCicloActual() {
		return cicloActual;
	}

	public void setCicloActual(String cicloActual) {
		this.cicloActual = cicloActual;
	}

	public String getEstadoInforme() {
		return estadoInforme;
	}

	public void setEstadoInforme(String estadoInforme) {
		this.estadoInforme = estadoInforme;
	}

	public String getFechaUltimoCambioEstado() {
		return fechaUltimoCambioEstado;
	}

	public void setFechaUltimoCambioEstado(String fechaUltimoCambioEstado) {
		this.fechaUltimoCambioEstado = fechaUltimoCambioEstado;
	}

	public String getFechaEnvio() {
		return fechaEnvio;
	}

	public void setFechaEnvio(String fechaEnvio) {
		this.fechaEnvio = fechaEnvio;
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

	public String getContacto() {
		return contacto;
	}

	public void setContacto(String contacto) {
		this.contacto = contacto;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
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

	public String getEdad() {
		return edad;
	}

	public void setEdad(String edad) {
		this.edad = edad;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
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

	public String getPropositoAnioComienza() {
		return propositoAnioComienza;
	}

	public void setPropositoAnioComienza(String propositoAnioComienza) {
		this.propositoAnioComienza = propositoAnioComienza;
	}

	public String getTiempoLibreGusta() {
		return tiempoLibreGusta;
	}

	public void setTiempoLibreGusta(String tiempoLibreGusta) {
		this.tiempoLibreGusta = tiempoLibreGusta;
	}

	public Boletin getBoletinAnioAnterior() {
		return boletinAnioAnterior;
	}

	public void setBoletinAnioAnterior(Boletin boletinAnioAnterior) {
		this.boletinAnioAnterior = boletinAnioAnterior;
	}

	public String getConducta() {
		return conducta;
	}

	public void setConducta(String conducta) {
		this.conducta = conducta;
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

	public List<MateriaDTO> getMateriasDto() {
		return materias;
	}

	public void setMateriasDto(List<MateriaDTO> materias) {
		this.materias = materias;
		
	}

	public Long getNroCtesPlataformaContable() {
		return nroCtesPlataformaContable;
	}

	public void setNroCtesPlataformaContable(Long nroCtesPlataformaContable) {
		this.nroCtesPlataformaContable = nroCtesPlataformaContable;
	}

	public String getInfoEscuela() {
		return infoEscuela;
	}

	public void setInfoEscuela(String infoEscuela) {
		this.infoEscuela = infoEscuela;
	}

	public String getEspacioEscuela() {
		return espacioEscuela;
	}

	public void setEspacioEscuela(String espacioEscuela) {
		this.espacioEscuela = espacioEscuela;
	}

	public String getProposito() {
		return proposito;
	}

	public void setProposito(String proposito) {
		this.proposito = proposito;
	}

	public String getHabiliaddes() {
		return habiliaddes;
	}

	public void setHabiliaddes(String habiliaddes) {
		this.habiliaddes = habiliaddes;
	}



	
	
	
	
	
	

	
}
