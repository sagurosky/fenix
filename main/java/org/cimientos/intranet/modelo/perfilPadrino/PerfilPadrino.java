package org.cimientos.intranet.modelo.perfilPadrino;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.empresa.Empresa;
import org.cimientos.intranet.modelo.persona.Persona;

/**
 * @author plabaronnie
 *
 */
@Entity
public class PerfilPadrino implements Serializable{

	@Id
	@GeneratedValue
	private Long id;
	
	@Enumerated(EnumType.ORDINAL)
	private TipoPadrino tipo;
	
	@OneToOne(cascade=CascadeType.ALL)
	private Persona datosPersonales;
	
	@OneToOne(cascade=CascadeType.ALL)
	private Empresa empresa;
	
	@OneToMany
	private List<Beca> becas;
	
	private Date fechaAlta;
	
	private Long idPlataforma;
	
	private Long nroCtesPlataformaContable;
	
	private boolean recibeInformesMasivos;
	
	/**
	 * Estado del padrino. Puede ser activo - inactivo
	 * sirve para el borrado logico.
	 */
	private boolean activo;
	
	
	/**
	 * retorna el idPerfilPadrino.
	 * @return idPerfilPadrino
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Setea el idPerfilPadrino.
	 * @param idPerfilPadrino
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return
	 */
	public TipoPadrino getTipo() {
		return tipo;
	}

	/**
	 * @param tipo
	 */
	public void setTipo(TipoPadrino tipo) {
		this.tipo = tipo;
	}

	/**
	 * @return
	 */
	public Persona getDatosPersonales() {
		return datosPersonales;
	}

	/**
	 * @param datosPersonales
	 */
	public void setDatosPersonales(Persona datosPersonales) {
		this.datosPersonales = datosPersonales;
	}

	/**
	 * @return
	 */
	public Empresa getEmpresa() {
		return empresa;
	}

	/**
	 * @param empresa
	 */
	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

	/**
	 * @return
	 */
	public List<Beca> getBecas() {
		return becas;
	}

	/**
	 * @param becas
	 */
	public void setBecas(List<Beca> becas) {
		this.becas = becas;
	}

	/**
	 * @return
	 */
	public Date getFechaAlta() {
		return fechaAlta;
	}

	/**
	 * @param fechaAlta
	 */
	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	/**
	 * @return
	 */
	public boolean isActivo() {
		return activo;
	}

	/**
	 * @param activo
	 */
	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public Long getIdPlataforma() {
		return idPlataforma;
	}

	public void setIdPlataforma(Long idPlataforma) {
		this.idPlataforma = idPlataforma;
	}

	/**
	 * @return the nroCtesPlataformaContable
	 */
	public Long getNroCtesPlataformaContable() {
		return nroCtesPlataformaContable;
	}

	/**
	 * @param nroCtesPlataformaContable the nroCtesPlataformaContable to set
	 */
	public void setNroCtesPlataformaContable(Long nroCtesPlataformaContable) {
		this.nroCtesPlataformaContable = nroCtesPlataformaContable;
	}

	/**
	 * @return the recibeInformesMasivos
	 */
	public boolean isRecibeInformesMasivos() {
		return recibeInformesMasivos;
	}

	/**
	 * @param recibeInformesMasivos the recibeInformesMasivos to set
	 */
	public void setRecibeInformesMasivos(boolean recibeInformesMasivos) {
		this.recibeInformesMasivos = recibeInformesMasivos;
	}
	public void agregarBeca(Beca beca) {
		if(becas == null){
			becas = new ArrayList<Beca>();
		}
		becas.add(beca);
	}
		
	
	public String ObtenerDescripcionPadrino() {
		
		if (this == null)
			return "";
		if (this.getTipo().equals(TipoPadrino.CORPORATIVO))
				return this.getEmpresa().getDenominacion().toUpperCase();
		else
			if(this.getTipo().equals(TipoPadrino.INDIVIDUAL))
				return this.getDatosPersonales().getApellidoNombre().toUpperCase();
		return "";
	}
}
