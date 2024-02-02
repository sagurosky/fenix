package org.cimientos.intranet.modelo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.Where;


/**
 * Clase que mapea la entidad Parametro en la DB. Contiene los atributos del objeto y el constructor asociado
 * @author Juan Irungaray
 *
 */
@Entity
@Where(clause = "activo = 1")
public class Parametro implements Serializable{

	/**
	 * Constante utilizada para definir el tipo de parametro que se va a usar.
	 */
	public static final int AREA = 1;
	public static final int PUESTO = 2;
	public static final int MONTO_BECA = 3;
	public static final int ADICIONAL = 4;
	public static final int ADICIONAL_INGRESO = 5;
	public static final int EXTRA = 6;
	public static final int MATERIA = 7;

	
	public static int getArea() {
		return AREA;
	}

	public static int getPuesto() {
		return PUESTO;
	}

	public static int getMontoBeca() {
		return MONTO_BECA;
	}

	public static int getAdicional() {
		return ADICIONAL;
	}

	public static int getAdicionalIngreso() {
		return ADICIONAL_INGRESO;
	}

	public static int getExtra() {
		return EXTRA;
	}


	public static int getMateria() {
		return MATERIA;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Identificador unico de la entidad
	 */
	@Id
	@GeneratedValue
	private Long id;
	
	/**
	 * Tipo de parametro a usar, Ejemplo 1 equivale a PERFIL USUARIO
	 */
	private int tipo;
	
	/**
	 * Descripcion del tipo de parametro a usar. Ejemplo CORRECTOR equivale a un perfil de usuario
	 */
	private String valor;
	
	
	/**
	 * Estado del parametro. Puede ser activo o inactivo 
	 */
	private boolean activo;

	/**
	 * Constructor vacio de la entidad. Requerido por Hibernate
	 */
	public Parametro ()
	{
		
	}
	
	/**
	 * Constructor de la entidad. Instancia el objeto con sus atributos
	 * @param tipo
	 * @param valor
	 */
	public Parametro(int tipo, String valor) {
		this.tipo = tipo;
		this.valor = valor;
		this.activo=true;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		Parametro otro = (Parametro) obj;
		return otro.id == this.id;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return valor;
	}

	
	/**
	 * Retorna el tipo de Parametro
	 * @return int 
	 * 
	 */
	public int getTipo() {
		return tipo;
	}

	/**
	 * Setea el tipo de Parametro
	 * @param tipo
	 * 
	 */
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	/**
	 * Retorna la descripcion del tipo de parametro
	 * @return String
	 * 
	 */
	public String getValor() {
		return valor;
	}

	
	/**
	 * Setea la descripcion del tipo de parametro
	 * @param valor
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}

	/**
	 * Retorna el identificador unico del parametro
	 * @return
	 */
	public Long getId() {
		return id;
	}
	
	/**
	 * Retorna el estado del parametro
	 * @return the activo
	 */
	public boolean isActivo() {
		return activo;
	}

	/**
	 * Setea el estado del parametro
	 * @param activo the activo to set
	 */
	public void setActivo(boolean activo) {
		this.activo = activo;
	}
	
}
