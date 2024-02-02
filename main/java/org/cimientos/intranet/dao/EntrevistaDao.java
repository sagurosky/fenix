package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.Entrevista;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaGrupal;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaIndividual;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.displaytag.properties.SortOrderEnum;

import com.cimientos.intranet.enumerativos.entrevista.TipoEntrevista;

public interface EntrevistaDao extends Dao<Entrevista>{

	List<EntrevistaIndividual> obtenerEntrevistasIndividuales();

	List<EntrevistaIndividual> obtenerEntrevistasAAprobar(Long idRR);

	List<EntrevistaIndividual> obtenerEntrevistasIndividualesPorId(Long idAlumno, List<Long> periodosIds);
	
	EntrevistaIndividual obtenerEntrevistasIndividualesPorAlumno(Long idAlumno, EstadoAlumno estado, CicloPrograma cicloPrograma);

	List<EntrevistaIndividual> obtenerEntrevistasPorId(String string,List<Long> entrevistasIds);

	List<EntrevistaGrupal> obtenerEntrevistasGrupales();

	EntrevistaGrupal obtenerEntrevistaGrupal(Long id);

	List<EntrevistaIndividual> obtenerEntrevistaPorTipo(Long id, List<Long> periodosIds, TipoEntrevista tipo);

	List<EntrevistaIndividual> obtenerEntrevistaPorTipo(Long id, TipoEntrevista tipo);

	List<EntrevistaIndividual> obtenerTodasEntrevistasPorEa(Long idEA,	List<Long> periodosIds);

	EntrevistaIndividual obtenerUltimaEntrevista(PerfilAlumno p, List<Long> periodosIds);

	EntrevistaIndividual obtenerEntrevistasCesacion(Long idPerfilAlumno, CicloPrograma cicloActual);

	EntrevistaIndividual obtenerEntrevistasIncorporacion(Long idPerfilAlumno, CicloPrograma cicloActual);

	EntrevistaIndividual obtenerEntrevistasRenovacion(Long idPerfilAlumno, CicloPrograma cicloActual);

	List<EntrevistaGrupal> obtenerEntrevistasGrupalesPorEa(Long idPerfilEA, CicloPrograma cicloActual);
	
	List<EntrevistaGrupal> obtenerEntrevistasGrupalesTodas(CicloPrograma cicloActual);

	/**
	 * @param ciclo 
	 * @param eaId 
	 * @param rrId 
	 * @param nombreAlumno 
	 * @param adicional 
	 * @param anio 
	 * @param sortCriterion 
	 * @param sortDirection 
	 * @param maxResults 
	 * @param firstResult 
	 * @return
	 */
	public List<EntrevistaIndividual> obtenerEntrevistasAExportar(List<CicloPrograma> ciclo, List<Integer > tipoId, List<Integer> idEstado, 
			List<Integer> idSituacion, List<Long> idPeriodo, 
			Integer idForma, Long padrinoId, Long zonaId, Long rrId, Long eaId, String nombreAlumno, List<Integer> anio, Boolean adicional,
			Long escuelaId, List <Integer> idsEstadoRenovacion, List<Integer >idsMotivoNoRenovacion,
			List <Integer> idsMotivoPendiente, List <Integer> idsMotivoSuspension, List <Integer> idsMotivoCesacion,
			List <Integer> idsEstadoIncorporacion, List <Integer> idsMotivoIncorporacionPendiente, List <Integer> idsMotivoNoIncorporacion,
			List <Integer> idsEstadoEntrevista, List <Integer> idsSituacioneEscolares,			
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion, String eae);

	/**
	 * @param ciclo
	 * @param padrinoId 
	 * @param idForma 
	 * @param idPeriodo 
	 * @param idSituacion 
	 * @param idEstado 
	 * @param eaId 
	 * @param rrId 
	 * @param nombreAlumno 
	 * @param adicional 
	 * @param anio 
	 * @return
	 */
	int obtenerCantidadEntrevistasAExportar(List<CicloPrograma> ciclo, List <Integer > tipoId, List<Integer> idEstado, 
										List<Integer> idSituacion, List<Long> idPeriodo, Integer idForma, Long padrinoId, 
										Long zonaId, Long rrId, Long eaId, String nombreAlumno, List<Integer> anio, Boolean adicional,
										Long escuelaId, List <Integer> idsEstadoRenovacion, List<Integer >idMotivoNoRenovacion,
										List <Integer> idsMotivoPendiente, List <Integer> idsMotivoSuspension, List <Integer> idsMotivoCesacion,
										List <Integer> idsEstadoIncorporacion, List <Integer> idsMotivoIncorporacionPendiente, List <Integer> idsMotivoNoIncorporacion,
										List <Integer> idsEstadoEntrevista, List <Integer> idsSituacioneEscolares, String eae );

	/**
	 * @param eaAnterior
	 * @param idsAlumnosSeleccionados
	 * @return
	 */
	List<EntrevistaIndividual> obtenerEntrevistasInconclusasAlumnosEa(
			PerfilEA eaAnterior, List<Long> idsAlumnosSeleccionados);

	/**
	 * @param rrAnterior
	 * @param easIds
	 * @return
	 */
	List<EntrevistaIndividual> obtenerEntrevistasInconclusasEasRR(
			PerfilRR rrAnterior, List<Long> easIds);
	
	/**
	 * @param idZona
	 * @param cicloActual
	 * @param idPeriodo
	 * @return
	 */
	public List<EntrevistaIndividual> obtenerEntrevistasCesacionPorZonaCicloPeriodo(Long idZona, Long idCicloActual, Long idPeriodo); 
	
	public List<EntrevistaIndividual> obtenerEntrevistasConPagoSuspendidoPorAlumno(Long idAlumno);

	public List<EntrevistaIndividual> obtenerEntrevistasPorAlumno(Long idAlumno, CicloPrograma cicloPrograma, String orden);
	
	public List<EntrevistaGrupal> obtenerEntrevistasGrupalesPorRR(Long idPerfilRR, CicloPrograma cicloActual);
	
	public List<EntrevistaIndividual> obtenerEntrevistasMensualesPorAlumno(Long idAlumno, CicloPrograma cicloPrograma);
	
	public void guardarEntrevistas(List<EntrevistaIndividual> entrevistas);

	public List<EntrevistaIndividual> obtenerTodasEntrevistasPorAlumno(Long idAlumno, String orden);

}
