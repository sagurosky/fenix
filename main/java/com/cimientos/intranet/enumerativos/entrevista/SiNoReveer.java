/**
 * 
 */
package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * @author nlopez
 *
 */
public enum SiNoReveer {
	
	SI(1, "Si"),
	NO(2, "No"),
	REVEER(3, "Reveer");
	
	private Integer id;
	private String valor;
	
	private SiNoReveer( Integer id, String valor ){
		this.id = id;
		this.valor = valor;
	}

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the id to set
	 * @since 15-dic-2010
	 * @author nlopez
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the valor
	 */
	public String getValor() {
		return valor;
	}

	/**
	 * @param valor the valor to set
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	public static SiNoReveer getSiNoReveer( Integer id){
		
		switch (id) {
		case 1:
			return SI;
			
		case 2:
			return NO;
			
		case 3:
			return REVEER;						

		default:
			throw new InvalidParameterException( "Tipo de opcion no valida: " + id );
		}
	}
	
	public static List<SiNoReveer> getSiNoReveers(){
		return Arrays.asList(values());
	} 

}
