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
public enum RelacionVivienda implements Serializable{

	PROPIA(1, "Propia" ),
	ALQUILADA(2, "Alquilada"),
	PRESTADA(3, "Prestada"),
	CEDIDA(4, "Cedida"),
	TERRENO_FISCAL(5, "Terreno_Fiscal"),
	OTRO(6, "Otro");
	
	private Integer id;
	private String valor;
	
	private RelacionVivienda( Integer id, String valor){
			this.id = id;
			this.valor = valor;
	}

	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @since 15-dic-2010
	 * @author nlopez
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
	
	public static RelacionVivienda getRelacionVivienda( Integer id ){
		
		switch (id) {
		case 1:
			return PROPIA;
		
		case 2:
			return ALQUILADA;
		
		case 3:
			return PRESTADA;
			
		case 4:
			return CEDIDA;
			
		case 5:
			return TERRENO_FISCAL;
			
		case 6:
			return OTRO;			

		default:
			throw new InvalidParameterException( "Tipo de vivienda desconocido: " + id );
		}
				
	}

	public static List<RelacionVivienda> getRelacionViviendas(){
		return Arrays.asList(values());
	}
		
}
