package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum NecesidadesEscuela {

	FORMACIONDOCENTE(1, "Formación para docentes"), 
	FORMACIONEQUIPO(2, "Formación para equipo de liderazgo"),
	TALLERES(3, "Talleres para alumnos -Confección de CV; Post Egreso-"),	
	OTRA(12, "Otras");
	
	
	private Integer id;
	private String valor;
	
	
	private NecesidadesEscuela(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}
	
	public static NecesidadesEscuela getNecesidadesEscuela(Integer id){
		switch (id) {
		case 1:
			return FORMACIONDOCENTE;
		case 2:
			return FORMACIONEQUIPO;
		case 3:
			return TALLERES;
		case 4:
			return OTRA;
		default:
			throw new InvalidParameterException("Necesidades de Escuela desconocida: " + id);
		}
	}	
	
	public static List<NecesidadesEscuela> getnNecesidadesEscuelas(){
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
