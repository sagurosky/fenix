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
 *
 */
public enum EstadoCivil implements Serializable{

	CASADO(4, "CASADO"), 
	VIUDO(3, "VIUDO"),
	DIVORCIADO(2, "DIVORCIADO"),
	SOLTERO(1, "SOLTERO");

	private Integer id;
	private String valor;

	private EstadoCivil(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the valor
	 */
	public String getValor() {
		return valor;
	}

	/**
	 * @param valor the valor to set
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}


	public static EstadoCivil getEstadoCivil(int id) {
		switch (id) {
		case 1:
			return SOLTERO;
		case 2:
			return DIVORCIADO;
		case 3:
			return VIUDO;
		case 4:
			return CASADO;
		default:
			throw new InvalidParameterException("Estado Civil desconocido: "
					+ id);
		}
	}
	
	/**
	 * getListaEstadosCiviles
	 * @return lista de estados civiles
	 */
	public static List<EstadoCivil> getListaEstadosCiviles(){
		return Arrays.asList(values());
	}
	
}
