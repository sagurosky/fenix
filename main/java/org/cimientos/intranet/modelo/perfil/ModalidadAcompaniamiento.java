package org.cimientos.intranet.modelo.perfil;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

public enum ModalidadAcompaniamiento implements Serializable{

	
	PRESENCIAL(1,"Presencial"),
	
	
	VIRTUAL(2,"Virtual");
	
	
	
	private Integer id;
	
	
	private String valor;
	
	
	private ModalidadAcompaniamiento(Integer id, String valor) {
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
		
	public static ModalidadAcompaniamiento getModalidadAcompaniamiento(Integer id){
		for(ModalidadAcompaniamiento modalidadAcompaniamiento : Arrays.asList(values())){
			if(modalidadAcompaniamiento.getId().equals(id)){
				return modalidadAcompaniamiento;
			}
		}

		return null;
	}
		
	public static List<ModalidadAcompaniamiento> getListaModalidadAcompaniamientos() {
		return Arrays.asList(values());
	}
	
}
