package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum EstadoEscuela implements Serializable{
	
	ACEPTADA(1,"Aceptada"),
	RECHAZADA(2,"Rechazada"),
	NO_SELECCIONADA(3,"No seleccionada"),
	PARTICIPANDO_PROGRAMA(4,"Participando de algún programa"),
	INACTIVA(5,"Inactiva");
	
	private Integer id;
	private String valor;
	
	
	private EstadoEscuela(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getValor() {
		return valor;
	}


	public void setValor(String valor) {
		this.valor = valor;
	}
	
	
	public static EstadoEscuela getEstados(Integer id){
		switch (id) {
		case 1:
			return ACEPTADA;
		case 2:
			return RECHAZADA;
		case 3:
			return NO_SELECCIONADA;
		case 4:
			return PARTICIPANDO_PROGRAMA;
		case 5:
			return INACTIVA;
		default:
			throw new InvalidParameterException("EstadoEscuela  desconocido: "
					+ id);
		}

	}
	/**
	 * @return
	 */
	public static List<EstadoEscuela> getListaEstadoEscuelas() {
		return Arrays.asList(values());
	}
}
