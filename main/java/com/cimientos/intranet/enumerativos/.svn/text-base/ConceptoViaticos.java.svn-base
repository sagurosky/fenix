/**
 * 
 */
package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * @author nlopez
 *
 */
public enum ConceptoViaticos {

	TRANSPORTE(1, "Transporte"),
	COMUNICACIONES(2,"Comunicaciones"),
	INTERNET(3,"Internet"),
	MATERIAL_DE_APOYO(4,"Material de apoyo"), 
	CORREO_POSTAL(5,"Correo postal"),
	COMIDA(6,"Comida"),
	OTROS(7, "Otro");
	
	private Integer id;
	private String valor;
	
	private ConceptoViaticos(Integer id, String valor)
	{
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
	
	public static ConceptoViaticos getConceptoViaticos(Integer id) {
		switch (id) {
		case 1:
			return TRANSPORTE;
		case 2:
			return COMUNICACIONES;
		case 3:
			return INTERNET;
		case 4:
			return MATERIAL_DE_APOYO;
		case 5:
			return CORREO_POSTAL;
		case 6:
			return COMIDA;
		case 7:
			return OTROS;
		default:
			throw new InvalidParameterException("Concepto Viatico desconocido: "
					+ id);
		}
	}
	
	/**
	 * @return
	 */
	public static List<ConceptoViaticos> getListaEstados() {
		return Arrays.asList(values());
	}
	
}
