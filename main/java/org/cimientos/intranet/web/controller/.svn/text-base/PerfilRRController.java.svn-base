package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.modelo.usuario.Recordatorio;
import org.cimientos.intranet.servicio.PerfilRRSrv;
import org.cimientos.intranet.servicio.PersonaSrv;
import org.cimientos.intranet.servicio.RecordatorioSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.EstadoCivil;

/**
 * PerfilRRController
 * 		Esta clase mapea las vistas de los PerfilesRR. 
 * @author Nicolas Lopez
 *
 */
@Controller
@RequestMapping("/perfilRR/*")
public class PerfilRRController	extends BaseController{

	@Autowired
	private PerfilRRSrv srvPerfilRR;
	
	@Autowired
	private ZonaCimientosSrv zonaCimientosSrv;
	
	@Autowired
	private RecordatorioSrv srvRecordatorio;
	
	private Map<String,Object> map;
	
	@Autowired
	private PersonaSrv srvPersona;
	
		

	
	
	@RequestMapping("/perfilRR/listaPerfilRR.do")
	public ModelAndView listaPerfilRR(){
		map = new HashMap<String,Object>();
		map.put("perfilRR", srvPerfilRR.obtenerTodos());
		return forward("/perfilRR/listaPerfilRRs", map);
	}

	
	/**
	 * Mapea esta accion con altaPerfilRR.jsp,
	 * pasandole como parametro un PerfilEA nuevo.
	 * @return el modelo con el objeto PerfilRR.
	 */	
	@RequestMapping("/perfilRR/altaPerfilRR.do")
	public ModelAndView agregarPerfilRR(){  		
		map = new HashMap<String,Object>();
		
		map.put("zonas", zonaCimientosSrv.obtenerTodos());
		map.put("estadosCiviles", EstadoCivil.getListaEstadosCiviles());
		map.put("perfilRR", new PerfilRR());
		map.put("redirigir", "alta");
		
		return forward("/perfilRR/altaPerfilRR", map);
	}
	
	/**
	 * 
	 * @param perfilRR del perfil a guardar.
	 * @return
	 */
	@RequestMapping("/perfilRR/guardarPerfilRR.do")
	public ModelAndView guardarPerfilRR(
			@RequestParam("zonas") List<Long> zonasCimientos,
			@ModelAttribute("perfilRR") PerfilRR perfilRR){
		
		map = new HashMap<String, Object>();
		
		Persona persona= srvPersona.buscarPorCuil(perfilRR.getDatosPersonales().getCuilCuit());
		
		if(srvPerfilRR.existeRRPorPersona(persona)){
			map.put("error", "Ya existe un perfil creado para esa persona");
			map.put("zonas", zonaCimientosSrv.obtenerTodos());
			return forward("/perfilRR/altaPerfilRR", map);
		}
		for (Long aux : zonasCimientos) {
			if(aux.longValue() == 0L){
				zonasCimientos.remove(aux);
			}
		}
		List<ZonaCimientos> zonas = zonaCimientosSrv.obtenerPorIds(zonasCimientos);
		perfilRR.setZona(zonas);
		perfilRR.getDatosPersonales().setPerfilRR(perfilRR);
		srvPerfilRR.agregarPerfilRR(perfilRR);		
		
		return listaPerfilRR();
	}	
	
	@RequestMapping("/perfilRR/detalleRr.do")
	public ModelAndView detalleRr(@RequestParam("idRr") Long idRr,
								  @RequestParam("idRecordatorio") Long idRecordatorio)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		Recordatorio recordatorio = srvRecordatorio.obtenerRecordatorio(idRecordatorio);
		List<Recordatorio> lista = new ArrayList<Recordatorio>();
		lista.add(recordatorio);
		PerfilRR rr = srvPerfilRR.obtenerPerfilRR(idRr);
		rr.setRecordatorios(lista);
		srvPerfilRR.agregarPerfilRR(rr);
		List<Pago> pagos = recordatorio.getPagos();
		resul.put("rr", rr);
		resul.put("pagos", pagos);
		return forward("/perfilRR/detalleRr", resul);
	}
	
	@RequestMapping("/perfilRR/guardarCambiosPerfilRR.do")
	public ModelAndView guardarCambios(
			@RequestParam("zonas") List<Long> zonasCimientos,
			@RequestParam("fechaNac") String fechaNac,
			@ModelAttribute("perfilRR") PerfilRR perfilRR){
			map = new HashMap<String, Object>();		
			
			perfilRR.getDatosPersonales().setFechaNacimiento(Formateador.parsearFecha(fechaNac));
			
			List<Long> zonas = new ArrayList<Long>();
			for (Long aux : zonasCimientos) {
				if(aux.longValue() != 0L){
					zonas.add(aux);
				}
			}//Guardo en zonas los ids de zonas válidas
			perfilRR.setZona(zonaCimientosSrv.obtenerPorIds(zonas));
			srvPerfilRR.agregarPerfilRR(perfilRR);
			
			map.put("mensaje", "Se modificó el RR: " + perfilRR.getDatosPersonales().getNombre() + " " +  perfilRR.getDatosPersonales().getApellido());
			map.put("perfilRR", srvPerfilRR.obtenerTodos());
			return forward("/perfilRR/listaPerfilRRs", map);
			}
	/**
	 * 
	 * @param idPerfilRR Id del PerfilRR a modificar.
	 * @return
	 */
	
	@RequestMapping("/perfilRR/modificarPerfilRR.do")
	public ModelAndView modificarPerfilRR(
			@RequestParam("idPerfilRR") Long idPerfilRR){  
		
		map = new HashMap<String,Object>();
		
		map.put("zonas", zonaCimientosSrv.obtenerTodos());
		map.put("estadosCiviles", EstadoCivil.getListaEstadosCiviles());
		map.put("perfilRR", srvPerfilRR.obtenerPerfilRR(idPerfilRR));
		map.put("redirigir", "modificar");
		
		return forward("/perfilRR/altaPerfilRR", map);
		
	}

	/**
	 * 
	 * @param idPerfilRR Id del PerfilRR a eliminar.
	 * @return
	 */
	@RequestMapping("/perfilRR/eliminarPerfilRR.do")
	public ModelAndView eliminarPerfilRR(@RequestParam("idPerfilRR") Long idPerfilRR){
		map = new HashMap<String, Object>();
		try {
			PerfilRR perfilRR = srvPerfilRR.obtenerPerfilRR(idPerfilRR); 
			srvPerfilRR.eliminarPerfilRR(perfilRR);
			
			map.put("perfilRR", srvPerfilRR.obtenerTodos());
		} catch (Exception e) {
			e.printStackTrace();
			return forward("fail");
		}
		map.put("perfilRR", srvPerfilRR.obtenerTodos());
		return forward("/perfilRR/listaPerfilRRs", map);
		}
	
	
	@RequestMapping("/perfilRR/mostrarPerfilRR.do")
	public ModelAndView mostrarPerfilRR(@RequestParam("idPerfilRR") long idPerfilRR) {
		ModelAndView mv = new ModelAndView("/perfilRR/mostrarPerfilRR");
		PerfilRR perfilRR = srvPerfilRR.obtenerPerfilRR(idPerfilRR);
		mv.addObject("perfilRR", perfilRR);
		return mv;
	}
	
	/**
	 * @param id
	 * @return la vista con el detalle de Perfil RR
	 */
	@RequestMapping("/perfilRR/verDetalleRRView.do")
	public ModelAndView verDetalleRRView(@RequestParam("idObjeto") Long id) 
	{
		PerfilRR perfilRR = srvPerfilRR.obtenerPerfilRR(id);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("persona", perfilRR.getDatosPersonales());
		model.put("rr", perfilRR);
		return new ModelAndView("detallePerfil/detalleRR", model);
	}
	
	
	/**
	 * @author hhrodriguez
	 * @param idRR
	 * @return La vista para el popup con las zonas del PerfilRR de id = idRR
	 */
	@RequestMapping("/perfilRR/verZonasPerfilRR.do")
	public ModelAndView verZonasPerfilRR(@RequestParam("idRR") Long idRR){
		Map<String, Object> model = new HashMap<String, Object>();
		PerfilRR perfilRR = srvPerfilRR.obtenerPerfilRR(idRR);
		model.put("zona", perfilRR.getZona());
		return new ModelAndView("/perfilRR/zonasPerfilRR", model);
	}
	
	
}

