package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.cimientos.intranet.modelo.supervisorescolar.SupervisorEscolar;
import org.cimientos.intranet.servicio.EscuelaSrv;
import org.cimientos.intranet.servicio.LocalidadSrv;
import org.cimientos.intranet.servicio.SupervisorEscolarSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author nlopez
 *
 */
@Controller
@RequestMapping("/supervisorEscolar/*")
public class SupervisorEscolarController extends BaseController {
	
	@Autowired
	private SupervisorEscolarSrv supervisorEscolarSrv;
	@Autowired
	private LocalidadSrv localidadSrv;
	@Autowired
	private EscuelaSrv escuelaSrv;
	
	
	@RequestMapping("/supervisorEscolar/supervisorEscolarView.do")
	public ModelAndView supervisorEscolarView(){
				Map<String, Object> result = new HashMap<String, Object>();
				result.put("supervisorEscolar",new SupervisorEscolar());
		
				return forward("/supervisorEscolar/altaSupervisorEscolar", result); 
				}
	
	/**
	 * Lista supervisor escolar.
	 *
	 * @return the model and view
	 * @since 25-nov-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/supervisorEscolar/listaSupervisorEscolar.do")
	public ModelAndView listaSupervisorEscolar(){
				Map<String, Object> result = new HashMap<String, Object>();
				result.put("supervisorEscolars", supervisorEscolarSrv.obtenerTodos());
				
				return forward("/supervisorEscolar/listaSupervisorEscolar", result);
				}	
	
	@RequestMapping("/supervisorEscolar/guardarRegistrarDatosConsultaSE.do")
	public ModelAndView guardarConsultaSE(  
				@ModelAttribute("supervisorEscolar") SupervisorEscolar supervisorEscolar,
				@RequestParam("idLocalidad") Long idLocalidad,
				@RequestParam("idEscuela") Long idEscuela
				){
				Map<String, Object> result = new HashMap<String, Object>();
				
				supervisorEscolar.setLocalidad(localidadSrv.obtenerLocalidad(idLocalidad));
				supervisorEscolar.setEscuela(escuelaSrv.obtenerEscuelaPorId(idEscuela));
				supervisorEscolarSrv.agregarSupervisorEscolar(supervisorEscolar);
				
				result.put("mensaje", "Se dio de alta el supervisor escolar: " + supervisorEscolar.getNombre());
				result.put("supervisorEscolars", supervisorEscolarSrv.obtenerTodos());
				
				return forward("/supervisorEscolar/listaSupervisorEscolar", result);
				}
	
	/**
	 * Modificar supervisor view.
	 *
	 * @param idSupervisor the id supervisor
	 * @return the model and view
	 * @since 01-feb-2011
	 * @author cfigueroa
	 */
	@RequestMapping("/supervisorEscolar/modificarSupervisorView.do")
	public ModelAndView modificarSupervisorView(@RequestParam("idSupervisor") Long idSupervisor){
				Map<String,Object> map = new HashMap<String, Object>();
				
				SupervisorEscolar supervisorEscolar = supervisorEscolarSrv.obtenerPorId(idSupervisor);
				map.put("supervisorEscolar",supervisorEscolar);
				
				return forward("/supervisorEscolar/altaSupervisorEscolar", map); 
				}
	
	/**
	 * Eliminar supervisor escolar.
	 *
	 * @param idSupervisor the id supervisor
	 * @return the model and view
	 * @since 01-feb-2011
	 * @author cfigueroa
	 */
	@RequestMapping("/supervisorEscolar/eliminarSupervisorEscolar.do")
	public ModelAndView eliminarSupervisorEscolar(@RequestParam("idSupervisor") Long idSupervisor){
				Map<String, Object> result = new HashMap<String, Object>();
				
				SupervisorEscolar supervisorEscolar = supervisorEscolarSrv.obtenerPorId(idSupervisor);
				supervisorEscolarSrv.eliminar(supervisorEscolar);
				result.put("mensaje", "Se elimino el siguiente Supervisor Escolar " + supervisorEscolar.getNombre());
				result.put("supervisorEscolars", supervisorEscolarSrv.obtenerTodos());
				
				return forward("/supervisorEscolar/listaSupervisorEscolar", result);
				}

	
}
