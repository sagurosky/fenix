package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cimientos.intranet.servicio.ReporteConvocatoriaServ;
import org.cimientos.intranet.utils.ConstantesMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author nlopez
 *
 */

@Controller
@RequestMapping("/reporteConvocatoria/*")
public class ReporteConvocatoriaController extends BaseController{

	@Autowired
	private ReporteConvocatoriaServ reporteConvocatoriaServ;
	
	@RequestMapping("/reporteConvocatoria/reporteConvocatoria.do")
	public ModelAndView reporteConvocatoriaView(HttpServletRequest req){
		HttpSession session = req.getSession();
		session.setAttribute("menu", ConstantesMenu.menuSeleccion);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("listaConvocatoria", reporteConvocatoriaServ.obtenerConvocatorias());
		return forward("/convocatoria/listaConvocatoria", map);
		
	}
	
}
