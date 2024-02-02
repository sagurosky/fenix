package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum SituacionRiesgoEscolar {
	
	DIFICULTAD(1,"Dificultad en la comprensión de los contenidos escolares"),
	DEVOLUCION(2,"Falta de devolución de profesores"),
	DESMOTIVACION(3,"Desmotivación por las actividades escolares virtuales"),
	AUSENTISMO(4,"Ausentismo prolongado a las actividades escolares"),	
	OTRO(5,"Otro"),
	NINGUNO(6,"Ninguno");
	
	
	private Integer id;
	private String valor;
	
	
	private SituacionRiesgoEscolar(Integer id, String valor) {
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
	
	
	public static SituacionRiesgoEscolar getSituacionRiesgoEscolar(Integer id){

		switch (id) {
		case 1:
			return DIFICULTAD;
		case 2:
			return DEVOLUCION;
		case 3:
			return DESMOTIVACION;
		case 4:
			return AUSENTISMO;		
		case 5:
			return OTRO;
		case 6:
			return NINGUNO;
		
		
		default:
			throw new InvalidParameterException("Situacion de crisis desconocida: "
					+ id);
		}

	}


	public static List<SituacionRiesgoEscolar> getSituacionRiesgoEscolar() {
		return Arrays.asList(values());
	}
	
}
