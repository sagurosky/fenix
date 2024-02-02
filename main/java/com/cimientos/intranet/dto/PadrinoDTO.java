package com.cimientos.intranet.dto;

import java.util.Date;

import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;

public class PadrinoDTO {
	
	private String nombre;
	
	private Date fechaAlta;
	
	private String cuilCuit;
	
	private String tipo;
	
	private Long id;

	private boolean seleccionado;
	
	private String nroCtesPlataformaContable;
	
	

	public String getNroCtesPlataformaContable() {
		return nroCtesPlataformaContable;
	}


	public void setNroCtesPlataformaContable(String nroCtesPlataformaContable) {
		this.nroCtesPlataformaContable=nroCtesPlataformaContable;
	}


	public boolean isSeleccionado() {
		return seleccionado;
	}


	public void setSeleccionado(boolean seleccionado) {
		this.seleccionado = seleccionado;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	


	public String getCuilCuit() {
		return cuilCuit;
	}


	public void setCuilCuit(String cuilCuit) {
		this.cuilCuit = cuilCuit;
	}


	public Date getFechaAlta() {
		return fechaAlta;
	}


	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	
	

}
