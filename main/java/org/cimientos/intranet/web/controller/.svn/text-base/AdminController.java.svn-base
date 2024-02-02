package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * AdminController	
 * @author Juan Irungaray
 *
 */
@Controller
@RequestMapping("/admin/*")
public class AdminController extends BaseController{

	@RequestMapping("/admin/altaPersona.do")
	public ModelAndView altaPersonaView(){
		Map<String, Object> model = new HashMap<String, Object>();
		return forward("/persona/fichaPersona", model);
	}
}
