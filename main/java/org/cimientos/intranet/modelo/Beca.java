package org.cimientos.intranet.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.cimientos.intranet.enumerativos.TipoBeca;

/**
 * Beca
 * 
 * @author pmlabaronnie
 * 
 */
@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Beca implements Serializable {

	@Id
	@GeneratedValue
	private Long id;

	private Date fechaAlta;

	@ManyToOne
	private Periodo periodoPago;

	@ManyToOne
	private CicloPrograma ciclo;

	@ManyToOne
	private PerfilPadrino padrino;

	@Enumerated(EnumType.ORDINAL)
	private EstadoBeca estado;

	/**
	 * Estado del padrino. Puede ser activo - inactivo sirve para el borrado
	 * logico.
	 */
	private boolean activo;

	@ManyToOne
	private ZonaCimientos zona;

	private Integer cantidad;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "beca_id")
	private List<PerfilAlumno> becados;

	@Column(length = 10000)
	private String comentarios;

	@Enumerated(EnumType.ORDINAL)
	private TipoBeca tipo;

	private Integer cantidadAsignada;

	private String clonada;

	private Date fechaModificacion;
	
	private Date fechaBajaBecado;

	public Date getFechaBajaBecado() {
		return fechaBajaBecado;
	}

	public void setFechaBajaBecado(Date fechaBajaBecado) {
		this.fechaBajaBecado = fechaBajaBecado;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public Periodo getPeriodoPago() {
		return periodoPago;
	}

	public void setPeriodoPago(Periodo periodoPago) {
		this.periodoPago = periodoPago;
	}

	public CicloPrograma getCiclo() {
		return ciclo;
	}

	public void setCiclo(CicloPrograma ciclo) {
		this.ciclo = ciclo;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public PerfilPadrino getPadrino() {
		return padrino;
	}

	public void setPadrino(PerfilPadrino padrino) {
		this.padrino = padrino;
	}

	public EstadoBeca getEstado() {
		return estado;
	}

	public void setEstado(EstadoBeca estado) {
		this.estado = estado;
	}

	public ZonaCimientos getZona() {
		return zona;
	}

	public void setZona(ZonaCimientos zona) {
		this.zona = zona;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public List<PerfilAlumno> getBecados() {
		return becados;
	}

	public void setBecados(List<PerfilAlumno> becados) {
		this.becados = becados;
	}

	/**
	 * @return the comentarios
	 */
	public String getComentarios() {
		return comentarios;
	}

	/**
	 * @param comentarios
	 *            the comentarios to set
	 */
	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	/**
	 * @return the tipo
	 */
	public TipoBeca getTipo() {
		return tipo;
	}

	/**
	 * @param tipo
	 *            the tipo to set
	 */
	public void setTipo(TipoBeca tipo) {
		this.tipo = tipo;
	}

	public Integer getCantidadAsignada() {
		return cantidadAsignada;
	}

	public void setCantidadAsignada(Integer cantidadAsignada) {
		this.cantidadAsignada = cantidadAsignada;
	}

	public String getClonada() {
		return clonada;
	}

	public void setClonada(String clonada) {
		this.clonada = clonada;
	}
	
	public Date getFechaModificacion() {
		return fechaModificacion;
	}

	public void setFechaModificacion(Date fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}

}
