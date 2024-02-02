/**
 * 
 */
package org.cimientos.intranet.utils.cuentas;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.utils.Formateador;

/**
 * @author plabaronnie
 *
 */
public abstract class ArchivoCuenta {

	
	protected List<String[]> datos = new ArrayList<String[]>();
	
	private String nombreHoja;

	/**
	 * @return the datos
	 */
	public List<String[]> getDatos() {
		return datos;
	}

	/**
	 * @param datos the datos to set
	 */
	public void setDatos(List<String[]> datos) {
		this.datos = datos;
	}
	
	/**
	 * @param nombre
	 * @return
	 */
	protected String getNombre(String nombre) {
		return Formateador.capitalizarTodas(nombre);
	}

	/**
	 * @param apellido
	 * @return
	 */
	protected String getApellido(String apellido) {
		return Formateador.capitalizarTodas(apellido);
	}

	/**
	 * @param direccion
	 * @return
	 */
	protected String getNroCalle(String nro) {
		if(StringUtils.isNotBlank( nro)){
			return nro;
		}
		return "";
	}
	
	/**
	 * @param direccion
	 * @return
	 */
	protected String getCalle(String calle) {
		if(StringUtils.isNotBlank( calle)){
			return Formateador.capitalizarTodas( calle);
		}
		return "";
	}
	
	/**
	 * @param direccion
	 * @return
	 */
	protected String getPiso(String piso) {
		if(StringUtils.isNotBlank( piso)){
			return piso;
		}
		return "0";
	}
	
	
	/**
	 * @param idLocalidad
	 * @return
	 */
	protected String getCodPostal(String codPostal) {
		if(codPostal != null){
			return codPostal;
		}
		return "";
	}
	

	
	/**
	 * @param dni
	 * @return
	 */
	protected String getNroDocumento(Integer dni) {
		if(dni != null){
			return Integer.toString(dni);
		}
		return "";
	}
	
	/**
	 * @param cuilCuit
	 * @return
	 */
	protected String getNroCuil(String cuilCuit) {
		if(StringUtils.isNotBlank( cuilCuit)){
			return Formateador.formatearCuilSinGuiones(cuilCuit);
		}
		return "";
	}
	
	/**
	 * @return the nombreHoja
	 */
	public String getNombreHoja() {
		return nombreHoja;
	}

	/**
	 * @param nombreHoja the nombreHoja to set
	 */
	public void setNombreHoja(String nombreHoja) {
		this.nombreHoja = nombreHoja;
	}
	
	/**
	 * @param ciclo
	 * @return
	 */
	protected String getMontoBecaCicloActual(CicloPrograma ciclo) {
		return  ciclo.getMontoBeca().toString();
	}

	/**
	 * @param sexo
	 * @return
	 */
	protected String getSexo(boolean sexo) {
		if(sexo){
			return "M";
		}else{
			return "F";
		}
	}
	
	/**
	 * @param string
	 * @return
	 */
	protected String getSexo(String string) {
		if(StringUtils.isNotBlank( string)){
			return (string.equals("femenino")? "F" : "M");
		}
		return "";
	}
	
}
