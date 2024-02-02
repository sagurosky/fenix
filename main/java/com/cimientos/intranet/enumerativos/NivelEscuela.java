package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;


/**
 * The Enum NivelEscuela.
 */
public enum NivelEscuela implements Serializable{
	
	INICIAL(1,"-"),
	PRIMARIO(2,"-"),
	SECUNDARIO(3,"Secundaria"),
	EGB_1(4,"-"),
	EGB_2(5,"-"),
	EGB_3(6,"-"),
	POLIMODAL(7,"-"),
	PRIMARIO_SECUNDARIO(8,"Primaria - Secundaria"),
	INICIAL_PRMARIO_SECUNDARIO(9,"Inicial - Primaria - Secundaria"),
	INICIAL_PRIMARIO(10,"-"),
	EGB1_2_3 (11,"-"),
	//DMS 31/1/24 agrego los que necesito, si molestan en otro listado filtrarlos
	PRIMARIA (12,"Primaria"),
	SUPERIOR (13,"Superior");

	
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
	private NivelEscuela(Integer id, String valor) {
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
	 * Gets the niveles escuela.
	 *
	 * @param id the id
	 * @return the niveles escuela
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public static NivelEscuela getNivelEscuela(Integer id){
	
		for(NivelEscuela nivel : values()){
			if(nivel.getId() == id){
				return nivel;
			}
		}
		return null;
//			throw new InvalidParameterException("Nivel desconocido: " + id);
	

	}
	
	/**
	 * Gets the lista niveles escuela.
	 *
	 * @return the lista niveles escuela
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public static List<NivelEscuela> getListaNivelesEscuela() {
		return Arrays.asList(values());
	}
	
	
}
