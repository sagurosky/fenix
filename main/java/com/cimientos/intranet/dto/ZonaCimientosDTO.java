package com.cimientos.intranet.dto;

import java.io.Serializable;

public class ZonaCimientosDTO implements Serializable{

	private Long id;
		
	private String nombre;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}	

	
}
