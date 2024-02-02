package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum CargaHoraria implements Serializable{
	
	PARTTIME(1, "Part-Time"), 
	FULLTIME(2, "Full-Time");

	private int id;
	private String valor;

			
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getValor() {
		return valor;
	}


	public void setValor(String valor) {
		this.valor = valor;
	}


	private CargaHoraria(int id, String valor) {
		this.id = id;
		this.valor = valor;
	}


	public static CargaHoraria getCargaHoraria(int id) {
		switch (id) {
		case 1:
			return PARTTIME;
		case 2:
			return FULLTIME;
		default:
			throw new InvalidParameterException("Modalidad desconocida: "+ id);
		}
	}
	
	public static List<CargaHoraria> getListaCargaHoraria(){
		return Arrays.asList(values());
	}


}
