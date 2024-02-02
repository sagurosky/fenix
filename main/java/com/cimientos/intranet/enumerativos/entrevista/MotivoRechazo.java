package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum MotivoRechazo {

	ALTOS_INGRESOS(1,"Altos ingresos"),
	COMPROMISO_ESCOLAR_BAJO(2,"Bajo compromiso escolar"),
	REPITENCIA(3,"Está repitiendo"),
	ELIGE_OTRA_BECA(4,"Elige otra beca"),
	CONVIVIENTE_CON_BECA(5,"Otro conviviente con beca Cimientos"),
	CAMBIO_ESCUELA(6,"Se cambió de escuela"),
	RENDIMIENTO_INSUFICIENTE(7,"Rendimiento insuficiente"),
	OTRO(8,"Otro");
	
	private Integer id;
	private String valor;
	
	private MotivoRechazo(Integer id, String valor) {
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
	
	public static MotivoRechazo getMotivoRechazo(Integer id){
		switch (id) {
		case 1:
			return ALTOS_INGRESOS;
		case 2:
			return COMPROMISO_ESCOLAR_BAJO;
		case 3:
			return REPITENCIA;
		case 4:
			return ELIGE_OTRA_BECA;
		case 5:
			return CONVIVIENTE_CON_BECA;
		case 6:
			return CAMBIO_ESCUELA;
		case 7:
			return RENDIMIENTO_INSUFICIENTE;
		case 8:
			return OTRO;
		default:
			throw new InvalidParameterException("Motivo de Rechazo desconocido: "
					+ id);
		}
	}
	
	public static List<MotivoRechazo> getListaMotivosRechazo(){
		return Arrays.asList(values());
	}
	
	
}
