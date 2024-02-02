package org.cimientos.intranet.web.controller;


import java.util.HashMap;
import java.util.Map;

import org.cimientos.intranet.servicio.ReporteBecasAlumnosDisponiblesSvr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author nlopez
 *
 */

@Controller
@RequestMapping("/reporteBecasAlumnosDisponibles/*")
public class ReporteBecasAlumnosDisponiblesController extends BaseController{
	
	@Autowired
	private ReporteBecasAlumnosDisponiblesSvr srvReporteBecasAlumnosDisponibles;

	@RequestMapping("/reporteBecasAlumnosDisponibles/reporteBecasAlumnosDisponibles.do")
	public ModelAndView viewReporteBecasAlumnosDisponibles(){
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("reporteBecasAlumnosDisponibles", srvReporteBecasAlumnosDisponibles.obtenerBecas());
		return forward("/reporteBecasAlumnosDisponibles/reporteBecasAlumnosDisponibles", map);
	}		
}
