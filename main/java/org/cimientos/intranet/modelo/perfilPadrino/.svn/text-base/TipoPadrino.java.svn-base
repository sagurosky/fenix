package org.cimientos.intranet.modelo.perfilPadrino;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum TipoPadrino implements Serializable{

	CORPORATIVO(1, "Corporativo"),INDIVIDUAL(2, "Individual");
	
	private TipoPadrino(int id, String valor) {
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
	
	public static TipoPadrino getTipoPadrino(int id) {
		switch (id) {
		case 1:
			return CORPORATIVO;
		case 2:
			return INDIVIDUAL;	
		default:
			throw new InvalidParameterException("Tipo de padrino desconocido: "
					+ id);
		}
	}
	
	/**
	 * @return
	 */
	public static List<TipoPadrino> getListaTipos(){
		return Arrays.asList(values());
	}
	
}
