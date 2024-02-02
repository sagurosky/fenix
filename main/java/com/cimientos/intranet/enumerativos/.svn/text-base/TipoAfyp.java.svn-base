/**
 * 
 */
package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * @author msagarduy
 * @param 
 */
public enum TipoAfyp implements Serializable{

	MONOTRIBUTISTA(1, "MONOTRIBUTISTA"); 
	
	private Integer id;
	private String valor;
	
	private TipoAfyp(Integer id, String valor)
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
	
	public static TipoAfyp getTipoAfyp(Integer tipo) {
		switch (tipo) {
		case 1:
			return MONOTRIBUTISTA;
		default:
			throw new InvalidParameterException("Monotributista desconocido: "
					+ tipo);
		}
	}
	
	/**
	 * @return
	 */
	public static List<TipoAfyp> getListaTipos() {
		return Arrays.asList(values());
	}
}
