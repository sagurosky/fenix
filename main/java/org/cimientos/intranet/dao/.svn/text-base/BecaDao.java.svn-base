/**
 * 
 */
package org.cimientos.intranet.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.EstadoBeca;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.displaytag.properties.SortOrderEnum;

/**
 * @author plabaronnie
 *
 */
public interface BecaDao extends Dao<Beca> {

	/**
	 * @param anioActual 
	 * @return
	 */
	List<Beca> obtenerBecasConCupo(int anioActual);
	
	/**
	 * Obtener becas por estado.
	 *
	 * @param estadoBeca the estado beca
	 * @return the list
	 * @since 25-nov-2010
	 * @author cfigueroa
	 */
	List<Beca> obtenerBecasPorEstado(EstadoBeca estadoBeca);

	/**
	 * @return
	 */
	List<Beca> obtenerBecasActivas();

	/**
	 * @param padrino
	 * @param zona
	 * @param anioCicloAnterior
	 * @return
	 */
	Beca buscarBecaCorrespondienteCicloAnterior(PerfilPadrino padrino,
			ZonaCimientos zona, int anioCicloAnterior);

	/**
	 * Obtener becas  por periodo.
	 *
	 * @param periodo the periodo
	 * @return the list
	 * @since 29-dic-2010
	 * @author cfigueroa
	 */
	List<Beca> obtenerBecasPorPeriodo(Periodo periodo);
	
	Integer cantidadBecasUltimoAnioEscolarPorZona(Long idPeriodo , Long idZona);
	
	Integer cantidadBecasCesadasPorZona(Long idPeriodo , Long idZona);
	
	/**
	 * Obtiene todas las becas cuyo ciclo es el actual.
	 * @return la lista de becas con ciclo actual
	 */
	public List<Beca> obtenerBecasCicloActual();
	
	public List<Beca> obtenerBecasCicloActualParaReasignacion();

	/**
	 * Retorna la cantidad de becados de las becas
	 * @param id
	 * @return
	 */
	public Map<Long, Integer> obtenerCantidadBecados();

	/**
	 * Cantidad becas por estados.
	 *
	 * @param estadoBecas the estado becas
	 * @return the integer
	 * @since 04-may-2011
	 * @author cfigueroa
	 */
	public Integer cantidadBecasPorEstados(List<EstadoBeca> estadoBecas);

	/**
	 * @param ciclo
	 * @param idTipo
	 * @param idEstado
	 * @param idPeriodo
	 * @param tipoBecaId
	 * @param padrinoId
	 * @param zonaId
	 * @param total - se utiliza para saber si se quiere paginar o no. Para el clonar becas se pasa en 'true' para que traiga todos los resultados 
	 * @param becaClonada 
	 * @return
	 */
	int obtenerCantidadBecasAExportar(CicloPrograma ciclo,
			Integer idTipo, Integer idEstado, Long idPeriodo,
			Integer tipoBecaId, Long padrinoId, Long zonaId, boolean total, Boolean becaClonada);

	/**
	 * @param ciclo
	 * @param idTipo
	 * @param idEstado
	 * @param idPeriodo
	 * @param tipoBecaId
	 * @param padrinoId
	 * @param zonaId
	 * @param total - se utiliza para saber si se quiere paginar o no. Para el clonar becas se pasa en 'true' para que traiga todos los resultados 
	 * @param becaClonada 
	 * @param pagesize
	 * @param totalRows
	 * @param sortDirection
	 * @param sortCriterion
	 * @return
	 */
	List<Beca> obtenerBecasAExportar(CicloPrograma ciclo, Integer idTipo,
			Integer idEstado, Long idPeriodo, Integer tipoBecaId,
			Long padrinoId, Long zonaId, boolean total , Boolean becaClonada, int pagesize, int totalRows,
			SortOrderEnum sortDirection, String sortCriterion);

	
	List<Beca> obtenerBecasCicloActualPorFecha(Date fecha);
	
	List<Beca> buscarBecaPorCicloPorZona(ZonaCimientos zona, Long ciclo);
	
}
