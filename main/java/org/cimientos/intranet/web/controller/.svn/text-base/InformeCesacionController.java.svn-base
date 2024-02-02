package org.cimientos.intranet.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.informe.InformeCesacion;
import org.cimientos.intranet.modelo.informe.InformeIS3;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.BecaSvr;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.InformeCesacionSrv;
import org.cimientos.intranet.servicio.InformeSrv;
import org.cimientos.intranet.servicio.PerfilPadrinoSvr;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.EnumPBE;
import com.cimientos.intranet.enumerativos.Esfuerzo;
import com.cimientos.intranet.enumerativos.entrevista.Compromiso;

@Controller
@RequestMapping("/informeCesacion/*")
public class InformeCesacionController extends BaseController
{

	@Autowired
	private InformeCesacionSrv srvInformeC;
	
	@Autowired
	private InformeSrv srvInforme;
		
	@Autowired
	private AlumnoSrv srvBecado;
	
	@Autowired
	private BecaSvr srvBeca;
	
	@Autowired
	private CicloProgramaSrv srvCiclo;
	
	@Autowired
	private PerfilPadrinoSvr srvPadrino;
	
	private static final String ACCION_REVISAR = "revisar";
	private static final String ACCION_SUPERVISAR = "supervisar";
	private static final String ACCION_FINALIZAR = "finalizar";
	private static final String ACCION_CORREGIR = "corregir";
	private static final String EXITO_MSJ = "La acción se ha realizado con éxito.";
	private static final String FALTAN_DATOS_MSJ = "Faltan los siguientes datos obligatorios: ";
	
	@RequestMapping("/informeCesacion/verInformeCesacion.do")
	public ModelAndView verInformeCesacion(@RequestParam ("idInformeCesacion") Long idInforme)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		InformeCesacion informe = srvInformeC.obtenerInformeCesacion(idInforme);
		if(!informe.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(informe.getBecado().getDatosPersonales().getFechaNacimiento());
			informe.setEdad(edad);
		}
		srvInformeC.guardarInformeCesacion(informe);
		resul.put("informe", informe);
		resul.put("conductas", EnumPBE.getEnumPBE());
		resul.put("esfuerzos", Esfuerzo.getEsfuerzo());
		resul.put("asistenciaBecados", EnumPBE.getEnumPBE());
		resul.put("asistenciaRAs", EnumPBE.getEnumPBE());
		resul.put("presentacionMateriales", EnumPBE.getEnumPBE());
	    resul.put("compromisoEscolaridades", Compromiso.getCompromiso());
	    resul.put("compromisoEscolaridadesPBE", Compromiso.getCompromiso());
	    resul.put("compromisosRa", Compromiso.getCompromiso());
	    resul.put("compromisosRaPBE", Compromiso.getCompromiso());
		Boletin boletin = srvInforme.getBoletinCicloInforme(informe.getBecado(), informe.getCicloActual());
		resul.put("boletin", boletin);
		resul.put("datosEstimadosCheck", informe.getDatosEstimadosCheck());
		resul.put("incluirBoletinCheck", informe.getIncluirBoletinCheck());
		return forward("/informeCesacion/verInformeCesacion", resul);
	}

	/**
	 * @param idInforme
	 * @return
	 */
	@RequestMapping("/informeCesacion/verInformeCesacionCorrectoraView.do")
	public ModelAndView verInformeCesacionCorrectora(@RequestParam ("idInformeCesacion") Long idInforme)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		InformeCesacion informe = srvInformeC.obtenerInformeCesacion(idInforme);
		if(!informe.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(informe.getBecado().getDatosPersonales().getFechaNacimiento());
			informe.setEdad(edad);
		}
		srvInformeC.guardarInformeCesacion(informe);
		resul.put("informe", informe);
		resul.put("conductas", EnumPBE.getEnumPBE());
		resul.put("esfuerzos", Esfuerzo.getEsfuerzo());
		resul.put("asistenciaBecados", EnumPBE.getEnumPBE());
		resul.put("asistenciaRAs", EnumPBE.getEnumPBE());
		resul.put("presentacionMateriales", EnumPBE.getEnumPBE());
	    resul.put("compromisoEscolaridades", Compromiso.getCompromiso());
	    resul.put("compromisoEscolaridadesPBE", Compromiso.getCompromiso());
	    resul.put("compromisosRa", Compromiso.getCompromiso());
	    resul.put("compromisosRaPBE", Compromiso.getCompromiso());
		resul.put("urlInforme", "../informeCesacion/verInformeCesacionCorrectoraView.do?idInformeCesacion=" + informe.getId());
		Boletin boletin = srvInforme.getBoletinCicloInforme(informe.getBecado(), informe.getCicloActual());
		resul.put("boletin", boletin);
		resul.put("datosEstimadosCheck", informe.getDatosEstimadosCheck());
		resul.put("incluirBoletinCheck", informe.getIncluirBoletinCheck());
		return forward("/informeCesacion/correccionInformeCesacion", resul);
	}

	/**
	 * @return
	 */
	@RequestMapping("/informeCesacion/listaInformesCorreccion.do")
	public ModelAndView listaInformesCorreccion(@RequestParam (required=false, value= "mensaje") String mensaje){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("informes", srvInformeC.obtenerCorreccion());
		if(StringUtils.isNotBlank(mensaje)){
			resul.put("mensaje", mensaje);
		}
		return forward("/informeCesacion/listaInformesCesacionCorreccion", resul);
	}
	
	/**
	 * @param informeCesacion
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping("/informeCesacion/actualizarInformeCorrectora.do")
	public ModelAndView actualizarInformeCorrectora(HttpServletRequest req,
												    @ModelAttribute("informe") InformeCesacion informeCesacion, 
													@RequestParam("accion") String accion) 
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		ModelAndView modelAndView = null;
		String mensaje = EXITO_MSJ;
		if(accion.equals(ACCION_SUPERVISAR)){
			//Si la correctora selecciona revisar se guarda en estado revision y se le informa el exito.
			informeCesacion.setEstado(EstadoInforme.SUPERVISOR);
			informeCesacion.setFechaUltimaModificacion(new Date());
			informeCesacion.setFechaCambioUltimoEstado(new Date());
					
		}else if(accion.equals(ACCION_FINALIZAR)){
			//Si la correctora selecciona finalizar, se guarda en estado Finalizado y se informa el exito. 
			
			String datosFaltantes = validarCamposObligatoriosInforme(informeCesacion);
			if(StringUtils.isNotBlank(datosFaltantes))
			{
				mensaje = FALTAN_DATOS_MSJ + datosFaltantes;
				resul.put("mensaje", mensaje);
			}
			else
			{
				informeCesacion.setEstado(EstadoInforme.FINALIZADO);
				informeCesacion.setFechaUltimaModificacion(new Date());
				informeCesacion.setFechaCambioUltimoEstado(new Date());
				resul.put("mensaje", EXITO_MSJ);
			}
		}
		if(!informeCesacion.getEstado().equals(EstadoInforme.ENVIADO))
		{	
			Integer edad = Formateador.calcularEdad(informeCesacion.getBecado().getDatosPersonales().getFechaNacimiento());
			informeCesacion.setEdad(edad);		
		}
		informeCesacion.setFechaUltimaModificacion(new Date());
		Persona personaLogeada = this.obtenerPersona(req);
		if(personaLogeada != null && personaLogeada.getPerfilCorrector() == true)
			informeCesacion.setCorrectora(personaLogeada.getApellido() + " " + personaLogeada.getNombre());
		informeCesacion.setFechaReincorporacionPBE(informeCesacion.getBecado().getFechaReincorporacionPBE());
		srvInformeC.guardarInformeCesacion(informeCesacion);
		modelAndView = new ModelAndView("redirect:/informes/listaInformesCorreccion.do", resul);
		return modelAndView;
		
		
	}
	
	
	private String validarCamposObligatoriosInforme(InformeCesacion informe)
	{
		StringBuffer datosFaltantes = new StringBuffer();
		String edad;	
		
		if(informe.getCicloActual() == null)
			datosFaltantes.append( "ciclo lectivo; ");
		
		if(informe.getBecado().getFechaPBE() == null)
			datosFaltantes.append("fecha de incorporación al pbe; ");
		
		if(informe.getBecado().getDatosPersonales().getFechaNacimiento() == null)
			datosFaltantes.append("fecha de nacimiento; ");
		
		edad = String.valueOf(informe.getEdad());
		datosFaltantes.append(StringUtils.isBlank(edad)  ? "edad; " : "");
		datosFaltantes.append(StringUtils.isBlank( informe.getBecado().getDatosPersonales().getNombre())  ? "nombre del alumno; " : "");
		datosFaltantes.append(StringUtils.isBlank( informe.getBecado().getDatosPersonales().getApellido())  ? "apellido del alumno; " : "");
		
		if(informe.getBecado().getEscuela() == null)
			datosFaltantes.append("institución educativa; ");
		
		if(informe.getBecado().getEscuela().getLocalidad() == null)
			datosFaltantes.append("localidad donde vive; ");
		
		if(informe.getBecado().getAnioEscolar() == null)
			datosFaltantes.append("año que cursa; ");
		
		if(informe.getBecado().getResponsable1() == null)
		{
			datosFaltantes.append("responsable adulto");
		}
		
		
		datosFaltantes.append(StringUtils.isBlank( informe.getBecado().getResponsable1().getNombre())  ? "nombre del RA; " : "");
		datosFaltantes.append(StringUtils.isBlank( informe.getBecado().getResponsable1().getApellido())  ? "apellido del RA; " : "");
		
			
		if(informe.getPadrino() == null)
			datosFaltantes.append("padrino; ");
		
		if(informe.getPadrino().getEmpresa() != null)
			datosFaltantes.append(StringUtils.isBlank( informe.getPadrino().getEmpresa().getDenominacion())  ? "empresa; " : "");
		else if (informe.getPadrino().getDatosPersonales() != null)
		{
			datosFaltantes.append(StringUtils.isBlank( informe.getPadrino().getDatosPersonales().getNombre())  ? "nombre del padrino; "  : "");
			datosFaltantes.append(StringUtils.isBlank( informe.getPadrino().getDatosPersonales().getApellido())  ? "apellido del padrino; "  : "");
		}
		return datosFaltantes.toString();
	}
	
	/**
	 * @param idInforme
	 * @return
	 */
	@RequestMapping("/informeCesacion/verInformeCesacionSupervisorView.do")
	public ModelAndView verInformeCesacionSupervisor(@RequestParam ("idInformeCesacion") Long idInforme)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		InformeCesacion informe = srvInformeC.obtenerInformeCesacion(idInforme);
		if(!informe.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(informe.getBecado().getDatosPersonales().getFechaNacimiento());
			informe.setEdad(edad);	
			srvInformeC.guardarInformeCesacion(informe);
		}
		resul.put("informe", informe);
		resul.put("conductas", EnumPBE.getEnumPBE());
		resul.put("esfuerzos", Esfuerzo.getEsfuerzo());
		resul.put("asistenciaBecados", EnumPBE.getEnumPBE());
		resul.put("asistenciaRAs", EnumPBE.getEnumPBE());
		resul.put("presentacionMateriales", EnumPBE.getEnumPBE());
	    resul.put("compromisoEscolaridades", Compromiso.getCompromiso());
	    resul.put("compromisoEscolaridadesPBE", Compromiso.getCompromiso());
	    resul.put("compromisosRa", Compromiso.getCompromiso());
	    resul.put("compromisosRaPBE", Compromiso.getCompromiso());
		resul.put("urlInforme", "../informeCesacion/verInformeCesacionSupervisorView.do?idInformeCesacion=" + informe.getId());
		Boletin boletin = srvInforme.getBoletinCicloInforme(informe.getBecado(), informe.getCicloActual());
		resul.put("boletin", boletin);
		resul.put("datosEstimadosCheck", informe.getDatosEstimadosCheck());
		resul.put("incluirBoletinCheck", informe.getIncluirBoletinCheck());
		return forward("/informeCesacion/supervisionInformeCesacion", resul);
	}
	
	
	/**
	 * @return
	 */
	@RequestMapping("/informeCesacion/listaInformesSupervisor.do")
	public ModelAndView listaInformesSupervisor(@RequestParam (required=false, value= "mensaje") String mensaje)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("informes", srvInformeC.obtenerSupervision());
		if(StringUtils.isNotBlank(mensaje)){
			resul.put("mensaje", mensaje);
		}
		return forward("/informeCesacion/listaInformesCesacionSupervisor", resul);
	}
	
	
	/**
	 * @param informeCesacion
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping("/informeCesacion/actualizarInformeSupervisor.do")
	public ModelAndView actualizarInformeSupervisor(HttpServletRequest request,
													@ModelAttribute("informe") InformeCesacion informeCesacion,
													@RequestParam("accion") String accion) 
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		PerfilRR perfilRR = getPerfilRR(request);
		List<Informe> informes = new ArrayList<Informe>();
		ModelAndView modelAndView = new ModelAndView("redirect:/informes/listaInformesSupervision.do");
		String mensaje = EXITO_MSJ;
		if(!informeCesacion.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(informeCesacion.getBecado().getDatosPersonales().getFechaNacimiento());
			informeCesacion.setEdad(edad);		
		}
		informeCesacion.setFechaReincorporacionPBE(informeCesacion.getBecado().getFechaReincorporacionPBE());
		if(accion.equals(ACCION_REVISAR)){
			//Si el supervisor selecciona revisar se guarda en estado Revision y se le informa el exito.
			informeCesacion.setEstado(EstadoInforme.CONSTRUCCION);
			informeCesacion.setFechaUltimaModificacion(new Date());
			informeCesacion.setFechaCambioUltimoEstado(new Date());
			srvInformeC.guardarInformeCesacion(informeCesacion);
			informes = srvInforme.obtenerInformesConstruccionPorEA(informeCesacion.getEaPerfil());
			informes.addAll(srvInformeC.obtenerRevisionPorEA(informeCesacion.getEaPerfil()));
			informes.removeAll(srvInformeC.obtenerSupervisionPorRR(perfilRR));
			resul.put("mensaje", mensaje);
			resul.put("informes", informes);
			return modelAndView;
					
		}else if(accion.equals(ACCION_CORREGIR)){
			//Si el supervisor selecciona corregir, se guarda en estado Correctora y se informa el exito. 
			
			informeCesacion.setEstado(EstadoInforme.CORRECTORA);
			informeCesacion.setFechaUltimaModificacion(new Date());
			informeCesacion.setFechaCambioUltimoEstado(new Date());
			srvInformeC.guardarInformeCesacion(informeCesacion);
			informes = srvInforme.obtenerInformesARevisar(perfilRR);
			resul.put("mensaje", mensaje);
			resul.put("informes", informes);
			return modelAndView;
			
		}
		
		informeCesacion.setFechaUltimaModificacion(new Date());
		srvInformeC.guardarInformeCesacion(informeCesacion);
		informes = srvInforme.obtenerInformesASupervisarYRevisar(perfilRR);
		resul.put("mensaje", mensaje);
		resul.put("informes", informes);
		return modelAndView;
	}


	/**
	 * @return
	 */
	@RequestMapping("/informeCesacion/listaInformesRevision.do")
	public ModelAndView listaInformesRevision(@RequestParam (required=false, value= "mensaje") String mensaje){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("informes", srvInformeC.obtenerRevision());
		if(StringUtils.isNotBlank(mensaje)){
			resul.put("mensaje", mensaje);
		}
		return forward("/informeCesacion/listaInformesCesacionRevision", resul);
	}


	/**
	 * @param idInforme
	 * @return
	 */
	@RequestMapping("/informeCesacion/verInformeCesacionRevisionView.do")
	public ModelAndView verInformeCesacionRevision(@RequestParam ("idInformeCesacion") Long idInforme)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		InformeCesacion informe = srvInformeC.obtenerInformeCesacion(idInforme);
		if(!informe.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(informe.getBecado().getDatosPersonales().getFechaNacimiento());
			informe.setEdad(edad);		
			srvInformeC.guardarInformeCesacion(informe);
		}
		resul.put("informe", informe);
		resul.put("conductas", EnumPBE.getEnumPBE());
		resul.put("esfuerzos", Esfuerzo.getEsfuerzo());
		resul.put("asistenciaBecados", EnumPBE.getEnumPBE());
		resul.put("asistenciaRAs", EnumPBE.getEnumPBE());
		resul.put("presentacionMateriales", EnumPBE.getEnumPBE());
	    resul.put("compromisoEscolaridades", Compromiso.getCompromiso());
	    resul.put("compromisoEscolaridadesPBE", Compromiso.getCompromiso());
	    resul.put("compromisosRa", Compromiso.getCompromiso());
	    resul.put("compromisosRaPBE", Compromiso.getCompromiso());
	    resul.put("urlInforme", "../informeCesacion/verInformeCesacionRevisionView.do?idInformeCesacion=" + informe.getId());
		Boletin boletin = srvInforme.getBoletinCicloInforme(informe.getBecado(), informe.getCicloActual());
	    resul.put("boletin", boletin);
		resul.put("datosEstimadosCheck", informe.getDatosEstimadosCheck());
		resul.put("incluirBoletinCheck", informe.getIncluirBoletinCheck());
		resul.put("materiasAprobadas", informe.getMateriasAprobadas());
		resul.put("materiasDesaprobadas", informe.getMateriasDesaprobadas());
		resul.put("inasistencias", informe.getInasistencias());
		resul.put("obsBoletin", informe.getObsBoletin());
		return forward("/informeCesacion/revisionInformeCesacion", resul);
	}
	
	/**
	 * @param informeCesacion
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping("/informeCesacion/actualizarInformeRevision.do")
	public ModelAndView actualizarInformeRevision(HttpServletRequest req,
												@ModelAttribute("informe") InformeCesacion informeCesacion, 
												@RequestParam(required=false, value="incluirBoletinCheck") Boolean incluirBoletinCheck,
												@RequestParam(required=false, value="datosEstimadosCheck") Boolean datosEstimadosCheck,
												@RequestParam(required=false, value="materiasAprobadas") Integer materiasAprobadas,
												@RequestParam(required=false, value="materiasDesaprobadas") Integer materiasDesaprobadas,
												@RequestParam(required=false, value="inasistencias") Float inasistencias,
												@RequestParam(required=false, value="obsBoletin") String obsBoletin,
											  	@RequestParam("accion") String accion) throws ParseException, IOException 
	{
		String mensaje = EXITO_MSJ;
		Map<String, Object> resul = new HashMap<String, Object>();
		ModelAndView model = null;
		List<Informe> informes = new ArrayList<Informe>();
		PerfilEA ea = this.getPerfilEA(req);
		if(!informeCesacion.getEstado().equals(EstadoInforme.ENVIADO))
		{	
			Integer edad = Formateador.calcularEdad(informeCesacion.getBecado().getDatosPersonales().getFechaNacimiento());
			informeCesacion.setEdad(edad);		
		}
		informeCesacion.setFechaUltimaModificacion(new Date());
		
		//incluir boletin
		if(incluirBoletinCheck != null)
		{	
			informeCesacion.setIncluirBoletinCheck(true);
		}
		else
			informeCesacion.setIncluirBoletinCheck(false);
		
		//incluir datos estimados de boletin
		if(datosEstimadosCheck != null)
		{	
			informeCesacion.setDatosEstimadosCheck(true);
			informeCesacion.setMateriasAprobadas(materiasAprobadas);
			informeCesacion.setMateriasDesaprobadas(materiasDesaprobadas);
			informeCesacion.setInasistencias(inasistencias);
			informeCesacion.setObsBoletin(obsBoletin);
		}
		else
			informeCesacion.setDatosEstimadosCheck(false);
		informeCesacion.setFechaReincorporacionPBE(informeCesacion.getBecado().getFechaReincorporacionPBE());
		if(accion.equals(ACCION_FINALIZAR))
		{
			informeCesacion.setEstado(EstadoInforme.FINALIZADO);
			informeCesacion.setFechaCambioUltimoEstado(new Date());
			srvInformeC.guardarInformeCesacion(informeCesacion);
			resul.put("informes", srvInforme.obtenerInformesARevisar(informeCesacion.getRrPerfil()));
			return model = new ModelAndView("redirect:/informes/listaInformesConstruccion.do", resul);
		}		

		srvInformeC.guardarInformeCesacion(informeCesacion);
		if(ea != null){
			informes = srvInforme.obtenerInformesConstruccionPorEA(ea);
			informes.addAll(srvInformeC.obtenerRevisionPorEA(ea));
		}
		resul.put("mensaje", mensaje);
		resul.put("informes", informes);
		return model = new ModelAndView("redirect:/informes/listaInformesConstruccion.do", resul);
			
	}

	/**
	 * @param idInforme
	 * @return
	 */
	@RequestMapping("/informeCesacion/verInformeCesacionDIView.do")
	public ModelAndView verInformeCesacionDI(@RequestParam ("idInformeCesacion") Long idInforme,
			@RequestParam(required=false, value="valorPerfil") String valorPerfil)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		InformeCesacion informe = srvInformeC.obtenerInformeCesacion(idInforme);
		if(!informe.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(informe.getBecado().getDatosPersonales().getFechaNacimiento());
			informe.setEdad(edad);
		}

		srvInformeC.guardarInformeCesacion(informe);
		resul.put("informe", informe);
		resul.put("conductas", EnumPBE.getEnumPBE());
		resul.put("esfuerzos", Esfuerzo.getEsfuerzo());
		resul.put("asistenciaBecados", EnumPBE.getEnumPBE());
		resul.put("asistenciaRAs", EnumPBE.getEnumPBE());
		resul.put("presentacionMateriales", EnumPBE.getEnumPBE());
	    resul.put("compromisoEscolaridades", Compromiso.getCompromiso());
	    resul.put("compromisoEscolaridadesPBE", Compromiso.getCompromiso());
	    resul.put("compromisosRa", Compromiso.getCompromiso());
	    resul.put("compromisosRaPBE", Compromiso.getCompromiso());
		resul.put("materiasAprobadas", informe.getMateriasAprobadas());
		resul.put("materiasDesaprobadas", informe.getMateriasDesaprobadas());
		resul.put("inasistencias", informe.getInasistencias());
		resul.put("obsBoletin", informe.getObsBoletin());
		resul.put("urlInforme", "../informeCesacion/verInformeCesacionCorrectoraView.do?idInformeCesacion=" + informe.getId());
		Boletin boletin = srvInforme.getBoletinCicloInforme(informe.getBecado(), informe.getCicloActual());
		resul.put("boletin", boletin);
		resul.put("datosEstimadosCheck", informe.getDatosEstimadosCheck());
		resul.put("incluirBoletinCheck", informe.getIncluirBoletinCheck());
		resul.put("valorPerfil", valorPerfil);
		resul.put("estadoConstruccion", EstadoInforme.CONSTRUCCION.getValor());
		resul.put("estadoFinalizado", EstadoInforme.FINALIZADO.getValor());
		return forward("/informeCesacion/actualizacionInformeCesacion", resul);
	}
	
	/**
	 * @param informeCesacion
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping("/informeCesacion/actualizarInformeFinalizado.do")
	public ModelAndView actualizarInformeFinalizado(HttpServletRequest req,
												@ModelAttribute("informe") InformeCesacion informeCesacion, 
												@RequestParam(required=false, value="incluirBoletinCheck") Boolean incluirBoletinCheck,
												@RequestParam(required=false, value="datosEstimadosCheck") Boolean datosEstimadosCheck,
												@RequestParam(required=false, value="materiasAprobadas") Integer materiasAprobadas,
												@RequestParam(required=false, value="materiasDesaprobadas") Integer materiasDesaprobadas,
												@RequestParam(required=false, value="inasistencias") Float inasistencias,
												@RequestParam(required=false, value="obsBoletin") String obsBoletin,
											  	@RequestParam("accion") String accion) throws ParseException, IOException 
	{
		String mensaje = "";
		Map<String, Object> resul = new HashMap<String, Object>();
		ModelAndView model = null;
		List<Informe> informes = new ArrayList<Informe>();
		if(!informeCesacion.getEstado().equals(EstadoInforme.ENVIADO))
		{	
			Integer edad = Formateador.calcularEdad(informeCesacion.getBecado().getDatosPersonales().getFechaNacimiento());
			informeCesacion.setEdad(edad);		
		}
		informeCesacion.setFechaUltimaModificacion(new Date());
		
		//incluir boletin
		if(incluirBoletinCheck != null)
		{	
			informeCesacion.setIncluirBoletinCheck(true);
		}
		else
			informeCesacion.setIncluirBoletinCheck(false);
		
		//incluir datos estimados de boletin
		if(datosEstimadosCheck != null)
		{	
			informeCesacion.setDatosEstimadosCheck(true);
			informeCesacion.setMateriasAprobadas(materiasAprobadas);
			informeCesacion.setMateriasDesaprobadas(materiasDesaprobadas);
			informeCesacion.setInasistencias(inasistencias);
			informeCesacion.setObsBoletin(obsBoletin);
		}
		else
			informeCesacion.setDatosEstimadosCheck(false);
		informeCesacion.setFechaCambioUltimoEstado(new Date());		
		if(accion.equals(ACCION_REVISAR)){
			informeCesacion.setEstado(EstadoInforme.CONSTRUCCION);		
			mensaje = "El Informe de Cesación del becado " + informeCesacion.getBecado().getDatosPersonales().getApellidoNombre() + 
				" ha sido guardado en Construcción";
		}
		else{
			informeCesacion.setEstado(EstadoInforme.FINALIZADO);
			mensaje = "El Informe de Cesación del becado " + informeCesacion.getBecado().getDatosPersonales().getApellidoNombre() + 
				" ha sido Finalizado";
		}
		informeCesacion.setFechaReincorporacionPBE(informeCesacion.getBecado().getFechaReincorporacionPBE());
		srvInformeC.guardarInformeCesacion(informeCesacion);
		
		resul.put("mensaje", mensaje);
		resul.put("informes", informes);
		return model = new ModelAndView("redirect:/reporteGeneralInformes/verReporteGeneralInformes.do", resul);
			
	}
	
	@RequestMapping("/informeCesacion/eliminarIC.do")
	public ModelAndView eliminarIC(@RequestParam ("idIC") Long idIC, @RequestParam ("urlRegreso") String urlRegreso){
		ModelAndView modelAndView = new ModelAndView("redirect:/reporteGeneralInformes/verReporteGeneralInformes.do");
		String mensaje = "";
		String error = "";
		InformeCesacion informeIC = srvInformeC.obtenerInformeCesacion(idIC);
		if(!informeIC.getEstado().equals(EstadoInforme.ENVIADO)){
			srvInformeC.eliminarInformeCesacion(informeIC);
			mensaje = "El Informe de Cesación del becado " + informeIC.getBecado().getDatosPersonales().getApellidoNombre() + 
					" ha sido eliminado";
		}
		else
			error = "El Informe de Cesación del becado " + informeIC.getBecado().getDatosPersonales().getApellidoNombre() + 
				" no se puede eliminar porque el mismo ya ha sido enviada al padrino";
		
		if(StringUtils.isNotBlank(mensaje))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?mensaje=" + mensaje);
		if(StringUtils.isNotBlank(error))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?error=" + error);
		
		return modelAndView;
	}
	
	@InitBinder
	protected void initBinder(HttpServletRequest request,ServletRequestDataBinder binder) throws Exception 
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		if (binder.getTarget()!=null && !binder.getTarget().equals("")) 
		{
			binder.setDisallowedFields(new String[] { "becado.id", "beca.id", "cicloActual.id", "padrino.id", "esfuerzo", "compromisoEscolaridad", "compromisoRa",
													  "asistenciaBecadoAEntrevista", "presentacionMaterial", "compromisoEscolaridadPBE",
													  "asistenciaRAEntrevista", "compromisoRaPBE", "motivoCesacion", "conducta", "fechaAlta"});
			if ((binder.getTarget() instanceof InformeCesacion)) 
			{
				InformeCesacion informe = (InformeCesacion) binder.getTarget();	
				Long idAlum = null;
				Long idBeca = null;
				Integer idEsfuerzo = null;
				Long idCicloActual = null;
				Long idPadrino = null;
				Integer idCompromisoEsc = null;
				Integer idCompromisoRa = null;
				Integer idAsisBecado = null;
				Integer idPres = null;
				Integer idCompromisoEscPBE = null;
				Integer idAsisRa = null;
				Integer idCompromisoRaPBE = null;
				String motivoCesacion = null;
				Integer idConducta = null;
				String fecha = null;
				try 
				{
					idAlum = Long.parseLong(request.getParameter("becado.id"));
					idBeca = Long.parseLong(request.getParameter("beca.id"));
					idEsfuerzo = StringUtils.isNotBlank(request.getParameter("esfuerzo"))? Integer.parseInt(request.getParameter("esfuerzo")) :  null;
					idCompromisoEsc = StringUtils.isNotBlank(request.getParameter("compromisoEscolaridad"))? Integer.parseInt(request.getParameter("compromisoEscolaridad")) :  null;
					idCompromisoRa = StringUtils.isNotBlank(request.getParameter("compromisoRa"))? Integer.parseInt(request.getParameter("compromisoRa")) :  null;
					idAsisBecado = StringUtils.isNotBlank(request.getParameter("asistenciaBecadoAEntrevista"))? Integer.parseInt(request.getParameter("asistenciaBecadoAEntrevista")) :  null;
					idPres = StringUtils.isNotBlank(request.getParameter("presentacionMaterial"))? Integer.parseInt(request.getParameter("presentacionMaterial")) :  null;
					idCompromisoEscPBE = StringUtils.isNotBlank(request.getParameter("compromisoEscolaridadPBE"))? Integer.parseInt(request.getParameter("compromisoEscolaridadPBE")) :  null;
					idAsisRa = StringUtils.isNotBlank(request.getParameter("asistenciaRAEntrevista"))? Integer.parseInt(request.getParameter("asistenciaRAEntrevista")) :  null;
					idCompromisoRaPBE = StringUtils.isNotBlank(request.getParameter("compromisoRaPBE"))? Integer.parseInt(request.getParameter("compromisoRaPBE")) :  null;
					motivoCesacion = request.getParameter("motivoCesacion");
					idConducta = StringUtils.isNotBlank(request.getParameter("conducta"))? Integer.parseInt(request.getParameter("conducta")) :  null;
					idCicloActual = Long.parseLong(request.getParameter("cicloActual.id"));
					idPadrino = Long.parseLong(request.getParameter("padrino.id"));
					fecha = request.getParameter("fechaAlta");
				} 
				catch (Exception e) 
				{
				
				}
				if(fecha!= null)
				{
					Date fechaAlta = Formateador.parsearFecha(fecha);
					informe.setFechaAlta(fechaAlta);
				}
				if(idAlum != null)
				{
					PerfilAlumno becado = srvBecado.obtenerAlumno(idAlum);
					informe.setBecado(becado);
				}
				if(idBeca != null)
				{
					Beca beca = srvBeca.obtenerPorId(idBeca);
					informe.setBeca(beca);
				}
				if(idEsfuerzo != null)
				{
					Esfuerzo esfuerzo = Esfuerzo.getEsfuerzo(idEsfuerzo);
					informe.setEsfuerzo(esfuerzo);
				}
				if(idCompromisoEsc != null)
				{
					Compromiso compromisoEscolar = Compromiso.getCompromiso(idCompromisoEsc);
					informe.setCompromisoEscolaridad(compromisoEscolar);
				}
				if(idCompromisoRa != null)
				{
					Compromiso compromisoRa = Compromiso.getCompromiso(idCompromisoRa);
					informe.setCompromisoRa(compromisoRa);
				}
				if(idAsisBecado != null)
				{
					EnumPBE asisBecado = EnumPBE.getEnumPBE(idAsisBecado);
					informe.setAsistenciaBecadoAEntrevista(asisBecado);
				}
				if(idPres != null)
				{
					EnumPBE presentacionMaterial = EnumPBE.getEnumPBE(idPres);
					informe.setPresentacionMaterial(presentacionMaterial);
				}
				if(idCompromisoEscPBE != null)
				{
					Compromiso compromisoEscPBE = Compromiso.getCompromiso(idCompromisoEscPBE);
					informe.setCompromisoEscolaridadPBE(compromisoEscPBE);
				}
				if(idAsisRa != null)
				{
					EnumPBE asisRaPBE = EnumPBE.getEnumPBE(idAsisRa);
					informe.setAsistenciaRAEntrevista(asisRaPBE);
				}
				if(idCompromisoRaPBE != null)
				{
					Compromiso compRaPBE =Compromiso.getCompromiso(idCompromisoRaPBE);
					informe.setCompromisoRaPBE(compRaPBE);
				}
				if(StringUtils.isNotBlank(motivoCesacion))
				{
					informe.setMotivoCesacion(motivoCesacion);
				}
				if(idConducta != null)
				{
					EnumPBE conducta = EnumPBE.getEnumPBE(idConducta);
					informe.setConducta(conducta);
				}
				if(idCicloActual != null)
				{
					CicloPrograma ciclo = srvCiclo.obtenerCiclo(idCicloActual);
					informe.setCicloActual(ciclo);
				}
				if(idPadrino != null)
				{
					PerfilPadrino padrino = srvPadrino.obtenerPorId(idPadrino);
					informe.setPadrino(padrino);
				}
			}
			}
		}
}