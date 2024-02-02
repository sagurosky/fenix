package org.cimientos.intranet.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Where;

/**
 * @author msagarduy
 * 
 */
@Entity
public class CicloPrograma implements Serializable
{

	@Id
	@GeneratedValue
	private Long id;
	
	
	//Se introdujo estos cambios respecto a la relacion Ciclo Periodo
	//en vistas a traer por cada Ciclo, todos los Periodos correspondientes
	//al Ciclo seleccionado en viewRegistrarObjetivoSeleccion.jsp
	//Nicolas Lopez 20 Dic 2010, 16:00 hs.
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name = "ciclo_id")
	private List<Periodo> periodos = new ArrayList<Periodo>();
	
	
	private Date fechaInicio;	

	private Date fechaFin;
	
	private boolean activo;

	private String nombre;
	
	private Double montoBeca;
	
	private EstadoCiclo estado;
	
	private Integer orden;
	
	
	private Date fecha1IS2;
	
	private Date fecha2IS2;
	
	private Date fechalimite1;
	
	private Date fechalimite2;
	
	
	private Date fecha1T;
	
	private Date fecha2T;
	
	private Date fecha3T;
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Periodo> getPeriodos() {
		return periodos;
	}

	public void setPeriodos(List<Periodo> periodos) {
		this.periodos = periodos;
	}

	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return the montoBeca
	 */
	public Double getMontoBeca() {
		return montoBeca;
	}

	/**
	 * @param montoBeca the montoBeca to set
	 */
	public void setMontoBeca(Double montoBeca) {
		this.montoBeca = montoBeca;
	}

	/**
	 * @return the estado
	 */
	public EstadoCiclo getEstado() {
		return estado;
	}

	/**
	 * @param estado the estado to set
	 */
	public void setEstado(EstadoCiclo estado) {
		this.estado = estado;
	}

	/**
	 * @return the orden
	 */
	public Integer getOrden() {
		return orden;
	}

	/**
	 * @param orden the orden to set
	 */
	public void setOrden(Integer orden) {
		this.orden = orden;
	}

	/**
	 * @return the fecha1IS2
	 */
	public Date getFecha1IS2() {
		return fecha1IS2;
	}

	/**
	 * @param fecha1IS2 the fecha1IS2 to set
	 */
	public void setFecha1IS2(Date fecha1IS2) {
		this.fecha1IS2 = fecha1IS2;
	}

	/**
	 * @return the fecha2IS2
	 */
	public Date getFecha2IS2() {
		return fecha2IS2;
	}

	/**
	 * @param fecha2IS2 the fecha2IS2 to set
	 */
	public void setFecha2IS2(Date fecha2IS2) {
		this.fecha2IS2 = fecha2IS2;
	}

	/**
	 * @return the fechalimite1
	 */
	public Date getFechalimite1() {
		return fechalimite1;
	}

	/**
	 * @param fechalimite1 the fechalimite1 to set
	 */
	public void setFechalimite1(Date fechalimite1) {
		this.fechalimite1 = fechalimite1;
	}

	/**
	 * @return the fechalimite2
	 */
	public Date getFechalimite2() {
		return fechalimite2;
	}

	/**
	 * @param fechalimite2 the fechalimite2 to set
	 */
	public void setFechalimite2(Date fechalimite2) {
		this.fechalimite2 = fechalimite2;
	}

	/**
	 * @return
	 */
	public Date getFecha1T() {
		return fecha1T;
	}

	/**
	 * @param fecha1t
	 */
	public void setFecha1T(Date fecha1t) {
		fecha1T = fecha1t;
	}

	/**
	 * @return
	 */
	public Date getFecha2T() {
		return fecha2T;
	}

	/**
	 * @param fecha2t
	 */
	public void setFecha2T(Date fecha2t) {
		fecha2T = fecha2t;
	}

	/**
	 * @return
	 */
	public Date getFecha3T() {
		return fecha3T;
	}

	/**
	 * @param fecha3t
	 */
	public void setFecha3T(Date fecha3t) {
		fecha3T = fecha3t;
	}

	
	

}
