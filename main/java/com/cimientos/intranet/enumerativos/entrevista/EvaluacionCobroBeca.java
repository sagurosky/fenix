package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum EvaluacionCobroBeca {
	
	APROBADO(1,"Aprobado"),
	SUSPENDIDO(2,"Suspendido"),
	DUDOSO(3,""), //dudoso
	CESADO(4,"Cesado"),
	NULO(5,""),
	NO_APLICA(6,"No Aplica");
	
	private Integer id;
	private String valor;
	
	
	private EvaluacionCobroBeca(Integer id, String valor) {
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
	
	public static List<EvaluacionCobroBeca> getEvaluacionesCobroBeca(List<Integer> ids){
		ArrayList<EvaluacionCobroBeca> valor = new ArrayList<EvaluacionCobroBeca>();
		
		for (Integer id: ids)
			valor.add(EvaluacionCobroBeca.getEvaluacionCobroBeca(id));
		
		return valor;
	}
	
	public static EvaluacionCobroBeca getEvaluacionCobroBeca(Integer id){
		switch (id) {
		case 1:
			return APROBADO;
		case 2:
			return SUSPENDIDO;
		case 3:
			return DUDOSO;
		case 4:
			return CESADO;	
		case 5:
			return NULO;	
		case 6:
			return NO_APLICA;	
		default:
			throw new InvalidParameterException("Evaluacion de cobro de beca desconocida: "
					+ id);
		}
	}


	public static List<EvaluacionCobroBeca> getEvaluacionCobroBeca() {
		return Arrays.asList(APROBADO, SUSPENDIDO, CESADO,DUDOSO);
	}
	
	public static List<EvaluacionCobroBeca> getEvaluacionCobroBecaFinal() {
		return Arrays.asList(APROBADO, SUSPENDIDO);
	}
	
	public static List<EvaluacionCobroBeca> getEvaluacionCobroBecaFinal2017() {
		return Arrays.asList(APROBADO, SUSPENDIDO);
	}
	
	public static List<EvaluacionCobroBeca> getEvaluacionCobroBecaIncorpRenov() {
		return Arrays.asList(APROBADO,DUDOSO);
	}
	
	public static List<EvaluacionCobroBeca> getEvaluacionCobroBecaIncorpRenov2017() {
		return Arrays.asList(APROBADO,DUDOSO);
	}
	
}
