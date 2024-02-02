/**
 * 
 */
package org.cimientos.intranet.modelo.objetivoseleccion;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Where;


/**
 * The Class ObjetivoSeleccion.
 *
 * @author nlopez
 */

@Entity
@Where(clause="activo = 1")
public class ObjetivoSeleccion {

	/** The id  objetivo seleccion. */
	@Id
	@GeneratedValue
	private Long id;
	@ManyToOne
	@Cascade(value = CascadeType.PERSIST)
	private CicloPrograma cicloPrograma;
	/** The periodo. */
	@OneToOne
	@Cascade(value = CascadeType.PERSIST)
	private Periodo periodo;
	
	/** The zona. */
	@OneToOne
	@Cascade(value = CascadeType.PERSIST)
	private ZonaCimientos zona;
	
	/** Cantidad de Becas*/
	private Long cantidadBecas;
	
	/** Becados Cesados: cantidad de becados cesados que se produjeron en cada periodo.*/
	private Long cantidadBecasCesadas;
	
	/** Becas a disponer por egreso: cantidad de becados que se encuentran cursando el último año escola */
	private Long cantidadBecasDisponiblesPorEgreso;
	
	private Boolean activo;
	
	/**
	 * Gets the id registrar objetivo seleccion.
	 *
	 * @return the id
	 * @since 23-nov-2010
	 * @author nlopez
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Sets the id registrar objetivo seleccion.
	 *
	 * @param id the id to set
	 * @since 23-nov-2010
	 * @author nlopez
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the periodo.
	 *
	 * @return the periodo
	 * @since 23-nov-2010
	 * @author nlopez
	 */
	public Periodo getPeriodo() {
		return periodo;
	}

	/**
	 * Sets the periodo.
	 *
	 * @param periodo the periodo to set
	 * @since 23-nov-2010
	 * @author nlopez
	 */
	public void setPeriodo(Periodo periodo) {
		this.periodo = periodo;
	}

	/**
	 * Gets the zona.
	 *
	 * @return the zona
	 * @since 23-nov-2010
	 * @author nlopez
	 */
	public ZonaCimientos getZona() {
		return zona;
	}

	/**
	 * Sets the zona.
	 *
	 * @param zona the zona to set
	 * @since 23-nov-2010
	 * @author nlopez
	 */
	public void setZona(ZonaCimientos zona) {
		this.zona = zona;
	}
	

	/**
	 * @return the cantidadBecasCesadas
	 */
	public Long getCantidadBecasCesadas() {
		return cantidadBecasCesadas;
	}

	/**
	 * @param cantidadBecasCesadas the cantidadBecasCesadas to set
	 */
	public void setCantidadBecasCesadas(Long cantidadBecasCesadas) {
		this.cantidadBecasCesadas = cantidadBecasCesadas;
	}

	/**
	 * @return the cantidadBecasDisponiblesPorEgreso
	 */
	public Long getCantidadBecasDisponiblesPorEgreso() {
		return cantidadBecasDisponiblesPorEgreso;
	}

	/**
	 * @param cantidadBecasDisponiblesPorEgreso the cantidadBecasDisponiblesPorEgreso to set
	 */
	public void setCantidadBecasDisponiblesPorEgreso(
			Long cantidadBecasDisponiblesPorEgreso) {
		this.cantidadBecasDisponiblesPorEgreso = cantidadBecasDisponiblesPorEgreso;
	}

	/**
	 * @return the cantidadBecas
	 */
	public Long getCantidadBecas() {
		return cantidadBecas;
	}

	/**
	 * @param cantidadBecas the cantidadBecas to set
	 */
	public void setCantidadBecas(Long cantidadBecas) {
		this.cantidadBecas = cantidadBecas;
	}

	public CicloPrograma getCicloPrograma() {
		return cicloPrograma;
	}

	public void setCicloPrograma(CicloPrograma cicloPrograma) {
		this.cicloPrograma = cicloPrograma;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((cicloPrograma == null) ? 0 : cicloPrograma.hashCode());
		result = prime * result + ((periodo == null) ? 0 : periodo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ObjetivoSeleccion other = (ObjetivoSeleccion) obj;
		if (cicloPrograma == null) {
			if (other.cicloPrograma != null)
				return false;
		} else if (!cicloPrograma.equals(other.cicloPrograma))
			return false;
		if (periodo == null) {
			if (other.periodo != null)
				return false;
		} else if (!periodo.equals(other.periodo))
			return false;
		return true;
	}

	public Boolean getActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

}
