package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.dao.AlumnoDao;
import org.cimientos.intranet.dao.EntrevistaDao;
import org.cimientos.intranet.dao.ObjetivoSeleccionDao;
import org.cimientos.intranet.dao.PanelControlSeleccionDao;
import org.cimientos.intranet.dto.PanelControlSeleccionDTO;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaIndividual;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class PanelControlSrv {
	
	@Autowired 
	private PanelControlSeleccionDao dao;
	@Autowired
	private AlumnoDao alumnoDao;
	@Autowired
	private ObjetivoSeleccionDao objetivoSeleccionDao;
	@Autowired
	private EntrevistaDao entrevistaIndividualDao;
	/**
	 * Este metodo devuelve una lista de beca donde figuran las becas disponibles y las que realmentes se cargaron
	 *
	 * @return the list
	 * @since 26-nov-2010
	 * @author nlopez
	 */
	public List<PanelControlSeleccionDTO> listaPanelControlSeleccion(){
		List<PanelControlSeleccionDTO> list = dao.obtenerBecasActual();
		List<EntrevistaIndividual> entrevistasBecadosCesados = new ArrayList<EntrevistaIndividual>();
		List<PerfilAlumno> alumnosPadrinoCimientos = new ArrayList<PerfilAlumno>();
		List<PanelControlSeleccionDTO> listReporte = new ArrayList<PanelControlSeleccionDTO>();
		for( PanelControlSeleccionDTO panelControlSeleccionDTO : list){

			int becaDisp = panelControlSeleccionDTO.getBecasDisponibles();
			int cantidadObjetivo = objetivoSeleccionDao.obtenerCantidadBecasPorIdCicloIdPeriodoIdZona(panelControlSeleccionDTO.getIdCiclo(),
																									  panelControlSeleccionDTO.getIdPeriodo(),
																									  panelControlSeleccionDTO.getIdZona());
			entrevistasBecadosCesados = entrevistaIndividualDao.obtenerEntrevistasCesacionPorZonaCicloPeriodo(panelControlSeleccionDTO.getIdZona(), 
																											   panelControlSeleccionDTO.getIdCiclo(), 
																											   panelControlSeleccionDTO.getIdPeriodo());							
			
			alumnosPadrinoCimientos = alumnoDao.obtenerAlumnosPadrinoCimientosPorZonaCicloPeriodo(panelControlSeleccionDTO.getIdZona(), 
																											   panelControlSeleccionDTO.getIdCiclo(), 
																											   panelControlSeleccionDTO.getIdPeriodo());
			panelControlSeleccionDTO.setBecasObjetivosSeleccion(cantidadObjetivo);
			if(entrevistasBecadosCesados != null)
				panelControlSeleccionDTO.setBecadosCesados(entrevistasBecadosCesados.size());
			else
				panelControlSeleccionDTO.setBecadosCesados(0);
			
			if(alumnosPadrinoCimientos != null)
				panelControlSeleccionDTO.setBecadosSinPadrino(alumnosPadrinoCimientos.size());
			else
				panelControlSeleccionDTO.setBecadosSinPadrino(0);
			
			int cantidad = panelControlSeleccionDTO.getBecasAsignadas();
			if(cantidad != 0 ){
				if(becaDisp > cantidad){
					panelControlSeleccionDTO.setBecasDisponibles(becaDisp - cantidad);
				}else{
					panelControlSeleccionDTO.setBecasDisponibles(cantidad - cantidad);
				}
			}
			listReporte.add(panelControlSeleccionDTO);
				
		}

		return listReporte;
	}

}
