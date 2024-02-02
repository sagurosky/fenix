package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum EntrevistaReprogramada {

	NO(1,"No"),
	UNAVEZ(2,"1 Vez"),
	DOSVECES(3,"2 Veces"),
	MASDEDOS(4,"Mas de 2 veces"),
	ENTREVISTAVIRTUAL(5,"Entrevista virtual");
	
	private Integer id;
	private String valor;
	
	
	private EntrevistaReprogramada(Integer id, String valor) {
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
	
	
	public static EntrevistaReprogramada getEntrevistaReprogramada(Integer id){
		switch (id) {
		case 1:
			return NO;
		case 2:
			return UNAVEZ;
		case 3:
			return DOSVECES;
		case 4:
			return MASDEDOS;
		case 5:
			return ENTREVISTAVIRTUAL;

		default:
			throw new InvalidParameterException("Entrevista Reprogramada desconocida: "
					+ id);
		}
	}
	
	public static List<EntrevistaReprogramada> getEntrevistasReprogramadas(){
		return Arrays.asList(values());
	}
	
}
