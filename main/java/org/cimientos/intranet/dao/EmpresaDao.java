
package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.dao.impl.EmpresaDaoImpl;
import org.cimientos.intranet.modelo.empresa.Empresa;


/**
 * Interfaz  de la clase Empresa.
 * Establece los metodo basicos y generales para todas las entidades con las que se va a trabajar en la BD.
 * Hereda los metodos base de la Interfaz Base Dao.
 * Se proveen las siguientes implementaciones:
 * 
 * @see EmpresaDaoImpl
 * @author plabaronnie
 * @param <Empresa> la clase de la entidad a manejar por este dao.
 */
public interface EmpresaDao extends Dao<Empresa> {


	/**
	 * Recupera el empresa buscado en base al nombre
	 * @param nombre El nombre del empresa 
	 * @return {@link Empresa} objeto empresa
	 * 
	 */
	public Empresa obtenerEmpresaPorIgualNombre(String nombre);
	
	
	/**
	 * Recupera el empresa buscado en base al nombre y con id distinto al pasado por parametro
	 * @param nombre El nombre del empresa
	 * @param id Id del empresa
	 * @return {@link Empresa} objeto empresa
	 * 
	 */
	public Empresa obtenerEmpresa(String nombre, String id);

	
	/**
	 * Recupera la lista de empresas que estan activos en la DB.
	 * @return List<Usuario> La lista de empresas activos
	 * 
	 */
	public List<Empresa> obtenerEmpresasActivos();


	/**
	 * Recupera la empresa buscando en base al cuit
	 * 
	 * @param cuit CUIT de la empresa
	 * @return {@link Empresa} objeto empresa
	 */
	public Empresa buscarPorCUIT(String cuit);


	/**
	 * @param cuit
	 * @param id
	 * @return
	 */
	public Empresa buscarPorIgualCUIT(String cuit, Long id);
}
