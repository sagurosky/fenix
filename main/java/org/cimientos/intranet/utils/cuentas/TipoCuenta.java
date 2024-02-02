package org.cimientos.intranet.utils.cuentas;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum TipoCuenta {
	
	RESPONSABLE(1,"Responsable"),
	PERFIL_STAFF(2,"Perfil Staff");
	
	
	private Integer id;
	private String valor;
	
	
	private TipoCuenta(Integer id, String valor) {
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
	
	
	public static TipoCuenta getTipoCuenta(Integer id){
		switch (id) {
		case 1:
			return RESPONSABLE;
		case 2:
			return PERFIL_STAFF;
		default:
			throw new InvalidParameterException("Tipo de Cuenta desconocido: "
					+ id);
		}
	}	
	
	public static List<TipoCuenta> getTipoCuentas(){
		return Arrays.asList(values());
	}

}
