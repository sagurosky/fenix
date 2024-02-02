package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * The Enum Conducta.
 */
public enum Conducta  implements Serializable{

	/** The MALA. */
	MALA (1, "Mala"),
	
	/** The REGULAR. */
	REGULAR(2, "Regular"),
	
	/** The BUENA. */
	BUENA(3, "Buena"),
	
	/** The MU y_ buena. */
	MUY_BUENA(4, "Muy buena"),
	
	/** The EXCELENTE. */
	EXCELENTE(5, "Excelente");
	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;


	/**
	 * Instantiates a new conducta.
	 *
	 * @param id the id
	 * @param valor the valor
	 */
	private Conducta(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}
	
	
	/**
	 * Gets the id.
	 *
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * Gets the valor.
	 *
	 * @return the valor
	 */
	public String getValor() {
		return valor;
	}
	
	/**
	 * Sets the valor.
	 *
	 * @param valor the new valor
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	/**
	 * Gets the conducta.
	 *
	 * @param id the id
	 * @return the conducta
	 */
	public static Conducta getConducta(Integer id){
		switch (id) {
		case 1:
			return MALA;
		case 2:
			return REGULAR;
		case 3:
			return BUENA;
		case 4:
			return MUY_BUENA;
		case 5:
			return EXCELENTE;
		default:
			throw new InvalidParameterException("Conducta desconocida: " + id);
		}
	}
	
	/**
	 * Gets the conductas.
	 *
	 * @return the conductas
	 */
	public static List<Conducta> getConductas(){
		return Arrays.asList(values());
	}
	
	
}
