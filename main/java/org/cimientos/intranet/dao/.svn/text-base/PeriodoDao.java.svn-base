/**
 * 
 */
package org.cimientos.intranet.dao;

import java.util.Date;
import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.dao.impl.PeriodoDaoImpl;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Periodo;

/**
 * Interfaz  de la clase Periodo.
 * Establece los metodo basicos y generales para todas las entidades con las que se va a trabajar en la BD.
 * Hereda los metodos base de la Interfaz Base Dao.
 * Se proveen las siguientes implementaciones:
 *  
 * @see PeriodoDaoImpl
 * @author msagarduy
 * @param <Periodo> la clase de la entidad a manejar por este dao.
 *
 */
public interface PeriodoDao extends Dao<Periodo> {

	/**
	 * Recupera  el Periodo buscado en base al nombre del Periodo que llega como parametro
	 * @param nombre El nombre de la Periodo
	 * @return {@link Periodo} objeto Periodo
	 * 
	 */
	public Periodo obtenerPorNombre(String nombre);
	
	/**
	 * Recupera el Periodo buscado en base al nombre y a su id
	 * @param nombre El nombre de la Periodo
	 * @param id Id de la Periodo
	 * @return {@link Periodo} objeto Periodo
	 * 
	 */
	public Periodo obtenerPeriodoSiExiste(String nombre, String id);
	
	/**
	 * Me devuelve la lista de Periodos que pertenecen a un determinado ciclo
	 * @param nombresPeriodos
	 * @return  List<{@link Periodo>
	 */
	public List<Periodo> obtenerPorPeriodos(List<String> nombresPeriodos);
	
	/**
	 * Me devuelve la lista de Periodos que NO pertenecen a un determinado ciclo
	 * @param ciclo
	 * @param periodos
	 * @return List<{@link Periodo}>
	 */
	public List<Periodo> obtenerPorPeriodoExistente(CicloPrograma ciclo, List<String> periodos);

	/**
	 * @param idCiclo
	 * @return
	 */
	public List<Periodo> buscarPeriodosPorCiclo(Long idCiclo);
	
	/**
	 * Obtener periodo por fecha.
	 *
	 * @param date the date
	 * @return the periodo
	 * @since 18-feb-2011
	 * @author cfigueroa
	 */
	public Periodo obtenerPeriodoPorFecha(Date date);

	public String obtenerDeBecaAlumno(Long idAlumno);
		
	public Periodo obtenerPeriodoPorFechaFP(Date date);
	
	public List<Periodo> buscarPeriodosBeca(Periodo periodoDesde, Periodo periodoHasta);
}
