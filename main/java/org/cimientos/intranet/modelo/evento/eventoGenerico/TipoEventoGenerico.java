/**
 * 
 */
package org.cimientos.intranet.modelo.evento.eventoGenerico;

import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

/**
 * @author plabaronnie
 *
 */
public enum TipoEventoGenerico {

	TALLER_MATERIAS_PREVIAS(1, "Grupal en Escuela"),TALLER_COMPLEMENTARIO(2, "Visita a Empresa"), 
	ENTREVISTA_ADICIONAL(3, "Visita a Universidad"),ENCUENTRO_PADRES(4, "Salida Recreativa"), 
	ENCUENTRO_PADRINOS(5, "-"),ARTICULACION_ESCUELA(7, "-"),OTRO(6, "Otro");
	
	private TipoEventoGenerico(int id, String valor) {
		this.id = id;
		this.valor = valor;
	}
	
	private int id;
	private String valor;
	
	
	/**
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return
	 */
	public String getValor() {
		return valor;
	}
	
	/**
	 * @param valor
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	public static TipoEventoGenerico getTipoEventoGenerico(int id) {
		switch (id) {
		case 1:
			return TALLER_MATERIAS_PREVIAS;
		case 2:
			return TALLER_COMPLEMENTARIO;	
		case 3:
			return ENTREVISTA_ADICIONAL;
		case 4:
			return ENCUENTRO_PADRES;	
		case 5:
			return ENCUENTRO_PADRINOS;
		case 6:
			return OTRO;	
		case 7:
			return ARTICULACION_ESCUELA;	
		default:
			throw new InvalidParameterException("Tipo de evento desconocido: "
					+ id);
		}
	}
	
	/**
	 * @return
	 */
	public static List<TipoEventoGenerico> getListaTipos(){
		return Arrays.asList(values());
	}

}
