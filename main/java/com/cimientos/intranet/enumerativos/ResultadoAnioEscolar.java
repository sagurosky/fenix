package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum ResultadoAnioEscolar {

	
	PROMOVIDO(1,"Promovido sin adeudar materias"),
	PENDIENTE(2,"Promoción Pendiente"),
	REPITIO(3,"Repitio"),
	EGRESO(4,"Egreso efectivo"),
	PROMOVIDO_CON_PREVIAS(5,"Promovido con materias a rendir"),
	EGRESO_PENDIENTE(6,"Egreso pendiente");
	
	
	//PENDIENTE(2,"Promoción Pendiente (debe rendir materias)"),
	
	//EGRESO(4,"Egreso efectivo"),
	
	//EGRESO_PENDIENTE(6,"Egreso pendiente");
	
	
	
	//GRESO_PENDIENTE(6,"Egreso pendiente");
	
	// para entrevista febrero 2021
	
	
	
	
	
	private Integer id;
	private String valor;
	
	
	private ResultadoAnioEscolar(Integer id, String valor) {
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
	
	public static ResultadoAnioEscolar getReultadoAnioEscolarE(Integer id){
		switch (id) {
		case 1:
			return PROMOVIDO;
		case 2:
			return PENDIENTE;
		case 3:
			return REPITIO;
		case 4:
			return EGRESO;
		case 5:
			return PROMOVIDO_CON_PREVIAS;
		case 6:
			return EGRESO_PENDIENTE;
		default:
			throw new InvalidParameterException("Tipo de estado desconocido: " + id);
		}
	}	
	
	public static List<ResultadoAnioEscolar> getResultadoAnioEscolar(){
		return Arrays.asList(values());
	}

}
