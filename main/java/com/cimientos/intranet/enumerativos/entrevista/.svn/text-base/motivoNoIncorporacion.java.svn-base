package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum motivoNoIncorporacion {
	
	NOCONTACTO(1,"No se pudo establecer contacto"),
	CAMBIOESCUELA(2,"Cambio de escuela"),
	NOINTERESBECA(3,"No interesado en PFE por otra beca"),
	NOINTERESCONDICIONES(4,"No interesado en PFE por condiciones"),
	OTRO(5,"Otro");
	
	
	
	private Integer id;
	private String valor;
	
	
	private motivoNoIncorporacion(Integer id, String valor) {
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
	
	public static List<motivoNoIncorporacion> getMotivosNoIncorporacion(List<Integer> ids){
		ArrayList<motivoNoIncorporacion> valor = new ArrayList<motivoNoIncorporacion>();
		
		for (Integer id: ids)
			valor.add(motivoNoIncorporacion.getmotivoNoIncorporacion(id));
		
		return valor;
	}
	
	
	public static motivoNoIncorporacion getmotivoNoIncorporacion(Integer id){
		switch (id) {
		case 1:
			return NOCONTACTO;
		case 2:
			return CAMBIOESCUELA;
		case 3:
			return NOINTERESBECA;
		case 4:
			return NOINTERESCONDICIONES;
		case 5:
			return OTRO;
		
		default:
			throw new InvalidParameterException("Motivo de no incorporacion desconocido: "
					+ id);
		}
	}

	public static List<motivoNoIncorporacion> getmotivoNoIncorporacion(){
		return Arrays.asList(values());
	}
	
}
