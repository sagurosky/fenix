/**
 * 
 */
package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.objetivoseleccion.ObjetivoSeleccion;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

/**
 * The Interface ObjetivoSeleccionDao.
 *
 * @author nlopez
 */
public interface ObjetivoSeleccionDao extends Dao<ObjetivoSeleccion>{

	/**
	*Se utiliza para obtener de la grilla Registrar Objetivo Seleccion, todas las becas disponibles
	*por Periodo y Zona y colocar sus resultados en la grilla de Reporte Entrevistas Seleccion.
	*/
	public Integer obtenerCantidadBecasPorIdCicloIdPeriodoIdZona(Long idCiclo,Long idPeriodo,Long idZona);

	ObjetivoSeleccion obtenerBecasPorCesadosporCicloPeriodo(
			CicloPrograma ciclo);
	/**
	 * Obtener objetivo seleccion por periodo.
	 *
	 * @param periodo the periodo
	 * @return the list
	 * @since 04-ene-2011
	 * @author cfigueroa
	 */
	public List<ObjetivoSeleccion> obtenerObjetivoSeleccionPorPeriodoCiclo(Periodo periodo,CicloPrograma cicloPrograma);
	
	/**
	 * Obtener ciclo programa.
	 *
	 * @return the list
	 * @since 05-ene-2011
	 * @author cfigueroa
	 */
	public List<CicloPrograma> obtenerCicloPrograma();

	/**
	 * Obtener objetivo selecicon por ciclo.
	 *
	 * @param cicloPrograma the ciclo programa
	 * @return the list
	 * @since 05-ene-2011
	 * @author cfigueroa
	 */
	public List<ObjetivoSeleccion> obtenerObjetivoSeleciconPorCiclo(CicloPrograma cicloPrograma);
}
