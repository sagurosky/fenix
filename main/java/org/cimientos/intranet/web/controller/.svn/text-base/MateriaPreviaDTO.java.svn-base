/**
 * 
 */
package org.cimientos.intranet.web.controller;

import org.cimientos.intranet.modelo.Materia;
import org.cimientos.intranet.modelo.NotaMateria;

/**
 * @author plabaronnie
 *
 */
public class MateriaPreviaDTO {

	Materia materia;
	
	String cicloPrevia;
	
	public MateriaPreviaDTO(NotaMateria notaMateria) {
		super();
		this.materia = notaMateria.getMateria();
		this.cicloPrevia = notaMateria.getCiclo();
	}



	public MateriaPreviaDTO() {
		super();
	}



	/**
	 * @return the materia
	 */
	public Materia getMateria() {
		return materia;
	}



	/**
	 * @return the cicloPrevia
	 */
	public String getCicloPrevia() {
		return cicloPrevia;
	}



	/**
	 * @param cicloPrevia the cicloPrevia to set
	 */
	public void setCicloPrevia(String cicloPrevia) {
		this.cicloPrevia = cicloPrevia;
	}



	/**
	 * @param materia the materia to set
	 */
	public void setMateria(Materia materia) {
		this.materia = materia;
	}



	@Override
	public boolean equals(Object obj) {
		if (this == null)
			return false;
		if (this.getClass() != obj.getClass())
			return false;
		MateriaPreviaDTO otraMateriaDTO = (MateriaPreviaDTO) obj;
		return (this.materia.equals(otraMateriaDTO.getMateria()) && this.cicloPrevia
				.equals(otraMateriaDTO.getCicloPrevia()));
	}

	
}
