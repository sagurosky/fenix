package org.cimientos.intranet.modelo.perfil;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

/**
 * The Enum Turno.
 */
public enum Turno implements Serializable{

	/** The MANIANA. */
	MANIANA(1,"Mañana"),
	
	/** The TARDE. */
	TARDE(2,"Tarde"),
	
	/** The NOCHE. */
	NOCHE(3,"Noche"),
	
	/** The MANIAN a_ tarde. */
	MANIANA_TARDE (4,""),
	
	/** The MANIAN a_ tard e_ noche. */
	MANIANA_TARDE_NOCHE(5,""),
	
	/** The TARD e_ noceh. */
	TARDE_NOCEH(6,""),
	
	/** The MANIAN a_ noche. */
	MANIANA_NOCHE(7,""),
	
	/** The ALTERNADO. */
	ALTERNADO(8,""),
	
	/** The JORNAD a_ completa. */
	JORNADA_COMPLETA(9,"");
	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;
	
	
	/**
	 * Instantiates a new turno.
	 *
	 * @param id the id
	 * @param valor the valor
	 */
	private Turno(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}

	/**
	 * Gets the id.
	 *
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * Gets the valor.
	 *
	 * @return the valor
	 */
	public String getValor() {
		return valor;
	}

	/**
	 * Sets the valor.
	 *
	 * @param valor the new valor
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	/**
	 * Gets the turnos.
	 *
	 * @param id the id
	 * @return the turnos
	 */
	public static Turno getTurnos(Integer id){
		for(Turno turno : Arrays.asList(values())){
			if(turno.getId().equals(id)){
				return turno;
			}
		}
//			throw new InvalidParameterException("turnos  desconocido: "
//					+ id);
		return null;
	}
	
	/**
	 * Gets the lista turnos.
	 *
	 * @return the lista turnos
	 */
	public static List<Turno> getListaTurnos() {
		return Arrays.asList(values());
	}
	
	
}
