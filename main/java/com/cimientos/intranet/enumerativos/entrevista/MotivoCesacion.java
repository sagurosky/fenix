package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum MotivoCesacion {
	
	/*
	ABANDONO(1,"Abandono escolar"), //ok
	MUDANZA(2,"Cambio de escuela"), //ok
	CONDUCTA(3,"Bajo compromiso PFE"), // tiene que ser el 
	DEJAXBECA(4,"Bajo compromiso con la escolaridad"),  // tiene que ser el 8
	DEJAXTRABAJO(5,"Repitencia"),
	DEJAXEXIGENCIA(6,"Falta grave de conducta"), // tiene que ser el 3
	DEJAXINASISTENCIA(7,"Cambio en la situación económica"), // tiene que ser el 8
	DEJAXESITECO(8,"Renuncia a PFE"),
	FALLECIMIENTO(9,"Fallecimiento"),
	CAMBIODEESCUELA(10,"-"),// tiene que ser el 2
	*/
	
	// MODIFICADO 10.06.2021
	ABANDONO(1,"Abandono escolar"), 
	MUDANZA(2,"Cambio de escuela"), // DISA.
	CONDUCTA(3,"Falta grave de conducta"), 
	DEJAXBECA(4,"Renuncia a PFE"),  
	DEJAXTRABAJO(5,"Bajo compromiso con la escolaridad"),
	DEJAXEXIGENCIA(6,"Bajo compromiso con PFE"), 
	DEJAXINASISTENCIA(7,"Bajo compromiso con PFE"), // DISA
	DEJAXESITECO(8,"Cambio en la situación económica"),
	FALLECIMIENTO(9,"Fallecimiento"),
	CAMBIODEESCUELA(10,"Cambio de escuela"); 
	
		
	private Integer id;
	private String valor;
	
	
	private MotivoCesacion(Integer id, String valor) {
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
	
	public static List<MotivoCesacion> getMotivosCesacion(List<Integer> ids){
		ArrayList<MotivoCesacion> valor = new ArrayList<MotivoCesacion>();
		
		for (Integer id: ids)
			valor.add(MotivoCesacion.getMotivoCesacion(id));
		
		return valor;
	}
	
	public static MotivoCesacion getMotivoCesacion(Integer id){

		switch (id) {
		case 1:
			return ABANDONO;
		case 2:
			return MUDANZA;
		case 3:
			return CONDUCTA;
		case 4:
			return DEJAXBECA;
		case 5:
			return DEJAXTRABAJO;
		case 6:
			return DEJAXEXIGENCIA;
		case 7:
			return DEJAXINASISTENCIA;
		case 8:
			return DEJAXESITECO;
		case 9:
			return FALLECIMIENTO;
		case 10:
			return CAMBIODEESCUELA;
					
		default:
			throw new InvalidParameterException("Motivo de cesacion desconocido: "
					+ id);
		}

	}


	public static List<MotivoCesacion> getMotivoCesacion() {
		return Arrays.asList(values());
	}
	
}
