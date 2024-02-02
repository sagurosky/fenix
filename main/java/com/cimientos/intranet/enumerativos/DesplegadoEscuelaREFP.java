package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * The Enum Programa.
 */
public enum DesplegadoEscuelaREFP implements Serializable{

	/** The PAE. */
	CAT1(1,"La escuela cierra"),
	
	/** The PBE. */
	CAT2(2,"La escuela permanece abierta"),
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
	private DesplegadoEscuelaREFP(Integer id, String valor) {
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
	public static DesplegadoEscuelaREFP getPrograma(Integer id){
		switch (id) {
		case 0:
			return NADA;
		case 1:
			return CAT1;
		case 2:
			return CAT2;
		
		default:
			throw new InvalidParameterException("Desconocido: " + id);
		}

	}
	
	
	/**
	 * Gets the lista programa.
	 *
	 * @return the lista programa
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public static List<DesplegadoEscuelaREFP> getListaPrograma() {
		return Arrays.asList(values());
	}
	
}
