package org.cimientos.intranet.modelo.usuario;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;


@Entity
public class Recordatorio implements Serializable{

	private String titulo;
	
	private String detalle;

	private Date fechaVencimiento;

	@Id
	@GeneratedValue
	private long id;

	
	@ManyToMany
	@JoinTable(name="Recordatorio_Pago")
	private List<Pago> pagos = new ArrayList<Pago>();
	
	@OneToMany
	@JoinColumn(name="recordatorio_idEa")
	private List<PerfilEA> ea;
	
	@OneToMany
	@JoinColumn(name="recordatorio_idRr")
	private List<PerfilRR> rr;

	public Recordatorio(String title,String detalle, Date fechaVencimiento) 
	{
		this.setTitulo(title);
		this.setDetalle(detalle);
		this.setFechaVencimiento(fechaVencimiento);
	}

	
	public Recordatorio()
	{
		
	}
	
	public String getDetalle() {
		return detalle;
	}

	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}

	public long getId() {
		return id;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	
	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public List<Pago> getPagos() {
		return pagos;
	}

	public void setPagos(List<Pago> pagos) {
		this.pagos = pagos;
	}

	
	public void setId(long id) {
		this.id = id;
	}


	public List<PerfilEA> getEa() {
		return ea;
	}


	public void setEa(List<PerfilEA> ea) {
		this.ea = ea;
	}


	public List<PerfilRR> getRr() {
		return rr;
	}


	public void setRr(List<PerfilRR> rr) {
		this.rr = rr;
	}
	
	
	
}
