package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.ObjetivoSeleccionDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.objetivoseleccion.ObjetivoSeleccion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * The Class ObjetivoSeleccionSrv.
 *
 * @author nlopez
 */

@Service
@Transactional
public class ObjetivoSeleccionSrv {

	@Autowired
	private ObjetivoSeleccionDao objetivoSeleccionDao;
	
	
	/**
	 * Obtener todos.
	 *
	 * @return the list
	 * @since 03-ene-2011
	 * @author cfigueroa
	 */
	public List<ObjetivoSeleccion> obtenerTodos(){		
		return objetivoSeleccionDao.obtenerTodos();		
	}
	
	/**
	 * Guardar objetivo seleccion.
	 *
	 * @param objetivoSeleccion the objetivo seleccion
	 * @since 03-ene-2011
	 * @author cfigueroa
	 */
	public void guardarObjetivoSeleccion( ObjetivoSeleccion objetivoSeleccion ){
		objetivoSeleccionDao.guardar(objetivoSeleccion);
		objetivoSeleccionDao.flush();
	}
	
	/**
	 * Guardar objetivo seleccion.
	 *
	 * @param objetivoSelecciones the objetivo selecciones
	 * @since 03-ene-2011
	 * @author cfigueroa
	 */
	public void guardarObjetivoSeleccion(List<ObjetivoSeleccion> objetivoSelecciones ){
		objetivoSeleccionDao.guardar(objetivoSelecciones);
		objetivoSeleccionDao.flush();
	}
	
	/**
	 * Obtener objetivo seleccion por periodo.
	 *
	 * @param periodo the periodo
	 * @return the list
	 * @since 04-ene-2011
	 * @author cfigueroa
	 */
	public List<ObjetivoSeleccion> obtenerObjetivoSeleccionPorPeriodoCiclo(Periodo periodo,CicloPrograma cicloPrograma ){
		return objetivoSeleccionDao.obtenerObjetivoSeleccionPorPeriodoCiclo(periodo,cicloPrograma);
	} 
	
	/**
	 * Obtener ciclo programa.
	 *
	 * @return the list
	 * @since 05-ene-2011
	 * @author cfigueroa
	 */
	public List<CicloPrograma> obtenerCicloPrograma(){
		return objetivoSeleccionDao.obtenerCicloPrograma();
	}
	
	/**
	 * Obtener objetivo sel por ciclo.
	 *
	 * @param cicloPrograma the ciclo programa
	 * @return the list
	 * @since 10-ene-2011
	 * @author cfigueroa
	 */
	public List<ObjetivoSeleccion> obtenerObjetivoSelPorCiclo(CicloPrograma cicloPrograma){
		return objetivoSeleccionDao.obtenerObjetivoSeleciconPorCiclo(cicloPrograma);
	}
	
	/**
	 * Obtener objetivo seleccion.
	 *
	 * @param idObjetivos the id objetivos
	 * @return the list
	 * @since 10-ene-2011
	 * @author cfigueroa
	 */
	public List<ObjetivoSeleccion> obtenerObjetivoSeleccion(List<Long> idObjetivos){		
		return objetivoSeleccionDao.obtenerGrupo("id", idObjetivos);
	} 
	
	/**
	 * Eliminar objetivo.
	 *
	 * @param objetivoSeleccions the objetivo seleccions
	 * @since 10-ene-2011
	 * @author cfigueroa
	 */
	public void eliminarObjetivo(List<ObjetivoSeleccion> objetivoSeleccions){
		objetivoSeleccionDao.eliminar(objetivoSeleccions);
	}
	
	/**
	 * Eliminar objetivo.
	 *
	 * @param objetivoSeleccion the objetivo seleccion
	 * @since 10-ene-2011
	 * @author cfigueroa
	 */
	public void eliminarObjetivo(ObjetivoSeleccion objetivoSeleccion){
		objetivoSeleccionDao.eliminar(objetivoSeleccion);
	}
	
	public Integer obtenerCantidadBecasPorIdCicloIdPeriodoIdZona(Long idCiclo,Long idPeriodo,Long idZona){		
		return objetivoSeleccionDao.obtenerCantidadBecasPorIdCicloIdPeriodoIdZona(idCiclo, idPeriodo, idZona);
	}

}
