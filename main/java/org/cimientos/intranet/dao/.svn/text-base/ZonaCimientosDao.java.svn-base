
package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.dao.impl.ZonaCimientosDaoImpl;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

/**
 * Interfaz  de la clase ZonaCimientos
 * Establece los metodo basicos y generales para todas las entidades con las que se va a trabajar en la BD.
 * Hereda los metodos base de la Interfaz Base Dao.
 * Se proveen las siguientes implementaciones:
 * 
 * @see ZonaCimientosDaoImpl
 * @author msagarduy
 * @param <ZonaCimientos> la clase de la entidad a manejar por este dao.
 */
public interface ZonaCimientosDao extends Dao<ZonaCimientos> {
	
	/**
	 * Recupera  la zona buscada en base al nombre de la zona que llega como parametro
	 * @param nombre El nombre de la zona
	 * @return {@link Zona Cimientos} objeto zona
	 * 
	 */
	public ZonaCimientos obtenerPorNombre(String nombre);
	
	public List<ZonaCimientos> obtenerActivos();
	/**
	 * Recupera la zona buscada en base al nombre y a su id
	 * @param nombre El nombre de la zona
	 * @param id Id de la zona
	 * @return {@link Zona Cimientos} objeto zona
	 * 
	 */
	public ZonaCimientos obtenerZonaSiExiste(String nombre, String id);

	
	public List<ZonaCimientos> buscarLocalidades(String texto);

	
	public List<Escuela> buscarEscuelasZona(long idZona, String texto);

	
	/**
	 * Busca todas las localidad, tanto las activas como las inactivas
	 * @param texto
	 * @return
	 */
	public List<ZonaCimientos> buscarTodasLocalidades(String texto);

	
}
