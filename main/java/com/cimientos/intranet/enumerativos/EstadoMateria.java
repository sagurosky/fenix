package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

public enum EstadoMateria implements Serializable{

	APROBADA(1, "APROBADO"), 
	DESAPROBADA(2,"DESAPROBADO"),
	SIN_CALIFICAR(3," "),
	RECURSANDO(4,"RECURSANDO"),
	NOHUBOMESA(5,"NO HUBO MESA DE EXAMEN"),
	NOSEPRESENTO(6,"NO SE PRESENTO");
	
	
	private Integer id;
	private String valor;

	private EstadoMateria(Integer id, String valor)
	{
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
	
	public static EstadoMateria getEstadoMateria(Integer id) {
		switch (id) {
		case 1:
			return APROBADA;
		case 2:
			return DESAPROBADA;
		case 3:
			return SIN_CALIFICAR;		
		case 4:
			return RECURSANDO;
		case 5:
			return NOHUBOMESA;
		case 6:
			return NOSEPRESENTO;		
		default:
			throw new InvalidParameterException("Estado de la materia desconocida: "
					+ id);
		}
	}

	/**
	 * @return
	 */
	public static List<EstadoMateria> getListaEstadosMaterias() {
		return Arrays.asList(values());
	}
}
