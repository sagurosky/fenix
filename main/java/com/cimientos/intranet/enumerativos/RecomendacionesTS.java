package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum RecomendacionesTS implements Serializable {
	
	
	MUY_RECOMENDABLE(1, "Muy Recomendable"), 
	RECOMENDABLE(2, "Recomendable"),
	POCO_RECOMENDABLE(3, "Poco Recomendable"), 
	NO_RECOMENDABLE(4, "No Recomendable");
	

	private Integer id;
	private String valor;

	private RecomendacionesTS(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}

	public static RecomendacionesTS getRecomendacionesTS(Integer id) {
		switch (id) {
		case 1:
			return MUY_RECOMENDABLE;
		case 2:
			return RECOMENDABLE;
		case 3:
			return POCO_RECOMENDABLE;
		case 4:
			return NO_RECOMENDABLE;
		default:
			throw new InvalidParameterException("Recomendacion desconocida: "+ id);
		}
	}
	
	public static List<RecomendacionesTS> getListaRecomendacionesTS(){
		return Arrays.asList(values());
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


}
