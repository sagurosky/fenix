
package org.cimientos.intranet.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.servicio.PeriodoSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author msagarduy
 *  
 */
@Controller
@RequestMapping("/periodo/*")
public class PeriodoController extends BaseController
{

	@Autowired
	private PeriodoSrv srvPeriodo;
	
	/**
	 * Recupera la lista de todos los periodos (activos e inactivos) persistidos en la DB.
	 * @return la vista de la lista de periodos persistidos
	 */
	@RequestMapping("/periodo/listaPeriodos.do")
	public ModelAndView listaPeriodos(){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("periodos", srvPeriodo.obtenerTodos());
		
		return forward("/periodo/listaPeriodos", resul);
	}

	
	/**
	 * 
	 * @param idPeriodo Id del periodo a modificar.
	 * @return
	 */
	@RequestMapping("/periodo/modificarView.do")
	public ModelAndView modificar(@RequestParam("idPeriodo") Long idPeriodo) 
	{
		Periodo periodo = srvPeriodo.obtenerPeriodo(idPeriodo);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("periodo", periodo);
		
		return forward("/periodo/modificarView", model);
	}
	
	/**
	 * Este metodo permite modificar los datos de un periodo
	 * @param nombre
	 * @param fechaInicio
	 * @param fechaFin
	 * @param idPeriodo
	 * @return la lista de todos los periodos(activos e inactivos) persistidos
	 */
	@RequestMapping("/periodo/modificar.do")
	public ModelAndView modificarPeriodo(
			@RequestParam("nombre") String nombre,
			@RequestParam("fechaInicio") String fechaInicio,
			@RequestParam("fechaFin") String fechaFin,
			@RequestParam("idPeriodo") long idPeriodo) 
	{
		Periodo periodo = srvPeriodo.obtenerPeriodo(idPeriodo);
		Map<String, Object> model = new HashMap<String, Object>();
		if(srvPeriodo.buscarPeriodoPorNombre(nombre, String.valueOf(periodo.getId())))
		{
			model.put("error", "Ya existe un periodo con ese nombre");
			model.put("periodo", periodo);
		
			return forward("/periodo/modificarView", model);
		}
		periodo.setNombre(nombre);
		Date fechaInicial = Formateador.parsearFecha(fechaInicio);
		Date fechaFinal = Formateador.parsearFecha(fechaFin);
		if(fechaInicial.after(fechaFinal))
		{
			model.put("error", "La fecha de inicio no puede ser mayor a la fecha de fin");
			model.put("periodo", periodo);
		
			return forward("/periodo/modificarView", model);
		}
		periodo.setFechaInicio(fechaInicial);
		periodo.setFechaFin(fechaFinal);
		srvPeriodo.agregarPeriodo(periodo);
		model.put("mensaje", "Se han actualizado los datos del periodo: " + periodo.getNombre());
		model.put("periodos", srvPeriodo.obtenerTodos());
		return forward("/periodo/listaPeriodos", model);

	}
	
	

	/**
	 * @return la vista del alta del formulario de un periodo
	 */
	@RequestMapping("/periodo/registrarView.do")
	public ModelAndView registrar()
	{
		Map<String, Object> model = new HashMap<String, Object>();
		
		return forward("/periodo/registrarView", model);
	}
			
	
	/**
	 * Este metodo persiste los datos del periodo que llegan del formulario de alta.
	 * Setea el estado del periodo como activo.
	 * Verifica que el periodo a registrar no este dada de alta.
	 * @param request
	 * @param nombre
	 * @param fechaInicio
	 * @param fechaFin
	 * @return la vista que me devuelve los periodos activos 
	 * 
	 */
	@RequestMapping("/periodo/registrar.do")
	public ModelAndView registrar( 
			@RequestParam("nombre") String nombre,
			@RequestParam("fechaInicio") String fechaInicio,
			@RequestParam("fechaFin") String fechaFin) 
	{
		
		Periodo periodoObj = new Periodo();
		Map<String, Object> model = new HashMap<String, Object>();
		periodoObj.setActivo(true);
		Date fechaInicial = Formateador.parsearFecha(fechaInicio);
		Date fechaFinal = Formateador.parsearFecha(fechaFin);
		if(fechaInicial.after(fechaFinal))
		{
			model.put("error", "La fecha de inicio no puede ser mayor a la fecha de fin");
		
			return forward("/periodo/registrarView", model);
		}
		
		periodoObj.setFechaInicio(fechaInicial);
		periodoObj.setFechaFin(fechaFinal);
		if(srvPeriodo.buscarPeriodoPorNombre(nombre, String.valueOf(periodoObj.getId())))
		{
			model.put("error", "Ya existe un periodo con ese nombre");
		
			return forward("/periodo/registrarView", model);
		}
		periodoObj.setNombre(nombre);
		srvPeriodo.agregarPeriodo(periodoObj);
		
		model.put("mensaje", "Se dio de alta el periodo: " + periodoObj.getNombre());
		model.put("periodos", srvPeriodo.obtenerTodos());
		return forward("/periodo/listaPeriodos", model);

	}
	
	/**
	 * 
	 * @param idPeriodo Id del periodo a eliminar.
	 * @return
	 */
	@RequestMapping("/periodo/eliminarPeriodo.do")
	public ModelAndView eliminarPeriodo(@RequestParam("idPeriodo") Long idPeriodo) 
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		Periodo periodo = srvPeriodo.obtenerPeriodo(idPeriodo);
		periodo.setActivo(false);
		srvPeriodo.agregarPeriodo(periodo);
		resul.put("periodos", srvPeriodo.obtenerTodos());
		
		resul.put("mensaje", "El periodo " + periodo.getNombre()+ " ha sido eliminado");
		return forward("/periodo/listaPeriodos", resul);
	}
	
}
