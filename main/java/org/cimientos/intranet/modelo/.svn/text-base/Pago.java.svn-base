package org.cimientos.intranet.modelo;


import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;

import com.cimientos.intranet.enumerativos.EstadoPago;

/**
 * @author msagarduy
 * 
 */
@Entity
public class Pago implements Serializable{
	 
	@Id
	@GeneratedValue
	private Long id;
	
	@OneToOne
	private PerfilAlumno becado;
	
	@OneToOne
	private ResponsableAdulto ra;
	
	private Double extra;
	
	@OneToOne
	private PerfilEA ea;
	
	private Double monto;
	
	@OneToOne
	private Periodo periodo;
	
	private Date fechaExportacion;
	
	private String motivo;
	
	@Enumerated(EnumType.ORDINAL)
	private EstadoPago estadoPago;
	
	private Date fechaAprobacionRR;
	
	
	/**
	 * @return the fechaAprobacionRR
	 */
	public Date getFechaAprobacionRR() {
		return fechaAprobacionRR;
	}


	/**
	 * @param fechaAprobacionRR the fechaAprobacionRR to set
	 */
	public void setFechaAprobacionRR(Date fechaAprobacionRR) {
		this.fechaAprobacionRR = fechaAprobacionRR;
	}


	public Pago(){	
	}
	
	
	public Pago(PerfilAlumno becado, Periodo periodo)
	{
		this.setBecado(becado);
		this.setPeriodo(periodo);
		this.setEstadoPago(estadoPago);
		this.setRa(becado.getResponsable1());
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public PerfilAlumno getBecado() {
		return becado;
	}

	public void setBecado(PerfilAlumno becado) {
		this.becado = becado;
	}

	public Double getMonto() {
		return monto;
	}

	public void setMonto(Double monto) {
		this.monto = monto;
	}

	public Periodo getPeriodo() {
		return periodo;
	}

	
	public Double getExtra() {
		return extra;
	}


	public void setExtra(Double extra) {
		this.extra = extra;
	}


	public void setPeriodo(Periodo periodo) {
		this.periodo = periodo;
	}

	public EstadoPago getEstadoPago() {
		return estadoPago;
	}

	public void setEstadoPago(EstadoPago estadoPago) {
		this.estadoPago = estadoPago;
	}


	public Date getFechaExportacion() {
		return fechaExportacion;
	}

	

	public void setFechaExportacion(Date fechaExportacion) {
		this.fechaExportacion = fechaExportacion;
	}


	public String getMotivo() {
		return motivo;
	}


	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}


	public PerfilEA getEa() {
		return ea;
	}


	public void setEa(PerfilEA ea) {
		this.ea = ea;
	}


	public ResponsableAdulto getRa() {
		return ra;
	}


	public void setRa(ResponsableAdulto ra) {
		this.ra = ra;
	}

}
