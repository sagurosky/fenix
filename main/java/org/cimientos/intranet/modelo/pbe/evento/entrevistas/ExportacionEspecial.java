/**
 * 
 */
package org.cimientos.intranet.modelo.pbe.evento.entrevistas;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Esta clase se utiliza para separar los campos especiales 
 * de entrevistas que solo sirven para exportacion en excel.
 * No se hace referencia a las clases si no que se utilizan 
 * atributos planos por un tema de agilizar la performance.
 * @author plabaronnie
 *
 */
@Entity
public class ExportacionEspecial {
	
	@Id
	@GeneratedValue
	private Long id;

	private Long idBeca;
	
	private Long idInforme;
	
	private Integer edad;
	
	private String padrino;
	
	private String tipoPadrino;
	
	private boolean previas;
	
	private String nombresPrevias;
	
	private Long idPadrino;
	
	private String nroCtesPlataformaContable;
	
	
	

	

	public String getNroCtesPlataformaContable() {
		return nroCtesPlataformaContable;
	}

	public void setNroCtesPlataformaContable(String nroCtesPlataformaContable) {
		this.nroCtesPlataformaContable = nroCtesPlataformaContable;
	}

	/**
	 * @return the idPadrino
	 */
	public Long getIdPadrino() {
		return idPadrino;
	}

	/**
	 * @param idPadrino the idPadrino to set
	 */
	public void setIdPadrino(Long idPadrino) {
		this.idPadrino = idPadrino;
	}

	/**
	 * @return the idBeca
	 */
	public Long getIdBeca() {
		return idBeca;
	}

	/**
	 * @param idBeca the idBeca to set
	 */
	public void setIdBeca(Long idBeca) {
		this.idBeca = idBeca;
	}

	/**
	 * @return the idInforme
	 */
	public Long getIdInforme() {
		return idInforme;
	}

	/**
	 * @param idInforme the idInforme to set
	 */
	public void setIdInforme(Long idInforme) {
		this.idInforme = idInforme;
	}


	/**
	 * @return the edad
	 */
	public Integer getEdad() {
		return edad;
	}

	/**
	 * @param edad the edad to set
	 */
	public void setEdad(Integer edad) {
		this.edad = edad;
	}


	/**
	 * @return the padrino
	 */
	public String getPadrino() {
		return padrino;
	}

	/**
	 * @param padrino the padrino to set
	 */
	public void setPadrino(String padrino) {
		this.padrino = padrino;
	}

	/**
	 * @return the tipoPadrino
	 */
	public String getTipoPadrino() {
		return tipoPadrino;
	}

	/**
	 * @param tipoPadrino the tipoPadrino to set
	 */
	public void setTipoPadrino(String tipoPadrino) {
		this.tipoPadrino = tipoPadrino;
	}

	/**
	 * @return the previas
	 */
	public boolean isPrevias() {
		return previas;
	}

	/**
	 * @param previas the previas to set
	 */
	public void setPrevias(boolean previas) {
		this.previas = previas;
	}

	/**
	 * @return the nombresPrevias
	 */
	public String getNombresPrevias() {
		return nombresPrevias;
	}

	/**
	 * @param nombresPrevias the nombresPrevias to set
	 */
	public void setNombresPrevias(String nombresPrevias) {
		this.nombresPrevias = nombresPrevias;
	}


	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}


}
