/**
 * 
 */
package org.cimientos.intranet.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.servicio.PerfilEASrv;
import org.cimientos.intranet.servicio.PerfilRRSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.cimientos.intranet.utils.ConstantesMenu;
import org.cimientos.intranet.utils.Formateador;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author plabaronnie
 * Clase que se utiliza para  hacer la redireccion (mapeo) a las vistas.
 * Extiende de BaseController para incluir el Template
 */
@Controller
@RequestMapping("/asignacionEaRr/*")
public class AsignacionEaRrController extends BaseController{
	
	@Autowired
	private PerfilRRSrv srvPerfilRR;
	
	@Autowired
	public PerfilEASrv srvPerfilEA;
	
	@Autowired
	public ZonaCimientosSrv srvZona;
	
	
	
	/**
	 * Recupera las listas de todos las PerfilRRs y PerfilesEA persistidos en la DB.
	 * 
	 * @return la vista la vista con las 2 tablas de perfilrrs y de perfileas
	 */
	@RequestMapping("/asignacionEaRr/asignacionEaRrView.do")
	 public ModelAndView verPeriodosBecas(HttpSession session, @RequestParam(required=false, value="menuSup") String menuSup){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("perfilrrs", srvPerfilRR.obtenerEasConZona());
		resul.put("perfileas", srvPerfilEA.obtenerEAsSinAsignacionRR());
		
		resul.put("zonas", srvZona.obtenerTodos());
		
		if(StringUtils.isNotBlank(menuSup) && menuSup.equals("programas"))        
            session.setAttribute("menu", ConstantesMenu.menuGestionPrograma);
		return forward("asignacionEaRr/asignacionEAaRR", resul);
	}
	
	/**
	 * Realiza la asignacion de perfiles ea seleccionados al perfil rr seleccionado.
	 * 
	 * @return la vista de la lista de PerfilRRs y PerfilEAs segun sus asignaciones.
	 */
	@RequestMapping("/asignacionEaRr/asignacionEaRr.do")
	public ModelAndView asignarPerfilRRs(@RequestParam(required=false,value="idPerfilRR") Long idPerfilRR,
			@RequestParam(required=false,value="perfilesSeleccionados") String perfilesSeleccionados){
		Map<String, Object> resul = new HashMap<String, Object>();
		
		if(idPerfilRR != null && StringUtils.isNotBlank(perfilesSeleccionados)){
			PerfilRR perfilrrSeleccionado = srvPerfilRR.obtenerPerfilRR(idPerfilRR);
			List<PerfilEA> perfilesEA = srvPerfilEA.obtenerEAsPorIds(Formateador.toListOfLongs( perfilesSeleccionados) );
			srvPerfilRR.asignarEARR(perfilrrSeleccionado, perfilesEA);
			resul.put("mensaje", "Se han asignado " + perfilesEA.size() + " encargados al responsable seleccionado.");
		}else {
			resul.put("error", "Debe seleccionar 1 RR y al menos 1 EA para realizar la asignación.");
		}
				
		resul.put("perfilrrs", srvPerfilRR.obtenerEasConZona());
		resul.put("perfileas", srvPerfilEA.obtenerEAsSinAsignacionRR());
		resul.put("zonas", srvZona.obtenerTodos());
		
		return forward("asignacionEaRr/asignacionEAaRR", resul);
	}
	
	
	@RequestMapping("/asignacionEaRr/buscarEAs.do")
	public void buscarEAs(HttpServletResponse response,
			@RequestParam(required=false, value="rrId") Long rrId
			) throws JSONException {

			JSONObject resp = new JSONObject();
			
			try {
	
				JSONArray eas = new JSONArray();
				List<PerfilEA> filtrados = null;
				if(rrId != null && !rrId.equals(0L)){	
					PerfilRR rrSeleccionado = srvPerfilRR.obtenerPerfilRR(rrId);	
					filtrados = srvPerfilEA.obtenerEAsSegunZonaRR(rrSeleccionado);
				}else{
					filtrados = srvPerfilEA.obtenerEAsSinAsignacionRR();
				}	
				for (PerfilEA ea : filtrados) {
					JSONArray eaObj = new JSONArray();
					eaObj.put(ea.getIdPerfilEA());
					String zonas = "";
					for (ZonaCimientos zona : ea.getZona()) {
						zonas = zonas + zona.getNombre() + ";"; 
					}
					eaObj.put(zonas);					
					eaObj.put(ea.getDatosPersonales().getApellido() + ", " + ea.getDatosPersonales().getNombre() );
					eas.put(eaObj);
				}
				
				resp.put("aaData", eas);
			} catch (JSONException e) {
				e.printStackTrace();
			}
			response.setContentType("application/json");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("ISO-8859-1");
			try {
				response.getWriter().write(resp.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}

		}


}
