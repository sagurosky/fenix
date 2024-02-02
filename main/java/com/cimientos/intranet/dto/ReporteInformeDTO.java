package com.cimientos.intranet.dto;

public class ReporteInformeDTO{

	private Long id;
	
	private Long idAlumno; 
	
	private Long idEscuelaAlumno; 
	
	private Long cicloInforme;
	
	private String apellidoAlumno;
	
	private String nombreAlumno;
	
	private String zona;
	
	private String tipoInforme;
	
	private String tipoPadrino;
	
	private String padrino;
	
	private String estadoInforme;
	
	private String correctora;
	
	private String fechaCreacion;
	
	private String fechaUltimoCambioEstado;
	
	private String fechaEnvio;
	
	private String cicloActual;
	
	private String ea;
	
	private String rr;
	
	private String acciones;
	
	private String anioEscolar;
	
	private String escuelaNombre;
	
	private String fechaUltimaModificacion;
	
	private String eae;
	
	
	
	
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

	public String getAnioEscolar() {
		return anioEscolar;
	}

	public void setAnioEscolar(String anioEscolar) {
		this.anioEscolar = anioEscolar;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getZona() {
		String zona = "";
		try {
			zona = this.zona;
		} catch (Exception e) {
			// TODO: handle exception
			////System.out.println("Alumno " + this.getApellidoAlumno());
		}
		return zona;		
	}

	public void setZona(String zona) {
		this.zona = zona;
	}

	public String getTipoInforme() {
		return tipoInforme;
	}

	public void setTipoInforme(String tipoInforme) {
		this.tipoInforme = tipoInforme;
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

	public String getEstadoInforme() {
		return estadoInforme;
	}

	public void setEstadoInforme(String estadoInforme) {
		this.estadoInforme = estadoInforme;
	}

	public String getCorrectora() {
		return correctora;
	}

	public void setCorrectora(String correctora) {
		this.correctora = correctora;
	}

	public String getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
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

	public String getCicloActual() {
		return cicloActual;
	}

	public void setCicloActual(String cicloActual) {
		this.cicloActual = cicloActual;
	}

	public String getEa() {
		return ea;
	}

	public void setEa(String ea) {
		this.ea = ea;
	}

	public String getRr() {
		return rr;
	}

	public void setRr(String rr) {
		this.rr = rr;
	}
	

	public Long getIdAlumno() {
		return idAlumno;
	}

	public void setIdAlumno(Long idAlumno) {
		this.idAlumno = idAlumno;
	}

	public String getAcciones() {
		return acciones;
	}

	public void setAcciones(String acciones) {
		this.acciones = acciones;
	}
	
	public String getEscuelaNombre() {
		return escuelaNombre;
	}

	public void setEscuelaNombre(String escuelaNombre) {
		this.escuelaNombre = escuelaNombre;
	}
	
	public Long getIdEscuelaAlumno() {
		return idEscuelaAlumno;
	}

	public void setIdEscuelaAlumno(Long idEscuelaAlumno) {
		this.idEscuelaAlumno = idEscuelaAlumno;
	}

	public Long getCicloInforme() {
		return cicloInforme;
	}

	public void setCicloInforme(Long cicloInforme) {
		this.cicloInforme = cicloInforme;
	}	
}
