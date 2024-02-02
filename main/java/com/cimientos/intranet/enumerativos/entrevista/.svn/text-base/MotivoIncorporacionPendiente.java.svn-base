package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum MotivoIncorporacionPendiente {
	
	NOCONTACTO(1,"No se pudo establecer contacto"),
	NOSEREALIZOENTREVISTA(2,"No se llegó a realizar la entrevista por finalización del período"),
	FALTOBECADO(3,"Faltó becado o RA"),
	OTROMOTIVO(4, "Otro");
	
	
	private Integer id;
	private String valor;
	
	
	private MotivoIncorporacionPendiente(Integer id, String valor) {
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
	
	public static List<MotivoIncorporacionPendiente> getMotivosIncorporacionPendiente(List<Integer> ids){
		ArrayList<MotivoIncorporacionPendiente> valor = new ArrayList<MotivoIncorporacionPendiente>();
		
		for (Integer id: ids)
			valor.add(MotivoIncorporacionPendiente.getMotivoIncorporacionPendiente(id));
		
		return valor;
	}
	
	public static MotivoIncorporacionPendiente getMotivoIncorporacionPendiente(Integer id){
		switch (id) {
		case 1:
			return NOCONTACTO;
		case 2:
			return NOSEREALIZOENTREVISTA;
		case 3:
			return FALTOBECADO;
		case 4:
			return OTROMOTIVO;
		default:
			throw new InvalidParameterException("Motivi de incorporación pendiente desconocida: "
					+ id);
		}
	}


	public static List<MotivoIncorporacionPendiente> getMotivoIncorporacionPendiente() {
		return Arrays.asList(values());
	}
}
