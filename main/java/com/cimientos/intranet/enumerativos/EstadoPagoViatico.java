package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * The Enum EstadoPagoViatico.
 */
public enum EstadoPagoViatico {

	/** The APROBADO. */
	APROBADO(1,"Aprobado"),

	
	/** The N o_ aprobado. */
	NO_APROBADO(2,"No Aprobado");
	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;
	
	/**
	 * Instantiates a new estado pago viatico.
	 *
	 * @param id the id
	 * @param valor the valor
	 * @author hhrodriguez
	 * @since 09-feb-2011
	 */
	private EstadoPagoViatico(Integer id, String valor)
	{
		this.id = id;
		this.valor = valor;
	}

	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @author hhrodriguez
	 * @since 09-feb-2011
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the id to set
	 * @author hhrodriguez
	 * @since 09-feb-2011
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * Gets the valor.
	 *
	 * @return the valor
	 * @author hhrodriguez
	 * @since 09-feb-2011
	 */
	public String getValor() {
		return valor;
	}

	/**
	 * Sets the valor.
	 *
	 * @param valor the valor to set
	 * @author hhrodriguez
	 * @since 09-feb-2011
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	/**
	 * Gets the estado pago viatico.
	 *
	 * @param id the id
	 * @return the estado pago viatico
	 * @author hhrodriguez
	 * @since 09-feb-2011
	 */
	public static EstadoPagoViatico getEstadoPagoViatico(Integer id) {
		switch (id) {
		case 1:
			return APROBADO;
		case 2:
			return NO_APROBADO;
		default:
			throw new InvalidParameterException("Estado Pago desconocido: "	+ id);
		}
	}
	
	public static List<EstadoPagoViatico> getListaEstadoPagos() {
		return Arrays.asList(values());
	}
	
}
