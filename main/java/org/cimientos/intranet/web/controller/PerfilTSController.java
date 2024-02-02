package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.usuario.Usuario;
import org.cimientos.intranet.servicio.PerfilTSSrv;
import org.cimientos.intranet.servicio.PersonaSrv;
import org.cimientos.intranet.servicio.UsuarioSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.EstadoCivil;



/**
 * PerfilTSController
 * 		Esta clase mapea las vistas de los PerfilesTS. 
 * @author Nicolas Lopez
 *
 */
@Controller
@RequestMapping("/perfilTS/*")
public class PerfilTSController extends BaseController	{

	@Autowired
	private PerfilTSSrv srvPerfilTS;
	
	@Autowired
	private ZonaCimientosSrv zonaCimientosSrv;
	
	private Map<String,Object> map;
	
	@Autowired
	private PersonaSrv srvPersona;
	@Autowired
	private UsuarioSrv usuarioSrv;
	

	
	@RequestMapping("/perfilTS/listaPerfilTS.do")
	public ModelAndView listaPerfilTS(){
		map = new HashMap<String,Object>();
		map.put("listaPerfilTS", srvPerfilTS.obtenerTodos());		
		return forward("/perfilTS/listaPerfilTS", map);
	}
	
	

	/**
	 * Mapea esta accion con altaPerfilTS.jsp,
	 * pasandole como parametro un PerfilTS nuevo.
	 * @return el modelo con el objeto PerfilTS.
	 */	
	@RequestMapping("/perfilTS/modificarPerfilTS.do")
	public ModelAndView modificarPerfilTSView(	@RequestParam("idTS") Long idPerfilTS){		
		map = new HashMap<String,Object>();
		PerfilTS perfilTS = srvPerfilTS.obtenerPerfilTS(idPerfilTS);		
				
		map.put("zona", zonaCimientosSrv.obtenerTodos());
		map.put("estadosCiviles", EstadoCivil.getListaEstadosCiviles());
		map.put("perfilTS", perfilTS);
		map.put("redirigir", "modificar");
		return forward("/perfilTS/altaPerfilTS", map);
	}	
	
	@RequestMapping("/perfilTS/guardarCambiosPerfilTS.do")
	public ModelAndView guardarCambios(
			@RequestParam( required=false,value="zonasCimientos")List<Long> zonasCimientos,
			@RequestParam("estado") int estado,
			@ModelAttribute("perfilTS") PerfilTS perfilTS
			){
		map = new HashMap<String, Object>();		
		perfilTS.setActivo(true);
		perfilTS.getDatosPersonales().setEstadoCivil(EstadoCivil.getEstadoCivil(estado));
		if(zonasCimientos != null){
			List<Long> zonas = new ArrayList<Long>();
			for (Long aux : zonasCimientos) {
				if(aux.longValue() != 0L){
					zonas.add(aux);
				}
			}//Guardo en zonas los ids de zonas válidas
			perfilTS.setZonas(zonaCimientosSrv.obtenerPorIds(zonas));
		}else{
			perfilTS.setZonas(null);
		}
		srvPerfilTS.agregarPerfilTS(perfilTS);	//Guarda en la base de datos.	
		map.put("listaPerfilTS", srvPerfilTS.obtenerTodos());		
		map.put("mensaje", "Se modifico los datos Personales del siguiente Perfil : "+perfilTS.getDatosPersonales().getApellido()+","+perfilTS.getDatosPersonales().getNombre());
		return forward("/perfilTS/listaPerfilTS", map);	
		
	}
	
	@RequestMapping("/perfilTS/guardarPerfilTS.do")
	public ModelAndView guardarPerfilTS(
			@RequestParam("zonasCimientos") List<Long> zonasCimientos,
			@RequestParam("estado") int estado,
			@ModelAttribute("perfilTS") PerfilTS perfilTS
			){
		map = new HashMap<String, Object>();		
		
		Persona persona = srvPersona.buscarPorCuil(perfilTS.getDatosPersonales().getCuilCuit());
		
		if(srvPerfilTS.existeTSPorPersona(persona)){
			map.put("error", "Ya existe un perfil creado para esa persona");
			map.put("zona", zonaCimientosSrv.obtenerTodos());
			return forward("/perfilTS/altaPerfilTS", map);
		}else{
			perfilTS.getDatosPersonales().setEstadoCivil(EstadoCivil.getEstadoCivil(estado));
		}
		List<Long> zonas = new ArrayList<Long>();
		for (Long aux : zonasCimientos) {
			if(aux.longValue() != 0L){
				zonas.add(aux);
			}
		}//Guardo en zonas los ids de zonas válidas
		perfilTS.setZonas(zonaCimientosSrv.obtenerPorIds(zonas));
		perfilTS.setActivo(true);
		srvPerfilTS.agregarPerfilTS(perfilTS);	//Guarda en la base de datos.	
		
		return this.listaPerfilTS();		
	}
	
	/**
	 * 
	 * @param idPerfilTS Id del PerfilTS a eliminar.
	 * @return
	 */
	@RequestMapping("/perfilTS/eliminarPerfilTS.do")
	public ModelAndView eliminarPerfilTS(@RequestParam("idTS") Long idPerfilTS){
		map = new HashMap<String, Object>();

		PerfilTS perfilTS = srvPerfilTS.obtenerPerfilTS(idPerfilTS);
		Usuario usuario = usuarioSrv.obtenerUsuarioPorDni(perfilTS.getDatosPersonales().getDni());
		if(!usuario.getPersona().getPerfilAdmin()  && !usuario.getPersona().getPerfilCoordPBE()  
			&& !usuario.getPersona().getPerfilCorrector() && !usuario.getPersona().getPerfilDI() && !usuario.getPersona().getPerfilSelector() 
			&& !usuario.getPersona().getPerfilSysAdmin()  && usuario.getPersona().getPerfilEA() == null && usuario.getPersona().getPerfilRR() == null 
			&& usuario.getPersona().getPerfilStaff() == null && usuario.getPersona().getPerfilVoluntario() == null){
			perfilTS.setActivo(false);
			usuario.getPersona().getPerfilTS().setActivo(false);
			usuario.setActivo(false);
			usuarioSrv.guardarUsuario(usuario);
		}else{
			perfilTS.setActivo(false);
		}
		srvPerfilTS.agregarPerfilTS(perfilTS);
		map.put("listaPerfilTS", srvPerfilTS.obtenerTodos());
		map.put("mensaje", "Se elimino el siguiente perfil : "+perfilTS.getDatosPersonales().getApellido()+","+perfilTS.getDatosPersonales().getNombre());
		return forward("/perfilTS/listaPerfilTS", map);
	}
	
	/**
	 * @param id
	 * @return la vista con el detalle de Perfil TS
	 */
	@RequestMapping("/perfilTS/verDetalleTSView.do")
	public ModelAndView verDetalleTSView(@RequestParam("idObjeto") Long id) 
	{
		PerfilTS perfilTS = srvPerfilTS.obtenerPerfilTS(id);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("persona", perfilTS.getDatosPersonales());
		model.put("listaPerfilTS", perfilTS);
		return new ModelAndView("detallePerfil/detalleTS", model);
	}
	
	/**
	 * Ver zonas perfil ts.
	 *
	 * @param idTS the id ts
	 * @return the model and view
	 * @since 14-abr-2011
	 * @author cfigueroa
	 */
	@RequestMapping("/perfilTS/verZonasPerfilTS.do")
	public ModelAndView verZonasPerfilTS(@RequestParam("idTS") Long idTS){
		PerfilTS perfilTS = this.srvPerfilTS.obtenerPerfilTS(idTS);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("zona",perfilTS.getZonas());
		return new ModelAndView("/perfilRR/zonasPerfilRR",model);
	}
}
