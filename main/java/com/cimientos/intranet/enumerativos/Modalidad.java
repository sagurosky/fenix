package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * The Enum NivelEscuela.
 */
public enum Modalidad implements Serializable{
	
	/** The TECNICA. */
	TECNICA(1,"Técnico Profesional"),
	
	/** The BACHILLER. */
	BACHILLER(2,"Común"),
	
	/** The NORMAL. */
	NORMAL(3,"Jóvenes y Adultos"),
	
	/** The ESCUELA ADULTOS. */
	ESCUELA_ADULTOS(4,"Rural"),
	
	/** The ARTES. */
	ARTES(5,"Artística"),
	
	/** The ARTES. */
	OTROS(6,"Otros");
	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;
	
	
	/**
	 * Instantiates a new nivel escuela.
	 *
	 * @param id the id
	 * @param valor the valor
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	private Modalidad(Integer id, String valor) {
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
	 * @param id the new id
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
	 * @param valor the new valor
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	/**
	 * Gets the estado.
	 *
	 * @param id the id
	 * @return the estado
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public static Modalidad getModalidad(Integer id){
		switch (id) {
		case 1:
			return TECNICA;
		case 2:
			return BACHILLER;
		case 3:
			return NORMAL;
		case 4:
			return ESCUELA_ADULTOS;
		case 5:
			return ARTES;
		case 6:
			return OTROS;
		default:
			throw new InvalidParameterException("Modalidad desconocida: " + id);
		}

	}
	
	
	/**
	 * Gets the lista nivel escuelas.
	 *
	 * @return the lista nivel escuelas
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public static List<Modalidad> getListaModalidad() {
		return Arrays.asList(values());
	}
	
}
