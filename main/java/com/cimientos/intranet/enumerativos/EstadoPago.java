/**
 * 
 */
package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.cimientos.intranet.modelo.EstadoCuenta;


/**
 * @author msagarduy
 * @param 
 */
public enum EstadoPago implements Serializable{

	APROBADO(1, "Aprobado"), 
	FALLIDO(2, "Fallido"),
	NO_APROBADO(3, "No Aprobado"), 
	REALIZADO(4, "Realizado"),
	CORREGIDO(5, "Corregido"),
	SUSPENDIDO(6, "Suspendido"),
	NO_APLICA(7,"No Aplica");
	
	private Integer id;
	private String valor;
	
	private EstadoPago(Integer id, String valor)
	{
		this.id = id;
		this.valor = valor;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}
	public static EstadoPago getEstadoPago(Integer id) {
		switch (id) {
		case 1:
			return APROBADO;
		case 2:
			return FALLIDO;
		case 3:
			return NO_APROBADO;
		case 4:
			return REALIZADO;
		case 5:
			return CORREGIDO;	
		case 6:
			return SUSPENDIDO;
		case 7:
			return NO_APLICA;	
		default:
			throw new InvalidParameterException("Estado Pago desconocido: "
					+ id);
		}
	}

	/**
	 * @return
	 */
	public static List<EstadoPago> getListaEstados() {
		return Arrays.asList(values());
	}

	public static List<EstadoPago> getEstadosPago(List<Integer> ids){
		ArrayList<EstadoPago> valor = new ArrayList<EstadoPago>();
		
		for (Integer id: ids)
			valor.add(EstadoPago.getEstadoPago(id));
		
		return valor;
	}
	
	/**
	 * @return Estados de Pago para el Listado de Pagos Anteriores
	 */
	public static List<EstadoPago> getListaEstadoPagosAnteriores() {
		ArrayList<EstadoPago> listaEstadoPagosAnteriores = new ArrayList<EstadoPago>();
		listaEstadoPagosAnteriores.add(REALIZADO);
		listaEstadoPagosAnteriores.add(FALLIDO);
		return listaEstadoPagosAnteriores;
	}
	
	/**
	 * @return Estados de Pago para el Listado de Pagos Becados
	 */
	public static List<EstadoPago> getListaEstadoPagosBecados() {
		ArrayList<EstadoPago> listaEstadoPagosAnteriores = new ArrayList<EstadoPago>();
		listaEstadoPagosAnteriores.add(APROBADO);
		listaEstadoPagosAnteriores.add(REALIZADO);
		listaEstadoPagosAnteriores.add(FALLIDO);
		listaEstadoPagosAnteriores.add(CORREGIDO);
		return listaEstadoPagosAnteriores;
	}
	
}
