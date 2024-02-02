package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum EnumPBE {

	EXCELENTE(1,"Excelente"),
	MUYBUENO(2,"Muy Bueno"),
	BUENO(3,"Bueno"),
	REGULAR(4,"Regular"),
	MALO(5,"Malo");
	
	
	private Integer id;
	private String valor;
	
	
	private EnumPBE(Integer id, String valor) {
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
	
	
	public static EnumPBE getEnumPBE(Integer id){
		switch (id) {
		case 1:
			return EXCELENTE;
		case 2:
			return MUYBUENO;
		case 3:
			return BUENO;
		case 4:
			return REGULAR;
		case 5:
			return MALO;

		default:
			throw new InvalidParameterException("Tipo de Enum de PFE desconocido: "
					+ id);
		}
	}	
	
	public static List<EnumPBE> getEnumPBE(){
		return Arrays.asList(values());
	}
}
