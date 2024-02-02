package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum SituacionActual {

	TRABAJA(1,"Trabaja"),
	ESTUDIA(2,"Estudia"),
	TRABAJAESTUDIA(3,"Trabaja y estudia"),
	NITRABAJANIESTUDIA(4,"Ni trabaja ni estudia"),
	OTRO(5,"Otro"),
	SINDATO(6,"Sin dato");
	
	private Integer id;
	private String valor;
	
	private SituacionActual(Integer id, String valor) {
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
	
	
	public static SituacionActual getSituacionActual(Integer id){
		switch (id) {
		case 1:
			return TRABAJA;
		case 2:
			return ESTUDIA;
		case 3:
			return TRABAJAESTUDIA;
		case 4:
			return NITRABAJANIESTUDIA;
		case 5:
			return OTRO;
		case 6:
			return SINDATO;	
		default:
			throw new InvalidParameterException("Situacion actual desconocida: "
					+ id);
		}
	}
	
	public static List<SituacionActual> getSituacionActual(){
		return Arrays.asList(values());
	}
	
}
