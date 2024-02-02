/**
 * 
 */
package com.cimientos.intranet.enumerativos.entrevista;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * @author nlopez
 *
 */
public enum Entrevistador implements Serializable{

	STAFF(1, "Staff"),
	EAS(2, "Eas"),
	VOLUNTARIOS(3, "Voluntarios");
	
	private Integer id;
	private String valor;
	
	private Entrevistador( Integer id, String valor){
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
	 * @param id the id to set
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
	
	public static Entrevistador getEntrevistador( Integer id ){
		switch ( id ) {
		case 1:
			return STAFF;
			
		case 2:
			return EAS;
		
		case 3:
			return VOLUNTARIOS;					

		default:
			throw new InvalidParameterException( "Tipo de opcion no valida: " + id );			
		}
	}
	
	public static List<Entrevistador> getEntrevistador(){
		return Arrays.asList(values());
	}
	
}
