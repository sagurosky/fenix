package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * The Enum TipoConvocatoria.
 */
public enum TipoConvocatoria {
	
	/** The INCORPORACION. */
	INCORPORACION(1,"Incorporacion"),
	
	/** The REEMPLAZO. */
	REEMPLAZO(2,"Reemplazo");
	
	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;
	
	
	/**
	 * Instantiates a new tipo convocatoria.
	 *
	 * @param id the id
	 * @param valor the valor
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	private TipoConvocatoria(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}


	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public Integer getId() {
		return id;
	}


	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public void setId(Integer id) {
		this.id = id;
	}


	/**
	 * Gets the valor.
	 *
	 * @return the valor
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public String getValor() {
		return valor;
	}


	/**
	 * Sets the valor.
	 *
	 * @param valor the new valor
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	
	/**
	 * Gets the tipo convocatoria.
	 *
	 * @param id the id
	 * @return the tipo convocatoria
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public static TipoConvocatoria getTipoConvocatoria(Integer id){
		switch (id) {
		case 1:
			return INCORPORACION;
		case 2:
			return REEMPLAZO;
				default:
			throw new InvalidParameterException("Tipo de convocatoria desconocido: "
					+ id);
		}
	}	
	
	/**
	 * Gets the tipo convocatoria.
	 *
	 * @return the tipo convocatoria
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public static List<TipoConvocatoria> getTipoConvocatoria(){
		return Arrays.asList(values());
	}
		
}
