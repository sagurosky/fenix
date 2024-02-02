/**
 * 
 */
package org.cimientos.intranet.modelo.informe;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author plabaronnie
 *
 */
public enum EstadoInforme {

	CONSTRUCCION(1,"Construccion"),
	SUPERVISOR(2,"Supervisor"),
	CORRECTORA(3,"Correctora"),
	REVISION(4,"Revision"),
	FINALIZADO(5,"Finalizado"),
	ENVIADO(6,"Enviado"),
	NO_ENVIADO(7,"No Enviado"),
	PENDIENTE_POR_RENOVACION(8,"Pendiente por renovación"),
	INACTIVO(9,"Inactivo");

	private Integer id;
	private String valor;
	
	
	private EstadoInforme(Integer id, String valor) {
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
	
	public static List<EstadoInforme> getEstados(List<Integer> ids){
		ArrayList<EstadoInforme> valor = new ArrayList<EstadoInforme>();
		
		for (Integer id: ids){
			valor.add(EstadoInforme.getEstados(id));
		}
		
		return valor;
	}
	
	public static EstadoInforme getEstados(Integer id){
		switch (id) {
		case 1:
			return CONSTRUCCION;
		case 2:
			return SUPERVISOR;
		case 3:
			return CORRECTORA;
		case 4:
			return REVISION;
		case 5:
			return FINALIZADO;
		case 6:
			return ENVIADO;
		case 7:
			return NO_ENVIADO;
		case 8:
			return PENDIENTE_POR_RENOVACION;
		case 9:
			return INACTIVO;
		default:
			throw new InvalidParameterException("EstadoInforme  desconocido: "
					+ id);
		}

	}
	
	public static List<EstadoInforme> getListaEstados(){
		return Arrays.asList(values());
	}
	
	public static List<EstadoInforme> getListaEstadosGrilla(){
		ArrayList<EstadoInforme> listaGrilla = new ArrayList<EstadoInforme>();
		listaGrilla.add(FINALIZADO);
		listaGrilla.add(ENVIADO);
		listaGrilla.add(NO_ENVIADO);
		return listaGrilla;
	}
	
	public static List<EstadoInforme> getListaEstadosSeleccion(){
		ArrayList<EstadoInforme> lista = new ArrayList<EstadoInforme>();
		lista.add(REVISION);
		lista.add(PENDIENTE_POR_RENOVACION);
		return lista;
	}
}
