package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum EstrategiaComplementaria {

	
	TALLER(1,"Taller de materias previas"),
	TALLERCOMPLEMENTARIO(2,"Taller complementario"),
	INTERVENCIONTS(3,"Intervención TS"),
	ENTREVISTAADI(4,"Entrevista adicional"),
	ENCUENTRO(5,"Encuentro de padres"),
	OTRO(6,"Otro");

	private Integer id;
	private String valor;
	
	
	private EstrategiaComplementaria(Integer id, String valor) {
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
	
	
	public static EstrategiaComplementaria getEstrategiaComplementaria(Integer id){
		switch (id) {
		case 1:
			return TALLER;
		case 2:
			return TALLERCOMPLEMENTARIO;
		case 3:
			return INTERVENCIONTS;
		case 4:
			return ENTREVISTAADI;
		case 5:
			return ENCUENTRO;
		case 6:
			return OTRO;
		
		default:
			throw new InvalidParameterException("Estrategia complementaria desconocida: "
					+ id);
		}

	}
	
	public static List<EstrategiaComplementaria> getEstrategiasComplementarias(){
		return Arrays.asList(values());
	}
	
}
