package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum Opciones {
	
	SI(1,"Si"),
	NO(2,"No"),
	NOCORRESPONDE(3,"No corresponde");
	
	
	private Integer id;
	private String valor;
	
	
	private Opciones(Integer id, String valor) {
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
	
	
	public static Opciones getOpciones(Integer id){
		switch (id) {
		case 1:
			return SI;
		case 2:
			return NO;
		case 3:
			return NOCORRESPONDE;
				
		default:
			throw new InvalidParameterException("Opcion desconocida: "
					+ id);
		}
	}
	
	public static List<Opciones> getOpciones(){
		return Arrays.asList(values());
	}

}
