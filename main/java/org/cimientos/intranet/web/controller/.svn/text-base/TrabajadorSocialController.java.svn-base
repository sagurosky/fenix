package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cimientos.intranet.utils.ConstantesMenu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Esta clase es para mapear el menu de Trabajador Social
 */
@Controller
@RequestMapping("/homeTrabajadoSocial/*")
public class TrabajadorSocialController {
	
	/**
	 * Menu trabajador social.
	 *
	 * @param req the req
	 * @return the model and view
	 * @since 06-abr-2011
	 * @author cfigueroa
	 */
	@RequestMapping("/homeTrabajadoSocial/reporteEntrevistaTS.do")
	public ModelAndView menuTrabajadorSocial(HttpServletRequest req){
		
		Map<String, Object> model = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		session.setAttribute("menu", ConstantesMenu.menuTS);
		return new ModelAndView("includes/Template", model);
	}
}
