package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.cimientos.intranet.servicio.ReporteEntrevistasPendientesSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



/**
 * @author nlopez
 *
 */

@Controller
@RequestMapping("/reporteEntrevistasPendientes/*")
public class ReporteEntrevistasPendientesController extends BaseController{

	@Autowired
	private ReporteEntrevistasPendientesSrv srvReporteEntrevistasPendientes;
	
	@RequestMapping("/reporteEntrevistasPendientes/listaReporteEntrevistasPendientes.do")
	public ModelAndView listaReporteEntrevistasPendientes(){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reporteEntrevistasPendientes", srvReporteEntrevistasPendientes.obtenerTodos());

		return forward("/reporteEntrevistasPendientes/listaReporteEntrevistasPendientes", map);
		
	}
	
}
