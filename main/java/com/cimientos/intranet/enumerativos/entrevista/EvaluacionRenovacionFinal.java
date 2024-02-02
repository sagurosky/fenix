package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum EvaluacionRenovacionFinal {
	 
	NO_RENUEVA(1,"No renueva"), //0
	PENDIENTE(2,"Pendiente"),   //1
	EN_CONDICIONES_DE_RENOVAR(3,"En condiciones de renovar"), //2
	FIN_PARTICIPACION_PFE(4,"Fin participación PFE"); //3
	
	
	private Integer id;
	private String valor;
	
	
	private EvaluacionRenovacionFinal(Integer id, String valor) {
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
	
	public static List<EvaluacionRenovacionFinal> getEvaluacionesRenovacionFinal(List<Integer> ids){
		ArrayList<EvaluacionRenovacionFinal> valor = new ArrayList<EvaluacionRenovacionFinal>();
		
		for (Integer id: ids)
			valor.add(EvaluacionRenovacionFinal.getEvaluacionRenovacion(id));
		
		return valor;
	}
	
	public static EvaluacionRenovacionFinal getEvaluacionRenovacion(Integer id){
		switch (id) {
		case 1:
			return NO_RENUEVA;
		case 2:
			return PENDIENTE;
		case 3:
			return EN_CONDICIONES_DE_RENOVAR;
		case 4:
			return FIN_PARTICIPACION_PFE;	
				
		default:
			throw new InvalidParameterException("Evaluacion de renovacion final desconocida: "
					+ id);
		}
	}


	public static List<EvaluacionRenovacionFinal> getEvaluacionRenovacionFinal() {
		return Arrays.asList(values());
	}
	
}
