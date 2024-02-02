/**
 * 
 */
package org.cimientos.intranet.modelo.viatico;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;

import com.cimientos.intranet.enumerativos.ConceptoViaticos;
import com.cimientos.intranet.enumerativos.EstadoPago;
import com.cimientos.intranet.enumerativos.EstadoPagoViatico;

/**
 * The Class Viatico.
 *
 * @author nlopez
 */

@Entity
public class Viatico {

	/** The id. */
	@Id
	@GeneratedValue
	Long id;
	
	/** The ea. */
	@OneToOne
	PerfilEA ea;
	
	/** The estado pago. */
	EstadoPagoViatico estadoPago;
	
	/** The comentario. */
	@Column(length = 10000)
	String comentario;
	
	/** The valor. */
	Double valor;		
	
	/** The periodo. */
	@ManyToOne
	Periodo periodo;
	
	//Concepto.
	/** The concepto viatico. */
	ConceptoViaticos conceptoViatico;
	
	/** The telefono. */
	Long telefono;

	/**
	 * Instantiates a new viatico.
	 *
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public Viatico(){
	}
	
	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the id to set
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the ea.
	 *
	 * @return the ea
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public PerfilEA getEa() {
		return ea;
	}

	/**
	 * Sets the ea.
	 *
	 * @param ea the ea to set
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public void setEa(PerfilEA ea) {
		this.ea = ea;
	}

	/**
	 * Gets the estado pago.
	 *
	 * @return the estadoPago
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public EstadoPagoViatico getEstadoPago() {
		return estadoPago;
	}

	/**
	 * Sets the estado pago.
	 *
	 * @param estadoPago the estadoPago to set
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public void setEstadoPago(EstadoPagoViatico estadoPago) {
		this.estadoPago = estadoPago;
	}

	/**
	 * Gets the valor.
	 *
	 * @return the valor
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public Double getValor() {
		return valor;
	}

	/**
	 * Sets the valor.
	 *
	 * @param valor the valor to set
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public void setValor(Double valor) {
		this.valor = valor;
	}

	/**
	 * Gets the telefono.
	 *
	 * @return the telefono
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public Long getTelefono() {
		return telefono;
	}

	/**
	 * Sets the telefono.
	 *
	 * @param telefono the telefono to set
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public void setTelefono(Long telefono) {
		this.telefono = telefono;
	}

	/**
	 * Gets the concepto viatico.
	 *
	 * @return the conceptoViatico
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public ConceptoViaticos getConceptoViatico() {
		return conceptoViatico;
	}

	/**
	 * Sets the concepto viatico.
	 *
	 * @param conceptoViatico the conceptoViatico to set
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public void setConceptoViatico(ConceptoViaticos conceptoViatico) {
		this.conceptoViatico = conceptoViatico;
	}

	/**
	 * Gets the comentario.
	 *
	 * @return the comentario
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public String getComentario() {
		return comentario;
	}

	/**
	 * Sets the comentario.
	 *
	 * @param comentario the comentario to set
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	/**
	 * Gets the periodo.
	 *
	 * @return the periodo
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public Periodo getPeriodo() {
		return periodo;
	}

	/**
	 * Sets the periodo.
	 *
	 * @param periodo the periodo to set
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	public void setPeriodo(Periodo periodo) {
		this.periodo = periodo;
	}
	
	
}
