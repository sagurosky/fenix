package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cimientos.intranet.servicio.PanelControlSrv;
import org.cimientos.intranet.utils.ConstantesMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("login_user")
@RequestMapping("/panelControl/*")
public class PanelControlSeleccionController extends BaseController {
	
	@Autowired
	private PanelControlSrv panelControlSrv;
	
	@RequestMapping("/panelControl/seleccionPanelControl")
	public ModelAndView seleccionPanelContrl(HttpServletRequest req){
		
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		map.put("listaBecas", panelControlSrv.listaPanelControlSeleccion());
		session.setAttribute("menu", ConstantesMenu.menuSeleccion);

		return forward("/panelControl/panelControlSeleccion", map);
		
	}	
}