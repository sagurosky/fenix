package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum EmitioCarta {

	NO_TIENE_CARTA(1,"No tiene Carta Emitida"),
	
	TIENE_CARTA(2,"Tiene Carta Emitida");
	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;
	
	
	private EmitioCarta(Integer id, String valor) {
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
	
	
	public static EmitioCarta getEmisionCarta(Integer id){
		switch (id) {
		case 1:
			return NO_TIENE_CARTA;
		case 2:
			return TIENE_CARTA;
		default:
		//	return null;
			throw new InvalidParameterException("Emisión   desconocida: " + id);
		}

	}
	
	
	public static List<EmitioCarta> getEmisionCartas() {
		return Arrays.asList(values());
	}
}
