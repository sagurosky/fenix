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
public enum EvaluacionEncuentro {

	EXCELENTE(1, "Excelente"),MUY_BUENO(2, "Muy Bueno"), 
	BUENO(3, "Bueno"),REGULAR(4, "Regular"), 
	MALO(5, "Malo");
	
	private EvaluacionEncuentro(int id, String valor) {
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
	
	public static EvaluacionEncuentro getEvaluacionEncuentro(int id) {
		switch (id) {
		case 1:
			return EXCELENTE;
		case 2:
			return MUY_BUENO;	
		case 3:
			return BUENO;
		case 4:
			return REGULAR;	
		case 5:
			return MALO;
		default:
			throw new InvalidParameterException("Tipo de evaluacion desconocido: "
					+ id);
		}
	}
	
	/**
	 * @return
	 */
	public static List<EvaluacionEncuentro> getListaTipos(){
		return Arrays.asList(values());
	}

}
