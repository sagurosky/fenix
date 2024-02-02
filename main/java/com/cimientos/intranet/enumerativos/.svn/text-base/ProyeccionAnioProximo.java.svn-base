package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum ProyeccionAnioProximo {

	TRABAJAR(1,"Trabajar"),
	REALIZAR_CURSO(2,"Realizar un curso"),
	REALIZAR_TERCIARIO(3,"Realizar estudios Terciario / Tecnicatura"),
	REALIZAR_UNIVERSITARIO(4,"Realizar estudios Universitarios"),
	NO_DEFINIDO_AUN(5,"No definido aún");
	
	private Integer id;
	private String valor;
	
	private ProyeccionAnioProximo(Integer id, String valor) {
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
	
	
	public static ProyeccionAnioProximo getProyeccionAnioProximo(Integer id){
		switch (id) {
		case 1:
			return TRABAJAR;
		case 2:
			return REALIZAR_CURSO;
		case 3:
			return REALIZAR_TERCIARIO;
		case 4:
			return REALIZAR_UNIVERSITARIO;
		case 5:
			return NO_DEFINIDO_AUN;
		default:
			throw new InvalidParameterException("Tipo de Proyeccion de año proximo desconocido: " + id);
		}
	}	
	
	public static List<ProyeccionAnioProximo> getProyeccionAnioProximo(){
		return Arrays.asList(values());
	}
	
}
