package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;


/**
 * The Enum Convive.
 */
public enum Convive implements Serializable{

	SI(0, "SI"), 
	NO(1, "NO");
	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;

	/**
	 * Instantiates a new convive.
	 *
	 * @param id the id
	 * @param valor the valor
	 * @since 07-dic-2010
	 * @author cfigueroa
	 */
	private Convive(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}

	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @since 07-dic-2010
	 * @author cfigueroa
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the id to set
	 * @since 07-dic-2010
	 * @author cfigueroa
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * Gets the valor.
	 *
	 * @return the valor
	 * @since 07-dic-2010
	 * @author cfigueroa
	 */
	public String getValor() {
		return valor;
	}

	/**
	 * Sets the valor.
	 *
	 * @param valor the valor to set
	 * @since 07-dic-2010
	 * @author cfigueroa
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}


	/**
	 * Gets the convive.
	 *
	 * @param id the id
	 * @return the convive
	 * @since 07-dic-2010
	 * @author cfigueroa
	 */
	public static Convive getConvive(int id) {
		switch (id) {
		case 0:
			return SI;
		case 1:
			return NO;
		default:
			throw new InvalidParameterException("Estado Civil desconocido: "
					+ id);
		}
	}
	
	/**
	 * Gets the lista convives.
	 *
	 * @return the lista convives
	 * @since 07-dic-2010
	 * @author cfigueroa
	 */
	public static List<Convive> getListaConvives(){
		return Arrays.asList(values());
	}
}
