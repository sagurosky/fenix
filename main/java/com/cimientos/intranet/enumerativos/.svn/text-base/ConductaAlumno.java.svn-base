/**
 * 
 */
package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * @author plabaronnie
 *
 */
public enum ConductaAlumno implements Serializable{
	EXCELENTE(1,"Excelente","E"),
	MUYBUENO(2,"Muy Bueno","MB"),
	BUENO(3,"Bueno","B"),
	REGULAR(4,"Regular","R"),
	MALO(5,"Malo","M");
	
	
	private Integer id;
	private String valor;
	private String descripcion;
	
	
	/**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}


	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	private ConductaAlumno(Integer id,  String descripcion, String valor) {
		this.id = id;
		this.valor = valor;
		this.descripcion = descripcion;
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
	
	
	public static ConductaAlumno getConductaAlumno(Integer id){
		switch (id) {
		case 1:
			return EXCELENTE;
		case 2:
			return MUYBUENO;
		case 3:
			return BUENO;
		case 4:
			return REGULAR;
		case 5:
			return MALO;

		default:
			throw new InvalidParameterException("Tipo de Conducta de Alumno desconocido: "
					+ id);
		}
	}	
	
	public static List<ConductaAlumno> getListaConductaAlumno(){
		return Arrays.asList(values());
	}
}
