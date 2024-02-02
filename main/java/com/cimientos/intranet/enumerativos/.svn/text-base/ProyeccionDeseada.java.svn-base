package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum ProyeccionDeseada {

	TRABAJAR(1,"Trabajar"),
	ESTUDIAR(2,"Estudiar"),
	TRABAJARESTUDIAR(3,"Trabajar y estudiar"),
	NITRABAJARESTUDIAR(4,"Ni trabajar ni estudiar"),
	OTRO(5,"Otro"),
	SINDATO(6,"Sin dato");
	
	
	private Integer id;
	private String valor;
	
	private ProyeccionDeseada(Integer id, String valor) {
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
	
	
	public static ProyeccionDeseada getProyeccionDeseada(Integer id){
		switch (id) {
		case 1:
			return TRABAJAR;
		case 2:
			return ESTUDIAR;
		case 3:
			return TRABAJARESTUDIAR;
		case 4:
			return NITRABAJARESTUDIAR;
		case 5:
			return OTRO;
		case 6:
			return SINDATO;	
		default:
			throw new InvalidParameterException("Situacion actual desconocida: " + id);
		}
	}
	
	public static List<ProyeccionDeseada> getProyeccionDeseada(){
		return Arrays.asList(values());
	}
	
}
