package com.cimientos.intranet.enumerativos.entrevista;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum DetalleGastos {
	
	UTILES(1,"útiles escolares"),
	LIBROS(2,"libros"),
	TRANSPORTE(3,"transporte"),
	VESTIMENTA(4,"vestimenta"),
	CALZADO(5,"calzado"),
	HIGIENE(6,"higiene personal"),
	ELEMENTOS(7,"elementos para el hogar"),
	COOPERADORA(8,"cooperadora escolar"),
	SERVICIOS(9,"servicios del hogar"),
	TECNOLOGIA(10,"tecnología"),
	DEPORTE(11,"deporte"),
	RECREACION(12,"recreación"),
	OTRO(13,"otro"),
	NC(14,"no corresponde");

	private Integer id;
	private String valor;
	
	
	private DetalleGastos(Integer id, String valor) {
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
	
	
	public static DetalleGastos getDetalleGastos(Integer id){
		switch (id) {
		case 1:
			return UTILES;
		case 2:
			return LIBROS;
		case 3:
			return TRANSPORTE;
		case 4:
			return VESTIMENTA;
		case 5:
			return CALZADO;
		case 6:
			return HIGIENE;
		case 7:
			return ELEMENTOS;
		case 8:
			return COOPERADORA;
		case 9:
			return SERVICIOS;
		case 10:
			return TECNOLOGIA;
		case 11:
			return DEPORTE;
		case 12:
			return RECREACION;
		case 13:
			return OTRO;
		case 14:
			return NC;	
		
		default:
			throw new InvalidParameterException("Detalle de gasto desconocido: "
					+ id);
		}

	}
	
	public static List<DetalleGastos> getDetalleGastos(){
		return Arrays.asList(values());
	}
	
}
