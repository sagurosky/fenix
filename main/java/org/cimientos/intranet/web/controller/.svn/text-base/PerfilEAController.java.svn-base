package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.usuario.Usuario;
import org.cimientos.intranet.servicio.PerfilEASrv;
import org.cimientos.intranet.servicio.PersonaSrv;
import org.cimientos.intranet.servicio.UsuarioSrv;
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
 * PerfilEAController
 * 		Esta clase mapea las vistas de los PerfilesTS. 
 * @author Nicolas Lopez
 *
 */
@Controller
@RequestMapping("/perfilEA/*")
public class PerfilEAController	extends BaseController{

	private Map<String,Object> map;
	
	@Autowired
	private PerfilEASrv srvPerfilEA;
	@Autowired
	private ZonaCimientosSrv zonaCimientosSrv;
	@Autowired
	private PersonaSrv srvPersona;
	@Autowired
	private UsuarioSrv usuarioSrv;
	
	/**
	 * Mapea esta acciï¿½n con altaPerfilEA.jsp,
	 * pasï¿½ndole como parï¿½metro un PerfilEA nuevo.
	 * @return el modelo con el objeto PerfilEA.
	 */	
	@RequestMapping("/perfilEA/altaPerfilEA.do")
	public ModelAndView agregarPerfilEA(){  		
		map = new HashMap<String,Object>();

		map.put("zona", zonaCimientosSrv.obtenerTodos());
		map.put("estadosCiviles", EstadoCivil.getListaEstadosCiviles());
		map.put("perfilEA", new PerfilEA());
		map.put("redirigir", "alta");
		
		return forward("/perfilEA/altaPerfilEA", map);
	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping("/perfilEA/listaPerfilEA.do")
	public ModelAndView listaPerfilEA(){
		map = new HashMap<String,Object>();

		map.put("eas", srvPerfilEA.obtenerTodos(true));
		return forward("/perfilEA/listaPerfilEAs", map);
	}
	
	/**
	 * @param idPerfilEA
	 * @return
	 */
	@RequestMapping("/perfilEA/recordatoriosEa.do")
	public ModelAndView listaRecordatoriosPerfilEA(@RequestParam("idPerfilEA") Long idPerfilEA)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		PerfilEA ea = srvPerfilEA.obtenerPerfilEA(idPerfilEA);
		
		resul.put("ea", ea);
		return forward("/perfilEA/recordatoriosEa", resul);
	}
	
	/**
	 * 
	 * @param idPerfilEA Id del PerfilEA a modificar.
	 * @return
	 */
	@RequestMapping("/perfilEA/modificarEAView.do")
	public ModelAndView modificarPerfilEA(@RequestParam("idEA") Long idPerfilEA){  
		map = new HashMap<String,Object>();
		PerfilEA perfilEA = srvPerfilEA.obtenerPerfilEA(idPerfilEA); 
	
		map.put("perfilEA", perfilEA);
		
		return new ModelAndView("/perfilEA/modificarPerfilEA", map);
	}

	@RequestMapping("/perfilEA/modificarEA.do")
	public ModelAndView modificarEA(@RequestParam("idEA") Long idPerfilEA){  
		map = new HashMap<String,Object>();
		
		PerfilEA perfilEA = srvPerfilEA.obtenerPerfilEA(idPerfilEA); 
		map.put("zona", zonaCimientosSrv.obtenerTodos());
		map.put("estadosCiviles", EstadoCivil.getListaEstadosCiviles());
		map.put("redirigir", "modificar");
		map.put("perfilEA", perfilEA);
		
		return forward ("/perfilEA/altaPerfilEA", map);
	}
	/**
	 * 
	 * @param perfilEA del perfil a guardar.
	 * @return
	 */
	@RequestMapping("/perfilEA/guardarPerfilEA.do")
	public ModelAndView guardarPerfilEA(
			@RequestParam("zonasCimientos") List<Long> zonasCimientos,
			@ModelAttribute("perfilEA") PerfilEA perfilEA){
		map = new HashMap<String, Object>();
		
		Persona persona= srvPersona.buscarPorCuil(perfilEA.getDatosPersonales().getCuilCuit());
		
		if(srvPerfilEA.existeEAPorPersona(persona)){
			map.put("error", "Ya existe un perfil creado para esa persona");
			map.put("zona", zonaCimientosSrv.obtenerTodos());
			return forward("/perfilEA/altaPerfilEA", map);
		}
		
		List<Long> zonas = new ArrayList<Long>();
		for (Long aux : zonasCimientos) {
			if(aux.longValue() != 0L){
				zonas.add(aux);
			}
		}//Guardo en zonas los ids de zonas válidas
		perfilEA.setZona(zonaCimientosSrv.obtenerPorIds(zonas));
		perfilEA.getDatosPersonales().setPerfilEA(perfilEA);
		srvPerfilEA.agregarPerfilEA(perfilEA);		
		return listaPerfilEA();
	}	
	
	/**
	 * @author hhrodriguez
	 * @param zonasCimientos Lista de ids de las zonas
	 * @param estado id de estado civil
	 * @param fechaNac String a parsear con la fecha de nacimiento
	 * @param perfilEA objeto PerfilEA de donde sacar los datos
	 * @return la vista de lista de EAs
	 */
	@RequestMapping("/perfilEA/guardarCambiosPerfilEA.do")
	public ModelAndView guardarCambios(
			@RequestParam("zonasCimientos") List<Long> zonasCimientos,
			@RequestParam("estado") Integer estado,
			@RequestParam("fechaNac") String fechaNac,
			@ModelAttribute("perfilEA") PerfilEA perfilEA){
			map = new HashMap<String, Object>();		
			
			PerfilEA perfilBD = srvPerfilEA.obtenerPerfilEA(perfilEA.getIdPerfilEA());
			Persona personaBD = perfilBD.getDatosPersonales();
			Persona persona = perfilEA.getDatosPersonales();
			
			personaBD.setEstadoCivil(EstadoCivil.getEstadoCivil(estado));
			personaBD.setFechaNacimiento(Formateador.parsearFecha(fechaNac));
			personaBD.setNombre(persona.getNombre());
			personaBD.setApellido(persona.getApellido());
			personaBD.setDni(persona.getDni());
			personaBD.setCuilCuit(persona.getCuilCuit());
			personaBD.setDireccion(persona.getDireccion());
			personaBD.setCodigoPostal(persona.getCodigoPostal());
			personaBD.setTelefono(persona.getTelefono());
			personaBD.setCelular(persona.getCelular());
			personaBD.setSexo(persona.isSexo());
			personaBD.setMail(persona.getMail());
			
			List<Long> zonas = new ArrayList<Long>();
			for (Long aux : zonasCimientos) {
				if(aux.longValue() != 0L){
					zonas.add(aux);
				}
			}//Guardo en zonas los ids de zonas válidas
			
			perfilBD.setZona(zonaCimientosSrv.obtenerPorIds(zonas));
			srvPerfilEA.agregarPerfilEA(perfilBD);
				
			map.put("mensaje", "Se modificó el EA: " + perfilEA.getDatosPersonales().getNombre() + " " +  perfilEA.getDatosPersonales().getApellido());
			map.put("eas", srvPerfilEA.obtenerTodos(true));
			return forward("/perfilEA/listaPerfilEAs", map);
			}
	/**
	 * 
	 * @param idPerfilEA Id del PerfilEA a eliminar.
	 * @return
	 */
	@RequestMapping("/perfilEA/eliminarPerfilEA.do")
	public ModelAndView eliminarPerfilEA(@RequestParam("idEA") Long idPerfilEA){
			
			map = new HashMap<String, Object>();
		
			PerfilEA perfilEA = srvPerfilEA.obtenerPerfilEA(idPerfilEA);
			Usuario usuario = usuarioSrv.obtenerUsuarioPorDni(perfilEA.getDatosPersonales().getDni());
			
			if(!usuario.getPersona().getPerfilAdmin()  && !usuario.getPersona().getPerfilCoordPBE()  
				&& !usuario.getPersona().getPerfilCorrector() && !usuario.getPersona().getPerfilDI() && !usuario.getPersona().getPerfilSelector() 
				&& !usuario.getPersona().getPerfilSysAdmin()  && usuario.getPersona().getPerfilTS() == null && usuario.getPersona().getPerfilRR() == null 
				&& usuario.getPersona().getPerfilStaff() == null && usuario.getPersona().getPerfilVoluntario() == null){
				perfilEA.setActivo(false);
				usuario.getPersona().getPerfilEA().setActivo(false);
				usuario.setActivo(false);
				usuarioSrv.guardarUsuario(usuario);
			}else{
				perfilEA.setActivo(false);
			}
			 
			srvPerfilEA.agregarPerfilEA(perfilEA);
			
			map.put("eas", srvPerfilEA.obtenerTodos(true));
			return forward("/perfilEA/listaPerfilEAs", map);
			}
	
	
	@RequestMapping("/perfilEA/mostrarPerfilEA.do")
	public ModelAndView mostrarPerfilEA(@RequestParam("idPerfilEA") long idPerfilEA) {
		map = new HashMap<String, Object>();
		PerfilEA perfilEA = srvPerfilEA.obtenerPerfilEA(idPerfilEA);
		map.put("perfilEA", perfilEA);
		
		return forward("/perfilEA/mostrarPerfilEA", map);
	}
	

	/**
	 * @param id
	 * @return la vista con el detalle de Perfil EA
	 */
	@RequestMapping("/perfilEA/verDetalleEAView.do")
	public ModelAndView verDetalleEAView(@RequestParam("idObjeto") Long id) 
	{
		PerfilEA perfilEA = srvPerfilEA.obtenerPerfilEA(id);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("persona", perfilEA.getDatosPersonales());
		model.put("ea", perfilEA);
		return new ModelAndView("detallePerfil/detalleEA", model);
	}
	

}
