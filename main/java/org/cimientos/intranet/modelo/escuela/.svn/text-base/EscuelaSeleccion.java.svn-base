package org.cimientos.intranet.modelo.escuela;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

import com.cimientos.intranet.enumerativos.EstadoEscuela;




/**
 * The Class EscuelaSeleccion.
 */
@Entity
public class EscuelaSeleccion {

	
	/*
	 * Datos formales de la escuela y de contacto 
	 */
	
	/** The id. */
	@Id
	@GeneratedValue
	private Long id;
	
	

	
	/** The nombre. */
	private String nombre;
	
	
	
	/** The orientacion. */
	private String  orientacion;
	
	/** The zona cimientos. */
	@ManyToOne
	private ZonaCimientos zonaCimientos;
	
	/*
	 * Informacion general Cimientos 
	 */
	
	/** The estado escuela. */
	@Enumerated(EnumType.ORDINAL)
	private EstadoEscuela estadoEscuela; 
	
	
	/** The activo. */
	private Boolean activo;
	
	/**
	 * Instantiates a new escuela seleccion.
	 *
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public EscuelaSeleccion(){};
	
	/**
	 * Instantiates a new escuela seleccion.
	 *
	 * @param escuelaSel the escuela sel
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public EscuelaSeleccion( Escuela escuelaSel){
		
		this.id = escuelaSel.getId();
		this.nombre = escuelaSel.getNombre();
		this.orientacion = escuelaSel.getOrientacion();
		this.zonaCimientos = escuelaSel.getZonaCimientos();
		this.estadoEscuela = escuelaSel.getEstadoEscuela();
		this.activo =escuelaSel.getActivo();
	}
	
	/**
	 * Gets the id.
	 *
	 * @return the id
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the nombre.
	 *
	 * @return the nombre
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * Sets the nombre.
	 *
	 * @param nombre the new nombre
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	/**
	 * Gets the estado escuela.
	 *
	 * @return the estadoEscuela
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public EstadoEscuela getEstadoEscuela() {
		return estadoEscuela;
	}

	/**
	 * Sets the estado escuela.
	 *
	 * @param estadoEscuela the estadoEscuela to set
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setEstadoEscuela(EstadoEscuela estadoEscuela) {
		this.estadoEscuela = estadoEscuela;
	}

	/**
	 * Gets the zona cimientos.
	 *
	 * @return the zona cimientos
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public ZonaCimientos getZonaCimientos() {
		return zonaCimientos;
	}

	/**
	 * Sets the zona cimientos.
	 *
	 * @param zonaCimientos the new zona cimientos
	 * @author hhrodriguez
	 * @since 01-feb-2011
	 */
	public void setZonaCimientos(ZonaCimientos zonaCimientos) {
		this.zonaCimientos = zonaCimientos;
	}


	/**
	 * Gets the activo.
	 *
	 * @return the activo
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public Boolean getActivo() {
		return activo;
	}

	/**
	 * Sets the activo.
	 *
	 * @param activo the new activo
	 * @since 15-feb-2011
	 * @author cfigueroa
	 */
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

	
	
}
