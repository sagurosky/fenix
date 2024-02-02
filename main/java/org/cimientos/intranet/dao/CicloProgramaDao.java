/**
 * 
 */
package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.dao.impl.CicloProgramaDaoImpl;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.EstadoCiclo;

/**
 * Interfaz  de la clase CicloPrograma.
 * Establece los metodo basicos y generales para todas las entidades con las que se va a trabajar en la BD.
 * Hereda los metodos base de la Interfaz Base Dao.
 * Se proveen las siguientes implementaciones:
 *  
 * @see CicloProgramaDaoImpl
 * @author msagarduy
 * @param <CicloPrograma> la clase de la entidad a manejar por este dao.
 *
 */
public interface CicloProgramaDao extends Dao<CicloPrograma> {
	
	/**
	 * Recupera  el ciclo buscado en base al nombre del nombre que llega como parametro
	 * @param nombre El nombre de la nombre
	 * @return {@link CicloPrograma} objeto ciclo
	 * 
	 */
	public CicloPrograma obtenerPorNombre(String nombre);
	
	/**
	 * Recupera el ciclo buscado en base al nombre y a su id
	 * @param nombre El nombre del ciclo
	 * @param id Id del ciclo
	 * @return {@link CicloPrograma} objeto ciclo
	 * 
	 */
	public CicloPrograma obtenerCicloSiExiste(String nombre, String id);

	/**
	 * @return
	 */
	public CicloPrograma obtenerCicloActual();
	
	/**
	 * Obtener ciclo por anio.
	 *
	 * @param anio the anio
	 * @return the ciclo programa
	 * @since 30-dic-2010
	 * @author cfigueroa
	 */
	public CicloPrograma obtenerCicloPorAnio(String anio);

	/**
	 * @param estados
	 * @return
	 */
	public List<CicloPrograma> obtenerCiclosPorEstados(EstadoCiclo[] estados);
	
	public CicloPrograma obtenerCicloPorOrden(int orden);
	
	/**
	 * Este metodo devuelve el siguiente ciclo despues del actual
	 * @return the ciclo programa
	 * @since 22-mar-2011
	 * @author cfigueroa
	 */
	public CicloPrograma obtenerSiguienteCiclo();

	/**
	 * Este servicio devuelve todos los ciclos a partir del 2010. Esto es asi, ya que existen becas
	 * desde ese año y no se necesitan los anteriores
	 * @return
	 */
	public List<CicloPrograma> obtenerCiclosClonarBecas();

	/**
	 * Este servicio devuelve todos los ciclos a partir del 2006. Esto es asi, ya que existen convocatorias
	 * desde ese año y no se necesitan los anteriores
	 * @return
	 */
	public List<CicloPrograma> obtenerCiclosConvocatoria();

	/**
	 * Este servicio devuelve todos los ciclos a partir del ciclo pasado por parametro
	 * @param anio - anio desde el cual se buscan los ciclos
	 * @return lista de ciclos desde el año pasado por parametro
	 */
	public List<CicloPrograma> obtenerCiclosConvocatoriaDesde(String anio);

}
