package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * The Enum Antiguedad.
 */
public enum Antiguedad implements Serializable{
	
	/** The NUEVA. */
	NUEVA(1, "Nueva"), 
	
	/** The SEGUNDA. */
	SEGUNDA(2, "2da"),
	
	/** The TERCERA. */
	TERCERA(3, "3ra"),
	
	/** The CUARTA. */
	CUARTA(4, "4ta"),
	
	/** The QUINTA. */
	QUINTA(5, "5ta"),
	
	/** The MAS. */
	MAS(6, "Mas");
	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;

	/**
	 * Instantiates a new antiguedad.
	 *
	 * @param id the id
	 * @param valor the valor
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	private Antiguedad(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}

	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the id to set
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * Gets the valor.
	 *
	 * @return the valor
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public String getValor() {
		return valor;
	}

	/**
	 * Sets the valor.
	 *
	 * @param valor the valor to set
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}


	/**
	 * Gets the antiguedad.
	 *
	 * @param id the id
	 * @return the antiguedad
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public static Antiguedad getAntiguedad(int id) {
		switch (id) {
		case 1:
			return NUEVA;
		case 2:
			return SEGUNDA;
		case 3:
			return TERCERA;
		case 4:
			return CUARTA;
		case 5:
			return QUINTA;
		case 6:
			return MAS;	
		default:
			throw new InvalidParameterException("Antiguedad desconocido: "
					+ id);
		}
	}
	
	
	/**
	 * Gets the antiguedades.
	 *
	 * @return the antiguedades
	 * @since 17-dic-2010
	 * @author cfigueroa
	 */
	public static List<Antiguedad> getAntiguedades(){
		return Arrays.asList(values());
	}
	
}
