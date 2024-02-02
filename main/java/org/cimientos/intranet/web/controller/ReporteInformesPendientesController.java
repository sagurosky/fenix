package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.servicio.InformeSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author plabaronnie
 * Clase que se utiliza para  hacer la redireccion (mapeo) a las vistas.
 * Extiende de BaseController para incluir el Template
 */
@Controller
@RequestMapping("/reporteInformesPendientes/*")
public class ReporteInformesPendientesController extends BaseController{
	
	@Autowired
	private InformeSrv informeSrv;
	
	
	/**
	 * Recupera la lista de los informes pendientes persistidos en la DB.
	 * 
	 * @return la vista la vista con la tabla de informes pendientes
	 */
	@RequestMapping("/reporteInformesPendientes/reporteInformesPendientesView.do")
	public ModelAndView verAsignacionBecas(){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("informes", informeSrv.obtenerInformesPendientes());
		
		resul.put("estados", EstadoInforme.values());
		return forward("reporteInformesPendientes/reporteInformesPendientes", resul);
	}
}