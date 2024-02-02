package org.cimientos.intranet.modelo.informe;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaRenovacion;

@Entity
@DiscriminatorValue("comunicado_no_renovacion")
public class ComunicadoNoRenovacion extends Informe
{

	@OneToOne
	private EntrevistaRenovacion er;

	public EntrevistaRenovacion getEr() {
		return er;
	}

	public void setEr(EntrevistaRenovacion er) {
		this.er = er;
	}

	@Override
	public String dameUrlVer() {
		//No hace nada, nunca llega aca!
		return null;
	}
	
	
}
