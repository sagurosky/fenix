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
public enum EstadoBeca implements Serializable{
	PLANIFICADA(1, "Estimada"),CONFIRMADA(2, "Confirmada"),INACTIVA(3,"Inactiva");
	
	private EstadoBeca(int id, String valor) {
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
	
	public static EstadoBeca getEstadoBeca(int id) {
		switch (id) {
		case 1:
			return PLANIFICADA;
		case 2:
			return CONFIRMADA;
		case 3:
			return INACTIVA;
		default:
			throw new InvalidParameterException("Estado Beca desconocido: "
					+ id);
		}
	}
	
	/**
	 * @return
	 */
	public static List<EstadoBeca> getListaEstados(){
		return Arrays.asList(values());
	}

	public static Object getListaEstadosParaClonar() {
		return Arrays.asList(PLANIFICADA,CONFIRMADA);
	}
	
}
