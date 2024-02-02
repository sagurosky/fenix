package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;

// TODO: Auto-generated Javadoc
/**
 * The Enum ModalidadEscuela.
 */
public enum ModalidadTrabajoEscuela implements Serializable{

	/** The CONTACT o_ telefonico. */
	CONTACTO_TELEFONICO(1,"Contacto Virtual"),
	
	/** The SEGUIMIENT o_ tradicional. */
	SEGUIMIENTO_TRADICIONAL(2,"-"),
	
	/** The ARTICULACION. */
	ARTICULACION(3, "Articulación"),
	
	/** The IMPLEMENTACIO n_ pe. */
	IMPLEMENTACION_PE(4, "-"),
	
	/** The IMPLEMENTACIO n_ eae. */
	IMPLEMENTACION_EAE(5, "-");
	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;

	/**
	 * Instantiates a new modalidad escuela.
	 *
	 * @param id the id
	 * @param valor the valor
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	private ModalidadTrabajoEscuela(Integer id, String valor) {
		this.id = id;
		this.valor = valor;
	}

	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the id to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * Gets the valor.
	 *
	 * @return the valor
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getValor() {
		return valor;
	}

	/**
	 * Sets the valor.
	 *
	 * @param valor the valor to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	/**
	 * Gets the modalidades escuelas.
	 *
	 * @param id the id
	 * @return the modalidades escuelas
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public static ModalidadTrabajoEscuela getModalidadEscuela(Integer id){
		switch (id) {
		case 1:
			return CONTACTO_TELEFONICO;
		case 2:
			return SEGUIMIENTO_TRADICIONAL;
		case 3:
			return ARTICULACION;
		case 4:
			return IMPLEMENTACION_PE;
		case 5:
			return IMPLEMENTACION_EAE;
		default:
			throw new InvalidParameterException("Modalidad desconocida: " + id);
		}

	}

	/**
	 * Gets the lista modalidades.
	 *
	 * @return the lista modalidades
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public static List<ModalidadTrabajoEscuela> getListaModalidades() {
		return Arrays.asList(values());
	}
	
}
