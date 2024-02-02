package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.Provincia;
import org.cimientos.intranet.servicio.LocalidadSrv;
import org.cimientos.intranet.servicio.ProvinciaSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/provincia/*")
public class ProvinciaController extends BaseController
{

	@Autowired
	private ProvinciaSrv srvProvincia;
	
	@Autowired
	private LocalidadSrv srvLocalidad;
	
	
	/**
	 * Recupera la lista de todos los provincias (activos e inactivos) persistidas en la DB.
	 * @return la vista de la lista de provincias persistidas
	 */
	@RequestMapping("/provincia/listaProvincias.do")
	public ModelAndView listaProvincias(){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("provincias", srvProvincia.obtenerTodas());
		
		return forward("/provincia/listaProvincias", resul);
	}
	

	/**
	 * Setea como inactiva la provincia que se quiere eliminar y se guarda el estado.
	 * @param idProvincia
	 * @return
	 */
	@RequestMapping("/provincia/eliminarProvincia.do")
	public ModelAndView eliminarProvincia(@RequestParam("idProvincia") Long idProvincia) 
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		
		Provincia provincia = srvProvincia.obtenerPorId(idProvincia);
		List<Localidad> localidadesDeUnaProvincia = provincia.getLocalidades();
		for (Localidad localidad : localidadesDeUnaProvincia) 
		{
			localidad.setProvincia(null);
		}
		provincia.setLocalidades(null);
		provincia.setActivo(false);
		srvProvincia.guardarProvincia(provincia);
		resul.put("provincias", srvProvincia.obtenerTodas());
		
		resul.put("mensaje", "La provincia " +provincia.getDescripcion()+ " ha sido eliminada");
		return forward("/provincia/listaProvincias", resul);
	}
	
	
	/**
	 * Este metodo recupera la provincia por id y la retorna
	 * @param idProvincia
	 * @return la vista con la provincia a modificar
	 */
	@RequestMapping("/provincia/modificarView.do")
	public ModelAndView modificar(@RequestParam("idProvincia") Long idProvincia) 
	{
		Provincia provincia = srvProvincia.obtenerPorId(idProvincia);
		List<Localidad> localidadesSinProvincias = srvLocalidad.obtenerLocalidadesSinProvincia();
		List<Localidad> localidadesSeleccionadas = provincia.getLocalidades();
		List<Localidad> localidadesDisponiblesYSeleccionadas = new ArrayList<Localidad>();
		for (Localidad localidad : localidadesSeleccionadas) 
		{
			localidadesDisponiblesYSeleccionadas.add(localidad);
		}
		for (Localidad localidad : localidadesSinProvincias) 
		{
			localidadesDisponiblesYSeleccionadas.add(localidad);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("localidades", localidadesDisponiblesYSeleccionadas);
		model.put("localidadesSeleccionadas", localidadesSeleccionadas);
		model.put("provincia", provincia);		
		return forward("/provincia/modificarView", model);
	}
	
	/**
	 * Este metodo permite modificar los datos de una provincia
	 * Valida que no exista una provincia con ese mismo nombre.
	 * Valida que el/las localidades seleccionadas no pertenezcan a otra provincia.
	 * @param descripcion
	 * @param localidadesIds
	 * @param idProvincia
	 * @return la lista de todas las provincias(activos e inactivos) persistidas
	 */
	@RequestMapping("/provincia/modificar.do")
	public ModelAndView modificarProvincia(
			@RequestParam("ids") String ids,
			@RequestParam("descripcion") String descripcion,
			@RequestParam("pais") String pais,
			@RequestParam(required=false,value="localidades") List<Long> localidadesIds,
			@RequestParam("idProvincia") long idProvincia) 
	{	
		Map<String, Object> model = new HashMap<String, Object>();
		Provincia provincia = srvProvincia.obtenerPorId(idProvincia);
		
		List<Localidad> localidadesSinProvincias = srvLocalidad.obtenerLocalidadesSinProvincia();
		
		List<Localidad> localidadesDisponiblesYSeleccionadas = new ArrayList<Localidad>();
		if (localidadesIds != null)
		{
			
			List<Localidad> localidadesSeleccionadasActuales = srvLocalidad.obtenerGrupo(localidadesIds);
			if(localidadesSeleccionadasActuales.size() <= provincia.getLocalidades().size())
			{
				String[] arrayIdsLocalidadesSeleccionadas = StringUtils.split(ids, ";");
				for (int i = 0; i < provincia.getLocalidades().size(); i++) 
				{
					String[] valuesArray = StringUtils.split(arrayIdsLocalidadesSeleccionadas[i], "-");
					Boolean localidadSeleccionada = Boolean.valueOf(valuesArray[0]);
					Long idLocalidadSeleccionada = Long.parseLong(valuesArray[1]);
					Localidad localidadSelected = srvLocalidad.obtenerLocalidad(idLocalidadSeleccionada);
					
					if(provincia.getLocalidades().get(i).equals(localidadSelected) && !localidadSeleccionada)
						provincia.getLocalidades().get(i).setProvincia(null);
				}
			}
			provincia.setPais(pais);
			provincia.setDescripcion(descripcion);
			if(srvProvincia.buscarProvinciaPorDescripcion(descripcion, String.valueOf(provincia.getId())))
			{
				model.put("error", "Ya existe una provincia con ese nombre");
				
				List<Localidad> localidadesYaSeleccionadas = provincia.getLocalidades();
				for (Localidad localidad : localidadesYaSeleccionadas) 
				{
					localidadesDisponiblesYSeleccionadas.add(localidad);
				}
				for (Localidad localidad : localidadesSinProvincias) 
				{
					localidadesDisponiblesYSeleccionadas.add(localidad);
				}
				
				model.put("provincia", provincia);
				model.put("localidades", localidadesDisponiblesYSeleccionadas);
				
				return forward("/provincia/modificarView", model);
			}
			
			for (Localidad localidad: localidadesSeleccionadasActuales)
			{
				localidad.setProvincia(provincia);
			}
			provincia.setLocalidades(localidadesSeleccionadasActuales);
			srvProvincia.guardarProvincia(provincia);
			
			model.put("provincias", srvProvincia.obtenerTodas());				
			model.put("mensaje", "Se han actualizado los datos de la provincia: " + provincia.getDescripcion());	
			model.put("localidades", localidadesSinProvincias);
			
			return forward("/provincia/listaProvincias", model);
			}
			else
			{
				model.put("mensaje", "No se han realizado cambios en la provincia \"" + provincia.getDescripcion()+	"\", debe seleccionar por lo menos una localidad.");
				srvProvincia.guardarProvincia(provincia);
				model.put("provincias", srvProvincia.obtenerTodas());
				
				return forward("/provincia/listaProvincias", model);
			}
	}
	
	/**
	 * Obtiene la provincia a la que se quiere volver a poner con estado activo
	 * y se actualiza su estado.
	 * @param idProvincia
	 * @return la vista que me devuelva la lista de las provincias activas
	 */
	@RequestMapping("/provincia/reingresarProvincia.do")
	public ModelAndView reingresarProvincia(@RequestParam("idProvincia") Long idProvincia){
		Provincia provincia = srvProvincia.obtenerPorId(idProvincia);
		provincia.setActivo(true);
		srvProvincia.guardarProvincia(provincia);
		Map<String , Object> model = new HashMap<String , Object>();
		
		List<Provincia> provincias = srvProvincia.obtenerTodas();
		model.put("mensaje", "Se ha vuelto a dar de alta a la provincia: " + provincia.getDescripcion());
		
		model.put("provincias", provincias);
		return forward("/provincia/listaProvincias", model);
	}
	
	

	/**
	 * @return la vista del alta del formulario de una provincia
	 */
	@RequestMapping("/provincia/registrarView.do")
	public ModelAndView registrar()
	{
		Map<String, Object> model = new HashMap<String, Object>();
		List<Localidad> localidadesSinProvincias = srvLocalidad.obtenerLocalidadesSinProvincia();
		if(localidadesSinProvincias.isEmpty())
		{
			model.put("error", "No se puede registrar la provincia, no existen localidades ");
		

		}
		model.put("localidades", localidadesSinProvincias);
		return forward("/provincia/registrarView", model);
	}
			
	
	/**
	 * Este metodo persiste los datos de la provincia que llegan del formulario de alta.
	 * Setea el estado de la provincia como activo y le asignan las localidades seleccionadas a dicha provincia.
	 * Valida que no exista una provincia con ese mismo nombre.
	 * Valida que el/las localidades seleccionadas no pertenezcan a otra provincia.
	 * @param request
	 * @param descripcion
	 * @param localidades
	 * @return la vista que me devuelve las provincias activas y la lista de localidades 
	 * perteneciente a esa provincia
	 */
	@RequestMapping("/provincia/registrar.do")
	public ModelAndView registrar( 
		@RequestParam("descripcion") String descripcion,
		@RequestParam("pais") String pais,
		@RequestParam(required=false, value="localidades") List<Long> localidades) {
		
		Provincia provinciaObj = new Provincia();
		Map<String, Object> model = new HashMap<String, Object>();
		List<Localidad> localidadesSinProvincias = srvLocalidad.obtenerLocalidadesSinProvincia();
		if(localidades!=null){ 
			provinciaObj.setDescripcion(descripcion);
			provinciaObj.setPais(pais);
			provinciaObj.setActivo(true);
			List<Localidad> localidadesSeleccionadas = srvLocalidad.obtenerGrupo(localidades);
			List<String> nombresLocalidadesSeleccionadas = srvLocalidad.obtenerNombresLocalidades(localidades);

			if(srvProvincia.buscarProvinciaPorDescripcion(descripcion, String.valueOf(provinciaObj.getId())))
			{
				model.put("error", "Ya existe una provincia con ese nombre");
				model.put("provincia", provinciaObj);
				model.put("descripcion",descripcion);
				model.put("pais", pais);
				model.put("localidades", localidadesSinProvincias);
				return forward("/provincia/registrarView", model);
			}
			boolean tieneProvincia = srvLocalidad.obtenerLocalidad(nombresLocalidadesSeleccionadas);
			if (tieneProvincia == true)
			{
				model.put("error", "La/las localidades seleccionada/s ya pertenece a una provincia ");
				
				model.put("provincia", provinciaObj);
				model.put("descripcion",descripcion);
				model.put("pais", pais);
				model.put("localidades",localidadesSinProvincias);
			
				return forward("/provincia/registrarView", model);
			}
			else
			{	
				for (Localidad localidad: localidadesSeleccionadas)
				{
					localidad.setProvincia(provinciaObj);
				}
				provinciaObj.setLocalidades(localidadesSeleccionadas);	
				srvProvincia.guardarProvincia(provinciaObj);
				model.put("provincias", srvProvincia.obtenerTodas());
				model.put("tipoProvincia", true);				
			
				model.put("mensaje", "Se dio de alta la provincia: " + provinciaObj.getDescripcion());
				return forward("/provincia/listaProvincias", model);
			}
			
			}
			else{
				if(localidadesSinProvincias.isEmpty())
				{
					model.put("error", "Debe seleccionar una localidad para asignar a la provincia ");
					model.put("provincia", provinciaObj);
					model.put("localidades", localidadesSinProvincias);
					model.put("descripcion",descripcion);
				}
				else
				{
					model.put("error", "No se puede registrar la provincia, no existen localidades ");
					model.put("provincia", provinciaObj);
					model.put("localidades", localidadesSinProvincias);
					model.put("descripcion",descripcion);
				}
				return forward("/provincia/registrarView", model);
		
	}
	
	}
}
