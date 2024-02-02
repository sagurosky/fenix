package com.cimientos.intranet.enumerativos;

import java.io.Serializable;
import java.security.InvalidParameterException;
import java.util.Arrays;
import java.util.List;


/**
 * The Enum NivelEducativo.
 */
public enum NivelEducativo implements Serializable{

	/** The SI n_ escolaridad. */
	SIN_ESCOLARIDAD	(1,	"Sin escolaridad formal"), 
	
	/** The PR i_ incompleta. */
	PRI_INCOMPLETA	(2,	"Primaria incompleta"),
	
	/** The PR i_ curso. */
	PRI_CURSO		(3,	"Primaria en curso"),
	
	/** The PR i_ completa. */
	PRI_COMPLETA	(4,	"Primaria completa"),
	
	/** The SE c_ incompleta. */
	SEC_INCOMPLETA	(5,	"Secundaria incompleta"),
	
	/** The SE c_ curso. */
	SEC_CURSO		(6, "Secundaria en curso"),
	
	/** The SE c_ completa. */
	SEC_COMPLETA	(7,	"Secundaria completa"),
	
	/** The TE r_ incompleta. */
	TER_INCOMPLETA	(8,	"Terciario incompleto"),
	
	/** The TE r_ curso. */
	TER_CURSO		(9,	"Terciario en curso"),
	
	/** The TE r_ completa. */
	TER_COMPLETA	(10,"Terciario completo"),
	
	/** The UN i_ incompleta. */
	UNI_INCOMPLETA	(11,"Universitario incompleto"),
	
	/** The UN i_ curso. */
	UNI_CURSO		(12,"Universitario en curso"),
	
	/** The UN i_ completa. */
	UNI_COMPLETA	(13,"Universitario completo"),
	
	INI_ENCURSO	(14,"Nivel inicial en curso"),
	
	ESP_ENCURSO	(15,"Escuela especial en curso"),
	
	ESP_COMPLETA	(16,"Escuela especial completa");

	
	/** The id. */
	private Integer id;
	
	/** The valor. */
	private String valor;

	
	/**
	 * Instantiates a new nivel educativo.
	 *
	 * @param id the id
	 * @param valor the valor
	 */
	private NivelEducativo(Integer id, String valor) {
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
	 * Gets the nivel educativo.
	 *
	 * @param id the id
	 * @return the nivel educativo
	 */
	public static NivelEducativo getNivelEducativo(int id) {
		switch (id) {
		case 1:
			return SIN_ESCOLARIDAD;
		case 2:
			return PRI_INCOMPLETA;
		case 3:
			return PRI_CURSO;
		case 4:
			return PRI_COMPLETA;
		case 5:
			return SEC_INCOMPLETA;
		case 6:
			return SEC_CURSO;
		case 7:
			return SEC_COMPLETA;
		case 8:
			return TER_INCOMPLETA;
		case 9:
			return TER_CURSO;
		case 10:
			return TER_COMPLETA;
		case 11:
			return UNI_INCOMPLETA;
		case 12:
			return UNI_CURSO;
		case 13:
			return UNI_COMPLETA;
		case 14:
			return INI_ENCURSO;
		case 15:
			return ESP_ENCURSO;
		case 16:
			return ESP_COMPLETA;
		default:
			throw new InvalidParameterException("Estado Civil desconocido: "
					+ id);
		}
	}
	
	
	/**
	 * Gets the lista nivel educativo.
	 *
	 * @return the lista nivel educativo
	 */
	public static List<NivelEducativo> getListaNivelEducativo(){
		return Arrays.asList(values());
	}
	
	
}
