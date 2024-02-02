package org.cimientos.intranet.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.PerfilEASrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.utils.ReasignacionHelper;
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
@RequestMapping("/reasignacionBecadosEa/*")
public class ReasignarBecadosEAController extends BaseController{
	
	
	@Autowired
	public PerfilEASrv srvPerfilEA;
	
	@Autowired
	public ZonaCimientosSrv srvZona;
	
	@Autowired
	public AlumnoSrv svrAlumno; 
	
	@Autowired
	public ReasignacionHelper reasignacionHelper;
	
	
	
	/**
	 * Recupera la lista de todos las PerfilEAs y alumnos persistidos en la DB.
	 * 
	 * @return la vista la vista con las 2 tablas de PerfilEAs y de alumnos
	 */
	@RequestMapping("/reasignacionBecadosEa/reasignacionBecadosEaView.do")
	public ModelAndView verAsignacionBecadosEas(){
		Map<String, Object> resul = new HashMap<String, Object>();
		
		resul.put("perfileas", srvPerfilEA.obtenerEasConRRAsignado());
		
		return forward("asignacionBecadosEa/reasignacionBecadosEa", resul);
	}
	
	/**
	 * Asigna los becados seleccionados al perfil ea seleccionado
	 * 
	 * @return la vista con las 2 tablas de PerfilEAs y de alumnos
	 */
	@RequestMapping("/reasignacionBecadosEa/reasignacionBecadosEa.do")
	public ModelAndView asignarBecadosEas(@RequestParam(required=false,value="idPerfilEA") Long idPerfilEA,
			@RequestParam(required=false,value="becadosSeleccionados") String becadosSeleccionados){
		Map<String, Object> resul = new HashMap<String, Object>();
		if(idPerfilEA != null && StringUtils.isNotBlank( becadosSeleccionados)){
			
			PerfilEA perfilEASeleccionado = srvPerfilEA.obtenerPerfilEA(idPerfilEA);
			List<Long> idsAlumnosSeleccionados = Formateador.toListOfLongs( becadosSeleccionados);
			List<PerfilAlumno> perfilesAlumnos = svrAlumno.obtenerAlumnosPorIds(idsAlumnosSeleccionados);
			
			//obtengo el perfilea anterior
			PerfilEA eaAnterior = perfilesAlumnos.get(0).getEa();
			
			srvPerfilEA.asignarBecadoEA(perfilEASeleccionado, perfilesAlumnos);
			
			//transfiero todas las entrevistas e informes del ea anterior al recientemente asignado 
			//lo hago despues de que se haya realizado la asignacion por si algo sale mal.
			reasignacionHelper.transferirEntrevistasInformesEA(eaAnterior, perfilEASeleccionado, idsAlumnosSeleccionados);
			
			resul.put("mensaje", "Se reasignaron " + perfilesAlumnos.size() + " becados al EA seleccionado.");
		}else {
			resul.put("error", "Debe seleccionar 1 EA y al menos 1 becado para realizar la asignación.");
		}
		resul.put("perfileas", srvPerfilEA.obtenerEasConRRAsignado());
		
		return forward("asignacionBecadosEa/reasignacionBecadosEa", resul);
	}
	

	@RequestMapping("/reasignacionBecadosEa/buscarBecados.do")
	public void buscarEAs(HttpServletResponse response,
			@RequestParam(required=false, value="eaId") Long eaId
			) throws JSONException {

			JSONObject resp = new JSONObject();
			
			try {
	
				JSONArray eas = new JSONArray();
				List<PerfilAlumno> filtrados = null;
				if(eaId != null && !eaId.equals(0L)){	
					PerfilEA eaSeleccionado = srvPerfilEA.obtenerPerfilEA(eaId);	
					filtrados = svrAlumno.obtenerAlumnosParaReasignarSegunZonaEA(eaSeleccionado);
				}else{
					filtrados = svrAlumno.obtenerAlumnosParaReasignarSegunZonaEA(null);
				}	
				for (PerfilAlumno alumno : filtrados) {
					JSONArray alumnoObj = new JSONArray();
					alumnoObj.put(alumno.getId());
					alumnoObj.put(alumno.getEscuela().getLocalidad().getZona().getNombre());
					alumnoObj.put(alumno.getDatosPersonales().getApellido() + ", " + alumno.getDatosPersonales().getNombre() );
					alumnoObj.put(alumno.getEscuela().getNombre());
					alumnoObj.put(alumno.getAnioEscolar().getValor());
					
					if(alumno.getEa() != null){
						alumnoObj.put(alumno.getEa().getDatosPersonales().getApellido() + ", " + alumno.getEa().getDatosPersonales().getNombre() );
					}else {
						alumnoObj.put("");
					}
					String fechaPBE = "";
					if(alumno.getFechaPBE() != null){
						fechaPBE = Formateador.formatearFecha(alumno.getFechaPBE(), "dd/MM/yyyy");
					}
					alumnoObj.put(fechaPBE);
					String padrino = (alumno.getBeca().getPadrino().getEmpresa() != null ? 
							alumno.getBeca().getPadrino().getEmpresa().getDenominacion() :
							alumno.getBeca().getPadrino().getDatosPersonales().getApellido() + ", " 
							+ alumno.getBeca().getPadrino().getDatosPersonales().getNombre()	);
					alumnoObj.put(padrino);
					eas.put(alumnoObj);
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
