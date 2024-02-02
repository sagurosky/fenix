package org.cimientos.intranet.modelo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


/**
 * The Class Materia.
 */
@Entity
public class Materia implements Serializable{

	/** The id. */
	@Id
	@GeneratedValue
	private Long id;
	
	/** The nombre. */
	private String nombre;
	
	/** The ano. */
	private String ano;
	
	/** The basica. */
	private boolean basica;
	

	/**
	 * Gets the id.
	 *
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the nombre.
	 *
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * Sets the nombre.
	 *
	 * @param nombre the new nombre
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * Gets the ano.
	 *
	 * @return the ano
	 */
	public String getAno() {
		return ano;
	}

	/**
	 * Sets the ano.
	 *
	 * @param ano the new ano
	 */
	public void setAno(String ano) {
		this.ano = ano;
	}

	/**
	 * Checks if is basica.
	 *
	 * @return the basica
	 */
	public boolean isBasica() {
		return basica;
	}

	/**
	 * Sets the basica.
	 *
	 * @param basica the basica to set
	 */
	public void setBasica(boolean basica) {
		this.basica = basica;
	}

	
}
