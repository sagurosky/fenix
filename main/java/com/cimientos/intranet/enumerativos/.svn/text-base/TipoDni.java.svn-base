package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

/**
 * @author msagarduy
 * @param 
 */
public enum TipoDni implements Serializable{
	DNI(1, "DNI"), 
	LC(4, "LC"),
	LE(5, "LE");
	
	private Integer id;
	private String valor;
	
	private TipoDni(Integer id, String valor)
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
	
	public static TipoDni getTipoDni(Integer tipo) {
		switch (tipo) {
		case 1:
			return DNI;
		case 4:
			return LC;
		case 5:
			return LE;
		default:
//			throw new InvalidParameterException("Tipo de Dni desconocido: "
//					+ tipo);
			return null;
		}
	}
	
	/**
	 * @return
	 */
	public static List<TipoDni> getListaTipos() {
		return Arrays.asList(values());
	}
}
