package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.viatico.Viatico;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.PeriodoSrv;
import org.cimientos.intranet.servicio.ViaticoSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.ConceptoViaticos;
import com.cimientos.intranet.enumerativos.EstadoPago;
import com.cimientos.intranet.enumerativos.EstadoPagoViatico;


@Controller
@RequestMapping("/viatico/*")
public class ViaticoController extends BaseController {

	@Autowired
	private ViaticoSrv viaticoSrv;
	
	@Autowired
	private PeriodoSrv periodoSrv;
	
	@Autowired
	private CicloProgramaSrv cicloSrv;
	
	/**
	 * View viatico.
	 *
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/viatico/viewViatico.do")
	public ModelAndView viewViatico(HttpServletRequest req){		
						
		Map<String, Object> resul = new HashMap<String, Object>();
		
		List<ConceptoViaticos> listConceptoViatico = ConceptoViaticos.getListaEstados();
		PerfilEA perfilEA = getPerfilEA(req);
		List<Viatico> viaticos = new ArrayList<Viatico>();
		if(perfilEA != null)
		{
			viaticos = viaticoSrv.obtenerViaticosPorEa(perfilEA);
		}
		resul.put("listConceptoViatico", listConceptoViatico);
		resul.put("viaticos", viaticos);	
						
		return forward("viatico/viewViatico", resul);
	}
	
	/**
	 * Alta viatico.
	 *
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/viatico/altaViatico.do")
	public ModelAndView altaViatico(){
		
		Map<String, Object> resul = new HashMap<String, Object>();		
		Viatico viatico = new Viatico();
		resul.put("periodos", cicloSrv.obtenerCicloActual().getPeriodos());
		resul.put("estadoPago", EstadoPago.NO_APROBADO);
		resul.put("listConceptoViatico", ConceptoViaticos.getListaEstados());
		resul.put("viatico", viatico);
		return forward("viatico/altaViatico", resul);
	}
	
	/**
	 * Guardar multiples viaticos.
	 *
	 * @param idConceptoViaticos the id concepto viaticos
	 * @param comentarios the comentarios
	 * @param valores the valores
	 * @param periodo the periodo
	 * @param request the request
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/viatico/guardarMultiplesViaticos.do")
	public ModelAndView guardarMultiplesViaticos( 
						@RequestParam("idConceptoViatico") List<Integer> idConceptoViaticos,
						@RequestParam("comentario") List<String> comentarios,
						@RequestParam("valor") List<Double> valores,
						@RequestParam("periodo") List<Long> periodo,
						HttpServletRequest request){		
				
			int index = 0;
			for (Integer idConceptoViatico : idConceptoViaticos) 
			{
				Viatico viatico = new Viatico();
				viatico.setConceptoViatico(ConceptoViaticos.getConceptoViaticos(idConceptoViatico));
				viatico.setEstadoPago(EstadoPagoViatico.NO_APROBADO);
				viatico.setComentario(comentarios.get(index));
				viatico.setValor(valores.get(index));
				viatico.setPeriodo(periodoSrv.obtenerPeriodo(periodo.get(index))); 
				
				//Captura de PerfilEA
				Persona persona = obtenerPersona(request);
				PerfilEA perfilEA = new PerfilEA();
				try {					 
					perfilEA = persona.getPerfilEA();
					viatico.setEa(perfilEA);
				} catch (Exception e) {
					 persona = new Persona();
					 
				}
				
				viaticoSrv.agregarViatico(viatico);
				
				index++;
			}

			Map<String, Object> resul = new HashMap<String, Object>();
			PerfilEA perfilEA = getPerfilEA(request);
			List<Viatico> viaticos = new ArrayList<Viatico>();
			if(perfilEA != null)
			{
				viaticos = viaticoSrv.obtenerViaticosPorEa(perfilEA);
			}
			resul.put("viaticos", viaticos);	
							
			return forward("viatico/viewViatico", resul);
	}
	
	/**
	 * Guardar viatico.
	 *
	 * @param viaticoModificado the viatico modificado
	 * @param idViatico the id viatico
	 * @param idConceptoViatico the id concepto viatico
	 * @param request the request
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/viatico/guardarViatico.do")
	public ModelAndView guardarViatico( @ModelAttribute("viatico") Viatico viaticoModificado,
										@RequestParam("id") Long idViatico,										
			                            @RequestParam("idConceptoViatico") Integer idConceptoViatico,
			                            @RequestParam("idPeriodo") Long idPeriodo,
			                            HttpServletRequest request)
	{
		Viatico viatico = new Viatico();
		viatico = viaticoSrv.obtenerViatico(idViatico);
		viatico.setEstadoPago(viaticoModificado.getEstadoPago());
		viatico.setConceptoViatico(ConceptoViaticos.getConceptoViaticos(idConceptoViatico)); 
		viatico.setComentario(viaticoModificado.getComentario());
		viatico.setPeriodo(periodoSrv.obtenerPeriodo(idPeriodo));
		viatico.setValor(viaticoModificado.getValor());			
		//Guarda el viatico en la base.
		viaticoSrv.agregarViatico(viatico); 		
		//ReDibuja la tabla con los resultados actualizados.			
		Map<String, Object> resul = new HashMap<String, Object>();
		PerfilEA perfilEA = getPerfilEA(request);
		List<Viatico> viaticos = new ArrayList<Viatico>();
		if(perfilEA != null)
		{
			viaticos = viaticoSrv.obtenerViaticosPorEa(perfilEA);
		}
		List<ConceptoViaticos> listConceptoViatico = ConceptoViaticos.getListaEstados();
		resul.put("listConceptoViatico", listConceptoViatico);
		resul.put("viaticos", viaticos);			
		return forward("viatico/viewViatico", resul);
	}
	
	/**
	 * Modificar viatico.
	 *
	 * @param viatico the viatico
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/viatico/modificarViatico.do")
	public ModelAndView modificarViatico( @RequestParam("idViatico") Long viatico )
	{									
		//ReDibuja la tabla con los resultados actualizados.			
		Map<String, Object> resul = new HashMap<String, Object>();
		List<ConceptoViaticos> listConceptoViatico = ConceptoViaticos.getListaEstados();								
		Viatico viaticoAModificar = viaticoSrv.obtenerViatico(viatico);
		resul.put("listConceptoViatico", listConceptoViatico);
		resul.put("viatico", viaticoAModificar);			
		resul.put("periodos", cicloSrv.obtenerCicloActual().getPeriodos());
		return forward("viatico/modificarViatico", resul);
	}
	
	/**
	 * Evaluacion viatico.
	 *
	 * @param request the request
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/viatico/evaluacionViatico.do")
	public ModelAndView evaluacionViatico( HttpServletRequest request)
	{	
		Map<String, Object> resul = new HashMap<String, Object>();
		PerfilRR perfilRR = getPerfilRR(request);
		List<Viatico> viaticos = new ArrayList<Viatico>();
		if(perfilRR != null)
		{
			viaticos = viaticoSrv.obtenerViaticosPorRr(perfilRR);
		}
		resul.put("viaticos", viaticos);
		resul.put("listEstadoPagos", EstadoPagoViatico.getListaEstadoPagos());	
		return forward("viatico/evaluacionViaticos", resul);
	}
	
	/**
	 * Guardar evaluacion viatico.
	 *
	 * @param idEstadoPago the id estado pago
	 * @param request the request
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/viatico/guardarEvaluacionViatico.do")
	public ModelAndView guardarEvaluacionViatico( @RequestParam("ids") String idEstadoPago,
												  HttpServletRequest request)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		String[] arrayIdsEstadoPagos = StringUtils.split(idEstadoPago, ";");
		List<String> listOfLong = Formateador.toListOfStrings(arrayIdsEstadoPagos);
		List<String> lista = new ArrayList<String>();
		
		for (String string : listOfLong) 
		{
			lista.add(string);
		}
		for (int i = 0; i < lista.size(); i++) 
		{
			arrayIdsEstadoPagos[i] = String.valueOf(lista.get(i));
		}
		for( int i = 0; i < arrayIdsEstadoPagos.length; i++ )
		{
			String[] valuesArray = StringUtils.split(arrayIdsEstadoPagos[i], "-");
			EstadoPagoViatico estadoPago = EstadoPagoViatico.getEstadoPagoViatico(Integer.parseInt(valuesArray[0]));
			Viatico viatico = viaticoSrv.obtenerViatico(Long.parseLong(valuesArray[1]));
			viatico.setEstadoPago(estadoPago);
			viaticoSrv.agregarViatico(viatico); //Revisar si es agregar o crear el guardar para q actualize y no ingrese uno nuevo.
		}		
		PerfilRR perfilRR = getPerfilRR(request);
		List<Viatico> viaticos = new ArrayList<Viatico>();
		if(perfilRR != null)
		{
			viaticos = viaticoSrv.obtenerViaticosPorRr(perfilRR);
		}
		resul.put("viaticos", viaticos);
		resul.put("listEstadoPagos", EstadoPagoViatico.getListaEstadoPagos());
		return forward("viatico/evaluacionViaticos", resul);
	}
	
	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception 
	{
		if (binder.getTarget()!=null && !binder.getTarget().equals("")) 
		{
			binder.setDisallowedFields(new String[] {"estadoPago.id"});
			if ((binder.getTarget() instanceof Viatico)) 
			{
				Viatico viatico = (Viatico) binder.getTarget();	
				Integer idEstadoPago = null;
				try 
				{
					idEstadoPago = Integer.parseInt(request.getParameter("estadoPago.id"));
				} 
				catch (Exception e) 
				{
				}
				if(idEstadoPago != null)
				{
					EstadoPagoViatico estadoPago = EstadoPagoViatico.getEstadoPagoViatico(idEstadoPago);
					viatico.setEstadoPago(estadoPago);
				}
				
			}
		}
	}
}
