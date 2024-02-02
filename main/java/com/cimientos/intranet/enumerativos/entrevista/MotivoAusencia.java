package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum MotivoAusencia {
	
	SELECCIONOPCION(0,"Seleccione una opción"),
	ENFERMEDAD(1,"Razones de salud propia o de terceros"), //antes era enfermedad
	EVENTUALIDAD(2,"Sin justificación-se desconoce el motivo"),
	INASISTENCIA(3,"Sin justificación-se desconoce el motivo"),
	OTROS(4,"Otros"),
	NOCORRESPONDE(5,"No corresponde"),
	CUIDADO(6,"Cuidado-ayuda a terceros"),
	MOTIVOSLABORALES(7,"Motivos laborales"),
	DESCONOCIMIENTO(8,"Desconocimiento, olvido o confusión de fecha de entrevista"),
	DIFICULTADES(9,"Dificultades en el traslado"),
	TRAMITES(10,"Realización de trámites"),
	FACTORESCLIMATICOS(11,"Factores climáticos"),
	VIAJEAOTRALOCALIDAD(12,"Viaje a otra localidad"),
	NODEMUESTRAINTERES(13,"No demuestra interés-compromiso");
	
	private Integer id;
	private String valor;
	
	
	private MotivoAusencia(Integer id, String valor) {
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
	
	
	public static MotivoAusencia getMotivoAusencia(Integer id){
		switch (id) {
		case 0:
			return SELECCIONOPCION;
		case 1:
			return ENFERMEDAD;
		case 2:
			return EVENTUALIDAD;
		case 3:
			return INASISTENCIA;
		case 4:
			return OTROS;
		case 5:
			return NOCORRESPONDE;
		case 6:
			return CUIDADO;
		case 7:
			return MOTIVOSLABORALES;
		case 8:
			return DESCONOCIMIENTO;
		case 9:
			return DIFICULTADES;
		case 10:
			return TRAMITES;
		case 11:
			return FACTORESCLIMATICOS;
		case 12:
			return VIAJEAOTRALOCALIDAD;
		case 13:
			return NODEMUESTRAINTERES;
		
		default:
			throw new InvalidParameterException("Motivo de ausencia desconocido: "
					+ id);
		}
	}

	public static List<MotivoAusencia> getMotivoAusencias(){
		return Arrays.asList(values());
	}
}
