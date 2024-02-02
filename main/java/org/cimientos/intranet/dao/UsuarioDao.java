
package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.dao.impl.UsuarioDaoImpl;
import org.cimientos.intranet.modelo.usuario.Usuario;


/**
 * Interfaz  de la clase Usuario.
 * Establece los metodo basicos y generales para todas las entidades con las que se va a trabajar en la BD.
 * Hereda los metodos base de la Interfaz Base Dao.
 * Se proveen las siguientes implementaciones:
 * 
 * @see UsuarioDaoImpl
 * @author msagarduy
 * @param <Usuario> la clase de la entidad a manejar por este dao.
 */
public interface UsuarioDao extends Dao<Usuario> {
	
	/**
	 * Recupera el usuario buscado en base al nombre de usuario y estado activo
	 * @param usuario Nombre de usuario
	 * @param soloActivos Estado de los usuarios (activos - inactivos)
	 * @return {@link Usuario} objeto usuario
	 * 
	 */
	public Usuario obtenerPorUsername(String usuario, boolean soloActivos);
	
	
	/**
	 * Recupera el usuario buscado en base a su email
	 * @param email Email del usuario a buscar
	 * @return {@link Usuario} objeto usuario
	 * 
	 */
	public Usuario buscarPorEmail(String email);
	
	
	/** 
	 * Recupera todos los usuarios del perfil en base a su id
	 * @param id Id del perfil buscado
	 * @return List<Usuario> todos los usuarios buscados
	 * 
	 */
	public List<Usuario> obtenerPorPerfil(long id);
	
	
	/**
	 * Recupera el usuario buscado en base al usuario
	 * @param usuario El nombre del usuario 
	 * @return {@link Usuario} objeto usuario
	 * 
	 */
	public Usuario obtenerUsuarioPorIgualUsuario(String usuario);
	
	
	/**
	 * Recupera el usuario buscado en base al nombre y a su id
	 * @param nombre El nombre del usuario
	 * @param id Id del usuario
	 * @return {@link Usuario} objeto usuario
	 * 
	 */
	public Usuario obtenerUsuario(String nombre, String id);
	
	/**
	 * Obtener usuario por perfil.
	 *
	 * @param idPerfil the id perfil
	 * @return the usuario
	 * @since 07-abr-2011
	 * @author cfigueroa
	 */
	public Usuario obtenerUsuarioPorDni(Integer dni);
}
