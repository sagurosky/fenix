package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * AlumnoController	
 * @author Julian Rios, Leonardo Capparelli
 *
 */

@Controller
@RequestMapping("/alumno/*")
public class AlumnoController extends BaseController{

	@Autowired
	private AlumnoSrv srvAlumno;
	
	@Autowired
	private CicloProgramaSrv srvCiclo;

	/**
	 * @return lista de becados inactivos del EA logueado
	 */
	@RequestMapping("/alumno/listaBecadosInactivosEa.do")
	public ModelAndView listaBecadosInactivosEa(HttpServletRequest request,
			@RequestParam(required=false, value="mensaje") String mensaje,
			@RequestParam(required=false, value="error") String error){
		Map<String, Object> resul = new HashMap<String, Object>();
		request.getSession().setAttribute("retorno", "ea");
		PerfilEA ea = this.getPerfilEA(request);
		if (ea != null){
			List<PerfilAlumno> cesados = srvAlumno.obtenerCesadosPorEa(ea);
			resul.put("ea", ea.getDatosPersonales());
			
			if(cesados == null){
				resul.put("cesados", cesados);	
			}
			else{
				List<PerfilAlumno> inactivo = filtrarRenovados(cesados);
				resul.put("cesados", inactivo);
			}			
		}
		else{
			List<PerfilAlumno> cesados = null;
			resul.put("cesados", cesados);
		}
		
		if(StringUtils.isNotBlank(mensaje))
			resul.put("mensaje", mensaje);
		if(StringUtils.isNotBlank(error))
			resul.put("error", error);
		
		return forward("/alumno/listaBecadosCesados", resul);
		
	}
	
	/**
	 * Cuando un alumno tiene estado NO RENOVADO, puede desprenderde de una entrevista de renovacion o de una final. Solo
	 * debe aparecer en el listado de inactivos cuando viene de una de renovacion. Eso se chequea contra la fecha de baja
	 * @param cesados
	 */
	private List<PerfilAlumno> filtrarRenovados(List<PerfilAlumno> cesados) {
		CicloPrograma ciclo = srvCiclo.obtenerCicloActual();
		List<PerfilAlumno> inactivos = new ArrayList<PerfilAlumno>();
		for (PerfilAlumno pa : cesados) {
			if(pa.getFechaBaja() != null){
				if(pa.getFechaBaja().after(ciclo.getPeriodos().get(0).getFechaInicio())){
					if(pa.getEstadoAlumno().equals(EstadoAlumno.NO_RENOVADO)){
						if(!pa.getFechaBaja().after(ciclo.getPeriodos().get(ciclo.getPeriodos().size() - 1).getFechaInicio()))
							inactivos.add(pa);
					}
					else{
						inactivos.add(pa);
					}
				}				
			}			
		}
		return inactivos;
	}

	/***
	 * 
	 * @param request
	 * @return lista de becados inactivos del RR logueado
	 */
	@RequestMapping("/alumno/listaBecadosInactivosRr.do")
	public ModelAndView listaBecadosInactivosRr(HttpServletRequest request,
			@RequestParam(required=false, value="mensaje") String mensaje,
			@RequestParam(required=false, value="error") String error){
		Map<String, Object> resul = new HashMap<String, Object>();
		request.getSession().setAttribute("retorno", "rr");
		PerfilRR rr = this.getPerfilRR(request);
		if (rr != null){
			List<PerfilAlumno> cesados = srvAlumno.obtenerCesadosPorRr(rr);
			resul.put("rr", rr.getDatosPersonales());
			
			if(cesados == null){
				resul.put("cesados", cesados);	
			}
			else{
				List<PerfilAlumno> inactivo = filtrarRenovados(cesados);
				resul.put("cesados", inactivo);			
			}
		}
		else{
			List<PerfilAlumno> cesados = null;
			resul.put("cesados", cesados);
		}
		
		if(StringUtils.isNotBlank(mensaje))
			resul.put("mensaje", mensaje);
		if(StringUtils.isNotBlank(error))
			resul.put("error", error);
		
		return forward("/alumno/listaBecadosCesados", resul);
		
	}
	
	
	@RequestMapping("/alumno/altaAlumno.do")
	public ModelAndView agregarAlumno() {		
		ModelAndView mv = new ModelAndView("/alumno/altaAlumno");
		PerfilAlumno alumno = new PerfilAlumno();
		mv.addObject("alumno", alumno);
		return mv;
	}
	
	/**
	 * 
	 * @param alumno
	 * @return 
	 */
	@RequestMapping("/alumno/guardarAlumno.do")
	public ModelAndView guardarAlumno(@ModelAttribute("alumno") PerfilAlumno alumno) {
		
		ModelAndView mv = new ModelAndView();
		mv = new ModelAndView("/alumno/listaAlumnos");
		srvAlumno.agregarAlumno(cargarAlumno(alumno));
		mv.addObject("alumnos", srvAlumno.obtenerTodos());
		return mv;
	}
	

	@RequestMapping("/alumno/listaAlumnos.do")
	public ModelAndView listaAlumnos() {
		Map<String, Object> resul = new HashMap<String, Object>();
		
		resul.put("alumnos", srvAlumno.obtenerTodos());
		
		return forward("/alumno/listaAlumnos", resul);
				
	}
	

	private PerfilAlumno cargarAlumno(PerfilAlumno alumno) {
		PerfilAlumno alumn = null;
		if (alumno.getId() == null) {
			alumn = new PerfilAlumno();
		} else {
			alumn = srvAlumno.obtenerAlumno(alumno.getId());
		}

		alumn.setDatosPersonales(alumno.getDatosPersonales());
		alumn.setTelefono1(alumno.getTelefono1());
		alumn.setContactoTelefono1(alumno.getContactoTelefono1());
		alumn.setTelefono2(alumno.getTelefono2());
		alumn.setContactoTelefono2(alumno.getContactoTelefono2());
		alumn.setTelefono3(alumno.getTelefono3());
		alumn.setContactoTelefono3(alumno.getContactoTelefono3());
		alumn.setMaterialCompleto(alumno.getMaterialCompleto());
		alumn.setFechaAlta(alumno.getFechaAlta());
		alumn.setFechaBaja(alumno.getFechaBaja());

		return alumn;
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param idalumno
	 * @return
	 */
	@RequestMapping("/alumno/modificarAlumno.do")
	public ModelAndView modificarAlumno(@RequestParam("idalumno") long idalumno) {
		
		ModelAndView mv = new ModelAndView("/alumno/altaAlumno");
		
		PerfilAlumno alumno = srvAlumno.obtenerAlumno(idalumno);
		mv.addObject("alumno", alumno);
		return mv;
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param idalumno
	 * @return
	 */
	@RequestMapping("/alumno/mostrarAlumno.do")
	public ModelAndView mostrarAlumno(@RequestParam("idalumno") long idalumno) {
		
		ModelAndView mv = new ModelAndView("/alumno/mostrarAlumno");
		
		PerfilAlumno alumno = srvAlumno.obtenerAlumno(idalumno);
		mv.addObject("alumno", alumno);
		return mv;
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param idalumno
	 * @return
	 */
	@RequestMapping("/alumno/eliminarAlumno.do")
	public ModelAndView eliminarAlumno(@RequestParam("idalumno") long idalumno) {
		ModelAndView mv = new ModelAndView();
		try {
			PerfilAlumno alumno = srvAlumno.obtenerAlumno(idalumno);
			srvAlumno.eliminarAlumno(alumno);
			mv = new ModelAndView("/alumno/listaAlumnos");
			mv.addObject("alumnos", srvAlumno.obtenerTodos());
		} catch (Exception e) {
			e.printStackTrace();
			mv = new ModelAndView("/alumno/listaAlumnos");
		}
		return mv;
	}
	
	/**
	 * @param id
	 * @return la vista con el detalle de Alumno
	 */
	@RequestMapping("/alumno/verDetalleAlumnoView.do")
	public ModelAndView verDetalleAlumnoView(@RequestParam("idObjeto") Long id){
		PerfilAlumno alumno = srvAlumno.obtenerAlumno(id);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("persona", alumno.getDatosPersonales());
		model.put("alumno", alumno);
		return new ModelAndView("detallePerfil/detalleAlumno", model);
	}

}
