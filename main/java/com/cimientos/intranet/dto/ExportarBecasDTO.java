package com.cimientos.intranet.dto;

public class ExportarBecasDTO {

	private String idBeca;
	private String tipoPadrino;
	private String padrino;
	private String idPlataforma;
	private String contacto;
	private String nombrePadrino;
	private String apellidoPadrino;
	private String mail;
	private String zona;
	private String cantidad;
	private String tipo;
	private String estado;
	private String ciclo;
	private String mes;
	
	public ExportarBecasDTO() {
		super();
	}

	public ExportarBecasDTO(String idBeca, String tipoPadrino, String padrino,
			String idPlataforma, String contacto, String nombrePadrino,
			String apellidoPadrino, String mail, String zona, String cantidad,
			String tipo, String estado, String ciclo, String mes) {
		super();
		this.idBeca = idBeca;
		this.tipoPadrino = tipoPadrino;
		this.padrino = padrino;
		this.idPlataforma = idPlataforma;
		this.contacto = contacto;
		this.nombrePadrino = nombrePadrino;
		this.apellidoPadrino = apellidoPadrino;
		this.mail = mail;
		this.zona = zona;
		this.cantidad = cantidad;
		this.tipo = tipo;
		this.estado = estado;
		this.ciclo = ciclo;
		this.mes = mes;
	}

	public String getIdBeca() {
		return idBeca;
	}

	public void setIdBeca(String idBeca) {
		this.idBeca = idBeca;
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

	public String getIdPlataforma() {
		return idPlataforma;
	}

	public void setIdPlataforma(String idPlataforma) {
		this.idPlataforma = idPlataforma;
	}

	public String getContacto() {
		return contacto;
	}

	public void setContacto(String contacto) {
		this.contacto = contacto;
	}

	public String getNombrePadrino() {
		return nombrePadrino;
	}

	public void setNombrePadrino(String nombrePadrino) {
		this.nombrePadrino = nombrePadrino;
	}

	public String getApellidoPadrino() {
		return apellidoPadrino;
	}

	public void setApellidoPadrino(String apellidoPadrino) {
		this.apellidoPadrino = apellidoPadrino;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getZona() {
		return zona;
	}

	public void setZona(String zona) {
		this.zona = zona;
	}

	public String getCantidad() {
		return cantidad;
	}

	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCiclo() {
		return ciclo;
	}

	public void setCiclo(String ciclo) {
		this.ciclo = ciclo;
	}

	public String getMes() {
		return mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}
	
	
	
	

}
