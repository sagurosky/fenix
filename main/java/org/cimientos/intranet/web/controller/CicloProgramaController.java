package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cimientos.intranet.dto.CierreDTO;
import org.cimientos.intranet.dto.EaDto;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.EstadoCiclo;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.servicio.AlumnoPanelEASrv;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.PagoSrv;
import org.cimientos.intranet.servicio.PerfilEASrv;
import org.cimientos.intranet.servicio.PeriodoSrv;
import org.cimientos.intranet.utils.ConstantesMenu;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.utils.PeriodoHelper;
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
@RequestMapping("/ciclo/*")
public class CicloProgramaController extends BaseController{

	@Autowired
	private CicloProgramaSrv srvCiclo;
	
	@Autowired
	private PeriodoSrv srvPeriodo;
	
	@Autowired
	private AlumnoPanelEASrv srvAlumnoPanel;
	
	@Autowired
	private PerfilEASrv srvPerfilEa;
	
	@Autowired
	private AlumnoSrv srvAlumno;
	
	@Autowired
	private PagoSrv srvPago;
	
	/**
	 * Recupera la lista de todos los ciclos (activos e inactivos) persistidas en la DB.
	 * @return la vista de la lista de ciclos persistidos
	 */
	@RequestMapping("/ciclo/listaCiclos.do")
	public ModelAndView listaCiclos(HttpServletRequest req){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("ciclos", srvCiclo.obtenerCiclosParaCreacionBeca());
		resul.put("estadoActual", EstadoCiclo.ACTUAL.getValor());
		HttpSession session = req.getSession();
		session.setAttribute("menu", ConstantesMenu.menuGestionPrograma);
		return forward("/ciclo/listaCiclos", resul);
	}

	
	/**
	 * 
	 * @param idCiclo Id del ciclo a modificar.
	 * @return
	 */
	@RequestMapping("/ciclo/modificarView.do")
	public ModelAndView modificar(@RequestParam("idCiclo") Long idCiclo){
		CicloPrograma ciclo = srvCiclo.obtenerCiclo(idCiclo);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("periodos", srvPeriodo.buscarPeriodosPorCiclo(idCiclo));
		model.put("ciclo", ciclo);
		return forward("/ciclo/modificarView", model);
	}
	
	/**
	 * Este metodo permite modificar los datos de un ciclo
	 * Valida que no exista un ciclo con ese mismo nombre.
	 * Valida que el/los periodos seleccionados no pertenezcan a otro ciclo
	 * @param nombre
	 * @param periodosIds
	 * @param idCiclo
	 * @return la lista de todos los ciclos(activos e inactivos) persistidos
	 */
	@RequestMapping("/ciclo/modificar.do")
	public ModelAndView modificarCiclo(
			@RequestParam("nombre") String nombre,
			@RequestParam("fechaInicio") String fechaInicio,
			@RequestParam("fechaFin") String fechaFin,
			@RequestParam("montoBeca") Double montoBeca,
			@RequestParam("fecha1IS2") String fecha1IS2,
			@RequestParam("fecha2IS2") String fecha2IS2,
			@RequestParam("fechalimite1") String fechalimite1,
			@RequestParam("fechalimite2") String fechalimite2,
			@RequestParam("fecha1T") String fecha1T,
			@RequestParam("fecha2T") String fecha2T,
			@RequestParam("fecha3T") String fecha3T,
			@RequestParam("idCiclo") long idCiclo){
		CicloPrograma ciclo = srvCiclo.obtenerCiclo(idCiclo);
		Map<String, Object> model = new HashMap<String, Object>();
		Date fechaInicial = Formateador.parsearFecha(fechaInicio);
		Date fechaFinal = Formateador.parsearFecha(fechaFin);
		//Le setea a la fecha la hora 23:59:59 por la comparacion de las horas
		fechaFinal = Formateador.setearHoraFinDia(fechaFinal);
		Date f1 = Formateador.parsearFecha(fecha1IS2);
		Date f2 = Formateador.parsearFecha(fecha2IS2);
		Date f3 = Formateador.parsearFecha(fechalimite1);
		Date f4 = Formateador.parsearFecha(fechalimite2);
		
		Date fechaPrimerTrimestre = Formateador.parsearFecha(fecha1T);
		Date fechaSegundoTrimestre = Formateador.parsearFecha(fecha2T);
		Date fechaTerceroTrimestre = Formateador.parsearFecha(fecha3T);
		
		model.put("ciclo", ciclo);
		model.put("fecha1T", fecha1T);
		model.put("fecha2T", fecha2T);
		model.put("fecha3T", fecha3T);
		
		if(fechaInicial.after(fechaFinal))
		{
			model.put("error", "La fecha de inicio no puede ser mayor a la fecha de fin");
			return forward("/ciclo/modificarView", model);
		}
		
		if (f3.after(f1)) {
			model.put("error",
					"La fecha límite correspondiente a la primer fecha IS2 no puede ser mayor que esta.");
			return forward("/ciclo/modificarView", model);
		}
		if (f4.after(f2)) {
			model.put("error",
					"La fecha límite correspondiente a la segunda fecha IS2 no puede ser mayor que esta.");
			return forward("/ciclo/modificarView", model);
		}
		if (f1.after(f2)) {
			model.put("error",
					"La primer fecha IS2 no puede ser mayor que la segunda fecha IS2.");
			return forward("/ciclo/modificarView", model);
		}
		if (f3.after(f4)) {
			model.put("error",
					"La fecha límite correspondiente a la primer fecha IS2 no puede ser mayor que la fecha límite correspondiente a la segunda fecha IS2.");
			return forward("/ciclo/modificarView", model);
		}
		
		if (fechaSegundoTrimestre.before(fechaPrimerTrimestre)) {
			model.put("error",
					"La primer fecha del 2º trimestre no puede ser menor que la fechadel 1º trimestre.");
			return forward("/ciclo/registrarView", model);
		}
		if (fechaTerceroTrimestre.before(fechaPrimerTrimestre)) {
			model.put("error",
					"La primer fecha  del 3º trimestre no puede ser menor que la fecha  del 1º trimestre.");
			return forward("/ciclo/registrarView", model);
		}
		
		if(srvCiclo.obtenerCicloExistente(String.valueOf(idCiclo), nombre))
		{
			model.put("error", "Ya existe un ciclo con ese nombre");
			return forward("/ciclo/modificarView", model);
		}
		
		ciclo.setFechaInicio(fechaInicial);
		ciclo.setFechaFin(fechaFinal);
		ciclo.setNombre(nombre);	
		ciclo.setMontoBeca(montoBeca);
		ciclo.setFecha1IS2(f1);
		ciclo.setFecha2IS2(f2);
		ciclo.setFechalimite1(f3);
		ciclo.setFechalimite2(f4);		
		ciclo.setFecha1T(fechaPrimerTrimestre);
		ciclo.setFecha2T(fechaSegundoTrimestre);
		ciclo.setFecha3T(fechaTerceroTrimestre);
		
		model.put("ciclos", srvCiclo.obtenerCiclosParaCreacionBeca());
		model.put("mensaje", "Se han actualizado los datos del ciclo: " + ciclo.getNombre());
		
		srvCiclo.agregarCiclo(ciclo);
		return forward("/ciclo/listaCiclos", model);

	}
	
	
	/**
	 * @return la vista del alta del formulario de un ciclo
	 */
	@RequestMapping("/ciclo/registrarView.do")
	public ModelAndView registrar(){
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("periodos", srvPeriodo.obtenerTodos());
		return forward("/ciclo/registrarView", model);
	}
			
	
	/**
	 * Este metodo persiste los datos de un ciclo que llegan del formulario de alta.
	 * Setea el estado del ciclo como activo y le asignan los periodos seleccionados a dicho ciclo.
	 * Valida que no exista un ciclo con ese mismo nombre.
	 * Valida que el/los periodos seleccionados no pertenezcan a otro ciclo.
	 * @param request
	 * @param nombre
	 * @param periodos
	 * @return la vista que me devuelve los ciclos activos y la lista de periodos
	 * perteneciente a ese ciclo
	 */
	@RequestMapping("/ciclo/registrar.do")
	public ModelAndView registrarCiclo(
			@RequestParam("nombre") String nombre,
			@RequestParam("fechaInicio") String fechaInicio,
			@RequestParam("fechaFin") String fechaFin,
			@RequestParam("montoBeca") Double montoBeca,
			@RequestParam("fecha1IS2") String fecha1IS2,
			@RequestParam("fecha2IS2") String fecha2IS2,
			@RequestParam("fechalimite1") String fechalimite1,
			@RequestParam("fechalimite2") String fechalimite2,
			@RequestParam("fecha1T") String fecha1T,
			@RequestParam("fecha2T") String fecha2T,
			@RequestParam("fecha3T") String fecha3T
			) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("nombre", nombre);
		model.put("fechaInicio", fechaInicio);
		model.put("fechaFin", fechaFin);
		model.put("montoBeca", montoBeca);
		model.put("fecha1IS2", fecha1IS2);
		model.put("fecha2IS2", fecha2IS2);
		model.put("fechalimite1", fechalimite1);
		model.put("fechalimite2", fechalimite2);
		model.put("fecha1T", fecha1T);
		model.put("fecha2T", fecha2T);
		model.put("fecha3T", fecha3T);
		CicloPrograma cicloObj = new CicloPrograma();
		cicloObj.setActivo(true);
		Date fechaInicial = Formateador.parsearFecha(fechaInicio);
		Date fechaFinal = Formateador.parsearFecha(fechaFin);
		//Le setea a la fecha la hora 23:59:59 por la comparacion de las horas
		fechaFinal = Formateador.setearHoraFinDia(fechaFinal);
		Date f1 = Formateador.parsearFecha(fecha1IS2);
		Date f2 = Formateador.parsearFecha(fecha2IS2);
		Date f3 = Formateador.parsearFecha(fechalimite1);
		Date f4 = Formateador.parsearFecha(fechalimite2);
		
		Date fechaPrimerTrimestre = Formateador.parsearFecha(fecha1T);
		Date fechaSegundoTrimestre = Formateador.parsearFecha(fecha2T);
		Date fechaTerceroTrimestre = Formateador.parsearFecha(fecha3T);
		
		if (fechaInicial.after(fechaFinal)) {
			model.put("error",
					"La fecha de inicio no puede ser mayor a la fecha de fin");
			return forward("/ciclo/registrarView", model);
		}
		
		if (f3.after(f1)) {
			model.put("error",
					"La fecha límite correspondiente a la primer fecha IS2 no puede ser mayor que esta.");
			return forward("/ciclo/registrarView", model);
		}
		if (f4.after(f2)) {
			model.put("error",
					"La fecha límite correspondiente a la segunda fecha IS2 no puede ser mayor que esta.");
			return forward("/ciclo/registrarView", model);
		}
		if (f1.after(f2)) {
			model.put("error",
					"La primer fecha IS2 no puede ser mayor que la segunda fecha IS2.");
			return forward("/ciclo/registrarView", model);
		}
		if (f3.after(f4)) {
			model.put("error",
					"La fecha límite correspondiente a la primer fecha IS2 no puede ser mayor que la fecha límite correspondiente a la segunda fecha IS2.");
			return forward("/ciclo/registrarView", model);
		}
		
		
		if (fechaSegundoTrimestre.before(fechaPrimerTrimestre)) {
			model.put("error",
					"La primer fecha del 2º trimestre no puede ser menor que la fechadel 1º trimestre.");
			return forward("/ciclo/registrarView", model);
		}
		if (fechaTerceroTrimestre.before(fechaPrimerTrimestre)) {
			model.put("error",
					"La primer fecha  del 3º trimestre no puede ser menor que la fecha  del 1º trimestre.");
			return forward("/ciclo/registrarView", model);
		}
		if (f1.after(f2)) {
			model.put("error",
					"La primer fecha IS2 no puede ser mayor que la segunda fecha IS2.");
			return forward("/ciclo/registrarView", model);
		}
		cicloObj.setFechaInicio(fechaInicial);
		cicloObj.setFechaFin(fechaFinal);
		if (srvCiclo.obtenerCicloExistente(String.valueOf(cicloObj.getId()),
				nombre)) {
			model.put("error", "Ya existe un ciclo con ese nombre");
			return forward("/ciclo/registrarView", model);
		}
		cicloObj.setNombre(nombre);
		cicloObj.setMontoBeca(montoBeca);
		cicloObj.setFecha1IS2(f1);
		cicloObj.setFecha2IS2(f2);
		cicloObj.setFechalimite1(f3);
		cicloObj.setFechalimite2(f4);	
		cicloObj.setFecha1T(fechaPrimerTrimestre);
		cicloObj.setFecha2T(fechaSegundoTrimestre);
		cicloObj.setFecha3T(fechaTerceroTrimestre);
		cicloObj.setActivo(true);

		srvCiclo.agregarCiclo(cicloObj);
		model.put("ciclos", srvCiclo.obtenerCiclosParaCreacionBeca());
		model.put("mensaje", "Se dio de alta un ciclo: "
						+ cicloObj.getNombre());
		return forward("/ciclo/listaCiclos", model);

	}
	
	/**
	 * Setea el atributo activo del ciclo en false y actualiza el estado de la misma
	 * @param idCiclo Id del ciclo a eliminar.
	 * @return la lista de ciclos activos
	 */
	@RequestMapping("/ciclo/eliminarCiclo.do")
	public ModelAndView eliminarCiclo(@RequestParam("idCiclo") Long idCiclo){
		Map<String, Object> resul = new HashMap<String, Object>();
		CicloPrograma ciclo = srvCiclo.obtenerCiclo(idCiclo); 
		ciclo.setActivo(false);
		srvCiclo.agregarCiclo(ciclo);
		resul.put("ciclos", srvCiclo.obtenerCiclosParaCreacionBeca());
		resul.put("mensaje", "El ciclo " +ciclo.getNombre()+ " ha sido eliminado");
		return forward("/ciclo/listaCiclos", resul);
	}
	
	
	/**
	 * 
	 * @param idPeriodo Id del periodo a modificar.
	 * @return
	 */
	@RequestMapping("/ciclo/modificarPeriodoView.do")
	public ModelAndView modificar(@RequestParam("idPeriodo") long idPeriodo,
			@RequestParam("idCiclo") Long idCiclo) {
		Periodo periodo = srvPeriodo.obtenerPeriodo(idPeriodo);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("periodo", periodo);
		model.put("idCiclo", idCiclo);
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
	@RequestMapping("/ciclo/modificarPeriodo.do")
	public ModelAndView modificarPeriodo(
			@RequestParam("nombre") String nombre,
			@RequestParam("fechaInicio") String fechaInicio,
			@RequestParam("fechaFin") String fechaFin,
			@RequestParam(required=false, value="idPeriodo") Long idPeriodo,
			@RequestParam("idCiclo") Long idCiclo) {
		CicloPrograma ciclo = srvCiclo.obtenerCiclo(idCiclo);
		Periodo periodo = srvPeriodo.obtenerPeriodo(idPeriodo);
		Map<String, Object> model = new HashMap<String, Object>();
		periodo.setNombre(nombre);
		Date fechaInicial = Formateador.parsearFecha(fechaInicio);
		Date fechaFinal = Formateador.parsearFecha(fechaFin);
		//Le setea a la fecha la hora 23:59:59 por la comparacion de las horas
		fechaFinal = Formateador.setearHoraFinDia(fechaFinal);
		model.put("periodo", periodo);
		
		model.put("idCiclo", idCiclo);
		
		if(fechaInicial.after(fechaFinal)){
			model.put("error", "La fecha de inicio no puede ser mayor a la fecha de fin");
			return forward("/periodo/modificarView", model);
		}
		if(!PeriodoHelper.validarFechasPeriodoConFechasCiclo(ciclo, fechaInicial, fechaFinal)){
			model.put("error", "Las fechas de los periodos deben estar incluidas dentro de las fechas limite del ciclo");
			return forward("/periodo/modificarView", model);
		}
		if(!PeriodoHelper.validarFechasPeriodo(idPeriodo, ciclo.getPeriodos(), fechaInicial, fechaFinal)){
			model.put("error", "Las fechas de los periodos no deben solaparse");
			return forward("/periodo/modificarView", model);
		}
		periodo.setFechaInicio(fechaInicial);
		periodo.setFechaFin(fechaFinal);

		
		srvPeriodo.reordenarPeriodos(ciclo.getPeriodos());

		model.put("ciclo", ciclo);
		model.put("mensaje", "Se han actualizado los datos del periodo: " + periodo.getNombre());
		return forward("/ciclo/modificarView", model);

	}
	
	

	/**
	 * @return la vista del alta del formulario de un periodo
	 */
	@RequestMapping("/ciclo/registrarPeriodoView.do")
	public ModelAndView registrarPeriodo(@RequestParam("idCiclo") Long idCiclo){
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("idCiclo", idCiclo);
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
	@RequestMapping("/ciclo/registrarPeriodo.do")
	public ModelAndView registrarPeriodo(
			@RequestParam("nombre") String nombre,
			@RequestParam("fechaInicio") String fechaInicio,
			@RequestParam("fechaFin") String fechaFin,
			@RequestParam("idCiclo") Long idCiclo) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		CicloPrograma ciclo = srvCiclo.obtenerCiclo(idCiclo);
		Periodo periodoObj = new Periodo();
		
		periodoObj.setActivo(true);
		Date fechaInicial = Formateador.parsearFecha(fechaInicio);
		Date fechaFinal = Formateador.parsearFecha(fechaFin);
		//Le setea a la fecha la hora 23:59:59 por la comparacion de las horas
		fechaFinal = Formateador.setearHoraFinDia(fechaFinal);
		periodoObj.setFechaInicio(fechaInicial);
		periodoObj.setFechaFin(fechaFinal);
		periodoObj.setNombre(nombre);

		model.put("idCiclo", idCiclo);
		model.put("ciclo", ciclo);
		model.put("fechaInicio", fechaInicio);
		model.put("fechaFin", fechaFin);
		model.put("nombre", nombre);
		
		if(fechaInicial.after(fechaFinal))
		{
			model.put("error", "La fecha de inicio no puede ser mayor a la fecha de fin");
			model.put("periodo", periodoObj);
			return forward("/periodo/registrarView", model);
		}
		if(!PeriodoHelper.validarFechasPeriodoConFechasCiclo(ciclo, fechaInicial, fechaFinal)){
			model.put("error", "Las fechas de los periodos deben estar incluidas dentro de las fechas limite del ciclo");
			model.put("periodo", periodoObj);
			return forward("/periodo/registrarView", model);
		}
		if(!PeriodoHelper.validarFechasPeriodo(null, ciclo.getPeriodos(), fechaInicial, fechaFinal)){
			model.put("error", "Las fechas de los periodos no deben solaparse");
			model.put("periodo", periodoObj);
			return forward("/periodo/registrarView", model);
		}
		
		periodoObj.setCiclo(ciclo);
		ciclo.getPeriodos().add(periodoObj);
		
		srvPeriodo.reordenarPeriodos(ciclo.getPeriodos());
		
		model.put("mensaje", "Se dio de alta el periodo: " + periodoObj.getNombre());
		return forward("/ciclo/modificarView", model);

	}
	
	/**
	 * 
	 * @param idPeriodo Id del periodo a eliminar.
	 * @return
	 */
	@RequestMapping("/ciclo/eliminarPeriodo.do")
	public ModelAndView eliminarPeriodo(
						@RequestParam("idPeriodo") Long idPeriodo,
						@RequestParam("idCiclo") Long idCiclo) {	
		Map<String, Object> resul = new HashMap<String, Object>();
		CicloPrograma ciclo = srvCiclo.obtenerCiclo(idCiclo);
		Periodo periodo = srvPeriodo.obtenerPeriodo(idPeriodo);
		periodo.setActivo(false);
		periodo.setCiclo(null);
		ciclo.getPeriodos().remove(periodo);
		srvPeriodo.reordenarPeriodos(ciclo.getPeriodos());
		resul.put("periodos", srvPeriodo.obtenerTodos());
		resul.put("ciclo", ciclo);
		resul.put("mensaje", "El periodo " + periodo.getNombre()+ " ha sido eliminado");
		return forward("/ciclo/modificarView", resul);
	}
	
	/**
	 * 
	 * @param idCiclo Id del ciclo a iniciar.
	 * @return
	 */
	@RequestMapping("/ciclo/iniciarCiclo.do")
	public ModelAndView iniciarCiclo(@RequestParam("idCiclo") Long idCiclo){	
		Map<String, Object> resul = new HashMap<String, Object>();
		
		List<CierreDTO> easSinCierre = new ArrayList<CierreDTO>();			
		
		List<PerfilEA> eas = srvPerfilEa.obtenerEasConBecadosAsignadosYRR();
		EaDto ea;
		for (PerfilEA perfilEA : eas) {
			ea = srvAlumno.obtenerDatosAlumnosPorEA(perfilEA,srvCiclo.obtenerCicloActual());
			if(ea.getEntrevistasRealizadas() < ea.getEntrevistas()){
				CierreDTO c = new CierreDTO();
				c.setNombreEA(ea.getNombreApellido());
				c.setNombreRR(ea.getNombreApellidoRR());
				c.setCantidades(ea.getEntrevistasRealizadas() + "/" + ea.getEntrevistas());
				easSinCierre.add(c);
			}
		}
		
		int cantidad = srvPago.obtenerCantidadPagosInconclusos();
		
		// para que no verifique nada y cierre el ciclo OJO !!!!!!!!!!!!!!!! comentar hasta 552
		//if(easSinCierre.size() > 0){
		//	resul.put("eas", easSinCierre);			
		//	resul.put("mensaje", "No se puede iniciar el nuevo ciclo ya que el ciclo actual tiene tareas pendientes.");			
		//}
		//if(cantidad > 0){
		//	resul.put("cantidad", "Existen " + cantidad + " de pagos en estado 'Aprobado'. " +
		//			"Para cerrar el ciclo deben efectuarse todos los pagos");
		//	resul.put("mensaje", "No se puede iniciar el nuevo ciclo ya que el ciclo actual tiene tareas pendientes.");
		//}
		//
		//if(easSinCierre.size() > 0 || cantidad > 0)
		//	return forward("/ciclo/cierreCiclos", resul);
		
		CicloPrograma ciclo = srvCiclo.obtenerCiclo(idCiclo); 
		srvCiclo.iniciarCiclo(ciclo);
		srvAlumnoPanel.desactivarAlumnosCierreCiclo();
		srvAlumno.avanzarAnioEscolar();
		resul.put("ciclos", srvCiclo.obtenerCiclosParaCreacionBeca());
		resul.put("mensaje", "El ciclo " +ciclo.getNombre()+ " ha sido iniciado");
		
		return forward("/ciclo/listaCiclos", resul);
	}
	
}
