package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum FaseProyecto {

	DIAGNOSTICO(1, "Diagnóstico"), 
	IMPLEMENTACION(2, "Implementación");
	
	private Integer id;
	private String valor;
	
	
	private FaseProyecto(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}
	
	public static FaseProyecto getFaseProyecto(Integer id){
		switch (id) {
		case 1:
			return DIAGNOSTICO;
		case 2:
			return IMPLEMENTACION;

		default:
			throw new InvalidParameterException("Fase de proyecto desconocido: " + id);
		}
	}	
	
	public static List<FaseProyecto> getFaseProyecto(){
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