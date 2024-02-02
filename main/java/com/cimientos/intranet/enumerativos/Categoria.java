package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;


public enum Categoria implements Serializable{
	
	LOCAL(1, "LOCAL"), 
	INTERIOR(2,"INTERIOR"),
	SUR(3,"SUR"); 
	
	private Integer id;
	private String valor;

	private Categoria(Integer id, String valor)
	{
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
	
	public static Categoria getCategoria(Integer id) {
		switch (id) {
		case 1:
			return LOCAL;
		case 2:
			return INTERIOR;
		case 3:
			return SUR;
		default:
			throw new InvalidParameterException("Categoria desconocida: "
					+ id);
		}
	}

	/**
	 * @return
	 */
	public static List<Categoria> getListaCategorias() {
		return Arrays.asList(values());
	}
}
