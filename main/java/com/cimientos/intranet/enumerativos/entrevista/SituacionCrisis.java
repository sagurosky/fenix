package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum SituacionCrisis {
	
	FALLECIMIENTO(1,"Fallecimiento de una persona significativa"),
	ENFERMEDAD(2,"Enfermedad propia o de una persona significativa"),
	MATERNIDAD(3,"Maternidad/Paternidad"),
	MUDANZA(4,"Mudanza"),
	VIOLENCIA(5,"Situación de violencia familiar"),
	CRISIS(6,"Situación de crisis económica en la familia"),
	CAMBIOFAMILIAR(7,"Cambio de estructura familiar/convivientes"),
	CONSUMO(8,"Consumo problemático"),
	VIOLENCIAESCOLAR(9,"Situación de violencia escolar"),
	OTRO(10,"Otro"),
	NINGUNO(11,"Ninguno"),
	CONECTIVIDAD(12,"Problemas de conectividad (acceso a internet y/o equipo)"),
	LABORALES(13,"Estudiante con responsabilidades laborales");

	private Integer id;
	private String valor;
	
	
	private SituacionCrisis(Integer id, String valor) {
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
	
	
	public static SituacionCrisis getSituacionCrisis(Integer id){

		switch (id) {
		case 1:
			return FALLECIMIENTO;
		case 2:
			return ENFERMEDAD;
		case 3:
			return MATERNIDAD;
		case 4:
			return MUDANZA;
		case 5:
			return VIOLENCIA;
		case 6:
			return CRISIS;
		case 7:
			return CAMBIOFAMILIAR;
		case 8:
			return OTRO;
		case 9:
			return CONSUMO;
		case 10:
			return VIOLENCIAESCOLAR;
		case 11:
			return NINGUNO;
		case 12:
			return CONECTIVIDAD;
		case 13:
			return LABORALES;
		
		default:
			throw new InvalidParameterException("Situacion de crisis desconocida: "
					+ id);
		}

	}


	public static List<SituacionCrisis> getSituacionCrisis() {
		return Arrays.asList(values());
	}
	
}
