package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum TipoContacto {
	
	ESCUELA(1,"Escuela"),
	TELEFONICO(2,"Telefónico con flia"),
	VISITA(3,"Visita TS"),
	NULO(4,"Nulo"),
	OTRO(5,"Otro");
	
	
	private Integer id;
	private String valor;
	
	
	private TipoContacto(Integer id, String valor) {
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
	
	
	public static TipoContacto getTipoContacto(Integer id){
		switch (id) {
		case 1:
			return ESCUELA;
		case 2:
			return TELEFONICO;
		case 3:
			return VISITA;
		case 4:
			return NULO;
		case 5:
			return OTRO;

		default:
			throw new InvalidParameterException("Tipo de contacto desconocido: "
					+ id);
		}
	}	
	
	public static List<TipoContacto> getTipoContacto(){
		return Arrays.asList(values());
	}
	
}
