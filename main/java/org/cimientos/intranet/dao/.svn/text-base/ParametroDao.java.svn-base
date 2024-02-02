
package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.dao.impl.ParametroDaoImpl;
import org.cimientos.intranet.modelo.Parametro;


/**
 * Interfaz  de la clase Parametro.
 * Establece los metodo basicos y generales para todas las entidades con las que se va a trabajar en la BD.
 * Hereda los metodos base de la Interfaz Base Dao.
 * Se proveen las siguientes implementaciones:
 * 
 * @see ParametroDaoImpl
 * @author msagarduy
 * @param <Parametro> la clase de la entidad a manejar por este dao.
 */
public interface ParametroDao extends Dao<Parametro> {

	
	/**
	 * Recupera la lista de Parametros de un tipo en particular. 
	 * @param Tipo de Parametro asociado a la busqueda. Ejemplo: (1 equivale a PERFILUSUARIO)
	 * @return List<Parametro>
	 */
	public List<Parametro> obtenerParametroDelTipo(int tipo);
	
	/**
	 * Realiza una búsqueda de parametros de un tipo en particular y la retorna
	 * @param Tipo de Parametro asociado a la busqueda. Ejemplo: (1 equivale a PERFILUSUARIO)
	 * @param cantidadMax
	 * @param descripcion del tipo de parametro a buscar. Ejemplo: ("Corrector" equivale a un perfil de usuario)
	 * @return List<Parametro>
	 */
	List<Parametro> buscarParametroDelTipo(int tipo, int cantidadMax, String valor);

	/**
	 * Recupera el id del parametro en base al valor que le llega y lo retorna
	 * @param descripcion del tipo de parametro a buscar. Ejemplo: ("Corrector" equivale a un perfil de usuario)
	 * @return long
	 */
	public long obtenerId(String valor);
	
	/**
	 * Recupera un parametro que coincida con el buscado
	 * @param valor
	 * @return Parametro
	 */
	public Parametro obtenerParametroPorIgualValor(String valor);
	
	
	/**
	 * Recupera un parametro que coincida con el buscado por id si existe
	 * @param valor
	 * @param id
	 * @return Parametro
	 */
	public Parametro obtenerParametroSiExiste(String valor, String id);
	
	/**
	 * @param id
	 * @return
	 */
	public Parametro obtener(Long id);
}
