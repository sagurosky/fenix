package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum FormaEntrevista {
	
	INDIVIDUAL(1,"Individual"),
	GRUPAL(2,"Grupal");	
	
	private Integer id;
	private String valor;
	
	
	private FormaEntrevista(Integer id, String valor) {
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
	
	
	public static FormaEntrevista getTipoEntrevista(Integer id){
		switch (id) {
		case 1:
			return INDIVIDUAL;
		case 2:
			return GRUPAL;

		default:
			throw new InvalidParameterException("Forma de Entrevista desconocido: "
					+ id);
		}
	}	
	
	public static List<FormaEntrevista> getFormasEntrevista(){
		return Arrays.asList(values());
	}

}
