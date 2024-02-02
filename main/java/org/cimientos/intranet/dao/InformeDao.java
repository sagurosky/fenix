/**
 * 
 */
package org.cimientos.intranet.dao;

import java.util.Date;
import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.web.controller.EnvioInformeDTO;
import org.displaytag.properties.SortOrderEnum;

import com.cimientos.intranet.enumerativos.AnioEscolar;

/**
 * @author plabaronnie
 *
 */
public interface InformeDao extends Dao<Informe>{

	/**
	 * @return
	 */
	public List<Informe> obtenerInformesPendientes(CicloPrograma ciclo);

	public  List<EnvioInformeDTO> obtenerInformesAEnviarAPadrinosFiltradosIndividuales(Long padrinoId, Long zonaId, Long estadoInformeId, String tipoInforme, CicloPrograma ciclo, int firstResult, int maxResults,
            SortOrderEnum sortDirection, String sortCriterion);
	
	public  List<EnvioInformeDTO> obtenerInformesAEnviarAPadrinosFiltradosCorporativos(Long padrinoId, Long zonaId, Long estadoInformeId, String tipoInforme, CicloPrograma ciclo, int firstResult, int maxResults,
            SortOrderEnum sortDirection, String sortCriterion);
	
	public  List<Informe> obtenerInformesAAprobar(CicloPrograma ciclo);
	
	public  List<Informe> obtenerInformesASupervisarYRevisar(PerfilRR rr,CicloPrograma ciclo);
	
	public  List<Informe> obtenerInformesARevisar(PerfilRR rr,CicloPrograma ciclo);

	public  List<Informe> obtenerInformesConstruccion(CicloPrograma ciclo);

	public List<Informe> obtenerTodosInformesPorEA(Long idEA, CicloPrograma ciclo, String nombre);

	public List<Informe> obtenerInformesConstruccionPorEA(PerfilEA perfilEA,CicloPrograma ciclo);
	
	public List<Informe> obtenerInformesAEnviar(Beca beca, EstadoInforme estado, String nombre);
	
	public Integer obtenerCantInformesPadrinosFiltradosAExportar(Boolean esIndividual, Long padrinoId, Long zonaId, Long estadoInformeId, String tipoInforme, CicloPrograma ciclo);
	
	public List<Informe> obtenerInformesAReportar(List<Long> ciclo, Integer tipoId, List<String> tipoInforme, List<Integer> idEstado, 
												List<Number> padrinoId, List<Number> zonaId, String nombreAlumno, Long idEA, Long idRR,
												AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta,
												int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion, String eae);
	
	int obtenerCantidadInformesAReportar(Integer tipoId, List<String> tipoInforme, List<Integer> idEstado, List<Number> padrinoId, List<Number> zonaId, String nombreAlumno, 
										List<Long> ciclo, Long idEA, Long idRR, AnioEscolar anioEscolar, Date fechaDesde, Date fechaHasta, String eae);
	
	int obtenerCantidadInformesAAprobar(String correctora, Integer tipoId, String tipoInforme, Long rrId,Long eaId,String nombreAlumno,Long padrinoId,Long zonaId, CicloPrograma ciclo);
	
	public List<Informe> obtenerInformesAAprobar(String correctora,  Integer tipoId, String tipoInforme, Long eaId, Long rrId,String nombreAlumno,
												 Long padrinoId, Long zonaId, int firstResult, int maxResults,SortOrderEnum sortDirection, String sortCriterion, CicloPrograma ciclo);
			
	int obtenerCantidadInformesActualizar(String tipoInforme, String nombreAlumno, PerfilEA perfilEA, CicloPrograma ciclo);
	
	public List<Informe> obtenerInformesActualizar(String tipoInforme, String nombreAlumno, PerfilEA perfilEA,
												  int firstResult, int maxResults,SortOrderEnum sortDirection, String sortCriterion,CicloPrograma ciclo);
	
	int obtenerCantidadInformesASupervisar(Integer tipoId, String tipoInforme, PerfilRR rr,String nombreAlumno,Long padrinoId,Long zonaId,CicloPrograma ciclo);
	
	public List<Informe> obtenerInformesASupervisar(Integer tipoId, String tipoInforme, PerfilRR rr,String nombreAlumno,
												 Long padrinoId, Long zonaId, int firstResult, int maxResults,SortOrderEnum sortDirection, String sortCriterion, CicloPrograma ciclo);
			
			
	public Boolean verSiAlumnoTieneInformePorTipo(Long idAlumno, String tipoInforme);

	/**
	 * @param eaAnterior
	 * @param idsAlumnos
	 * @return
	 */
	public List<Informe> obtenerInformesInconclusosAlumnosEa(
			PerfilEA eaAnterior, List<Long> idsAlumnos);

	/**
	 * @param rrAnterior
	 * @param easIds
	 * @return
	 */
	public List<Informe> obtenerInformesInconclusosEasRR(PerfilRR rrAnterior,
			List<Long> easIds);
}
