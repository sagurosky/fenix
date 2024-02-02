/**
 * 
 */
package org.cimientos.intranet.modelo;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.cimientos.intranet.enumerativos.entrevista.TipoEntrevista;

/**
 * @author plabaronnie
 *
 */
public enum EstadoCuenta implements Serializable{
	ACTIVA(1, "Activa"),
	EN_PROCESO(2, "En Proceso"),
	NO_SOLICITADA(3, "No Solicitada"),
	CORREGIDA(4, "Corregida"),
	FALLIDA(5, "Fallida"),
	INACTIVA(6, "Inactiva");
	
	private EstadoCuenta(Integer id, String valor) {
		this.valor = valor;
		this.id = id;
	}
	
	private Integer id;
	private String valor;
	
	
	/**
	 * @return
	 */
	public String getValor() {
		return valor;
	}
	
	/**
	 * @param valor
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	/**
	 * @return
	 */
	public static List<EstadoCuenta> getListaEstados(){
		return Arrays.asList(values());
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
	
	public static List<EstadoCuenta> getEstadosCuenta(List<Integer> ids){
		ArrayList<EstadoCuenta> valor = new ArrayList<EstadoCuenta>();
		
		for (Integer id: ids)
			valor.add(EstadoCuenta.getEstadoCuenta(id));
		
		return valor;
	}
	
	public static EstadoCuenta getEstadoCuenta(Integer id) {
		switch (id) {
		case 1:
			return ACTIVA;
		case 2:
			return EN_PROCESO;
		case 3:
			return NO_SOLICITADA;
		case 4:
			return CORREGIDA;
		case 5:
			return FALLIDA;
		case 6:
			return INACTIVA;			
		default:
			throw new InvalidParameterException("Estado Cuenta desconocido: "
					+ id);
		}
	}
	
	/**
	 * @return Estados de Cuenta para el Informe de Cuentas
	 */
	public static List<EstadoCuenta> getListaEstadoCuentaParaInforme() {
		ArrayList<EstadoCuenta> listaEstadoInforme = new ArrayList<EstadoCuenta>();
		listaEstadoInforme.add(NO_SOLICITADA);
		listaEstadoInforme.add(EN_PROCESO);
		listaEstadoInforme.add(FALLIDA);
		listaEstadoInforme.add(CORREGIDA);
		listaEstadoInforme.add(ACTIVA);		
		return listaEstadoInforme;
	}
	
}
