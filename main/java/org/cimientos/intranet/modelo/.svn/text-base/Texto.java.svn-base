package org.cimientos.intranet.modelo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.persona.Persona;

import com.cimientos.intranet.enumerativos.entrevista.MotivoNoRenovacion;
import com.cimientos.intranet.enumerativos.entrevista.MotivoPendiente;



@Entity
public class Texto implements Serializable{

	@Id
	@GeneratedValue
	private Long id;
	
	private String tipoInforme;	
	
	private String tipoMail;	

	@OneToOne
	private CicloPrograma cicloPrograma;
	
	private Date fechaCreacion;
	
	private Date fechaModicacion;

	@OneToOne
	private Persona usuario;
	
	@Column(length=500)
	private String titulo;	

	@Column(length=500)
	private String destinatario;
	
	@Column(length=10000)
	private String cuerpo;
	
	@Column(length=5000)
	private String firma;
	
	@Enumerated(EnumType.ORDINAL)
	private MotivoPendiente motivoPendiente;
	
	@Enumerated(EnumType.ORDINAL)
	private MotivoNoRenovacion motivoNoRenovacion;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTipoInforme() {
		return tipoInforme;
	}
	
	public String getTipoMail() {
		return tipoMail;
	}

	public void setTipoMail(String tipoMail) {
		this.tipoMail = tipoMail;
	}

	public void setTipoInforme(String tipoInforme) {
		this.tipoInforme = tipoInforme;
	}	

	public CicloPrograma getCicloPrograma() {
		return cicloPrograma;
	}

	public void setCicloPrograma(CicloPrograma cicloPrograma) {
		this.cicloPrograma = cicloPrograma;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public Date getFechaModicacion() {
		return fechaModicacion;
	}

	public void setFechaModicacion(Date fechaModicacion) {
		this.fechaModicacion = fechaModicacion;
	}

	public Persona getUsuario() {
		return usuario;
	}

	public void setUsuario(Persona usuario) {
		this.usuario = usuario;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDestinatario() {
		return destinatario;
	}

	public void setDestinatario(String destinatario) {
		this.destinatario = destinatario;
	}

	public String getCuerpo() {
		return cuerpo;
	}

	public void setCuerpo(String cuerpo) {
		this.cuerpo = cuerpo;
	}

	public String getFirma() {
		return firma;
	}

	public void setFirma(String firma) {
		this.firma = firma;
	}

	public MotivoPendiente getMotivoPendiente() {
		return motivoPendiente;
	}

	public void setMotivoPendiente(MotivoPendiente motivoPendiente) {
		this.motivoPendiente = motivoPendiente;
	}

	public MotivoNoRenovacion getMotivoNoRenovacion() {
		return motivoNoRenovacion;
	}

	public void setMotivoNoRenovacion(MotivoNoRenovacion motivoNoRenovacion) {
		this.motivoNoRenovacion = motivoNoRenovacion;
	}
}
