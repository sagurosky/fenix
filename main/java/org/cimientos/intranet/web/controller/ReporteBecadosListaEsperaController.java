package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author plabaronnie
 * Clase que se utiliza para  hacer la redireccion (mapeo) a las vistas.
 * Extiende de BaseController para incluir el Template
 */
@Controller
@RequestMapping("/reporteBecadosLE/*")
public class ReporteBecadosListaEsperaController extends BaseController{
	
	@Autowired
	private AlumnoSrv srvAlumno;
	
	@Autowired
	public ZonaCimientosSrv srvZona;
	
	
	
	@RequestMapping("/reporteBecadosLE/verDetalleAlumno.do") //Utilizado para ver el detalle del alumno llamandolo por ajax en el ReporteBecadosLE.jsp, 
															//al momento 10 01 2011 16:53 NO ESTA IMPLEMENTADO. Utiliza el del Jquery.
	public ModelAndView verDetalleAlumno(@RequestParam("alumnoId") Long alumnoId){  
		Map<String, Object> resul = new HashMap<String,Object>();
		PerfilAlumno alumno = srvAlumno.obtenerAlumno(alumnoId); 
	
		resul.put("alumno", alumno);
		
		return forward("reporteBecadosLE/reporteBecadosLE", resul);
	}
		
	
	/**
	 * Recupera la lista de todos los becados en lista de espera persistidos en la DB.
	 * 
	 * @return la vista la vista con la tabla de alumnos
	 */
	@RequestMapping("/reporteBecadosLE/reporteBecadosLEView.do")
	public ModelAndView verAsignacionBecas(){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("alumnos", srvAlumno.obtenerBecadosListaEspera());
		resul.put("zonas", srvZona.obtenerTodos());
		
		return forward("reporteBecadosLE/reporteBecadosLE", resul);
	}
	
	
	@RequestMapping("/reporteBecadosLE/eliminarReporteBecadosLE") 
	public ModelAndView eliminarReporteBecadosLE(@RequestParam("alumnosSeleccionados") String idsPerfilAlumnos){
		Map<String,Object> map = new HashMap<String, Object>();
		
		List<Long> ids = Formateador.toListOfLongs(idsPerfilAlumnos);
		StringBuffer buffer = new StringBuffer();
		for (Long id : ids) {
			PerfilAlumno perfilAlumno = srvAlumno.obtenerAlumno(id);
			perfilAlumno.setEstadoAlumno(EstadoAlumno.RECHAZADO);
			perfilAlumno.setActivo(false);
			srvAlumno.modificarAlumno(perfilAlumno);
			buffer.append(" ");
			buffer.append(perfilAlumno.getDatosPersonales().getNombre());
			buffer.append(" ");
			buffer.append(perfilAlumno.getDatosPersonales().getApellido());
			buffer.append(",");
		}
		
		loadObjectForm(map);
		
		map.put("mensaje", "Se ha eliminado los datos de los Alummnos: " + buffer.toString());
		
		map.put("alumnos", srvAlumno.obtenerBecadosListaEspera());
		map.put("zonas", srvZona.obtenerTodos());
		
		return forward("reporteBecadosLE/reporteBecadosLE", map);
	}
	
	@RequestMapping("/reporteBecadosLE/aprobadoReporteBecadosLE") 
	public ModelAndView aprobadoReporteBecadosLE(@RequestParam("alumnosSeleccionados") String idsPerfilAlumnos){
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		List<Long> ids = Formateador.toListOfLongs(idsPerfilAlumnos);
		StringBuffer buffer = new StringBuffer();
		for (Long id : ids) {
			PerfilAlumno perfilAlumno = srvAlumno.obtenerAlumno(id);
			if(perfilAlumno.getEstadoAlumno() == EstadoAlumno.LISTA_ESPERA || 
					perfilAlumno.getEstadoAlumno() == EstadoAlumno.LISTA_ESPERA_MATERIAS){
				perfilAlumno.setEstadoAlumno(EstadoAlumno.APROBADO);
			}else{
				perfilAlumno.setEstadoAlumno(EstadoAlumno.APROBADO_TS);
			}
			
			srvAlumno.modificarAlumno(perfilAlumno);
			buffer.append(" ");
			buffer.append(perfilAlumno.getDatosPersonales().getNombre());
			buffer.append(" ");
			buffer.append(perfilAlumno.getDatosPersonales().getApellido());
			buffer.append(",");
		}
		loadObjectForm(map);
		
		
		map.put("mensaje", "Se ha aprobado los datos de los Alummnos: " + buffer.toString());
		
		map.put("alumnos", srvAlumno.obtenerBecadosListaEspera());
		map.put("zonas", srvZona.obtenerTodos());
		
		return forward("reporteBecadosLE/reporteBecadosLE", map);
		
	}
	
	/**
	 * Load object form.
	 *
	 * @param map the map
	 * @param logeado the logeado
	 * @since 07-dic-2010
	 * @author nlopez
	 */
	private void loadObjectForm(Map<String, Object> map) {
		
		List<EstadoAlumno> listEstados = new ArrayList<EstadoAlumno>();
		listEstados.add(EstadoAlumno.getEstados(3));
		listEstados.add(EstadoAlumno.getEstados(4));
		List<PerfilAlumno> list = srvAlumno.obtenerAlumnosPorEstado(listEstados);
		map.put("listCandidatos",list);
	}
	
}