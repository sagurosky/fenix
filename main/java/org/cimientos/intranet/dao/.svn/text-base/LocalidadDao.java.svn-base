package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.dao.impl.LocalidadDaoImpl;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.Provincia;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;



/**
 * Interfaz  de la clase Localidad.
 * Establece los metodo basicos y generales para todas las entidades con las que se va a trabajar en la BD.
 * Hereda los metodos base de la Interfaz Base Dao.
 * Se proveen las siguientes implementaciones:
 *  
 * @see LocalidadDaoImpl
 * @author msagarduy
 * @param <Localidad> la clase de la entidad a manejar por este dao.
 *
 */
public interface LocalidadDao extends Dao<Localidad> {

	/**
	 * Me devuelve la lista de localidades que pertenecen a una determinada provincia
	 * @param nombresLocalidades
	 * @return  List<{@link Localidad}>
	 */
	public List<Localidad> obtenerPorLocalidadesZona(List<String> nombresLocalidades);
	
	public List<Localidad> obtenerActivos();
	/**
	 * Me devuelve la lista de localidades que NO pertenecen a una determinada zona
	 * @param zona
	 * @param localidades
	 * @return List<{@link Localidad}>
	 */
	public List<Localidad> obtenerPorZonaExistente(ZonaCimientos zona, List<String> localidades);
	
	/**
	 * Me devuelve la lista de localidades que pertenecen a una determinada provincia
	 * @param nombresLocalidades
	 * @return  List<{@link Localidad}>
	 */
	public List<Localidad> obtenerPorLocalidades(List<String> nombresLocalidades);
	
	/**
	 * Me devuelve la lista de localidades que NO pertenecen a una determinada provincia
	 * @param provincia
	 * @param localidades
	 * @return List<{@link Localidad}>
	 */
	public List<Localidad> obtenerPorProvinciaExistente(Provincia provincia, List<String> localidades);
	
	/**
	 * Recupera  la localidad buscada en base al nombre de la localidad que llega como parametro
	 * @param nombre El nombre de la localidad
	 * @return {@link Localidad} objeto localidad
	 * 
	 */
	public Localidad obtenerPorNombre(String nombre);
	
	/**
	 * Recupera la localidad buscada en base al nombre y a su id
	 * @param nombre El nombre de la localidad
	 * @param id Id de la localidad
	 * @return {@link Localidad} objeto localidad
	 * 
	 */
	public Localidad obtenerLocalidadSiExiste(String nombre, String id);
	
	/**
	 * @param texto
	 * @param cantidadMaxima
	 * @return
	 */
	public List<Localidad> buscarLocalidades(String texto, int cantidadMaxima);

	public List<Localidad> obtenerLocalidadesSinZona(); 
	
	public List<Localidad> obtenerLocalidadesSinProvincia();
	

}
