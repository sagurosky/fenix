package org.cimientos.intranet.modelo.evento;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

// TODO: Auto-generated Javadoc
/**
 * Evento.
 *
 * @author Juan Irungaray
 */
@Entity
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
public class Evento implements Serializable{
	
	/** The id evento. */
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	private Long id;
	
	/** The nombre. */
	private String nombre;
	

	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the nombre.
	 *
	 * @return the nombre
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public String getNombre() {
		return nombre;
	}
	
	/**
	 * Sets the nombre.
	 *
	 * @param nombre the new nombre
	 * @since 21-oct-2010
	 * @author cfigueroa
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
}
