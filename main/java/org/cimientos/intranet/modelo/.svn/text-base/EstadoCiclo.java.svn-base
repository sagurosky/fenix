/**
 * 
 */
package org.cimientos.intranet.modelo;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * @author plabaronnie
 *
 */
public enum EstadoCiclo implements Serializable{
	DISPONIBLE(1, "Disponible"),ACTUAL(2, "Actual"),CERRADO(3,"Cerrado");
	
	private EstadoCiclo(int id, String valor) {
		this.id = id;
		this.valor = valor;
	}
	
	private int id;
	private String valor;
	
	
	/**
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return
	 */
	public String getValor() {
		return valor;
	}
	
	/**
	 * @param valor
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	public static EstadoCiclo getEstadoCiclo(int id) {
		switch (id) {
		case 1:
			return DISPONIBLE;
		case 2:
			return ACTUAL;
		case 3:
			return CERRADO;
		default:
			throw new InvalidParameterException("Estado Ciclo desconocido: "
					+ id);
		}
	}
	
	/**
	 * @return
	 */
	public static List<EstadoCiclo> getListaEstados(){
		return Arrays.asList(values());
	}
	
}
