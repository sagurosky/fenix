package com.cimientos.intranet.enumerativos;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum EspacioApoyo {

	ESPACIOS(1, "Gabinete/Equipo de orientación escolar"), 
	ORIENTACION(2, "Sala de profesores"),
	BIBLIOTECA(3, "Biblioteca"),
	LABORATORIO(4, "Laboratorio/Taller"),
	COMPUTACION(5, "Sala de Computación"),
	USOSMULTIPLES(6, "Salón de usos múltiples"),
	CE(7, "Centro de Estudiantes"),
	ESPACIOSAA(8, "Apoyo escolar"),
	RECURSAR(9, "Sala de música"),
	INTERNET(10, "Acceso a internet"),
	COMEDOR(11, "Comedor"),
	COOPERADORA(12, "Cooperadora"),
	COCINA(13, "Cocina"),
	ALMUERZO(14, "Almuerzo/Merienda"),
	OTRO(15, "Otro");
	
	
	private Integer id;
	private String valor;
	
	
	private EspacioApoyo(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}
	
	public static EspacioApoyo getEspacioApoyo(Integer id){
		switch (id) {
		case 1:
			return ESPACIOS;
		case 2:
			return ORIENTACION;
		case 3:
			return BIBLIOTECA;
		case 4:
			return LABORATORIO;
		case 5:
			return COMPUTACION;
		case 6:
			return USOSMULTIPLES;
		case 7:
			return CE;
		case 8:
			return ESPACIOSAA;
		case 9:
			return RECURSAR;
		case 10:
			return INTERNET;
		case 11:
			return COMEDOR;
		case 12:
			return COOPERADORA;
		case 13:
			return COCINA;
		case 14:
			return ALMUERZO;
		case 15:
			return OTRO;	
		default:
			throw new InvalidParameterException("Espacio de apoyo desconocido: " + id);
		}
	}	
	
	public static List<EspacioApoyo> getEspacioApoyo(){
		return Arrays.asList(values());
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
}
