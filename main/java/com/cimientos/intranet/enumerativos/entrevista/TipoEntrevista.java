package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum TipoEntrevista {
	
	MENSUAL(1,"Mensual"),
	INCORPORACION(2,"Incorporacion"),
	FINAL(3,"Final"),
	RENOVACION(4,"Renovacion"),
	FEBRERO(5,"Febrero");
	
	
	private Integer id;
	private String valor;
	
	
	private TipoEntrevista(Integer id, String valor) {
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
	
	public static List<TipoEntrevista> getTiposEntrevista(List<Integer> ids){
		ArrayList<TipoEntrevista> valor = new ArrayList<TipoEntrevista>();
		
		for (Integer id: ids)
			valor.add(TipoEntrevista.getTipoEntrevista(id));
		
		return valor;
	}
	
	public static TipoEntrevista getTipoEntrevista(Integer id){
		switch (id) {
		case 1:
			return MENSUAL;
		case 2:
			return INCORPORACION;
		case 3:
			return FINAL;
		case 4:
			return RENOVACION;
		case 5:
			return FEBRERO;	

		default:
			throw new InvalidParameterException("Tipo de Entrevista desconocido: "
					+ id);
		}
	}	
	
	public static List<TipoEntrevista> getTipoEntrevistas(){
		return Arrays.asList(values());
	}

}
