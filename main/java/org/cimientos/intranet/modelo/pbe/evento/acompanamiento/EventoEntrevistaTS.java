package org.cimientos.intranet.modelo.pbe.evento.acompanamiento;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class EventoEntrevistaTS implements Serializable{

	@Id
	@GeneratedValue
	private long idEventoEntrevistaTS;
	
	public EventoEntrevistaTS(){}
}
