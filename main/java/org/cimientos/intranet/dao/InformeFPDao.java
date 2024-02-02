package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.FichaPresentacion;
import org.cimientos.intranet.modelo.informe.Informe;
import org.displaytag.properties.SortOrderEnum;

public interface InformeFPDao extends Dao<FichaPresentacion>
{

	public List<FichaPresentacion> obtenerInformesConstruccion(CicloPrograma ciclo);
	
	public List<FichaPresentacion> obtenerInformesRevision(CicloPrograma ciclo);
	
	public List<FichaPresentacion> obtenerInformesCorreccion(CicloPrograma ciclo);
	
	public List<FichaPresentacion> obtenerInformesFinalizados(CicloPrograma ciclo);

	public FichaPresentacion obtenerInformePorAlumno(Long id);
	
	int obtenerCantidadFpARevisar(String tipoInforme, Integer estadoId, String nombreAlumno, CicloPrograma ciclo, 
									Long zonaId, Long idPadrino, Long idEA, Long idRR, Long tipoPadrinoId);
	
	public List<Informe> obtenerFpARevisar(String tipoInforme, Integer estadoId, String nombreAlumno, int firstResult, 
													int maxResults,SortOrderEnum sortDirection, String sortCriterion, CicloPrograma ciclo,
													Long zonaId, Long idPadrino, Long idEA, Long idRR, Long tipoPadrinoId);
	
	public FichaPresentacion obtenerInformePorAlumnoPorCiclo(CicloPrograma ciclo, Long id);
	
	
	public FichaPresentacion obtenerFPFinalizadaPorAlumno(Long id);
}
