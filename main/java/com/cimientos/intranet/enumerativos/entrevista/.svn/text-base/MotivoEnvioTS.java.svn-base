package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum MotivoEnvioTS {

	INGRESOS_DUDOSOS(1,"Dudas sobre ingresos"),
	DUDAS_RA(2,"Dudas sobre RA"),
	UNICO_ENTREVISTADOR(3,"Único entrevistador");
	
	private Integer id;
	private String valor;
	
	private MotivoEnvioTS(Integer id, String valor) {
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
	
	public static MotivoEnvioTS getMotivoEnvioTS(Integer id){
		switch (id) {
		case 1:
			return INGRESOS_DUDOSOS;
		case 2:
			return DUDAS_RA;
		case 3:
			return UNICO_ENTREVISTADOR;
		default:
			throw new InvalidParameterException("Motivo de Envio a TS desconocido: "
					+ id);
		}
	}
	
	public static List<MotivoEnvioTS> getListMotivoEnvioTS(){
		return Arrays.asList(values());
	}
}
