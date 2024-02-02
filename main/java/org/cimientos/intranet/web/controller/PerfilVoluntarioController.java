package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.cimientos.intranet.execption.CimientosExceptionHandler;
import org.cimientos.intranet.modelo.perfilvoluntario.PerfilVoluntario;
import org.cimientos.intranet.servicio.PerfilVoluntarioSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


/**
 * The Class PerfilVoluntarioController.
 */
@Controller
@RequestMapping("/perfilVoluntario/*")
public class PerfilVoluntarioController extends BaseController {
	

	@Autowired
	private PerfilVoluntarioSrv perfilVoluntarioSrv;
	private Map<String,Object> map;
	
	
	/**
	 * Inits the perfil voluntario.
	 *
	 * @return the model and view
	 * @since 22-oct-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/perfilVoluntario/listaVoluntariosView.do")
	public ModelAndView listaPerfilVoluntarioView(){
		map = new HashMap<String, Object>();
		map.put("voluntarios", perfilVoluntarioSrv.obtenerVoluntarios());
		return forward("perfilVoluntario/listaPerfilVoluntarios", map);
	}
	/**
	 * Agregar voluntario.
	 *
	 * @param perfilVoluntario the voluntario
	 * @return the model and view
	 * @since 22-oct-2010
	 * @author cfigueroa
	 * @throws CimientosExceptionHandler 
	 */
	@RequestMapping("/perfilVoluntario/agregarVoluntario.do")
	public ModelAndView agregarVoluntario(
			@ModelAttribute("voluntario") PerfilVoluntario perfilVoluntario) throws CimientosExceptionHandler{
		map = new HashMap<String, Object>();
		perfilVoluntario.setActivo(true);
		perfilVoluntarioSrv.agregarVoluntario(perfilVoluntario);
		map.put("voluntarios", perfilVoluntarioSrv.obtenerVoluntarios());
		return forward("perfilVoluntario/listaPerfilVoluntarios", map);
		
	}
	@RequestMapping("/perfilVoluntario/altaPerfilVoluntarioView.do")
	public ModelAndView altaPerfilVoluntarioView(){
		map = new HashMap<String, Object>();
		map.put("voluntario", new PerfilVoluntario());
		return forward("perfilVoluntario/altaPerfilVoluntario", map);
	}
	/**
	 * Update voluntario.
	 *
	 * @param idVoluntario the id voluntario
	 * @return the model and view
	 * @since 22-oct-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/perfilVoluntario/updateVoluntario.do")
	public ModelAndView updateVoluntario(@RequestParam("idVoluntario")Long idVoluntario){
		map = new HashMap<String, Object>();
		map.put("voluntario", perfilVoluntarioSrv.obtenerVoluntario(idVoluntario));
		
		return forward("perfilVoluntario/altaPerfilVoluntario", map);
		
	}

	/**
	 * Delete voluntario.
	 *
	 * @param idVoluntario the id voluntario
	 * @return the model and view
	 * @since 22-oct-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/perfilVoluntario/deleteVoluntario.do")
	public ModelAndView deleteVoluntario(@RequestParam("idVoluntario")Long idVoluntario ){
		ModelAndView modelAndView = new ModelAndView("redirect:/perfilVoluntario/listaVoluntariosView.do");
		PerfilVoluntario perfilVoluntario = perfilVoluntarioSrv.obtenerVoluntario(idVoluntario);
		perfilVoluntarioSrv.deleteVoluntario(perfilVoluntario);
		modelAndView.addObject("mensaje", "se borro correctamente el voluntario " + perfilVoluntario.getDatosPersonales().getNombre());
		
		return modelAndView;
		
	}

}
