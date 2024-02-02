package org.cimientos.intranet.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.servicio.LocalidadSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * LocalidadController
 * 		Esta clase mapea las vistas de las localidades. 
 * @author msagarduy
 *
 */
@Controller
@RequestMapping("/localidad/*")
public class LocalidadController extends BaseController{

	@Autowired
	private LocalidadSrv srvLocalidad;
	
	/**
	 * Recupera la lista de todos las localidades (activos e inactivos) persistidas en la DB.
	 * @return la vista de la lista de localidade persistidas
	 */
	@RequestMapping("/localidad/listaLocalidades.do")
	public ModelAndView listaLocalidades(){
		Map<String, Object> resul = new HashMap<String, Object>();

		resul.put("localidades", srvLocalidad.obtenerTodos());

		return forward("/localidad/listaLocalidades", resul);
	}

	
	/**
	 * 
	 * @param idLocalidad Id de la localidad a modificar.
	 * @return
	 */
	@RequestMapping("/localidad/modificarView.do")
	public ModelAndView modificar(@RequestParam("idLocalidad") Long idLocalidad) 
	{
		Localidad localidad = srvLocalidad.obtenerLocalidad(idLocalidad);
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("localidad", localidad);
		return forward("/localidad/modificarView", model);
	}
	
	/**
	 * Este metodo permite modificar los datos de una localidad
	 * Valida que no exista una localidad con ese mismo nombre.
	 * Valida que el/los barrios seleccionados no pertenezcan a otra localidad.
	 * @param nombre
	 * @param barriosIds
	 * @param idLocalidad
	 * @return la lista de todas las localidades(activos e inactivos) persistidas
	 */
	@RequestMapping("/localidad/modificar.do")
	public ModelAndView modificarLocalidad(
			@RequestParam("nombre") String nombre,
			@RequestParam("idLocalidad") long idLocalidad) 
			{
			Map<String, Object> model = new HashMap<String, Object>();
			
			Localidad localidad = srvLocalidad.obtenerLocalidad(idLocalidad);
			localidad.setNombre(nombre);		
			
			if(srvLocalidad.buscarLocalidadPorNombre(nombre, String.valueOf(localidad.getId()))){
				model.put("error", "Ya existe una localidad con ese nombre");
				model.put("localidad", localidad);
	
				return forward("/localidad/modificarView", model);
			}
			
			srvLocalidad.agregarLocalidad(localidad);
				
			model.put("localidades",srvLocalidad.obtenerTodos());
			return forward("/localidad/listaLocalidades", model);
	
			}
	
	
	/**
	 * @return la vista del alta del formulario de una localidad
	 */
	@RequestMapping("/localidad/registrarView.do")
	public ModelAndView registrar()
	{
		Map<String, Object> model = new HashMap<String, Object>();

		return forward("/localidad/registrarView", model);
	}
			
	
	/**
	 * Este metodo persiste los datos de la provincia que llegan del formulario de alta.
	 * Setea el estado de la provincia como activo y le asignan las localidades seleccionadas a dicha provincia.
	 * Valida que no exista una localidad con ese mismo nombre.
	 * Valida que el/los barrios seleccionados no pertenezcan a otra localidad.
	 * @param request
	 * @param nombre
	 * @param barrios
	 * @return la vista que me devuelve las provincias activas y la lista de localidades 
	 * perteneciente a esa provincia
	 */
	@RequestMapping("/localidad/registrar.do")
	public ModelAndView registrarLocalidad(@RequestParam("nombre") String nombre) {
		
		Localidad localidadObj = new Localidad();
		Map<String, Object> model = new HashMap<String, Object>();

		localidadObj.setNombre(nombre);
		localidadObj.setActivo(true);
		
		if(srvLocalidad.buscarLocalidadPorNombre(nombre, String.valueOf(localidadObj.getId())))
		{

			model.put("error", "Ya existe una localidad con ese nombre");
		
			model.put("localidad", localidadObj);
			return forward("/localidad/registrarView", model);
		}else{
			
			srvLocalidad.agregarLocalidad(localidadObj);
			model.put("mensaje", "Se guardo la localidad " + localidadObj.getNombre());
			
		}
		model.put("localidades",srvLocalidad.obtenerTodos());
		return forward("/localidad/listaLocalidades", model);
	}
	
	/**
	 * Setea el atributo activo de la localidad en false y actualiza el estado de la misma
	 * @param idLocalidad Id de la localidad a eliminar.
	 * @return la lista de localidades activas
	 */
	@RequestMapping("/localidad/eliminarLocalidad.do")
	public ModelAndView eliminarLocalidad(@RequestParam("idLocalidad") Long idLocalidad) 
	{
		Map<String, Object> resul = new HashMap<String, Object>();

		Localidad localidad = srvLocalidad.obtenerLocalidad(idLocalidad); 
		
		localidad.setActivo(false);
		srvLocalidad.agregarLocalidad(localidad);
		resul.put("localidades", srvLocalidad.obtenerTodos());

		resul.put("mensaje", "La localidad " +localidad.getNombre()+ " ha sido eliminada");
		return forward("/localidad/listaLocalidades", resul);
	}
	

	
}
