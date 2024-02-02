package com.cimientos.intranet.enumerativos.entrevista;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum EstadoEntrevista implements Serializable{
	
	CONSTRUCCION(1,"En construccion"),
	SUPERVISOR(2,"Supervisor"),
	FINALIZADA(3,"Finalizada");
	
	
	private Integer id;
	private String valor;
	
	
	private EstadoEntrevista(Integer id, String valor) {
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
	
	public static List<EstadoEntrevista> getEstadosEntrevista(List<Integer> ids){
		ArrayList<EstadoEntrevista> valor = new ArrayList<EstadoEntrevista>();
		
		for (Integer id: ids)
			valor.add(EstadoEntrevista.getEstadoEntrevista(id));
		
		return valor;
	}
	
	
	public static EstadoEntrevista getEstadoEntrevista(Integer id){
		switch (id) {
		case 1:
			return CONSTRUCCION;
		case 2:
			return SUPERVISOR;
		case 3:
			return FINALIZADA;
				
		default:
			throw new InvalidParameterException("Estado deentrevista desconocido: "
					+ id);
		}
	}


	public static List<EstadoEntrevista> getEstadoEntrevista() {
		return Arrays.asList(values());
	}
}
