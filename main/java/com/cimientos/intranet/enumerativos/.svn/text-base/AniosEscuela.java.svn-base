package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * The Enum AniosEscuela.
 */
public enum AniosEscuela implements Serializable{

	/** The TRES. */
	TRES(3,"3"),
	
	/** The CINCO. */
	CINCO(5,"5"),
	
	/** The SEIS. */
	SEIS(6,"6"),
	
	/** The SIETE. */
	SIETE(7,"7");
	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;
	
	
	
	/**
	 * Instantiates a new anios escuela.
	 *
	 * @param id the id
	 * @param valor the valor
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	private AniosEscuela(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}
	
	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Integer getId() {
		return id;
	}
	
	/**
	 * Sets the id.
	 *
	 * @param id the id to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**
	 * Gets the valor.
	 *
	 * @return the valor
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getValor() {
		return valor;
	}
	
	/**
	 * Sets the valor.
	 *
	 * @param valor the valor to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	/**
	 * Gets the anios escuela.
	 *
	 * @param id the id
	 * @return the anios escuela
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public static AniosEscuela getAniosEscuela(Integer id){
		switch (id) {
		case 3:
			return TRES;
		case 5:
			return CINCO;
		case 6:
			return SEIS;
		case 7:
			return SIETE;
		default:
			throw new InvalidParameterException("Cantidad de años desconocidos: " + id);
		}

	}
	
	/**
	 * Gets the lista anios escuela.
	 *
	 * @return the lista anios escuela
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public static List<AniosEscuela> getListaAniosEscuela() {
		return Arrays.asList(values());
	}
	
	
}
