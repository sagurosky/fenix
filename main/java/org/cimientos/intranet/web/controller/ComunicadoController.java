package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cimientos.intranet.modelo.informe.ComunicadoNoRenovacion;
import org.cimientos.intranet.modelo.informe.ComunicadoPendiente;
import org.cimientos.intranet.servicio.ComunicadoNoRenovacionSrv;
import org.cimientos.intranet.servicio.ComunicadoPendienteSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/comunicado/*")
public class ComunicadoController extends BaseController{

	@Autowired
	private ComunicadoPendienteSrv srvPendiente;
	
	@Autowired 
	private ComunicadoNoRenovacionSrv srvNoRenovacion;
	
	
	@RequestMapping("/comunicado/listaPendientes.do")
	public ModelAndView verListaPendientesView(){
		Map<String, Object> resul = new HashMap<String, Object>();
		List<ComunicadoPendiente> pendientes = srvPendiente.obtenerTodos();
		resul.put("pendientes", pendientes);
		return forward("/comunicado/listaPendientes", resul);
	}
	
	@RequestMapping("/comunicado/listaNoRenovados.do")
	public ModelAndView verListaNoRenovadosView(){
		Map<String, Object> resul = new HashMap<String, Object>();
		List<ComunicadoNoRenovacion> norenovados = srvNoRenovacion.obtenerTodos();
		resul.put("norenovados", norenovados);
		return forward("/comunicado/listaNoRenovados", resul);
	}
	
	@RequestMapping("/comunicado/verPendienteView.do")
	public ModelAndView verPendienteView(@RequestParam ("idComunicado") Long idComunicado){
		Map<String, Object> resul = new HashMap<String, Object>();
		ComunicadoPendiente pendiente = srvPendiente.obtener(idComunicado);
		resul.put("pendiente", pendiente);
		resul.put("urlInforme", "../comunicado/verPendienteView.do?idComunicado=" + pendiente.getId());
		return forward("/comunicado/comunicadoPendiente", resul);
	}
	
	@RequestMapping("/comunicado/verNoRenovacionView.do")
	public ModelAndView verNoRenovacionView(@RequestParam ("idComunicado") Long idComunicado){
		Map<String, Object> resul = new HashMap<String, Object>();
		ComunicadoNoRenovacion noRenovacion = srvNoRenovacion.obtener(idComunicado);
		resul.put("comunicado", noRenovacion);
		resul.put("urlInforme", "../comunicado/verNoRenovacionView.do?idComunicado=" + noRenovacion.getId());
		return forward("/comunicado/comunicadoNoRenovacion", resul);
	}
}
