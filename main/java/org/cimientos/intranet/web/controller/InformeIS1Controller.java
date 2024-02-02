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
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.informe.InformeIS1;
import org.cimientos.intranet.modelo.perfil.AlumnoPanelEA;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.servicio.AlumnoPanelEASrv;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.BecaSvr;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.InformeIS1Srv;
import org.cimientos.intranet.servicio.InformeSrv;
import org.cimientos.intranet.servicio.PerfilEASrv;
import org.cimientos.intranet.servicio.PerfilPadrinoSvr;
import org.cimientos.intranet.servicio.PerfilRRSrv;
import org.cimientos.intranet.utils.ConstantesPaneles;
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
import com.cimientos.intranet.enumerativos.SituacionEscolarMergeada;


@Controller
@RequestMapping("/informeIS1/*")
public class InformeIS1Controller extends BaseController
{

	@Autowired
	private InformeIS1Srv srvInformeIS1;
	
	@Autowired
	private InformeSrv srvInforme;
	
	@Autowired
	private AlumnoSrv srvAlumno;
	
	@Autowired
	private BecaSvr srvBeca;
	
	@Autowired
	private CicloProgramaSrv srvCiclo;
	
	@Autowired
	private PerfilPadrinoSvr srvPadrino;
	
	@Autowired
	private PerfilEASrv srvEa;
	
	@Autowired
	private PerfilRRSrv srvRr;
	
	@Autowired
	private AlumnoPanelEASrv alumnoPanelEaSrv;
	
	private static final String ACCION_REVISAR = "revisar";
	private static final String ACCION_SUPERVISAR = "supervisar";
	private static final String ACCION_FINALIZAR = "finalizar";
	private static final String ACCION_CORREGIR = "corregir";
	private static final String EXITO_MSJ = "La acción se ha realizado con éxito.";
	private static final String FALTAN_DATOS_MSJ = "Faltan los siguientes datos obligatorios: ";
	
	/**
	 * @param idInforme
	 * @return
	 */
	@RequestMapping("/informeIS1/verInformeIS1CorrectoraView.do")
	public ModelAndView verInformeIS1Correctora(@RequestParam ("idInformeIS1") Long idInforme)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		List<SituacionEscolarMergeada> situacionesEscolares = new ArrayList<SituacionEscolarMergeada>();
		InformeIS1 informe = srvInformeIS1.obtenerInformeIS1(idInforme);
		List<SituacionEscolarMergeada> situaciones = SituacionEscolarMergeada.getSituacionEscolar();
		if(situaciones.contains(informe.getSituacion()))
		{
			for (int i = 0; i <= (situaciones.size() - 1); i++) 
			{
				if(!situaciones.get(i).equals(informe.getSituacion()))
				{	
					situacionesEscolares.add(situaciones.get(i));
				}
			}
		}
		if(!informe.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(informe.getBecado().getDatosPersonales().getFechaNacimiento());
			informe.setEdad(edad);
			srvInformeIS1.guardarInformeIS1(informe);
		}
		resul.put("informe", informe);
		resul.put("boletin", informe.getBoletinAnioAnterior());
		resul.put("situacionEscolar", informe.getSituacion());
	    resul.put("situaciones", situacionesEscolares);
		resul.put("urlInforme", "../informeIS1/verInformeIS1CorrectoraView.do?idInformeIS1=" + informe.getId());
		return forward("/informeIS1/correccionInformeIS1", resul);
	}

	/**
	 * @return
	 */
	@RequestMapping("/informeIS1/listaInformesCorreccion.do")
	public ModelAndView listaInformesCorreccion(@RequestParam (required=false, value= "mensaje") String mensaje){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("informes", srvInformeIS1.obtenerCorreccion());
		if(StringUtils.isNotBlank(mensaje)){
			resul.put("mensaje", mensaje);
		}
		return forward("/informeIS1/listaInformesIS1Correccion", resul);
	}
	
	/**
	 * @param informeIS1
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping("/informeIS1/actualizarInformeCorrectora.do")
	public ModelAndView actualizarInformeCorrectora(HttpServletRequest req,
												    @ModelAttribute("informe") InformeIS1 informeIS1, 
													@RequestParam("accion") String accion) 
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		ModelAndView modelAndView = null;
		String mensaje = null;
		informeIS1.setFechaCambioUltimoEstado(new Date());
		if(accion.equals(ACCION_SUPERVISAR)){
			//Si la correctora selecciona revisar se guarda en estado revision y se le informa el exito.
			informeIS1.setEstado(EstadoInforme.SUPERVISOR);
			informeIS1.setFechaUltimaModificacion(new Date());
			informeIS1.setFechaCambioUltimoEstado(new Date());
					
		}else if(accion.equals(ACCION_FINALIZAR)){
			//Si la correctora selecciona finalizar, se guarda en estado Finalizado y se informa el exito. 
			String datosFaltantes = validarCamposObligatoriosInforme(informeIS1);
			if(StringUtils.isNotBlank(datosFaltantes))
			{
				mensaje = FALTAN_DATOS_MSJ + datosFaltantes;
				resul.put("mensaje", mensaje);
			}
			else
			{
				informeIS1.setEstado(EstadoInforme.FINALIZADO);
				informeIS1.setFechaUltimaModificacion(new Date());
				informeIS1.setFechaCambioUltimoEstado(new Date());
				resul.put("mensaje", EXITO_MSJ);
			}
			
		}
		if(!informeIS1.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(informeIS1.getBecado().getDatosPersonales().getFechaNacimiento());
			informeIS1.setEdad(edad);
		}
		informeIS1.setFechaUltimaModificacion(new Date());
		Persona personaLogeada = this.obtenerPersona(req);
		if(personaLogeada != null && personaLogeada.getPerfilCorrector() == true)
			informeIS1.setCorrectora(personaLogeada.getApellido() + " " + personaLogeada.getNombre());
		informeIS1.setFechaCambioUltimoEstado(new Date());
		srvInformeIS1.guardarInformeIS1(informeIS1);
		modelAndView = new ModelAndView("redirect:/informes/listaInformesCorreccion.do", resul);
		return modelAndView;
		
		
	}
	
	private String validarCamposObligatoriosInforme(InformeIS1 informe)
	{
		StringBuffer datosFaltantes = new StringBuffer();
		String edad;	
		informe.setFechaCambioUltimoEstado(new Date());
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
	@RequestMapping("/informeIS1/verInformeIS1SupervisorView.do")
	public ModelAndView verInformeIS1Supervisor(@RequestParam ("idInformeIS1") Long idInforme)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		List<SituacionEscolarMergeada> situacionesEscolares = new ArrayList<SituacionEscolarMergeada>();
		InformeIS1 informe = srvInformeIS1.obtenerInformeIS1(idInforme);
		List<SituacionEscolarMergeada> situaciones = SituacionEscolarMergeada.getSituacionEscolar();
		if(situaciones.contains(informe.getSituacion()))
		{
			for (int i = 0; i <= (situaciones.size() - 1); i++) 
			{
				if(!situaciones.get(i).equals(informe.getSituacion()))
				{	
					situacionesEscolares.add(situaciones.get(i));
				}
			}
		}
		if(!informe.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(informe.getBecado().getDatosPersonales().getFechaNacimiento());
			informe.setEdad(edad);
			srvInformeIS1.guardarInformeIS1(informe);
		}
		resul.put("informe", informe);
		resul.put("boletin", informe.getBoletinAnioAnterior());
		resul.put("situacionEscolar", informe.getSituacion());
	    resul.put("situaciones", situacionesEscolares);
		resul.put("estadoInformeRevision", EstadoInforme.REVISION.getValor());	
		resul.put("urlInforme", "../informeIS1/verInformeIS1SupervisorView.do?idInformeIS1=" + informe.getId());
		return forward("/informeIS1/supervisionInformeIS1", resul);
	}
	
	
	/**
	 * @return
	 */
	@RequestMapping("/informeIS1/listaInformesSupervisor.do")
	public ModelAndView listaInformesSupervisor(@RequestParam (required=false, value= "mensaje") String mensaje)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("informes", srvInformeIS1.obtenerSupervisor());
		if(StringUtils.isNotBlank(mensaje)){
			resul.put("mensaje", mensaje);
		}
		return forward("/informeIS1/listaInformesIS1Supervisor", resul);
	}
	
	
	/**
	 * @param informeIS1
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping("/informeIS1/actualizarInformeSupervisor.do")
	public ModelAndView actualizarInformeSupervisor(HttpServletRequest request,
													@ModelAttribute("informe") InformeIS1 informeIS1,
													@RequestParam("accion") String accion) 
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		PerfilRR perfilRR = getPerfilRR(request);
		List<Informe> informes = new ArrayList<Informe>();
		ModelAndView modelAndView = new ModelAndView("redirect:/informes/listaInformesSupervision.do");
		String mensaje = EXITO_MSJ;
		informeIS1.setFechaCambioUltimoEstado(new Date());
		if(!informeIS1.getEstado().equals(EstadoInforme.ENVIADO))
		{	
			Integer edad = Formateador.calcularEdad(informeIS1.getBecado().getDatosPersonales().getFechaNacimiento());
			informeIS1.setEdad(edad);
		}
		if(accion.equals(ACCION_REVISAR)){
			//Si el supervisor selecciona revisar se guarda en estado Revision y se le informa el exito.
			informeIS1.setEstado(EstadoInforme.CONSTRUCCION);
			informeIS1.setFechaUltimaModificacion(new Date());
			informeIS1.setFechaCambioUltimoEstado(new Date());
			informeIS1.setFechaUltimaModificacion(new Date());
			srvInformeIS1.guardarInformeIS1(informeIS1);
			informes = srvInforme.obtenerInformesConstruccionPorEA(informeIS1.getEaPerfil());
			informes.addAll(srvInformeIS1.obtenerRevisionPorEA(informeIS1.getEaPerfil()));
			informes.removeAll(srvInformeIS1.obtenerSupervisionPorRR(perfilRR));
			resul.put("mensaje", mensaje);
			resul.put("informes", informes);
			return modelAndView;
					
		}else if(accion.equals(ACCION_CORREGIR)){
			//Si el supervisor selecciona corregir, se guarda en estado Correctora y se informa el exito. 
			
			informeIS1.setEstado(EstadoInforme.CORRECTORA);
			informeIS1.setFechaUltimaModificacion(new Date());
			informeIS1.setFechaCambioUltimoEstado(new Date());
			informeIS1.setFechaUltimaModificacion(new Date());
			srvInformeIS1.guardarInformeIS1(informeIS1);
			informes = srvInforme.obtenerInformesARevisar(perfilRR);
			resul.put("mensaje", mensaje);
			resul.put("informes", informes);
			return modelAndView;
			
		}
		informeIS1.setFechaUltimaModificacion(new Date());
		informeIS1.setFechaCambioUltimoEstado(new Date());
		srvInformeIS1.guardarInformeIS1(informeIS1);
		informes = srvInforme.obtenerInformesASupervisarYRevisar(perfilRR);
		resul.put("mensaje", mensaje);
		resul.put("informes", informes);
		return modelAndView;
	}


	/**
	 * @return
	 */
	@RequestMapping("/informeIS1/listaInformesRevision.do")
	public ModelAndView listaInformesRevision(@RequestParam (required=false, value= "mensaje") String mensaje){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("informes", srvInformeIS1.obtenerRevision());
		if(StringUtils.isNotBlank(mensaje)){
			resul.put("mensaje", mensaje);
		}
		return forward("/informeIS1/listaInformesIS1Revision", resul);
	}


	/**
	 * @param idInforme
	 * @return
	 */
	@RequestMapping("/informeIS1/verInformeIS1RevisionView.do")
	public ModelAndView verInformeIS1Revision(@RequestParam ("idInformeIS1") Long idInforme,
											  @RequestParam (required=false, value="urlRegreso") String urlRegreso)
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		List<SituacionEscolarMergeada> situacionesEscolares = new ArrayList<SituacionEscolarMergeada>();
		InformeIS1 informe = srvInformeIS1.obtenerInformeIS1(idInforme);
		List<SituacionEscolarMergeada> situaciones = SituacionEscolarMergeada.getSituacionEscolar();
		if(situaciones.contains(informe.getSituacion()))
		{
			for (int i = 0; i <= (situaciones.size() - 1); i++) 
			{
				if(!situaciones.get(i).equals(informe.getSituacion()))
				{	
					situacionesEscolares.add(situaciones.get(i));
				}
			}
		}
		if(!informe.getEstado().equals(EstadoInforme.ENVIADO))
		{
			Integer edad = Formateador.calcularEdad(informe.getBecado().getDatosPersonales().getFechaNacimiento());
			informe.setEdad(edad);
			srvInformeIS1.guardarInformeIS1(informe);
		}
		resul.put("informe", informe);
		resul.put("boletin", informe.getBoletinAnioAnterior());
		resul.put("situacionEscolar", informe.getSituacion());
	    resul.put("situaciones", situacionesEscolares);
	    resul.put("urlInforme", urlRegreso);
		return forward("/informeIS1/revisionInformeIS1", resul);
	}
	
	/**
	 * @param informeIS1
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping("/informeIS1/actualizarInformeRevision.do")
	public ModelAndView actualizarInformeRevision(HttpServletRequest req,
			@RequestParam("id") Long idIS1, 
			@RequestParam("propositoAnioComienza") String propositoAnioComienza,
			@RequestParam("observacionesExcepcion") String observacionesExcepcion,
			@RequestParam("actividadesVacaciones") String gustosTiempoLibreString,
			@RequestParam(required=false, value = "urlInforme") String urlRegreso) throws ParseException, IOException{
		Map<String, Object> resul = new HashMap<String, Object>();
		InformeIS1 informeIS1 = srvInformeIS1.obtenerInformeIS1(idIS1);
		informeIS1.setFechaCambioUltimoEstado(new Date());
		informeIS1.setPropositoAnioComienza(propositoAnioComienza);
		informeIS1.setObservacionesExcepcion(observacionesExcepcion);
		informeIS1.setActividadesVacaciones(gustosTiempoLibreString);
		if(!informeIS1.getEstado().equals(EstadoInforme.ENVIADO)){
			Integer edad = Formateador.calcularEdad(informeIS1.getBecado().getDatosPersonales().getFechaNacimiento());
			informeIS1.setEdad(edad);
		}		
		if(informeIS1.getFp() != null && informeIS1.getFp().getFpPorReasignacion()){
			if(informeIS1.getFp().getEstado().equals(EstadoInforme.ENVIADO)){
				informeIS1.setFechaCambioUltimoEstado(new Date());
				informeIS1.setEstado(EstadoInforme.FINALIZADO);
				resul.put("mensaje", "El Informe de Seguimiento Nº1 del becado " + informeIS1.getBecado().getDatosPersonales().getApellidoNombre() + 
							" ha sido Finalizado");
			}
			else{
				resul.put("error", "No se puede finalizar el Informe de Seguimiento Nº 1 del becado " +
						informeIS1.getBecado().getDatosPersonales().getApellidoNombre() + " porque la Ficha de Presentación asociada no ha sido " +
						"enviada aún al padrino");
			}
		}
		else{
			informeIS1.setFechaCambioUltimoEstado(new Date());
			informeIS1.setEstado(EstadoInforme.FINALIZADO);
			resul.put("mensaje", "El Informe de Seguimiento Nº1 del becado " + informeIS1.getBecado().getDatosPersonales().getApellidoNombre() + 
						" ha sido Finalizado");
		}
		informeIS1.setFechaUltimaModificacion(new Date());
		informeIS1.setFechaCambioUltimoEstado(new Date());
		srvInformeIS1.guardarInformeIS1(informeIS1);
		if(StringUtils.isNotBlank(urlRegreso)){
			return new ModelAndView("redirect:" + urlRegreso, resul);
		}
		else{
			return new ModelAndView("redirect:/informes/listaInformesConstruccion.do", resul);
		}			
	}

	/**
	 * @return
	 */
	@RequestMapping("/informeIS1/listaInformesEnviables.do")
	public ModelAndView listaInformesSinEnviar(){
		Map<String, Object> resul = new HashMap<String, Object>();
		resul.put("informes", srvInformeIS1.obtenerInformesAEnviar());
		return forward("/informeIS1/listaInformesIS1AEnviar", resul);
	}
	
	@RequestMapping("/informeIS1/verInformeIS1.do")
	public ModelAndView verInforme(@RequestParam ("idAlumno") Long idAlumno,
								   @RequestParam ( required= false, value= "urlInforme") String urlInforme){

		InformeIS1 informe = srvInformeIS1.obtenerInformePorAlumno(idAlumno,srvCiclo.obtenerCicloActual());
		if(informe.getEstado().equals(EstadoInforme.CONSTRUCCION)){
			String urlRegreso = "redirect:/entrevistas/listarBecados.do";
			return  verInformeIS1Revision(informe.getId(), urlRegreso);
		}
		else{
			Map<String, Object> resul =  new HashMap<String, Object>(); 
			if(!informe.getEstado().equals(EstadoInforme.ENVIADO))
			{
				Integer edad = Formateador.calcularEdad(informe.getBecado().getDatosPersonales().getFechaNacimiento());
				informe.setEdad(edad);
			}
			srvInformeIS1.guardarInformeIS1(informe);
			resul.put("informe", informe);
			resul.put("boletin", informe.getBoletinAnioAnterior());
			resul.put("estadoInformeRevision", EstadoInforme.REVISION.getValor());	
			resul.put("urlInformeReporte", "../reporteGeneralInformes/verInforme.do?idInforme=" + informe.getId());
			return forward("/informeIS1/verIS1", resul);
		}
	}
	
	private Map<String, Object> cargarDatosCorreccion(Long idAlumno, InformeIS1 informeIS1){
	
		Map<String, Object> resul = new HashMap<String, Object>();
		List<SituacionEscolarMergeada> situacionesEscolares = new ArrayList<SituacionEscolarMergeada>();
		List<SituacionEscolarMergeada> situaciones = SituacionEscolarMergeada.getSituacionEscolar();
		if(situaciones.contains(informeIS1.getSituacion()))
		{
			for (int i = 0; i <= (situaciones.size() - 1); i++) 
			{
				if(!situaciones.get(i).equals(informeIS1.getSituacion()))
				{	
					situacionesEscolares.add(situaciones.get(i));
				}
			}
		}
		Integer edad = Formateador.calcularEdad(informeIS1.getBecado().getDatosPersonales().getFechaNacimiento());
		informeIS1.setEdad(edad);
		informeIS1.setAnioEgreso(informeIS1.getAnioEgreso());
		srvInformeIS1.guardarInformeIS1(informeIS1);
		resul.put("informe", informeIS1);
		resul.put("boletin", informeIS1.getBoletinAnioAnterior());
		resul.put("situacionEscolar", informeIS1.getSituacion());
	    resul.put("situaciones", situacionesEscolares);
		resul.put("estadoInformeRevision", EstadoInforme.REVISION.getValor());
	   	return resul;
	
	}
	
	@RequestMapping("/informeIS1/verInformeIS1General.do")
	public ModelAndView verInformeIS1(@RequestParam ("idInformeIS1") Long idInforme){

		InformeIS1 informe = srvInformeIS1.obtenerInformeIS1(idInforme);
		Map<String, Object> resul = cargarDatosCorreccion(informe.getBecado().getId(), informe);
		
		return forward("/informeIS1/verIS1", resul);
		
	}
	
	
	@RequestMapping("/informeIS1/modificarView.do")
	public ModelAndView modificarView(@RequestParam ("idInformeIS1") Long idInforme,
			  @RequestParam(required=false, value="accion") String accion,
			  @RequestParam(required=false, value="valorPerfil") String valorPerfil){

		InformeIS1 informe = srvInformeIS1.obtenerInformeIS1(idInforme);
		Map<String, Object> resul = cargarDatosCorreccion(informe.getBecado().getId(), informe);
		resul.put("estadoInformeEnviado", EstadoInforme.ENVIADO.getValor());	
		resul.put("urlInforme", "/reporteGeneralInformes/verReporteGeneralInformes.do");
		
		return forward("/informeIS1/revisionInformeIS1", resul);
		
	}
	
	@RequestMapping("/informeIS1/eliminarIS1.do")
	public ModelAndView eliminarIS1(@RequestParam ("idIS1") Long idIS1, @RequestParam ("urlRegreso") String urlRegreso){
		ModelAndView modelAndView = new ModelAndView("redirect:/reporteGeneralInformes/verReporteGeneralInformes.do");
		String mensaje = "";
		String error = "";
		InformeIS1 informeIS1 = srvInformeIS1.obtenerInformeIS1(idIS1);
		informeIS1.setFechaCambioUltimoEstado(new Date());
		if(!informeIS1.getEstado().equals(EstadoInforme.ENVIADO)){
			CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
			boolean infoCicloActual = true;
			if(!cicloActual.equals(informeIS1.getCicloActual())){
				infoCicloActual = false;
			}
			if(infoCicloActual){
				srvInformeIS1.eliminarInformeIS1(informeIS1);
				AlumnoPanelEA ape = alumnoPanelEaSrv.obtenerAlumnoPanelPorIdPerfilAlumno(informeIS1.getBecado().getId());
				if(ape != null){
					ape.setColorIS1(ConstantesPaneles.RED);					
					alumnoPanelEaSrv.modificarAlumnoPanelEA(ape);
				}
			}
			else{
				srvInformeIS1.eliminarInformeIS1(informeIS1);
			}
			mensaje = "El Informe de Seguimiento Nº1 del becado " + informeIS1.getBecado().getDatosPersonales().getApellidoNombre() + 
					" ha sido eliminado";
		}
		else
			error = "El Informe de Seguimiento Nº1 del becado " + informeIS1.getBecado().getDatosPersonales().getApellidoNombre() + 
				" no se puede eliminar porque el mismo ya ha sido enviada al padrino";
		
		if(StringUtils.isNotBlank(mensaje))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?mensaje=" + mensaje);
		if(StringUtils.isNotBlank(error))
			modelAndView = new ModelAndView("redirect:" + urlRegreso + "?error=" + error);
		
		return modelAndView;
	}
	
	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
			
		   // custom date binding
		   SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		   binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		    
		if (binder.getTarget()!=null && !binder.getTarget().equals("")) 
		{
			binder.setDisallowedFields(new String[] { "eaPerfil.idPerfilEA", "rrPerfil.idPerfilRR", "becado.id", "beca.id", "padrino.id","situacionEscolar", "cicloActual.id", "fechaCambioUltimoEstado", "fechaAlta"});
			if ((binder.getTarget() instanceof InformeIS1)) 
			{
				
				InformeIS1 informe = (InformeIS1) binder.getTarget();	
				Long idAlum = null;
				Long idBeca = null;
				Integer idSituacion = null;
				Long idCicloActual = null;
				Long idPadrino = null;
				String fechaUltimo = null;
				Long idPerfilEa = null;
				Long idPerfilRr = null;
				String fecha = null;
				try 
				{
					idAlum = Long.parseLong(request.getParameter("becado.id"));
					idBeca = Long.parseLong(request.getParameter("beca.id"));
					idPerfilEa = Long.parseLong(request.getParameter("eaPerfil.idPerfilEA"));
					idPerfilRr = Long.parseLong(request.getParameter("rrPerfil.idPerfilRR"));
					idSituacion = Integer.parseInt(request.getParameter("situacionEscolar"));
					idCicloActual = Long.parseLong(request.getParameter("cicloActual.id"));
					idPadrino = Long.parseLong(request.getParameter("padrino.id"));
					fechaUltimo = request.getParameter("fechaCambioUltimoEstado");
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
				if(idPerfilEa != null)
				{
					PerfilEA ea = srvEa.obtenerPerfilEA(idPerfilEa);
					informe.setEaPerfil(ea);
				}
				if(idPerfilRr != null)
				{
					PerfilRR rr = srvRr.obtenerPerfilRR(idPerfilRr);
					informe.setRrPerfil(rr);
				}
				if(fechaUltimo != null)
				{
					Date fechaUltimoCambioEstado = Formateador.parsearFecha(fechaUltimo);
					informe.setFechaCambioUltimoEstado(fechaUltimoCambioEstado);
				}
				if(idBeca != null)
				{
					Beca beca = srvBeca.obtenerPorId(idBeca);
					informe.setBeca(beca);
				}
				if(idAlum != null)
				{
					PerfilAlumno becado = srvAlumno.obtenerAlumno(idAlum);
					informe.setBecado(becado);
				}
				if(idSituacion != null)
				{
//					SituacionEscolar situacion = SituacionEscolar.getSituacionEscolar(idSituacion);
					SituacionEscolarMergeada situacion = SituacionEscolarMergeada.getSituacionEscolar(idSituacion);
					informe.setSituacion(situacion);
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