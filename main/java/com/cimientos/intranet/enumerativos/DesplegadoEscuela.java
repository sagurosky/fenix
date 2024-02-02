package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * The Enum Programa.
 */
public enum DesplegadoEscuela implements Serializable{

	/** The PAE. */
	SIEMPRE(1,"Siempre"),
	
	/** The PBE. */
	MAYORESVECES(2,"Casi siempre"),
	
	/** The PA e_ pbe. */
	CASINUNCA(3,"Casi nunca"),
	
	/** The PRR. */
	NUNCA(4,"Nunca"),	
	NADA(0,"");
	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;
	
	/**
	 * Instantiates a new programa.
	 *
	 * @param id the id
	 * @param valor the valor
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	private DesplegadoEscuela(Integer id, String valor) {
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
	 * Gets the programas.
	 *
	 * @param id the id
	 * @return the programas
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public static DesplegadoEscuela getPrograma(Integer id){
		switch (id) {
		case 0:
			return NADA;
		case 1:
			return SIEMPRE;
		case 2:
			return MAYORESVECES;
		case 3:
			return CASINUNCA;
		case 4:
			return NUNCA;
		
		default:
			throw new InvalidParameterException("Programa desconocido: " + id);
		}

	}
	
	
	/**
	 * Gets the lista programa.
	 *
	 * @return the lista programa
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public static List<DesplegadoEscuela> getListaPrograma() {
		return Arrays.asList(values());
	}
	
}
