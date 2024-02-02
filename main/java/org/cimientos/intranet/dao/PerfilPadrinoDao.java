
package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.dao.impl.EmpresaDaoImpl;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.displaytag.properties.SortOrderEnum;


/**
 * Interfaz  de la clase Padrino.
 * Establece los metodo basicos y generales para todas las entidades con las que se va a trabajar en la BD.
 * Hereda los metodos base de la Interfaz Base Dao.
 * Se proveen las siguientes implementaciones:
 * 
 * @see EmpresaDaoImpl
 * @author plabaronnie
 * @param <Padrino> la clase de la entidad a manejar por este dao.
 */
public interface PerfilPadrinoDao extends Dao<PerfilPadrino> {


	/**
	 * Recupera el padrino buscado en base al nombre
	 * @param nombre El nombre del padrino 
	 * @return {@link Padrino} objeto padrino
	 * 
	 */
	public PerfilPadrino obtenerPadrinoPorIgualNombre(String nombre);
	
	
	/**
	 * Recupera el padrino buscado en base al nombre y con id distinto al pasado por parametro
	 * @param nombre El nombre del padrino
	 * @param id Id del padrino
	 * @return {@link Padrino} objeto padrino
	 * 
	 */
	public PerfilPadrino obtenerPadrino(String nombre, String id);

	
	/**
	 * Recupera la lista de padrinos que estan activos en la DB.
	 * @return List<Usuario> La lista de padrinos activos
	 * 
	 */
	public List<PerfilPadrino> obtenerPadrinosActivos();


	/**
	 * retorna el padrino que coincida con el cuit buscado
	 * 
	 * @param cuit_cuil el cuit del padrino
	 * @return {@link Padrino} objeto padrino
	 */
	/**
	 * @param cuit_cuil
	 * @param id el id del padrino
	 * @return
	 */
	public PerfilPadrino buscarPorIgualCUIT(String cuit_cuil, Long id);
	
	/**
	 * retorna el padrino que coincida con el cuit buscado
	 * 
	 * @param cuit_cuil el cuit del padrino
	 * @return {@link Padrino} objeto padrino
	 */
	public PerfilPadrino buscarPorCUIT(String cuit_cuil);


	/**
	 * retorna el padrino que coincide con el nombre o la denominacion
	 * 
	 * @param texto
	 * @param cantidadMax
	 * @return
	 */
	public List<PerfilPadrino> buscarPorNombreDenominacion(String texto,
			int cantidadMax);


	/**
	 * @param cuit_cuil
	 * @param id el id del padrino
	 * @return
	 */
	public PerfilPadrino buscarPorIgualCUIL(String cuitCuil, Long id);


	/**
	 * @param idTipo
	 * @param cuitCuil
	 * @param padrinoId
	 * @return
	 */
	public int obtenerCantidadPadrinosAExportar(Integer idTipo,
			String cuitCuil, Long padrinoId);


	/**
	 * @param idTipo
	 * @param cuitCuil
	 * @param padrinoId
	 * @param pagesize
	 * @param totalRows
	 * @param sortDirection
	 * @param sortCriterion
	 * @return
	 */
	public List<PerfilPadrino> obtenerPadrinosAExportar(Integer idTipo,
			String cuitCuil, Long padrinoId, int pagesize, int totalRows,
			SortOrderEnum sortDirection, String sortCriterion);


	public List<PerfilPadrino> buscarTodosPorNombreDenominacion(String texto,int cantidadMax);
	
}
