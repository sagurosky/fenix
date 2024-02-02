package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.InformeFPDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.FichaPresentacion;
import org.cimientos.intranet.modelo.informe.Informe;
import org.displaytag.properties.SortOrderEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cimientos.intranet.dto.ReporteInformeDTO;

@Service
@Transactional
public class InformeFPSrv {

	@Autowired
	private InformeFPDao daoInforme;
	
	@Autowired
	private CicloProgramaSrv srvCiclo;
 
 	@Autowired
	private InformeSrv srvInforme;
	
	

	public void guardarInformeFP(FichaPresentacion informe){
		daoInforme.guardar(informe);
		daoInforme.flush();
	}
	

	public void eliminarInformeFP(FichaPresentacion informe){
		daoInforme.eliminar(informe);
		daoInforme.flush();
	}
	
	public FichaPresentacion obtenerInformeFP(long id){
		return daoInforme.obtener(id);
	}
	
	public List<FichaPresentacion> obtenerTodos(){
		return daoInforme.obtenerTodos();
	}
	
	public List<FichaPresentacion> obtenerGrupo(List<Long> ids){
		return daoInforme.obtenerGrupo("id", ids);
	}
	
	public List<FichaPresentacion> obtenerConstruccion(){
		return daoInforme.obtenerInformesConstruccion(srvCiclo.obtenerCicloActual());
	}
	
	public List<FichaPresentacion> obtenerRevision(){
		return daoInforme.obtenerInformesRevision(srvCiclo.obtenerCicloActual());
	}
	
	public List<FichaPresentacion> obtenerCorreccion(){
		return daoInforme.obtenerInformesCorreccion(srvCiclo.obtenerCicloActual());
	}
	
	public List<FichaPresentacion> obtenerFinalizados(){
		return daoInforme.obtenerInformesFinalizados(srvCiclo.obtenerCicloActual());
	}

	public FichaPresentacion obtenerInformePorAlumno(Long id) {
		return daoInforme.obtenerInformePorAlumno(id);
	}
	
	public Integer obtenerCantidadFpARevisar(String tipoInforme, Integer estadoId, String nombreAlumno, CicloPrograma ciclo, 
									Long zonaId, Long idPadrino, Long idEA, Long idRR, Long tipoPadrinoId){
		
		return daoInforme.obtenerCantidadFpARevisar(tipoInforme, estadoId, nombreAlumno, ciclo, zonaId, idPadrino, idEA, idRR, tipoPadrinoId);
	}
	
	public List<ReporteInformeDTO> obtenerFpARevisar(String tipoInforme, Integer estadoId, String nombreAlumno,
								int firstResult, int maxResults,SortOrderEnum sortDirection, 
								String sortCriterion, CicloPrograma ciclo, Long zonaId, Long idPadrino, 
								Long idEA, Long idRR, Long tipoPadrinoId){
		
		List<Informe> informes = daoInforme.obtenerFpARevisar(tipoInforme, estadoId, nombreAlumno, firstResult, maxResults, 
												sortDirection, sortCriterion, ciclo, zonaId, idPadrino, idEA, idRR, tipoPadrinoId);
		
		return srvInforme.cargaReporteInformeDTO(informes);
		
	}
	
	public FichaPresentacion obtenerInformePorAlumnoPorCiclo(CicloPrograma ciclo, Long id) {
		return daoInforme.obtenerInformePorAlumnoPorCiclo(ciclo, id);
	}
	
	
	public FichaPresentacion obtenerFPFinalizadaPorAlumno(Long id) {
		return daoInforme.obtenerFPFinalizadaPorAlumno(id);
	}
}
