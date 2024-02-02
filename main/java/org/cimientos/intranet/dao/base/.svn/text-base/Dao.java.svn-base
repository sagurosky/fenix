package org.cimientos.intranet.dao.base;

import java.io.Serializable;
import java.util.List;

import org.springframework.dao.DataAccessException;
/**
 * Iterfaz Base para el desarrollo de todos los Data Acess Objects (DAOs). Establece los
 * metodo basicos y generales para todas las entidades con las que se va a trabar en la BD.
 * 
 * Se proveen las siguientes implementaciones:
 * @see SpringHibernateDao
 * 
 * @author Juan Irungaray
 *
 * @param <T> la clase de la entidad a menajar por este DAO.
 */
public interface Dao<T> {

	/**
	 * Elimina un conjunto objetos de la base de datos.
	 * 
	 * @param objetos la lista de objetos a eliminar.
	 * @throws DataAccessException
	 */
	public void eliminar(List<T> objetos) throws DataAccessException;

	/**
	 * Elimina un objeto de la base de datos.
	 * 
	 * @param objeto el objeto a eliminar.
	 * @throws DataAccessException
	 */
	public void eliminar(T objeto) throws DataAccessException;

	/**
	 * Persiste un conjunto de objetos en la base de datos.
	 * 
	 * @param objetos una lista de objetos a persistir.
	 * @throws DataAccessException
	 */
	public void guardar(List<T> objetos) throws DataAccessException;
	
	/**
	 * Persiste un objeto en la base de datos.
	 * 
	 * @param objeto el objeto a persistir.
	 * @throws DataAccessException
	 */
	public void guardar(T objeto) throws DataAccessException;

	/**
	 * Recupera un objeto de la base de datos a traves del ID.
	 * 
	 * @param id el ID del objeto a recuperar.
	 * @return el objeto de la clase determinada si existe o null en caso de que no exista en 
	 * la base de datos.
	 * @throws DataAccessException
	 */
	public T obtener(Serializable id) throws DataAccessException;
	
	/**
	 * Recupera todos los objetos persistidos de esta clase.
	 * ADVERTENCIA: Este metodo simplifica la recuperacion de la coleccion completa de objetos pero 
	 * su performance puede degradar considerablemente para colecciones de gran tamaño.
	 *  
	 * @return una Lista de objetos de la clase determinada que representa a todos los objetos
	 *  persistidos de la misma.
	 * @throws DataAccessException
	 */
	public List<T> obtenerTodos() throws DataAccessException;
	
	
	
	/**
	 * Recupera un conjunto de Objetos persitidos en base a sus IDs.
	 * 
	 * @param idProperty nombre de la variable que se usa como ID para esa clase.
	 * @param ids lista de IDs a recuperar.
	 * @return Una lista con todos los objetos encontrados con los IDs o una lista vacia en caso de
	 *  no encontrar ninguno de los IDs buscados.
	 * @throws DataAccessException
	 */
	public List<T> obtenerGrupo(String idProperty, List<? extends Serializable> ids) throws DataAccessException;

	/**
	 * Se utiliza para realizar un commit de la transaccion antes de que esta se complete. Util
	 *  para actualizar la base de datos a voluntad cuando se mantiene la sesion abierta por un
	 *   tiempo prolongado ( Ej. Spring @see OpenSessionInViewFilter , @see OpenSessionInViewInterceptor 
	 */
	public void flush();
	
	/**
	 * Este metodo es para poder borrar el objeto de la session de hibernate , pero al utilizar este metodo 
	 * cancela todas las operaciones pendientes que tiene,
	 * <b>Solo utilizarlo cuando necesitas guardar el mismo objeto en un mismo metodo.</b>
	 *
	 * @since 04-feb-2011
	 * @author cfigueroa
	 */
	public void clear();

	
}