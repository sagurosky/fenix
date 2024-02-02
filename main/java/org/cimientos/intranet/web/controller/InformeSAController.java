package org.cimientos.intranet.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.InformeSA;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.InformeSASrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.RecomendacionesTS;

@Controller
@RequestMapping("/informeSA/*")
public class InformeSAController extends BaseController{
	

	@Autowired
	private InformeSASrv srvInformeSA;
	
	@Autowired
	private AlumnoSrv srvAlumno;
	
	@Autowired
	private ZonaCimientosSrv srvZona;
	

	@RequestMapping("/informeSA/listaCandidatos.do")
	public ModelAndView listaCandidatos() {
				
		Map<String, Object> resul = new HashMap<String, Object>();

		resul.put("alumnos", srvAlumno.obtenerTodos());
		
		return forward("/informeSA/listaCandidatos", resul);
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/informeSA/registrarInformeSAView.do")
	public ModelAndView agregarInformeSA(@RequestParam("id") Long id) {
		
		PerfilAlumno	alumno = srvAlumno.obtenerAlumno(id);
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("alumno", alumno);
		model.put("fechaAlta", new Date());
		model.put("estadosInforme", EstadoInforme.values() );
		model.put("zonas", srvZona.obtenerTodos());
		model.put("recomendacionesTS", RecomendacionesTS.getListaRecomendacionesTS());
		return forward("/informeSA/registrarInformeSAView", model);
		
	}
	/**
	 * 
	 * @param 
	 * @return 
	 * 
	 */
	@RequestMapping("/informeSA/registrarInfomeSA.do")
	public ModelAndView guardarInforeSA( 
			@RequestParam("fechaAlta") Date fechaAlta,
			@RequestParam("zona") Long zona,
			@RequestParam("observIngresoEgreso") String observIngresoEgreso,
			@RequestParam("observGenerales") String observGenerales,
			@RequestParam("recomendaciones") int recomendaciones,
			@RequestParam("observSobreRA") String observSobreRA,
			@RequestParam("observGenerales2") String observGenerales2,
			@RequestParam("recomendaciones2") int recomendaciones2,
			@RequestParam("observIngresoEgreso2") String observIngresoEgreso2,
			@RequestParam("observSobreRA2") String observSobreRA2,
			@RequestParam("observGenerales3") String observGenerales3, 
			@RequestParam("recomendaciones3") int recomendaciones3,
			@RequestParam("estadoInforme") int estadoInforme) {
		
		InformeSA informeSA = new InformeSA();
		informeSA.setFechaAlta(fechaAlta);
		informeSA.setZonaCimientos(srvZona.obtenerZonaCimientos(zona));
		informeSA.setObservIngresoEgreso(observIngresoEgreso);
		informeSA.setObservGenerales(observGenerales);
		informeSA.setRecomendaciones(RecomendacionesTS.getRecomendacionesTS(recomendaciones));
		informeSA.setObservSobreRA(observSobreRA);
		informeSA.setObserGenerales2(observGenerales2);
		informeSA.setRecomendaciones2(RecomendacionesTS.getRecomendacionesTS(recomendaciones2));
		informeSA.setObservIngresoEgreso2(observIngresoEgreso2);
		informeSA.setObservSobreRA2(observSobreRA2);
		informeSA.setObserGenerales3(observGenerales3);
		informeSA.setRecomendaciones3(RecomendacionesTS.getRecomendacionesTS(recomendaciones3));
		informeSA.setEstado(EstadoInforme.getEstados(estadoInforme));
				
		Map<String, Object> resul = new HashMap<String, Object>();

		srvInformeSA.agregarInformeSA(informeSA);		
		resul.put("mensaje", "Registro de informe S.A. satisfactorio");
		resul.put("alumnos", srvAlumno.obtenerTodos());
		return forward("/informeSA/listaCandidatos", resul);
	}
}
