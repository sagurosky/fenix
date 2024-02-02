/**
 * 
 */
package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * @author plabaronnie
 *
 */
public enum TipoBeca {
	
	LOCAL(1, "L", "Local"), 
	INTERIOR(2,"I", "Interior"),
	PATAGONICA(3,"P", "Patagonia"); 
	
	private Integer id;
	private String valor;
	private String descripcion;

	private TipoBeca(Integer id, String valor, String descripcion)
	{
		this.id = id;
		this.valor = valor;
		this.descripcion = descripcion;
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
	
	public static TipoBeca getTipoBeca(Integer id) {
		switch (id) {
		case 1:
			return LOCAL;
		case 2:
			return INTERIOR;
		case 3:
			return PATAGONICA;
		default:
			throw new InvalidParameterException("Categoria desconocida: "
					+ id);
		}
	}

	/**
	 * @return
	 */
	public static List<TipoBeca> getListaTipoBecas() {
		return Arrays.asList(values());
	}

	/**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}

	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
}
