package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaSupervisionEscolar;
import org.cimientos.intranet.servicio.EntrevistaSupervisionEscolarSrv;
import org.cimientos.intranet.servicio.SupervisorEscolarSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/entrevistaSupervisionEscolar/*")
public class EntrevistaSupervisionEscolarController extends BaseController{
	
	@Autowired
	private ZonaCimientosSrv srvZona;
	
	@Autowired
	private SupervisorEscolarSrv srvSupervisor;
	
	@Autowired
	private EntrevistaSupervisionEscolarSrv entrevistaSupervisionEscolarSrv;
	
	
			
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/entrevistaSupervisionEscolar/entrevistaSupEscolarView.do")
	public ModelAndView entrevistaSupEscolarView() {
		
			
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("zonas", srvZona.obtenerTodos());
		model.put("listSupervisor", srvSupervisor.obtenerTodos());
		model.put("entrevistaSupervisorEscolar", new EntrevistaSupervisionEscolar());
		
		return forward("/entrevistaSupervisionEscolar/altaEntrevistaSupEscolar", model);
		
	}

	
	@RequestMapping("/entrevistaSupervisionEscolar/guardarEntrevistaSupEscolar.do")
	public ModelAndView guardarEntrevistaSupEscolar(@ModelAttribute("entrevistaSupervisorEscolar")EntrevistaSupervisionEscolar entrevistaSupervisionEscolar
			
		){
		entrevistaSupervisionEscolarSrv.agregarEntrevistaSupervisionEscolar(entrevistaSupervisionEscolar);	
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("entrevistaSupervisionEscolar", entrevistaSupervisionEscolarSrv.obtenerTodos());
		return forward("/entrevistaSupervisionEscolar/listaEntrevistasSupervisorEscolar", result);
	}
	

	@RequestMapping("/entrevistaSupervisionEscolar/modificarView.do")
	public ModelAndView modificar(@RequestParam("idEnt") Long id) 
	{
		EntrevistaSupervisionEscolar entrevistaObj = entrevistaSupervisionEscolarSrv.obtenerEntrevistaSE(id);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("entrevistaSupervisorEscolar",entrevistaObj);
		result.put("zonas", srvZona.obtenerTodos());
		result.put("listSupervisor", srvSupervisor.obtenerTodos());
		return forward("/entrevistaSupervisionEscolar/altaEntrevistaSupEscolar", result);
	}
	
	
	
	
	@RequestMapping("/entrevistaSupervisionEscolar/listaEntrevistaSupervisorEscolar.do")
	public ModelAndView listaEntrevistaSupervisorEscolar(){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("entrevistaSupervisionEscolar", entrevistaSupervisionEscolarSrv.obtenerTodos());
		return forward("/entrevistaSupervisionEscolar/listaEntrevistasSupervisorEscolar", result);
	}	
}