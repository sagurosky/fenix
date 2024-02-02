package org.cimientos.intranet.modelo.seleccion;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.Materia;


/**
 * The Class BoletinSeleccion.
 */
@Entity
public class BoletinSeleccion {
	
	/** The id. */
	@Id
	@GeneratedValue
	private Long id;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	private Materia materia;
	
	/** The nota primer trimestre. */
	private Integer notaPrimTrim;
	
	/** The nota segundo  trimestre. */
	private Integer notaSegTrim;
	
	/** The nota tercer  trimestre. */
	private Integer notaTerTrim;
	
	/** The nota marzo. */
	private Integer notaMarzo;
	
	/** The nota abril. */
	private Integer notaDiciembre;
	
	/** The nota fina. */
	private Integer notaFinal;
	
	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Long getId() {
		return id;
	}
	
	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setId(Long id) {
		this.id = id;
	}
	
	
	
	/**
	 * Gets the nota primer  trimestre.
	 *
	 * @return the nota primer trimestre
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Integer getNotaPrimTrim() {
		return notaPrimTrim;
	}
	
	/**
	 * Sets thenota primer  trimestre.
	 *
	 * @param notaPrimTrim the new nota primer  trimestre.
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setNotaPrimTrim(Integer notaPrimTrim) {
		this.notaPrimTrim = notaPrimTrim;
	}
	
	/**
	 * Gets the nota segundo trimestre.
	 *
	 * @return the segundo trimestre
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Integer getNotaSegTrim() {
		return notaSegTrim;
	}
	
	/**
	 * Sets the nota seg trim.
	 *
	 * @param notaSegTrim the new segundo trimestre
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setNotaSegTrim(Integer notaSegTrim) {
		this.notaSegTrim = notaSegTrim;
	}
	
	/**
	 * Gets the nota tercer trimestre.
	 *
	 * @return the nota tercer trimestre
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Integer getNotaTerTrim() {
		return notaTerTrim;
	}
	
	/**
	 * Sets the nota ter trim.
	 *
	 * @param notaTerTrim the new nota tercer trimestre
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setNotaTerTrim(Integer notaTerTrim) {
		this.notaTerTrim = notaTerTrim;
	}
	
	/**
	 * Gets the nota marzo.
	 *
	 * @return the nota marzo
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Integer getNotaMarzo() {
		return notaMarzo;
	}
	
	/**
	 * Sets the nota marzo.
	 *
	 * @param notaMarzo the new nota marzo
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setNotaMarzo(Integer notaMarzo) {
		this.notaMarzo = notaMarzo;
	}
	
	/**
	 * Gets the nota abril.
	 *
	 * @return the nota abril
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Integer getNotaDiciembre() {
		return notaDiciembre;
	}
	
	/**
	 * Sets the nota abril.
	 *
	 * @param notaDiciembre the new nota abril
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setNotaDiciembre(Integer notaAbril) {
		this.notaDiciembre = notaAbril;
	}
	
	/**
	 * Gets the nota final.
	 *
	 * @return the nota final
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public Integer getNotaFinal() {
		return notaFinal;
	}
	
	/**
	 * Sets the nota final.
	 *
	 * @param notaFinal the new nota final
	 * @since 25-ene-2011
	 * @author cfigueroa
	 */
	public void setNotaFinal(Integer notaFinal) {
		this.notaFinal = notaFinal;
	}

	public void setMateria(Materia materia) {
		this.materia = materia;
	}

	public Materia getMateria() {
		return materia;
	}
	
	public boolean esVacio(){
		boolean esVacio = true;
		
		if(this.notaPrimTrim != null){
			esVacio = false;
		}
		if(this.notaSegTrim != null){
			esVacio = false;
		}
		if(this.notaTerTrim != null){
			esVacio = false;
		}
		if(this.notaMarzo != null){
			esVacio = false;
		}
		if(this.notaDiciembre != null){
			esVacio = false;
		}
		if(this.notaFinal != null){
			esVacio = false;
		}
		
		return esVacio;
	}

}
