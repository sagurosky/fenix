package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum Equipo implements Serializable{
	
	STAFF(1, "Staff"), 
	EA(2, "EA");

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


	private Equipo(int id, String valor) {
		this.id = id;
		this.valor = valor;
	}


	public static Equipo getEquipo(int id) {
		switch (id) {
		case 1:
			return STAFF;
		case 2:
			return EA;
		default:
			throw new InvalidParameterException("Modalidad desconocida: "+ id);
		}
	}
	
	public static List<Equipo> getListaEquipo(){
		return Arrays.asList(values());
	}



}
