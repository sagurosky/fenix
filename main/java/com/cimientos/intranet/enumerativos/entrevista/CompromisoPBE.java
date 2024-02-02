package com.cimientos.intranet.enumerativos.entrevista;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum CompromisoPBE implements Serializable{
	
	SI(1,"Si"),
	NO(2,"No"),
	REVEER(3,"Reveer");
	
	
	private Integer id;
	private String valor;
	
	
	private CompromisoPBE(Integer id, String valor) {
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
	
	
	public static CompromisoPBE getCompromisoPBE(Integer id){
		switch (id) {
		case 1:
			return SI;
		case 2:
			return NO;
		case 3:
			return REVEER;
				
		default:
			throw new InvalidParameterException("Evaluacion compromiso desconocido: "
					+ id);
		}
	}


	public static List<CompromisoPBE> getCompromisoPBEs() {
		return Arrays.asList(values());
	}
}
