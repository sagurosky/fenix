package org.cimientos.intranet.web.controller;



import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.cimientos.intranet.modelo.perfilstaff.PerfilStaff;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.modelo.usuario.Usuario;
import org.cimientos.intranet.servicio.LocalidadSrv;
import org.cimientos.intranet.servicio.PerfilStaffSrv;
import org.cimientos.intranet.servicio.PersonaSrv;
import org.cimientos.intranet.servicio.ProvinciaSrv;
import org.cimientos.intranet.servicio.UsuarioSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.cimientos.intranet.utils.ConstantesMenu;
import org.cimientos.intranet.utils.Formateador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.EstadoCivil;
import com.cimientos.intranet.enumerativos.RolUsuario;








/**
 * @author msagarduy
 * Clase que se utiliza para  hacer la redireccion (mapeo) a las vistas.
 * Extiende de BaseController para incluir el Template
 * 
 */
@Controller
@RequestMapping("/usuario/*")
public class UsuarioController extends BaseController{
	
	@Autowired
	private UsuarioSrv srvUsuario;
	
	@Autowired
	private PersonaSrv srvPersona;
	
	@Autowired
	private LocalidadSrv srvLocalidad;
	
	@Autowired
	private ProvinciaSrv srvProvincia;
	
	@Autowired
	private ZonaCimientosSrv srvZona;

	@Autowired
	private PerfilStaffSrv perfilStaffSrv;
	
	
	/**
	 * Retorna el usuario logueado y lo redirige al home
	 * @return Vista
	 * @throws ParseException
	 */
	@RequestMapping("/usuario/home.do")
	public ModelAndView irAHome(HttpServletRequest req) throws ParseException 
	{
		Map<String , Object> model = new HashMap<String , Object>();
		HttpSession session = null;
		Usuario logeado = srvUsuario.obtenerPorUsuario(getCurrentLoggedUserName(),true);
		session = req.getSession();
		session.setAttribute("login_user", logeado); 
		session.setAttribute("menu", ConstantesMenu.menuAdministracionUsuarios);
		return forward("privado/home", model);
	
	}
	
	
	/**
	 * Recupera la lista de todos los usuarios (activos e inactivos) persistidos en la DB.
	 * @return la vista de la lista de usuarios persistidos
	 */
	@RequestMapping("/usuario/listaUsuarios.do")
	public ModelAndView listaUsuarios(HttpServletRequest req){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("usuarios", srvUsuario.obtenerTodos());
		HttpSession session = req.getSession();
		session.setAttribute("menu", ConstantesMenu.menuAdministracionUsuarios);
		return forward("/usuario/listaUsuarios", resul);
	}

	
	/**
	 * Recupera la lista de todos los usuarios (activos e inactivos) persistidos en la DB.
	 * @return la vista de la lista de usuarios persistidos
	 */
	@RequestMapping("/usuario/cambioContrasenia.do")
	public ModelAndView cambioContrasenia(HttpServletRequest req){
		Map<String, Object> resul = new HashMap<String, Object>();
		//resul.put("usuarios", srvUsuario.obtenerTodos());
		resul.put("usuarios", srvUsuario.obtenerPorUsuario(getCurrentLoggedUserName(),true));
		HttpSession session = req.getSession();
		session.setAttribute("menu", ConstantesMenu.menuAdministracionUsuarios);
		//return forward("/usuario/cambioContrasenia", resul);
		return forward("/usuario/listaUsuarios2", resul);
		
	}


	
	
	
	
	
	
	

	/**
	 * Setea como inactivo al usuario que se quiere eliminar y se guarda el estado.
	 * @param idUsuario
	 * @return
	 */
	@RequestMapping("/usuario/eliminarUsuario.do")
	public ModelAndView eliminarUsuario(@RequestParam("idUsuario") Long idUsuario){
			
			Map<String, Object> resul = new HashMap<String, Object>();		
			
			Usuario usuario = srvUsuario.obtenerPorId(idUsuario);
			usuario.desactivar();
			srvUsuario.guardarUsuario(usuario);
			
			resul.put("usuarios", srvUsuario.obtenerTodos());
			resul.put("mensaje", "El usuario " +usuario.getUsuario()+ " tiene estado Inactivo");
			return forward("/usuario/listaUsuarios", resul);
	}
	
	
	@RequestMapping("/usuario/activarUsuario.do")
	public ModelAndView activarUsuario(@RequestParam("idUsuario") Long idUsuario){
			
			Map<String, Object> resul = new HashMap<String, Object>();		
			
			Usuario usuario = srvUsuario.obtenerPorId(idUsuario);
			usuario.activar();
			srvUsuario.guardarUsuario(usuario);
			
			resul.put("usuarios", srvUsuario.obtenerTodos());
			resul.put("mensaje", "El usuario " +usuario.getUsuario()+ " tiene estado Activo");
			return forward("/usuario/listaUsuarios", resul);
	}

	
	/**
	 * @return la vista del alta del formulario del usuario
	 */
	@RequestMapping("/usuario/registrarView.do")
	public ModelAndView registrarView(
		@RequestParam(required=false, value="idUsuario") Long idUsuario	
		){
		Map<String, Object> model = new HashMap<String, Object>();
		Boolean vacio = true;
		if(idUsuario == null){
			Usuario usuario = new Usuario();
			usuario.setPersona(new Persona());
			model.put("usuario", usuario);
		}else{
			Usuario usuario = srvUsuario.obtenerPorId(idUsuario);
			vacio = false;
			model.put("usuario", usuario);
		}
		model.put("vacio", vacio);
		model.put("zonas", srvZona.obtenerTodos());
		model.put("estadosCivil", EstadoCivil.getListaEstadosCiviles());
		return forward("/usuario/altaUsuarioView", model);
	}
	
	/**
	 * @return la vista del alta del formulario del usuario
	 */
	@RequestMapping("/usuario/registrarView2.do")
	public ModelAndView registrarView2(
		@RequestParam(required=false, value="idUsuario") Long idUsuario	
		){
		Map<String, Object> model = new HashMap<String, Object>();
		Boolean vacio = true;
		if(idUsuario == null){
			Usuario usuario = new Usuario();
			usuario.setPersona(new Persona());
			model.put("usuario", usuario);
		}else{
			Usuario usuario = srvUsuario.obtenerPorId(idUsuario);
			vacio = false;
			model.put("usuario", usuario);
		}
		model.put("vacio", vacio);
		model.put("zonas", srvZona.obtenerTodos());
		model.put("estadosCivil", EstadoCivil.getListaEstadosCiviles());
		return forward("/usuario/altaUsuarioView2", model);
	}
	
	
	
	
	/**
	 * Este metodo persiste los datos del usuario que llegan del formulario de alta .
	 * Setea el estado del usuario como activo y le asigna los roles seleccionados a dicho usuario.
	 * Verifica que el usuario a registrar no este dado de alta.
	 * @param request
	 * @param usuario
	 * @param nombre
	 * @param password
	 * @param perfiles
	 * @param mail
	 * @return la vista que me devuelve los usuarios activos y la lista de roles
	 * de usuarios
	 */
	@RequestMapping("/usuario/registrar.do")
	public ModelAndView registrar(
			@ModelAttribute("usuario") Usuario usuario,
			@RequestParam(required=false, value="rolEA") boolean rolEA,
			@RequestParam(required=false, value="rolRR") boolean rolRR,
			@RequestParam(required=false, value="rolTS") boolean rolTS,
			@RequestParam("idLocalidad") Long idLocalidad,
			@RequestParam("idProvincia") Long idProvincia,
			@RequestParam(required=false, value="zonasEA") String zonasEA,
			@RequestParam(required=false, value="zonasRR") String zonasRR,
			@RequestParam(required=false, value="zonasTS") String zonaTS
			){
		
			Map<String, Object> model = new HashMap<String, Object>();
			
			if(usuario.getId() == null){
				
				if(srvUsuario.buscarPorIgualUsuario(usuario.getUsuario()))
				{	
					model.put("error", "Ya existe un usuario con ese nombre");
					model.put("zonas", srvZona.obtenerTodos());
					return forward("/usuario/altaUsuarioView", model);
				}
				if(srvPersona.buscarPorDNI(usuario.getPersona().getDni()) != null)
				{
					model.put("error", "Esta persona ya tiene asignado un usuario");
					model.put("zonas", srvZona.obtenerTodos());
					return forward("/usuario/altaUsuarioView", model);
				}			
			}
			
			PerfilStaff perfilStaff = new PerfilStaff();
			perfilStaff.setActivo(true);
			/* Compruebo existencia Usuario y DNI */ 
			String cuil_cuit = Formateador.formatearCuilSinGuiones(usuario.getPersona().getCuilCuit());
			Persona persona = usuario.getPersona();
			persona.setCuilCuit(cuil_cuit);			
			
			perfilStaff.setCodigoPostal(persona.getCodigoPostal());
			perfilStaff.setDpto(persona.getDepartamento());
			perfilStaff.setPiso(persona.getPiso());
			perfilStaff.setNacionalidad(persona.getNacionalidad());
			perfilStaff.setNroCalle(persona.getNumeroCalle());
			perfilStaff.setCalle(persona.getEntreCalles());
			perfilStaff.setFechaIngreso(new Date());
			perfilStaff.setDatosPersonales(persona);
			perfilStaffSrv.agregarPerfilStaff(perfilStaff);
			
			if(rolRR){
				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();				
				String[] zonas = StringUtils.split(zonasRR, ',');
				for (String zona : zonas){
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}
				PerfilRR rr = usuario.getPersona().getPerfilRR(); 
				rr.setActivo(true);
				rr.setZona(listaZonas);
				rr.setDatosPersonales(persona);
			}
			else{
				usuario.getPersona().setPerfilRR(null);
			}
			
			if(rolEA){
				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();				
				String[] zonas = StringUtils.split(zonasEA, ',');
				for (String zona : zonas){
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}
				PerfilEA ea = usuario.getPersona().getPerfilEA(); 
				ea.setActivo(true);
				ea.setZona(listaZonas);
				ea.setDatosPersonales(persona);
			}
			else{
				usuario.getPersona().setPerfilEA(null);				
			}

			if(rolTS){
				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();
				String[] zonas = StringUtils.split(zonaTS, ',');
				for (String zona : zonas) {
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}
				PerfilTS ts = usuario.getPersona().getPerfilTS(); 
				ts.setActivo(true);
				ts.setZonas(listaZonas);
				ts.setDatosPersonales(persona);
			}
			else{
				usuario.getPersona().setPerfilTS(null);
			}
		
			if(idLocalidad != null && idLocalidad != 0)
			{
				usuario.getPersona().setLocalidad(srvLocalidad.obtenerLocalidad(idLocalidad));
				persona.setLocalidad(srvLocalidad.obtenerLocalidad(idLocalidad));
			}
			if(idProvincia != null && idProvincia != 0)
			{
				usuario.getPersona().setProvincia(srvProvincia.obtenerPorId(idProvincia));
				persona.setProvincia(srvProvincia.obtenerPorId(idProvincia));
			}
			
			/* Guardo el Usuario - Persona */ 
			usuario.setActivo(true);
			model.put("mensaje", "Se dio de alta el usuario: " + usuario.getUsuario());
			persona.setPerfilStaff(perfilStaff);
			persona.setCredenciales(usuario);
			srvPersona.agregarPersona(persona);
			srvUsuario.guardarUsuario(usuario);
				
			model.put("usuarios", srvUsuario.obtenerTodos());
			return forward("/usuario/listaUsuarios", model);
		}
	
	
	@RequestMapping("/usuario/registrar2.do")
	public ModelAndView registrar2(
			@ModelAttribute("usuario") Usuario usuario,
			@RequestParam(required=false, value="rolEA") boolean rolEA,
			@RequestParam(required=false, value="rolRR") boolean rolRR,
			@RequestParam(required=false, value="rolTS") boolean rolTS,
			@RequestParam("idLocalidad") Long idLocalidad,
			@RequestParam("idProvincia") Long idProvincia,
			@RequestParam(required=false, value="zonasEA") String zonasEA,
			@RequestParam(required=false, value="zonasRR") String zonasRR,
			@RequestParam(required=false, value="zonasTS") String zonaTS
			){
		
			Map<String, Object> model = new HashMap<String, Object>();
			
			if(usuario.getId() == null){
				
				if(srvUsuario.buscarPorIgualUsuario(usuario.getUsuario()))
				{	
					model.put("error", "Ya existe un usuario con ese nombre");
					model.put("zonas", srvZona.obtenerTodos());
					return forward("/usuario/altaUsuarioView", model);
				}
				if(srvPersona.buscarPorDNI(usuario.getPersona().getDni()) != null)
				{
					model.put("error", "Esta persona ya tiene asignado un usuario");
					model.put("zonas", srvZona.obtenerTodos());
					return forward("/usuario/altaUsuarioView", model);
				}			
			}
			
			PerfilStaff perfilStaff = new PerfilStaff();
			perfilStaff.setActivo(true);
			/* Compruebo existencia Usuario y DNI */ 
			String cuil_cuit = Formateador.formatearCuilSinGuiones(usuario.getPersona().getCuilCuit());
			Persona persona = usuario.getPersona();
			persona.setCuilCuit(cuil_cuit);			
			
			perfilStaff.setCodigoPostal(persona.getCodigoPostal());
			perfilStaff.setDpto(persona.getDepartamento());
			perfilStaff.setPiso(persona.getPiso());
			perfilStaff.setNacionalidad(persona.getNacionalidad());
			perfilStaff.setNroCalle(persona.getNumeroCalle());
			perfilStaff.setCalle(persona.getEntreCalles());
			perfilStaff.setFechaIngreso(new Date());
			perfilStaff.setDatosPersonales(persona);
			perfilStaffSrv.agregarPerfilStaff(perfilStaff);
			
			if(rolRR){
				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();				
				String[] zonas = StringUtils.split(zonasRR, ',');
				for (String zona : zonas){
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}
				PerfilRR rr = usuario.getPersona().getPerfilRR(); 
				rr.setActivo(true);
				rr.setZona(listaZonas);
				rr.setDatosPersonales(persona);
			}
			else{
				usuario.getPersona().setPerfilRR(null);
			}
			
			if(rolEA){
				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();				
				String[] zonas = StringUtils.split(zonasEA, ',');
				for (String zona : zonas){
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}
				PerfilEA ea = usuario.getPersona().getPerfilEA(); 
				ea.setActivo(true);
				ea.setZona(listaZonas);
				ea.setDatosPersonales(persona);
			}
			else{
				usuario.getPersona().setPerfilEA(null);				
			}

			if(rolTS){
				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();
				String[] zonas = StringUtils.split(zonaTS, ',');
				for (String zona : zonas) {
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}
				PerfilTS ts = usuario.getPersona().getPerfilTS(); 
				ts.setActivo(true);
				ts.setZonas(listaZonas);
				ts.setDatosPersonales(persona);
			}
			else{
				usuario.getPersona().setPerfilTS(null);
			}
		
			if(idLocalidad != null && idLocalidad != 0)
			{
				usuario.getPersona().setLocalidad(srvLocalidad.obtenerLocalidad(idLocalidad));
				persona.setLocalidad(srvLocalidad.obtenerLocalidad(idLocalidad));
			}
			if(idProvincia != null && idProvincia != 0)
			{
				usuario.getPersona().setProvincia(srvProvincia.obtenerPorId(idProvincia));
				persona.setProvincia(srvProvincia.obtenerPorId(idProvincia));
			}
			
			/* Guardo el Usuario - Persona */ 
			usuario.setActivo(true);
			model.put("mensaje", "Se dio de alta el usuario: " + usuario.getUsuario());
			persona.setPerfilStaff(perfilStaff);
			persona.setCredenciales(usuario);
			srvPersona.agregarPersona(persona);
			srvUsuario.guardarUsuario(usuario);
				
			//model.put("usuarios", srvUsuario.obtenerTodos());
			model.put("usuarios", srvUsuario.obtenerPorUsuario(getCurrentLoggedUserName(),true));
			return forward("/usuario/listaUsuarios2", model);
		}
	
	
	
	@RequestMapping("/usuario/modificar.do")
	public ModelAndView modificar(
			@ModelAttribute("usuario") Usuario usuario,
			@RequestParam(required=false, value="rolEA") boolean rolEA,
			@RequestParam(required=false, value="rolRR") boolean rolRR,
			@RequestParam(required=false, value="rolTS") boolean rolTS,
			@RequestParam("idLocalidad") Long idLocalidad,
			@RequestParam("idProvincia") Long idProvincia,
			@RequestParam(required=false, value="zonasEA") String zonasEA,
			@RequestParam(required=false, value="zonasRR") String zonasRR,
			@RequestParam(required=false, value="zonasTS") String zonaTS
			)
	{
		
			Map<String, Object> model = new HashMap<String, Object>();


			/* Compruebo existencia Usuario y DNI */ 
			String cuil_cuit = Formateador.formatearCuilSinGuiones(usuario.getPersona().getCuilCuit());
			Persona persona = usuario.getPersona();
			
			Persona personaBase = srvPersona.obtenerPersona(persona.getId());			
			
			persona.setCuilCuit(cuil_cuit);
			
			PerfilRR perfilRR = null;
			if(rolRR){
				perfilRR = usuario.getPersona().getPerfilRR();
												
				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();
						
				String[] zonas = StringUtils.split(zonasRR, ',');
				for (String zona : zonas){
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}
				
				perfilRR.setActivo(true);
				perfilRR.setZona(listaZonas);
			}
			
			actualizarRR(personaBase,perfilRR);

			PerfilEA ea = null;
			if(rolEA){
				ea = usuario.getPersona().getPerfilEA();

				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();
						
				String[] zonas = StringUtils.split(zonasEA, ',');
				for (String zona : zonas){
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}				
				
				ea.setActivo(true);
				ea.setZona(listaZonas);
			}
			
			actualizarEA(personaBase,ea);

			PerfilTS ts = null;
			if(rolTS){
				ts = usuario.getPersona().getPerfilTS();
				
				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();
				String[] zonas = StringUtils.split(zonaTS, ',');
				for (String zona : zonas) {
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}

				ts.setActivo(true);
				ts.setZonas(listaZonas);
			}

			actualizarTS(personaBase, ts);

			if(idLocalidad != null && idLocalidad != 0)
			{
				usuario.getPersona().setLocalidad(srvLocalidad.obtenerLocalidad(idLocalidad));
				persona.setLocalidad(srvLocalidad.obtenerLocalidad(idLocalidad));
			}
			if(idProvincia != null && idProvincia != 0)
			{
				usuario.getPersona().setProvincia(srvProvincia.obtenerPorId(idProvincia));
				persona.setProvincia(srvProvincia.obtenerPorId(idProvincia));
			}
			
			actualizarPersona(personaBase,persona);
			
			/* Guardo el Usuario - Persona */ 
			usuario.setActivo(true);
			usuario.setPersona(personaBase);
			
			srvPersona.agregarPersona(personaBase);
			model.put("mensaje", "Se modifico el usuario: " + usuario.getUsuario());

			srvUsuario.guardarUsuario(usuario);

			model.put("usuarios", srvUsuario.obtenerTodos());
			return forward("/usuario/listaUsuarios", model);
	}
	
	
	@RequestMapping("/usuario/modificar2.do")
	public ModelAndView modificar2(
			@ModelAttribute("usuario") Usuario usuario,
			@RequestParam(required=false, value="rolEA") boolean rolEA,
			@RequestParam(required=false, value="rolRR") boolean rolRR,
			@RequestParam(required=false, value="rolTS") boolean rolTS,
			@RequestParam("idLocalidad") Long idLocalidad,
			@RequestParam("idProvincia") Long idProvincia,
			@RequestParam(required=false, value="zonasEA") String zonasEA,
			@RequestParam(required=false, value="zonasRR") String zonasRR,
			@RequestParam(required=false, value="zonasTS") String zonaTS
			)
	{
		
			Map<String, Object> model = new HashMap<String, Object>();


			/* Compruebo existencia Usuario y DNI */ 
			String cuil_cuit = Formateador.formatearCuilSinGuiones(usuario.getPersona().getCuilCuit());
			Persona persona = usuario.getPersona();
			
			Persona personaBase = srvPersona.obtenerPersona(persona.getId());			
			
			persona.setCuilCuit(cuil_cuit);
			
			PerfilRR perfilRR = null;
			if(rolRR){
				perfilRR = usuario.getPersona().getPerfilRR();
												
				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();
						
				String[] zonas = StringUtils.split(zonasRR, ',');
				for (String zona : zonas){
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}
				
				perfilRR.setActivo(true);
				perfilRR.setZona(listaZonas);
			}
			
			actualizarRR(personaBase,perfilRR);

			PerfilEA ea = null;
			if(rolEA){
				ea = usuario.getPersona().getPerfilEA();

				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();
						
				String[] zonas = StringUtils.split(zonasEA, ',');
				for (String zona : zonas){
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}				
				
				ea.setActivo(true);
				ea.setZona(listaZonas);
			}
			
			actualizarEA(personaBase,ea);

			PerfilTS ts = null;
			if(rolTS){
				ts = usuario.getPersona().getPerfilTS();
				
				List<ZonaCimientos> listaZonas = new ArrayList<ZonaCimientos>();
				String[] zonas = StringUtils.split(zonaTS, ',');
				for (String zona : zonas) {
					ZonaCimientos aux = srvZona.obtenerZonaCimientos(Long.parseLong(zona));
					listaZonas.add(aux);
				}

				ts.setActivo(true);
				ts.setZonas(listaZonas);
			}

			actualizarTS(personaBase, ts);

			if(idLocalidad != null && idLocalidad != 0)
			{
				usuario.getPersona().setLocalidad(srvLocalidad.obtenerLocalidad(idLocalidad));
				persona.setLocalidad(srvLocalidad.obtenerLocalidad(idLocalidad));
			}
			if(idProvincia != null && idProvincia != 0)
			{
				usuario.getPersona().setProvincia(srvProvincia.obtenerPorId(idProvincia));
				persona.setProvincia(srvProvincia.obtenerPorId(idProvincia));
			}
			
			actualizarPersona(personaBase,persona);
			
			/* Guardo el Usuario - Persona */ 
			usuario.setActivo(true);
			usuario.setPersona(personaBase);
			
			srvPersona.agregarPersona(personaBase);
			model.put("mensaje", "Se modifico el usuario: " + usuario.getUsuario());

			srvUsuario.guardarUsuario(usuario);

			//model.put("usuarios", srvUsuario.obtenerTodos());
			model.put("usuarios", srvUsuario.obtenerPorUsuario(getCurrentLoggedUserName(),true));
			return forward("/usuario/listaUsuarios2", model);
	}
	

	/**
	 * Actualiza la persona de la BD con la que se modifico por pantalla
	 * @param personaBase - BD
	 * @param persona - Creada en el controller
	 */
	private void actualizarPersona(Persona personaBase, Persona persona) {
		personaBase.setNombre(persona.getNombre());
		personaBase.setApellido(persona.getApellido());
		personaBase.setDni(persona.getDni());
		personaBase.setSexo(persona.isSexo());
		personaBase.setCuilCuit(persona.getCuilCuit());
		personaBase.setNacionalidad(persona.getNacionalidad());
		personaBase.setDireccion(persona.getDireccion());
		personaBase.setNumeroCalle(persona.getNumeroCalle());
		personaBase.setPiso(persona.getPiso());
		personaBase.setDepartamento(persona.getDepartamento());
		personaBase.setEntreCalles(persona.getEntreCalles());
		personaBase.setLocalidad(persona.getLocalidad());
		personaBase.setProvincia(persona.getProvincia());
		personaBase.setCodigoPostal(persona.getCodigoPostal());
		personaBase.setTelefono(persona.getTelefono());
		personaBase.setCelular(persona.getCelular());
		personaBase.setMail(persona.getMail());
		personaBase.setPerfilAdmin(persona.getPerfilAdmin());
		personaBase.setPerfilAsist(persona.getPerfilAsist());
		personaBase.setPerfilCoordPBE(persona.getPerfilCoordPBE());
		personaBase.setPerfilCorrector(persona.getPerfilCorrector());
		personaBase.setPerfilDI(persona.getPerfilDI());
		personaBase.setPerfilRRHH(persona.getPerfilRRHH());
		personaBase.setPerfilSelector(persona.getPerfilSelector());
		personaBase.setPerfilSysAdmin(persona.getPerfilSysAdmin());
		personaBase.setPerfilVisita(persona.getPerfilVisita());
		personaBase.setPerfilSuperUsuario(persona.getPerfilSuperUsuario());
		personaBase.getPerfilStaff().setActivo(true);	
		personaBase.getPerfilStaff().setCodigoPostal(persona.getCodigoPostal());
		personaBase.getPerfilStaff().setDpto(persona.getDepartamento());
		personaBase.getPerfilStaff().setPiso(persona.getPiso());
		personaBase.getPerfilStaff().setNacionalidad(persona.getNacionalidad());
		personaBase.getPerfilStaff().setNroCalle(persona.getNumeroCalle());
		personaBase.getPerfilStaff().setCalle(persona.getEntreCalles());
		personaBase.getPerfilStaff().setFechaIngreso(new Date());
	}


	/**
	 * Actualiza el perfil TS de la persona siempre y cuando sea necesario. 
	 * @param persona - es la persona recuperada de la BD que tiene todos los datos reales
	 * @param perfilTS - si viene null significa que se elimino o no se modifico
	 */
	private void actualizarTS(Persona persona, PerfilTS perfilTS) {
		PerfilTS ts = persona.getPerfilTS();
		if(perfilTS == null){
			if(ts != null)
				ts.setActivo(false);
		}
		//se modifico el rr, entonces les seteo las zonas que trae el perfilRR
		else{
			if(ts != null){
				ts.setZonas(perfilTS.getZonas());
				ts.setActivo(true);
			}
			else{
				perfilTS.setDatosPersonales(persona);
				persona.setPerfilTS(perfilTS);
			}
		}
	}
	
	/**
	 * Actualiza el perfil EA de la persona siempre y cuando sea necesario. 
	 * @param persona - es la persona recuperada de la BD que tiene todos los datos reales
	 * @param perfilEA - si viene null significa que se elimino o no se modifico
	 */
	private void actualizarEA(Persona persona, PerfilEA perfilEA) {
		PerfilEA ea = persona.getPerfilEA();
		if(perfilEA == null){
			if(ea != null)
				ea.setActivo(false);
		}
		//se modifico el ea, entonces les seteo las zonas que trae el perfilEA
		else{
			if(ea != null){
				ea.setZona(perfilEA.getZona());
				ea.setActivo(true);
			}
			else{
				perfilEA.setDatosPersonales(persona);
				persona.setPerfilEA(perfilEA);
			}
		}
	}


	/**
	 * Actualiza el perfil RR de la persona siempre y cuando sea necesario. 
	 * @param persona - es la persona recuperada de la BD que tiene todos los datos reales
	 * @param perfilRR - si viene null significa que se elimino o no se modifico
	 */
	private void actualizarRR(Persona persona, PerfilRR perfilRR) {
		PerfilRR rr = persona.getPerfilRR();
		if(perfilRR == null){
			if(rr != null)
				rr.setActivo(false);
		}
		//se modifico el rr, entonces les seteo las zonas que trae el perfilRR
		else{
			if(rr != null){
				rr.setZona(perfilRR.getZona());
				rr.setActivo(true);
			}
			else{
				perfilRR.setDatosPersonales(persona);
				persona.setPerfilRR(perfilRR);
			}
		}
	}


	/**
	 * Este metodo devuelve la lista de roles de usuario 
	 * en base a la lista de ids seleccionados en el formulario de alta
	 * que llegan por parametro
	 * @param roles
	 * @return List<RolUsuario> la lista de todos los roles de usuario
	 */
	public static List<RolUsuario> getRolesUsuarios(List<Integer> roles){
		List<RolUsuario> misRoles = new ArrayList<RolUsuario>();
		for (Integer rolUsuario : roles) 
		{
			misRoles.add(RolUsuario.getRolUsuario(rolUsuario));
		}
		return misRoles;

	}
	
	
	
}
