package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * The Enum Programa.
 */
public enum Programa implements Serializable{

	/** The PAE. */
	PAE(1,"-"),
	
	/** The PBE. */
	PFE(2,"PFE"),
	
	/** The PA e_ pbe. */
	PAE_PFE(3,"-"),
	
	/** The PRR. */
	PRR(4,"-"),
	
	/** The P_ alianzas. */
	P_ALIANZAS(5,"-"),
	
	/** The P_ articulacion. */
	P_ARTICULACION(6,"-"),
	
	/** The RE d_ egresados. */
	RED_EGRESADOS(7,"-"),
	
	/** The OTRO. */
	OTRO(8,"PFE + otros"),
	
	/** The OTRO. */
	OTRO2(9,"Otros");
	
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
	private Programa(Integer id, String valor) {
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
	public static Programa getPrograma(Integer id){
		switch (id) {
		case 1:
			return PAE;
		case 2:
			return PFE;
		case 3:
			return PAE_PFE;
		case 4:
			return PRR;
		case 5:
			return P_ALIANZAS;
		case 6:
			return P_ARTICULACION;
		case 7:
			return RED_EGRESADOS;
		case 8:
			return OTRO;
		case 9:
			return OTRO2;	
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
	public static List<Programa> getListaPrograma() {
		return Arrays.asList(values());
	}
	
}
