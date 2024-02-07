package org.cimientos.intranet.web.controller;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dto.InformeCesacionDTO;
import org.cimientos.intranet.dto.InformeFPDTO;
import org.cimientos.intranet.dto.InformeIS2DTO;
import org.cimientos.intranet.dto.InformeIS3DTO;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.FichaFamiliar;
import org.cimientos.intranet.modelo.Materia;
import org.cimientos.intranet.modelo.NotaMateria;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.Texto;
import org.cimientos.intranet.modelo.Trimestre;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.informe.ComunicadoNoRenovacion;
import org.cimientos.intranet.modelo.informe.ComunicadoPendiente;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.FichaPresentacion;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.informe.InformeCesacion;
import org.cimientos.intranet.modelo.informe.InformeIS1;
import org.cimientos.intranet.modelo.informe.InformeIS2;
import org.cimientos.intranet.modelo.informe.InformeIS3;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.cimientos.intranet.modelo.perfilPadrino.TipoPadrino;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.seleccion.BoletinSeleccion;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.BecaSvr;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.ComunicadoNoRenovacionSrv;
import org.cimientos.intranet.servicio.ComunicadoPendienteSrv;
import org.cimientos.intranet.servicio.EscuelaSrv;
import org.cimientos.intranet.servicio.InformeSrv;
import org.cimientos.intranet.servicio.MateriaSrv;
import org.cimientos.intranet.servicio.PeriodoSrv;
import org.cimientos.intranet.servicio.TextoSrv;
import org.cimientos.intranet.utils.ConstantesInformes;
import org.cimientos.intranet.utils.ConstantesMenu;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.utils.FormateadorMail;
import org.cimientos.intranet.utils.InformeUtils;
import org.cimientos.intranet.utils.MailService;
import org.cimientos.intranet.utils.paginacion.ExtendedPaginatedList;
import org.cimientos.intranet.utils.paginacion.PaginateListFactory;
import org.displaytag.tags.TableTagParameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.cimientos.intranet.dto.FichaFamiliarDTO;
import com.cimientos.intranet.dto.MateriaDTO;
import com.cimientos.intranet.enumerativos.CalificacionMateria;
import com.cimientos.intranet.enumerativos.Convive;
import com.cimientos.intranet.enumerativos.EspacioApoyo;
import com.cimientos.intranet.enumerativos.ModalidadTrabajoEscuela;
import com.cimientos.intranet.enumerativos.entrevista.GustosTiempoLibre;
import com.cimientos.intranet.enumerativos.entrevista.MotivoNoRenovacion;
import com.cimientos.intranet.enumerativos.entrevista.MotivoPendiente;
import com.cimientos.intranet.enumerativos.entrevista.PropositoAnioComienza;

@Controller
@RequestMapping("/envioInformes/*")
public class EnvioInformeController extends BaseController
{
	
	@Autowired
	private InformeSrv srvInforme;
	
	@Autowired
	private MailService mailsService;
	
	@Autowired
	private BecaSvr srvBeca;
	
	@Autowired 
	private ComunicadoNoRenovacionSrv srvNoRenovacion;
	
	@Autowired
	private ComunicadoPendienteSrv srvPendiente;
	
	@Autowired
	private PaginateListFactory paginateListFactory;
	
	@Autowired
	private CicloProgramaSrv cicloSrv;
	
	@Autowired
	private PeriodoSrv srvPeriodo;
	
	@Autowired
	private EscuelaSrv srvEscuela;
	
	@Autowired
	private AlumnoSrv srvAlumno;

	@Autowired
	private MateriaSrv srvMateria;
	
	@Autowired
	private TextoSrv srvTexto;
		
	@Autowired
	private CicloProgramaSrv srvCiclo;
	
	private static final String MSG_EXITO_INFORMES = "El/los informe/s se envio/aron exitosamente";
	private static final String MSG_EXITO_COMUNICADOS = "El/los comunicado/s se envio exitosamente";
	private static final String MSG_ERROR_GRAL = "Por alg�n motivo no se pudo enviar el informe";
	private static final String MSG_ERROR_TEXTO_PADRINO = "No se pudo enviar el informe porque no existe cargado el mensaje del mail para el padrino";
	private static final String MSG_ERROR_MAIL = "Se ha producido un error en la conexi�n del servicio de email";
	private static final String MSG_DATOS_ESTIMADOS_BOLETIN_PARTE1 = "Hasta el momento no se cuenta con la informaci�n del bolet�n, pero se estima que ";
	private static final String MSG_DATOS_ESTIMADOS_BOLETIN_PARTE2 = " tiene ";
	private static final String MSG_DATOS_ESTIMADOS_BOLETIN_PARTE3 = " materia/s aprobada/s y ";
	private static final String MSG_DATOS_ESTIMADOS_BOLETIN_PARTE4 = " materia/s desaprobada/s. \n";
	private static final String MSG_DATOS_ESTIMADOS_BOLETIN_PARTE5 = "Respecto de la asistencia a clases, se estima que tiene ";
	private static final String MSG_DATOS_ESTIMADOS_BOLETIN_PARTE6 = " inasistencia/s. \n";
	private static final String MSG_ESCUELA_PARTE1 = "El Programa se desarrolla en un contexto complejo ya que en dicha escuela los indicadores de repitencia oscilan entre el ";
	private static final String MSG_ESCUELA_PARTE2 = " y ";
	private static final String MSG_ESCUELA_PARTE3 = "%, y los de abandono entre el ";
	private static final String MSG_ESCUELA_PARTE4 = "%.";
	
	private static final String PATH_SUBREPORTES = "WEB-INF/jasperTemplates/compile";


	@RequestMapping("/envioInformes/listaInformes.do")
	public ModelAndView listaInformesSinEnviar(HttpServletRequest req,
			@RequestParam(required= false, value="padrino") String padrino,
			@RequestParam(required= false, value="zona") String zona,
			@RequestParam(required= false, value="idZona") Long idZona,
			@RequestParam(required= false, value="tipoInforme") String tipoInforme,
			@RequestParam(required= false, value="estadoInforme") String estadoInforme,
			@RequestParam(required= false, value="idEstadoInforme") Long idEstadoInforme,
			@RequestParam(required= false, value="idPadrino") Long padrinoId,
			@RequestParam(required= false, value="cicloId") String cicloId) throws ParseException{
		Map<String, Object> resul = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		session.setAttribute("menu", ConstantesMenu.menuDI);
		
		Long zonaId = idZona != null && idZona.equals(0L) ? null : idZona;
		Long estadoInformeId = idEstadoInforme != null && idEstadoInforme.equals(0L) ? null : idEstadoInforme;
		String informeTipo = tipoInforme != null && tipoInforme.equals("0") ? null : tipoInforme;
		Long idCiclo = null;
		if(StringUtils.isNotBlank(cicloId)){
			idCiclo = Long.parseLong(cicloId);
		}else {
			idCiclo = cicloSrv.obtenerCicloActual().getId();
			cicloId = idCiclo.toString();
		}		
		
		boolean export = req.getParameter(TableTagParameters.PARAMETER_EXPORTING) != null;
		ExtendedPaginatedList listaCuentasPaginadas = null;
		listaCuentasPaginadas = paginarInformePadrinos(true,export,req, padrinoId, zonaId, estadoInformeId, informeTipo,idCiclo);
        WebUtils.setSessionAttribute(req, "informes", listaCuentasPaginadas);
		resul.put("informes", listaCuentasPaginadas);
		
        resul.put("ciclos", cicloSrv.obtenerCiclosConvocatoriaDesde("2012"));
		resul.put("cicloId", cicloId);
        resul.put("padrino", padrino);
        resul.put("idZona", zonaId);
        resul.put("zona", zona);
        resul.put("tiposInforme", InformeUtils.getTipoInformes());
        resul.put("tipoInforme", tipoInforme);
        resul.put("estadoInforme", EstadoInforme.getListaEstadosGrilla());
        resul.put("idEstadoInforme", idEstadoInforme);
        resul.put("idPadrino", padrinoId);
		
		return forward("/envioInformes/listaEnvioInformes", resul);
	}
	
	@RequestMapping("/envioInformes/listaInformesCorporativos.do")
	public ModelAndView listaInformesSinEnviarPadrinosCorporativos(HttpServletRequest req,
			@RequestParam(required= false, value="padrino") String padrino,
			@RequestParam(required= false, value="zona") String zona,
			@RequestParam(required= false, value="idZona") Long idZona,
			@RequestParam(required= false, value="tipoInforme") String tipoInforme,
			@RequestParam(required= false, value="estadoInforme") String estadoInforme,
			@RequestParam(required= false, value="idEstadoInforme") Long idEstadoInforme,
			@RequestParam(required= false, value="idPadrino") Long padrinoId,
			@RequestParam(required= false, value="cicloId") String cicloId) throws ParseException
	{
		Map<String, Object> resul = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		session.setAttribute("menu", ConstantesMenu.menuDI);
		
		Long zonaId = idZona != null && idZona.equals(0L) ? null : idZona;
		Long estadoInformeId = idEstadoInforme != null && idEstadoInforme.equals(0L) ? null : idEstadoInforme;
		String informeTipo = tipoInforme != null && tipoInforme.equals("0") ? null : tipoInforme;
		Long idCiclo = null;
		if(StringUtils.isNotBlank(cicloId)){
			idCiclo = Long.parseLong(cicloId);
		}else {
			idCiclo = cicloSrv.obtenerCicloActual().getId();
			cicloId = idCiclo.toString();
		}
		
		boolean export = req.getParameter(TableTagParameters.PARAMETER_EXPORTING) != null;
		ExtendedPaginatedList listaCuentasPaginadas = null;
		listaCuentasPaginadas = paginarInformePadrinos(false,export,req,padrinoId, zonaId, estadoInformeId, informeTipo,idCiclo);
        WebUtils.setSessionAttribute(req, "informes", listaCuentasPaginadas);
		resul.put("informes", listaCuentasPaginadas);
        resul.put("ciclos", cicloSrv.obtenerCiclosConvocatoriaDesde("2012"));
		resul.put("cicloId", cicloId);
        resul.put("padrino", padrino);
        resul.put("idZona", zonaId);
        resul.put("zona", zona);
        resul.put("tiposInforme", InformeUtils.getTipoInformes());
        resul.put("tipoInforme", tipoInforme);
        resul.put("estadoInforme", EstadoInforme.getListaEstadosGrilla());
        resul.put("idEstadoInforme", idEstadoInforme);
        resul.put("idPadrino", padrinoId);
		
		return forward("/envioInformes/listaEnvioInformesCorporativos", resul);
	}
	
	
	/**
	 * @param request
	 * @param export
	 * @return ExtendedPaginatedList
	 * @throws ParseException 
	 * @author esalvador
	 * @param estadoInformeId 
	 * @param tipoInformeId 
	 * @param zonaId 
	 * @param padrinoId 
	 * @param idCiclo 
	 */
	private ExtendedPaginatedList paginarInformePadrinos(boolean esIndividual, boolean export, HttpServletRequest request, Long padrinoId, Long zonaId, Long estadoInformeId, String tipoInforme, Long idCiclo) throws ParseException {
		
		List<EnvioInformeDTO> informeDTO = null;
		
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		int totalRowsIndividuales;
		int totalRowsCorporativos;
		CicloPrograma ciclo = null;
		if (!idCiclo.equals(0L)) {
			ciclo = cicloSrv.obtenerCiclo(idCiclo);
		}
		//Si es un export debo cargar toda la lista entera, si no lo es entonces se carga la lista de a una pagina por vez
		if(export)
		{
			if (esIndividual) 
			{
				totalRowsIndividuales = srvInforme.obtenerCantInformesPadrinosFiltradasAExportar(true, padrinoId, zonaId, estadoInformeId, tipoInforme,ciclo);
				informeDTO = srvInforme.obtenerInformesAEnviarAPadrinosFiltradosIndividuales(padrinoId, zonaId, estadoInformeId, tipoInforme,ciclo, 0, totalRowsIndividuales, listaPaginada.getSortDirection(), listaPaginada.getSortCriterion());
				listaPaginada.setTotalNumberOfRows(totalRowsIndividuales);
			}else
			{
				totalRowsCorporativos = srvInforme.obtenerCantInformesPadrinosFiltradasAExportar(false, padrinoId, zonaId, estadoInformeId, tipoInforme,ciclo);
				informeDTO = srvInforme.obtenerInformesAEnviarAPadrinosFiltradosCorporativos(padrinoId, zonaId, estadoInformeId, tipoInforme,ciclo, 0, totalRowsCorporativos, listaPaginada.getSortDirection(), listaPaginada.getSortCriterion());
				listaPaginada.setTotalNumberOfRows(totalRowsCorporativos);
			}
		}
		else
		{
			if (esIndividual) 
			{
				totalRowsIndividuales = srvInforme.obtenerCantInformesPadrinosFiltradasAExportar(true, padrinoId, zonaId, estadoInformeId, tipoInforme,ciclo);
				informeDTO = srvInforme.obtenerInformesAEnviarAPadrinosFiltradosIndividuales(padrinoId, zonaId, estadoInformeId, tipoInforme,ciclo, listaPaginada.getFirstRecordIndex(), listaPaginada.getPageSize(),
						listaPaginada.getSortDirection(), listaPaginada.getSortCriterion());
				listaPaginada.setTotalNumberOfRows(totalRowsIndividuales);
			}else
			{
				totalRowsCorporativos = srvInforme.obtenerCantInformesPadrinosFiltradasAExportar(false, padrinoId, zonaId, estadoInformeId, tipoInforme,ciclo);
				informeDTO = srvInforme.obtenerInformesAEnviarAPadrinosFiltradosCorporativos(padrinoId, zonaId, estadoInformeId, tipoInforme,ciclo, listaPaginada.getFirstRecordIndex(), listaPaginada.getPageSize(),
						listaPaginada.getSortDirection(), listaPaginada.getSortCriterion());
				listaPaginada.setTotalNumberOfRows(totalRowsCorporativos);
			}
		}
		listaPaginada.setList(informeDTO);

		return listaPaginada;
	}	
	
	
	@RequestMapping("/envioInformes/enviar.do")
	public ModelAndView enviarInforme(@RequestParam("idBeca") Long idBeca,
									  @RequestParam("idEstado") Integer idEstado,
									  @RequestParam("nombreInforme") String nombre,
									  @RequestParam("cantidad") Long cantidad,
									  @RequestParam(required=false,value="_chk") List<Long> pagosSeleccionados,
									  HttpServletRequest request,
									  HttpServletResponse response) throws Exception 
	{
		Boolean ok = false;
		Beca beca = srvBeca.obtenerPorId(idBeca);
		EstadoInforme estado = EstadoInforme.getEstados(idEstado);
		Map<String, Object> model = new HashMap<String, Object>();
		List<Informe> informes = srvInforme.obtenerInformesAEnviar(beca, estado, nombre);
		model.put("ciclos", cicloSrv.obtenerCiclosConvocatoriaDesde("2012"));
		if(nombre.equals(ConstantesInformes.nombreInformeFP))
		{
			return esUnaFP(request, model,ok, informes, cantidad);	
		}
		if(nombre.equals(ConstantesInformes.nombreInformeIS1))
		{
			return esUnIS1(request, model, ok, informes, cantidad);
		}
		if(nombre.equals(ConstantesInformes.nombreInformeIS2))
		{
			return esUnIS2(request, model, ok, informes, cantidad);
		}
		if(nombre.equals(ConstantesInformes.nombreInformeIS3))
		{
			return esUnIS3(request, model, ok,informes, cantidad);
		}
		if(nombre.equals(ConstantesInformes.nombreInformeCesacion))
		{
			return esUnInformeCesacion(request, model, ok, informes, cantidad);
		}
		if(nombre.equals(ConstantesInformes.nombreComunicadoNoRenovacion))
		{
			return obtenerComunicadoNoRenovacion(request, model, ok, informes, cantidad);
		}
		if(nombre.equals(ConstantesInformes.nombreComunicadoPendiente))
		{
			return obtenerComunicadoPendiente(request, model, ok, informes, cantidad);
		}
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		model.put("informes", srvInforme.obtenerInformesAEnviarAPadrinosFiltradosIndividuales(null, null, null, null,cicloSrv.obtenerCicloActual(), listaPaginada.getFirstRecordIndex(), listaPaginada.getPageSize(),
				listaPaginada.getSortDirection(), listaPaginada.getSortCriterion()));
		return forward("/envioInformes/listaEnvioInformes", model);

	}

	private ModelAndView obtenerComunicadoPendiente(HttpServletRequest request, Map<String,Object> model, Boolean resultado, 
			List<Informe> informes, Long cantidad) throws Exception {
		String mensaje = "";
		String titulo = "";
//		String nombreApellidoAlumno = "";
		ComunicadoPendiente unComunicado = null;
		Persona personaLogeada = this.obtenerPersona(request);
		Persona alumno = null;
		String usuarioDi = personaLogeada.getNombre() + " " + personaLogeada.getApellido();
		Texto texto = null;
		String error = "";
		
		for (int i = 0; i < informes.size(); i++) {
			Informe informe = (Informe)informes.get(i);
			ComunicadoPendiente comunicado = (ComunicadoPendiente) informe;
			if(comunicado != null){
				unComunicado = comunicado;
				alumno = unComunicado.getBecado().getDatosPersonales();
				CicloPrograma ciclo = srvCiclo.obtenerCicloActual();
				if(comunicado.getEstado().equals(EstadoInforme.FINALIZADO) || comunicado.getEstado().equals(EstadoInforme.ENVIADO) 
						|| comunicado.getEstado().equals(EstadoInforme.NO_ENVIADO)){
					try {
						resultado = true;
						titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreComunicadoPendiente, 
								FormateadorMail.getTipoMailIndividual());
//						nombreApellidoAlumno = comunicado.getBecado().getDatosPersonales().getNombre();						
						// saco para corpo
						//if(comunicado.getPadrino().getTipo().equals(TipoPadrino.INDIVIDUAL)){
							if(comunicado.getEr().getMotivoPendiente().equals(MotivoPendiente.DEBERENDIR)){
//								mensaje = mensaje + FormateadorMail.getContenidoCpMotivo1(unComunicado.getPadrino().getDatosPersonales().getNombre(),
//									nombreApellidoAlumno, unComunicado.getBeca().getZona().getNombre(), usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoPendiente, FormateadorMail.getTipoMailIndividual(),
										MotivoPendiente.DEBERENDIR, null);
							}
							if (comunicado.getEr().getMotivoPendiente().equals(MotivoPendiente.LOCALIZAR)){
//								mensaje = mensaje + FormateadorMail.getContenidoCpMotivo2(unComunicado.getPadrino().getDatosPersonales().getNombre(),
//									nombreApellidoAlumno, unComunicado.getBeca().getZona().getNombre(), usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoPendiente, FormateadorMail.getTipoMailIndividual(),
										MotivoPendiente.LOCALIZAR, null);
							}
							if (comunicado.getEr().getMotivoPendiente().equals(MotivoPendiente.OTRO)){	
//								mensaje = mensaje + FormateadorMail.getContenidoCpMotivoOtro(unComunicado.getPadrino().getDatosPersonales().getNombre(),
//									comunicado.getEr().getMotivoOtro(), usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoPendiente, FormateadorMail.getTipoMailIndividual(),
										MotivoPendiente.OTRO, null);
							}
							String otroMotivo;
							otroMotivo=comunicado.getEr().getMotivoOtro();
							if(i == 0){
								mensaje = this.obtenerMensajePadrino(texto, informe.getPadrino().getTipo(), informe.getPadrino(), alumno, personaLogeada,  
										informe.getBeca().getZona(), otroMotivo);
							}
							else{
								if(i == informes.size()-1){
									mensaje = mensaje + "<br><br>" + this.obtenerMensajePadrino(texto, null, null, alumno, personaLogeada,  
											informe.getBeca().getZona(),otroMotivo);
								}
								else{
									mensaje = mensaje +  "<br><br>" + this.obtenerMensajePadrino(texto, null, null, alumno, personaLogeada, informe.getBeca().getZona(),otroMotivo);
								}
							}						
							if(StringUtils.isNotBlank(mensaje) && StringUtils.isNotBlank(titulo)){
								comunicado.setEstado(EstadoInforme.ENVIADO);
								srvPendiente.agregarComunicadoPendiente(comunicado);
							}
							else{
								comunicado.setEstado(EstadoInforme.NO_ENVIADO);
								resultado = false;
								error = MSG_ERROR_TEXTO_PADRINO;
							}	
						//}
					} 
					catch (Exception e) {
						resultado = false;
						e.printStackTrace();
						comunicado.setEstado(EstadoInforme.NO_ENVIADO);
						srvPendiente.agregarComunicadoPendiente(comunicado);
						error = MSG_ERROR_GRAL;
					}
				}
				else{
//					model.put("error", "No se encontraron comunicados de ese padrino");
					resultado = false;
					error = "No se encontraron comunicados de ese padrino";
				}
			}
		}
		if(unComunicado.getPadrino().getDatosPersonales() != null){
			String [] recipients = unComunicado.getPadrino().getDatosPersonales().getMail().split(";");
			Boolean result = null;
			if(resultado){
				if(mensaje != null && mensaje.contains("null")){
					String mensajeUnico = mensaje.substring(4, mensaje.length());
					result = mailsService.enviarMailSistemaSinAdjunto(titulo,mensajeUnico,resultado,recipients);
					actualizarFechaEnvioInforme(informes, result);
				}
				else{
					result = mailsService.enviarMailSistemaSinAdjunto(titulo,mensaje,resultado,recipients);
					actualizarFechaEnvioInforme(informes, result);
				}
				return irAPadrinosIndividuales(request, model, unComunicado, result, MSG_EXITO_COMUNICADOS, error);
			}			
		}else{
			String [] recipients = unComunicado.getPadrino().getEmpresa().getMailContacto1().split(";");
			Boolean result = null;
			if(resultado){
				if(mensaje != null && mensaje.contains("null")){
					String mensajeUnico = mensaje.substring(4, mensaje.length());
					result = mailsService.enviarMailSistemaSinAdjunto(titulo,mensajeUnico,resultado,recipients);
					actualizarFechaEnvioInforme(informes, result);
				}
				else{
					result = mailsService.enviarMailSistemaSinAdjunto(titulo,mensaje,resultado,recipients);
					actualizarFechaEnvioInforme(informes, result);
				}
				return irAPadrinosIndividuales(request, model, unComunicado, result, MSG_EXITO_COMUNICADOS, error);
			}		
			
			
		}
		
		return irAPadrinosIndividuales(request, model, unComunicado, resultado, MSG_EXITO_COMUNICADOS, error);
	}

	private ModelAndView irAPadrinosIndividuales(HttpServletRequest request, Map<String, Object> model, 
			ComunicadoPendiente unComunicado, Boolean result, String mensaje, String error) {
		if(result){
			unComunicado.setEstado(EstadoInforme.ENVIADO);
			srvPendiente.agregarComunicadoPendiente(unComunicado);
			model.put("mensaje", mensaje);
		}
		else{
			unComunicado.setEstado(EstadoInforme.NO_ENVIADO);
			srvPendiente.agregarComunicadoPendiente(unComunicado);
			model.put("error", error);
		}
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		model.put("informes", srvInforme.obtenerInformesAEnviarAPadrinosFiltradosIndividuales(null, null, null, null,cicloSrv.obtenerCicloActual(), listaPaginada.getFirstRecordIndex(), listaPaginada.getPageSize(),
				listaPaginada.getSortDirection(), listaPaginada.getSortCriterion()));
		model.put("tiposInforme", InformeUtils.getTipoInformes());
		model.put("estadoInforme", EstadoInforme.getListaEstadosGrilla());
		return forward("/envioInformes/listaEnvioInformes", model);
	}

	private ModelAndView irAPadrinosIndividuales(HttpServletRequest request, Map<String, Object> model, 
			Informe unInforme, Boolean result, String mensaje, String error) {
		if(result){
			unInforme.setEstado(EstadoInforme.ENVIADO);
			srvInforme.guardarInforme(unInforme);
			model.put("mensaje", mensaje);
		}
		else{
			unInforme.setEstado(EstadoInforme.NO_ENVIADO);
			srvInforme.guardarInforme(unInforme);
			model.put("error", error);
			
		}
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		model.put("informes", srvInforme.obtenerInformesAEnviarAPadrinosFiltradosIndividuales(null, null, null, null,cicloSrv.obtenerCicloActual(), listaPaginada.getFirstRecordIndex(), listaPaginada.getPageSize(),
				listaPaginada.getSortDirection(), listaPaginada.getSortCriterion()));
		model.put("tiposInforme", InformeUtils.getTipoInformes());
		model.put("estadoInforme", EstadoInforme.getListaEstadosGrilla());
		return forward("/envioInformes/listaEnvioInformes", model);
		
	}
	
	private ModelAndView irAPadrinosCorporativos(HttpServletRequest request, Map<String, Object> model,
			Informe unInforme, Boolean result, String mensaje, String error) { 
		if(result == true){
			unInforme.setEstado(EstadoInforme.ENVIADO);
			srvInforme.guardarInforme(unInforme);
			model.put("mensaje", mensaje);
		}
		else{
			unInforme.setEstado(EstadoInforme.NO_ENVIADO);
			srvInforme.guardarInforme(unInforme);
			model.put("error", error);
			
		}		
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		model.put("informes", srvInforme.obtenerInformesAEnviarAPadrinosFiltradosCorporativos(null, null, null, null,cicloSrv.obtenerCicloActual(), listaPaginada.getFirstRecordIndex(), listaPaginada.getPageSize(),
				listaPaginada.getSortDirection(), listaPaginada.getSortCriterion()));
		model.put("tiposInforme", InformeUtils.getTipoInformes());
		model.put("estadoInforme", EstadoInforme.getListaEstadosGrilla());
		return forward("/envioInformes/listaEnvioInformesCorporativos", model);
		
	}
	
	private ModelAndView obtenerComunicadoNoRenovacion(HttpServletRequest request, Map<String,Object>model, Boolean resultado, List<Informe> informes, 
			Long cantidad) throws Exception {
		String mensaje = "";
		String titulo = "";
		String error = "";
//		String nombreApellidoAlumno = "";
		ComunicadoNoRenovacion unComunicado = null;
		Persona personaLogeada = this.obtenerPersona(request);
		Persona alumno = null;
		Texto texto = null;
		String usuarioDi = personaLogeada.getNombre() + " " + personaLogeada.getApellido();
		for (int i = 0; i < informes.size(); i++) {
			Informe informe = (Informe)informes.get(i);
			ComunicadoNoRenovacion comunicado = (ComunicadoNoRenovacion) informe;
			if(comunicado != null){
				unComunicado = comunicado;
				CicloPrograma ciclo = srvCiclo.obtenerCicloActual();
				if(comunicado.getEstado().equals(EstadoInforme.FINALIZADO) || comunicado.getEstado().equals(EstadoInforme.ENVIADO)
						|| comunicado.getEstado().equals(EstadoInforme.NO_ENVIADO)){
					try {
						resultado = true;
						titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreComunicadoNoRenovacion, 
								FormateadorMail.getTipoMailIndividual());
						alumno = unComunicado.getBecado().getDatosPersonales();
//						nombreApellidoAlumno = comunicado.getBecado().getDatosPersonales().getNombre() + " ";
						// sacado para que envie a los corpo
						//if(comunicado.getPadrino().getTipo().equals(TipoPadrino.INDIVIDUAL)){
							if(comunicado.getEr().getMotivoNoRenovacion().equals(MotivoNoRenovacion.BAJOCOMPROMISO)){
//								mensaje =  FormateadorMail.getContenidoCnrMotivo1(unComunicado.getPadrino().getDatosPersonales().getNombre(), 
//										nombreApellidoAlumno, usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoNoRenovacion, FormateadorMail.getTipoMailIndividual(), null,
										MotivoNoRenovacion.BAJOCOMPROMISO);
							}
							if (comunicado.getEr().getMotivoNoRenovacion().equals(MotivoNoRenovacion.MATERIASPREVIAS)){
//								mensaje =  FormateadorMail.getContenidoCnrMotivo2(unComunicado.getPadrino().getDatosPersonales().getNombre(), 
//										nombreApellidoAlumno, usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoNoRenovacion, FormateadorMail.getTipoMailIndividual(), null,
										MotivoNoRenovacion.MATERIASPREVIAS);
							}							
							if (comunicado.getEr().getMotivoNoRenovacion().equals(MotivoNoRenovacion.CAMBIOSITUACIONECO)){
//								mensaje =  FormateadorMail.getContenidoCnrMotivo3(unComunicado.getPadrino().getDatosPersonales().getNombre(),
//										nombreApellidoAlumno, usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoNoRenovacion, FormateadorMail.getTipoMailIndividual(), null,
										MotivoNoRenovacion.CAMBIOSITUACIONECO);
							}
							if (comunicado.getEr().getMotivoNoRenovacion().equals(MotivoNoRenovacion.CAMBIOESCUELA)){
//								mensaje =  FormateadorMail.getContenidoCnrMotivo4(unComunicado.getPadrino().getDatosPersonales().getNombre(), 
//										nombreApellidoAlumno, usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoNoRenovacion, FormateadorMail.getTipoMailIndividual(), null,
										MotivoNoRenovacion.CAMBIOESCUELA);
							}
							if (comunicado.getEr().getMotivoNoRenovacion().equals(MotivoNoRenovacion.MUDANZA)){
//								mensaje =  FormateadorMail.getContenidoCnrMotivo5(unComunicado.getPadrino().getDatosPersonales().getNombre(), 
//										nombreApellidoAlumno, usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoNoRenovacion, FormateadorMail.getTipoMailIndividual(), null,
										MotivoNoRenovacion.MUDANZA);
							}
							if (comunicado.getEr().getMotivoNoRenovacion().equals(MotivoNoRenovacion.ABANDONO)){
//								mensaje =  FormateadorMail.getContenidoCnrMotivo6(unComunicado.getPadrino().getDatosPersonales().getNombre(), 
//										nombreApellidoAlumno, usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoNoRenovacion, FormateadorMail.getTipoMailIndividual(), null,
										MotivoNoRenovacion.ABANDONO);
							}
							if (comunicado.getEr().getMotivoNoRenovacion().equals(MotivoNoRenovacion.RENUNCIABECA)){
//								mensaje =  FormateadorMail.getContenidoCnrMotivo7(unComunicado.getPadrino().getDatosPersonales().getNombre(), 
//										nombreApellidoAlumno, usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoNoRenovacion, FormateadorMail.getTipoMailIndividual(), null,
										MotivoNoRenovacion.RENUNCIABECA);
							}
							/*
							if (comunicado.getEr().getMotivoNoRenovacion().equals(MotivoNoRenovacion.REPITENCIA)){
//								mensaje =  FormateadorMail.getContenidoCnrMotivo8(unComunicado.getPadrino().getDatosPersonales().getNombre(), 
//										nombreApellidoAlumno, usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoNoRenovacion, FormateadorMail.getTipoMailIndividual(), null,
										MotivoNoRenovacion.REPITENCIA);
							}
							*/
							if (comunicado.getEr().getMotivoNoRenovacion().equals(MotivoNoRenovacion.FALLECIMIENTO)){
//								mensaje =  FormateadorMail.getContenidoCnrMotivo8(unComunicado.getPadrino().getDatosPersonales().getNombre(), 
//										nombreApellidoAlumno, usuarioDi);
								texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, 
										ConstantesInformes.nombreComunicadoNoRenovacion, FormateadorMail.getTipoMailIndividual(), null,
										MotivoNoRenovacion.FALLECIMIENTO);
							}
							
							if(i == 0){
								mensaje = this.obtenerMensajePadrino(texto, informe.getPadrino().getTipo(), informe.getPadrino(), alumno, personaLogeada,  
										informe.getBeca().getZona(),"");
							}
							else{
								if(i == informes.size()-1){
									mensaje = mensaje + "<br><br>" + this.obtenerMensajePadrino(texto, null, null, alumno, personaLogeada,  
											informe.getBeca().getZona(),"");
								}
								else{
									mensaje = mensaje + "<br><br>" + this.obtenerMensajePadrino(texto, null, null, alumno, null, informe.getBeca().getZona(),"");
								}
							}
							if(StringUtils.isNotBlank(mensaje) && StringUtils.isNotBlank(titulo)){
								comunicado.setEstado(EstadoInforme.ENVIADO);
								srvNoRenovacion.agregarComunicadoNoRenovacion(comunicado);
							}
							else{
								comunicado.setEstado(EstadoInforme.NO_ENVIADO);
								resultado = false;
								error = MSG_ERROR_TEXTO_PADRINO;
							}						
						//}
					} 
					catch (Exception e) {
						resultado = false;
						e.printStackTrace();
						comunicado.setEstado(EstadoInforme.NO_ENVIADO);
						srvNoRenovacion.agregarComunicadoNoRenovacion(comunicado);
						error = MSG_ERROR_GRAL;
					}
				}
			}
		}
		//agrego para corpo
		if(unComunicado.getPadrino().getDatosPersonales() != null){	
			String [] recipients = unComunicado.getPadrino().getDatosPersonales().getMail().split(";");
			Boolean result = null;
			if(resultado){
				result = mailsService.enviarMailSistemaSinAdjunto(titulo,mensaje,resultado,recipients);
				actualizarFechaEnvioInforme(informes, result);
				return irAPadrinosIndividuales(request, model, unComunicado, result, MSG_EXITO_COMUNICADOS, error);
			}			
		}else{
			//String [] recipients = unComunicado.getPadrino().getDatosPersonales().getMail().split(";");
			String [] recipients = unComunicado.getPadrino().getEmpresa().getMailContacto1().split(";");
			Boolean result = null;
			if(resultado){
				result = mailsService.enviarMailSistemaSinAdjunto(titulo,mensaje,resultado,recipients);
				actualizarFechaEnvioInforme(informes, result);
				return irAPadrinosIndividuales(request, model, unComunicado, result, MSG_EXITO_COMUNICADOS, error);
			}
			
		}
		
		
		return irAPadrinosIndividuales(request, model, unComunicado, resultado, MSG_EXITO_COMUNICADOS, error);
	}



	private ModelAndView esUnInformeCesacion(HttpServletRequest request, Map<String,Object> model, Boolean ok, List<Informe> informes, 
			Long cantidad){
		Boolean resultado;
//		String nombreApellidoAlumno = "";
		Persona alumno = null;
		List<InformeCesacionDTO> listInformeCesacionDTO = new ArrayList<InformeCesacionDTO>();
		Persona personaLogeada = this.obtenerPersona(request);
		String usuarioDi = personaLogeada.getNombre() + " " + personaLogeada.getApellido();
		InformeCesacion informeCesacion = null;
		int i = 0;
		String mensaje = "";
//		String padrino = "";
		Texto texto = new Texto();
		String error = "";
		String titulo = "";
//		padrino = obtenerNombrePorTipoPadrino(informes, i);
		CicloPrograma ciclo = informes.get(0).getCicloActual();
		if(cantidad > 1){
		//	mensaje = FormateadorMail.getContenidoVariosIc(padrino, usuarioDi,obtenerTipoPadrino(informes, i));
			texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, ConstantesInformes.nombreInformeCesacion, 
					FormateadorMail.getTipoMailGrupal(), null, null);
		}
		for (Informe informe : informes){
			InformeCesacion informeC = (InformeCesacion) informe;
			if(informeC != null){
				informeCesacion = informeC;
//				nombreApellidoAlumno = informeCesacion.getBecado().getDatosPersonales().getNombre();
				alumno = informeCesacion.getBecado().getDatosPersonales();
				if(cantidad <= 1){
		//			mensaje = FormateadorMail.getContenidoIc(padrino, nombreApellidoAlumno, usuarioDi,obtenerTipoPadrino(informes, i));		
					texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, ConstantesInformes.nombreInformeCesacion, 
							FormateadorMail.getTipoMailIndividual(), null, null);
				}
				cargarICDTO(listInformeCesacionDTO, informeCesacion);												
			}
			i = i + 1;
		}
		try{
			mensaje = this.obtenerMensajePadrino(texto, informes.get(0).getPadrino().getTipo(), informes.get(0).getPadrino(), alumno, 
					personaLogeada,  informes.get(0).getBeca().getZona(),"");
			
			if(StringUtils.isNotBlank(mensaje)){
				Map<String,Object> parametros = new HashMap<String, Object>();
				String url = this.getServletContext().getRealPath(PATH_SUBREPORTES);			
				parametros.put("SUBREPORT_DIR", url);
				resultado = this.guardarReporteJasper("INFORME DE CESACION.pdf", "informeCesacion.jasper", ok,listInformeCesacionDTO, parametros);				
				Boolean result = null;
				if(informeCesacion.getPadrino().getDatosPersonales() != null){
					titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreInformeCesacion, 
							FormateadorMail.getTipoMailIndividual());
					if(StringUtils.isNotBlank(titulo)){
						//String mail=informeCesacion.getPadrino().getDatosPersonales().getMail()+";"+informeCesacion.getEaPerfil().getDatosPersonales().getMail();						 
						String mail=informeCesacion.getPadrino().getDatosPersonales().getMail();
						String [] recipients=mail.split(";");
						String bcc="";
						result = mailsService.enviarMailSistema(titulo,mensaje, recipients, bcc,resultado, getProps().getProperty("base.path.cesacion"));
						actualizarFechaEnvioInforme(informes, result);	
						cambiarEstadoInformesCesacion(informes,EstadoInforme.ENVIADO);
						return irAPadrinosIndividuales(request, model, informeCesacion, result, MSG_EXITO_INFORMES, MSG_ERROR_MAIL);
					}
					else{
						cambiarEstadoInformesCesacion(informes,EstadoInforme.NO_ENVIADO);
						resultado = false;
						error = MSG_ERROR_TEXTO_PADRINO;
					}
				}
				else{	
					titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreInformeCesacion, 
							FormateadorMail.getTipoMailGrupal());
					if(StringUtils.isNotBlank(titulo)){
						//String mail=informeCesacion.getPadrino().getDatosPersonales().getMail()+";"+informeCesacion.getEaPerfil().getDatosPersonales().getMail();						 
						String mail=informeCesacion.getPadrino().getEmpresa().getMailContacto1();
						String [] recipients=mail.split(";");
						String bcc="";
						result = mailsService.enviarMailSistema(titulo,mensaje, recipients, bcc,resultado, getProps().getProperty("base.path.cesacion"));
						actualizarFechaEnvioInforme(informes, result);
						cambiarEstadoInformesCesacion(informes,EstadoInforme.ENVIADO);
						return irAPadrinosCorporativos(request, model, informeCesacion, result, MSG_EXITO_INFORMES, MSG_ERROR_MAIL);
					}
					else{
						cambiarEstadoInformesCesacion(informes,EstadoInforme.NO_ENVIADO);
						resultado = false;
						error = MSG_ERROR_TEXTO_PADRINO;
					}
				}
			}
			else{
				cambiarEstadoInformesCesacion(informes,EstadoInforme.NO_ENVIADO);
				resultado = false;
				error = MSG_ERROR_TEXTO_PADRINO;
			}			
		} 
		catch (Exception e) {
			resultado = false;
			e.printStackTrace();
			cambiarEstadoInformesCesacion(informes,EstadoInforme.NO_ENVIADO);
			error = MSG_ERROR_GRAL;
		}
		
		if(informeCesacion.getPadrino().getDatosPersonales() != null){
			return irAPadrinosIndividuales(request, model, informeCesacion, resultado, MSG_EXITO_INFORMES, error);
		}
		else{
			return irAPadrinosCorporativos(request, model, informeCesacion, resultado, MSG_EXITO_INFORMES, error);
		}
	}

	private ModelAndView esUnIS3(HttpServletRequest request, Map<String,Object> model,Boolean ok, List<Informe> informes, Long cantidad){
		Boolean resultado;
//		String nombreApellidoAlumno = "";
		List<InformeIS3DTO> listInformeIS3DTO = new ArrayList<InformeIS3DTO>();
		Persona personaLogeada = this.obtenerPersona(request);
		Persona alumno = null;
		String usuarioDi = personaLogeada.getNombre() + " " + personaLogeada.getApellido();
		String mensaje = "";
		InformeIS3 unIs3 = null;
		int i = 0;
//		String padrino = "";
//		padrino = obtenerNombrePorTipoPadrino(informes, i);
		Texto texto = null; 
		String error = "";
		String titulo = "";
		CicloPrograma ciclo = informes.get(0).getCicloActual();
		if(cantidad > 1){
//			mensaje = FormateadorMail.getContenidoVariosIs3(padrino, usuarioDi,obtenerTipoPadrino(informes, i));
			texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, ConstantesInformes.nombreInformeIS3, 
					FormateadorMail.getTipoMailGrupal(), null, null);
		}
		for (Informe informe : informes) {
			InformeIS3 unInforme = (InformeIS3) informe;
			if(unInforme != null){
				unIs3 = unInforme;
//				nombreApellidoAlumno = unIs3.getBecado().getDatosPersonales().getNombre();
				alumno = unIs3.getBecado().getDatosPersonales();
				if(cantidad <= 1){
//					mensaje = FormateadorMail.getContenidoIs3(padrino, nombreApellidoAlumno, usuarioDi,obtenerTipoPadrino(informes, i));
					texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, ConstantesInformes.nombreInformeIS3,
							FormateadorMail.getTipoMailIndividual(), null, null);
				}
				cargarIS3DTO(listInformeIS3DTO, unInforme);
				
			}
			i = i + 1;
		}
		try {
			mensaje = this.obtenerMensajePadrino(texto, informes.get(0).getPadrino().getTipo(), informes.get(0).getPadrino(), alumno, 
					personaLogeada, informes.get(0).getBeca().getZona(),"");
			
			if(StringUtils.isNotBlank(mensaje)){
				Map<String,Object> parametros = new HashMap<String, Object>();
				String url = this.getServletContext().getRealPath(PATH_SUBREPORTES);			
				parametros.put("SUBREPORT_DIR", url);
				resultado = this.guardarReporteJasper("INFORME DE SEGUIMIENTO Nro 3.pdf", "nuevoIS3.jasper", ok,listInformeIS3DTO, parametros);				
				Boolean result = null;
				if(unIs3.getPadrino().getDatosPersonales() != null){
					titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreInformeIS3, 
							FormateadorMail.getTipoMailIndividual());
					if(StringUtils.isNotBlank(titulo)){
						//String mail=unIs3.getPadrino().getDatosPersonales().getMail()+";"+unIs3.getEaPerfil().getDatosPersonales().getMail();						 
						String mail=unIs3.getPadrino().getDatosPersonales().getMail();
						String [] recipients=mail.split(";");
						String bcc="";
						result = mailsService.enviarMailSistema(titulo,mensaje, recipients, bcc,resultado,getProps().getProperty("base.path.is3") );
						actualizarFechaEnvioInforme(informes, result);
						cambiarEstadoInformesIS3(informes,EstadoInforme.ENVIADO);
						return irAPadrinosIndividuales(request, model, unIs3, result, MSG_EXITO_INFORMES, MSG_ERROR_MAIL);
					}
					else{
						cambiarEstadoInformesIS3(informes,EstadoInforme.NO_ENVIADO);
						resultado = false;
						error = MSG_ERROR_TEXTO_PADRINO;
					}
				}
				else {
					titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreInformeIS3, 
							FormateadorMail.getTipoMailGrupal());
					if(StringUtils.isNotBlank(titulo)){
						//String mail=unIs3.getPadrino().getDatosPersonales().getMail()+";"+unIs3.getEaPerfil().getDatosPersonales().getMail();						 
						String mail=unIs3.getPadrino().getEmpresa().getMailContacto1();
						String [] recipients=mail.split(";");
						String bcc="";
						result = mailsService.enviarMailSistema(titulo,mensaje, recipients,bcc, resultado, getProps().getProperty("base.path.is3"));
						actualizarFechaEnvioInforme(informes, result);
						cambiarEstadoInformesIS3(informes,EstadoInforme.ENVIADO);
						return irAPadrinosCorporativos(request, model, unIs3, result, MSG_EXITO_INFORMES, MSG_ERROR_MAIL);
					}
					else{
						cambiarEstadoInformesIS3(informes,EstadoInforme.NO_ENVIADO);
						resultado = false;
						error = MSG_ERROR_TEXTO_PADRINO;
					}
				}
			}
			else{
				cambiarEstadoInformesIS3(informes,EstadoInforme.NO_ENVIADO);
				resultado = false;
				error = MSG_ERROR_TEXTO_PADRINO;
			}		
		} 
		catch (Exception e){
			resultado = false;
			e.printStackTrace();
			cambiarEstadoInformesIS3(informes,EstadoInforme.NO_ENVIADO);
			error = MSG_ERROR_GRAL;
		}
		
		if(unIs3.getPadrino().getDatosPersonales() != null){
			return irAPadrinosIndividuales(request, model, unIs3, resultado, MSG_EXITO_INFORMES, error);
		}
		else {			
			return irAPadrinosCorporativos(request, model, unIs3, resultado, MSG_EXITO_INFORMES, error);
		}
	}
	
	private ModelAndView esUnIS2(HttpServletRequest request, Map<String,Object> model,Boolean ok, List<Informe> informes, Long cantidad){
		Boolean resultado;
//		String nombreApellidoAlumno = "";
		List<InformeIS2DTO> listInformeIS2DTO = new ArrayList<InformeIS2DTO>();
		Persona personaLogeada = this.obtenerPersona(request);
		String usuarioDi = personaLogeada.getNombre() + " " + personaLogeada.getApellido();
		Persona alumno = null;
		String mensaje = "";
		InformeIS2 unIs2 = null;
		Long i = 0L;
//		String padrino = "";
//		padrino = obtenerNombrePorTipoPadrino(informes, i);
		Texto texto = null; 
		String error = "";
		String titulo = "";
		CicloPrograma ciclo = informes.get(0).getCicloActual();
		if(cantidad > 1){
//			mensaje = FormateadorMail.getContenidoVariosIs2(padrino, usuarioDi,obtenerTipoPadrino(informes, i));
			texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, ConstantesInformes.nombreInformeIS2,
					FormateadorMail.getTipoMailGrupal(), null, null);
		}
		long cantidadTotalIS2=0;
		for (Informe informe : informes) {
			
			InformeIS2 unInforme = (InformeIS2) informe;
			if(unInforme != null){
				unIs2 = unInforme;
//				nombreApellidoAlumno = unIs2.getBecado().getDatosPersonales().getNombre();
				alumno = unIs2.getBecado().getDatosPersonales();
				if(cantidad <= 1){
//					mensaje = FormateadorMail.getContenidoIs2(padrino, nombreApellidoAlumno, usuarioDi,obtenerTipoPadrino(informes, i));
					texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, ConstantesInformes.nombreInformeIS2,
							FormateadorMail.getTipoMailIndividual(), null, null);
				}
				if(unInforme.getEstado().equals(EstadoInforme.FINALIZADO) || 
						unInforme.getEstado().equals(EstadoInforme.ENVIADO) ||
						unInforme.getEstado().equals(EstadoInforme.NO_ENVIADO)){
					unInforme.setCantidadBecadosIS2(i+1);
					cantidadTotalIS2=cantidadTotalIS2+1;
					cargarIS2DTO(listInformeIS2DTO, unInforme,cantidadTotalIS2);
					
					
				}
			}
			i = i + 1;
			
		}
		
		try{
			mensaje = this.obtenerMensajePadrino(texto, informes.get(0).getPadrino().getTipo(), informes.get(0).getPadrino(), alumno, 
					personaLogeada, informes.get(0).getBeca().getZona(),"");
			
			if(StringUtils.isNotBlank(mensaje)){
				Map<String,Object> parametros = new HashMap<String, Object>();			
				String url = this.getServletContext().getRealPath(PATH_SUBREPORTES);			
				parametros.put("SUBREPORT_DIR", url);
				resultado = this.guardarReporteJasper("INFORME DE SEGUIMIENTO Nro 2.pdf", "nuevoIS2.jasper", ok,listInformeIS2DTO, parametros);			
				Boolean result = null;
				if(unIs2.getPadrino().getDatosPersonales() != null){
					titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreInformeIS2, 
							FormateadorMail.getTipoMailIndividual());
					if(StringUtils.isNotBlank(titulo)){
						//String mail=unIs2.getPadrino().getDatosPersonales().getMail()+";"+unIs2.getEaPerfil().getDatosPersonales().getMail();						 
						String mail=unIs2.getPadrino().getDatosPersonales().getMail();
						String [] recipients=mail.split(";");
						String bcc="";
						result = mailsService.enviarMailSistema(titulo,mensaje, recipients, bcc,resultado, getProps().getProperty("base.path.is2"));
						actualizarFechaEnvioInforme(informes, result);	
						cambiarEstadoInformesIS2(informes,EstadoInforme.ENVIADO);
						return irAPadrinosIndividuales(request, model, unIs2, result, MSG_EXITO_INFORMES, MSG_ERROR_MAIL);
					}
					else{
						cambiarEstadoInformesIS2(informes,EstadoInforme.NO_ENVIADO);
						resultado = false;
						error = MSG_ERROR_TEXTO_PADRINO;
					}	
				}
				else{
					titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreInformeIS2, 
							FormateadorMail.getTipoMailGrupal());
					if(StringUtils.isNotBlank(titulo)){
						//String mail=unIs2.getPadrino().getDatosPersonales().getMail()+";"+unIs2.getEaPerfil().getDatosPersonales().getMail();						 
						String mail=unIs2.getPadrino().getEmpresa().getMailContacto1();
						String [] recipients=mail.split(";");
						String bcc="";
						result = mailsService.enviarMailSistema(titulo,mensaje, recipients, bcc,resultado, getProps().getProperty("base.path.is2"));
						actualizarFechaEnvioInforme(informes, result);
						cambiarEstadoInformesIS2(informes,EstadoInforme.ENVIADO);
						return irAPadrinosCorporativos(request, model, unIs2, result, MSG_EXITO_INFORMES, MSG_ERROR_MAIL);
					}
					else{
						cambiarEstadoInformesIS2(informes,EstadoInforme.NO_ENVIADO);
						resultado = false;
						error = MSG_ERROR_TEXTO_PADRINO;
					}
				}
			}
			else{
				cambiarEstadoInformesIS2(informes,EstadoInforme.NO_ENVIADO);
				resultado = false;
				error = MSG_ERROR_TEXTO_PADRINO;
			}	
		} 
		catch (Exception e){
			resultado = false;
			e.printStackTrace();
			cambiarEstadoInformesIS2(informes,EstadoInforme.NO_ENVIADO);
			error = MSG_ERROR_GRAL;
		}
		
		if(unIs2.getPadrino().getDatosPersonales() != null){
			return irAPadrinosIndividuales(request, model, unIs2, resultado, MSG_EXITO_INFORMES, error);
		}
		else{
			return irAPadrinosCorporativos(request, model, unIs2, resultado, MSG_EXITO_INFORMES, error);
		}
	}

	private ModelAndView esUnIS1(HttpServletRequest request, Map<String,Object> model, Boolean ok, List<Informe> informes, Long cantidad){
		Boolean resultado;
//		String nombreApellidoAlumno = "";
		List<InformeIS1DTO> listInformeIS1DTO = new ArrayList<InformeIS1DTO>();
		InformeIS1 unIs1 = null;
		String mensaje = "";
		int i = 0;
//		String padrino = "";
		Persona personaLogeada = this.obtenerPersona(request);
		Persona alumno = null;
		String usuarioDi = personaLogeada.getNombre() + " " + personaLogeada.getApellido();
//		padrino = obtenerNombrePorTipoPadrino(informes, i);
		Texto texto = null; 
		String error = "";
		String titulo = "";
		CicloPrograma ciclo = informes.get(0).getCicloActual();
		if(cantidad > 1){
//			mensaje = FormateadorMail.getContenidoVariosIs1(padrino, usuarioDi,obtenerTipoPadrino(informes, i));
			texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, ConstantesInformes.nombreInformeIS1,
					FormateadorMail.getTipoMailGrupal(), null, null);
		}

		for (Informe informe : informes){
			InformeIS1 unInforme = (InformeIS1) informe;
			if(unInforme != null){
				unIs1 = unInforme;
//				nombreApellidoAlumno = unIs1.getBecado().getDatosPersonales().getNombre();
				alumno = unIs1.getBecado().getDatosPersonales();
				if(cantidad <= 1){
//					mensaje = FormateadorMail.getContenidoIs1(padrino, nombreApellidoAlumno, usuarioDi,obtenerTipoPadrino(informes, i));
					texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, ConstantesInformes.nombreInformeIS1, 
							FormateadorMail.getTipoMailIndividual(), null, null);
				}
				cargarIS1DTO(listInformeIS1DTO, unInforme);
			}
			i = i + 1;
		}
		try {
			mensaje = this.obtenerMensajePadrino(texto, informes.get(0).getPadrino().getTipo(), informes.get(0).getPadrino(), alumno, 
					personaLogeada,  informes.get(0).getBeca().getZona(),"");
			
			if(StringUtils.isNotBlank(mensaje)){
				Map<String,Object> parametros = new HashMap<String, Object>();
				String url = this.getServletContext().getRealPath(PATH_SUBREPORTES);
				System.out.println(System.getProperty("java.io.tmpdir"));
				parametros.put("SUBREPORT_DIR", url);
				resultado = this.guardarReporteJasper("INFORME DE SEGUIMIENTO Nro 1.pdf", "informeIS1.jasper", ok,listInformeIS1DTO, parametros);				
				Boolean result = null;
				if(unIs1.getPadrino().getDatosPersonales() != null){
					titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreInformeIS1, 
							FormateadorMail.getTipoMailIndividual());
					if(StringUtils.isNotBlank(titulo)){
						
						//String mail=unIs1.getPadrino().getDatosPersonales().getMail()+";"+unIs1.getEaPerfil().getDatosPersonales().getMail();						 
						String mail=unIs1.getPadrino().getDatosPersonales().getMail();
						System.out.println("mail en envio: "+mail);
						String [] recipients=mail.split(";");
						String bcc="";
						System.out.println("titulo: "+ titulo);
						System.out.println("mensaje: "+ mensaje);
						System.out.println("recipients: "+ recipients);
						System.out.println("bcc: "+ bcc);
						System.out.println("resultado: "+resultado);
						System.out.println("get props: "+ getProps().getProperty("base.path.is1"));
						
						result = mailsService.enviarMailSistema(titulo,mensaje, recipients, bcc,resultado, getProps().getProperty("base.path.is1"));
						actualizarFechaEnvioInforme(informes, result);
						cambiarEstadoInformesIS1(informes, EstadoInforme.ENVIADO);
						return irAPadrinosIndividuales(request, model, unIs1, result, MSG_EXITO_INFORMES, MSG_ERROR_MAIL);
					}
					else{
						cambiarEstadoInformesIS1(informes,EstadoInforme.NO_ENVIADO);
						resultado = false;
						error = MSG_ERROR_TEXTO_PADRINO;
					}	
				}
				else{
					titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreInformeIS1, 
							FormateadorMail.getTipoMailGrupal());
					if(StringUtils.isNotBlank(titulo)){
						//String mail=unIs1.getPadrino().getDatosPersonales().getMail()+";"+unIs1.getEaPerfil().getDatosPersonales().getMail();						 
						String mail=unIs1.getPadrino().getEmpresa().getMailContacto1();
						String [] recipients=mail.split(";");
						String bcc="";
						result = mailsService.enviarMailSistema(titulo,mensaje, recipients, bcc,resultado, getProps().getProperty("base.path.is1"));
						actualizarFechaEnvioInforme(informes, result);
						cambiarEstadoInformesIS1(informes, EstadoInforme.ENVIADO);
						return irAPadrinosCorporativos(request, model, unIs1, result, MSG_EXITO_INFORMES, MSG_ERROR_MAIL);
					}
					else{
						cambiarEstadoInformesIS1(informes,EstadoInforme.NO_ENVIADO);
						resultado = false;
						error = MSG_ERROR_TEXTO_PADRINO;
					}	
				}
			}
			else{
				cambiarEstadoInformesIS1(informes,EstadoInforme.NO_ENVIADO);
				resultado = false;
				error = MSG_ERROR_TEXTO_PADRINO;
			}	
		}
		catch (Exception e){
			resultado = false;
			System.out.println("ERROR IS1: "+e.getMessage());
			System.out.println();
			System.out.println();
			
			e.printStackTrace();
			cambiarEstadoInformesIS1(informes,EstadoInforme.NO_ENVIADO);
			error = MSG_ERROR_GRAL;
			
		}		
		if(unIs1.getPadrino().getDatosPersonales() != null){
			return irAPadrinosIndividuales(request, model, unIs1, resultado, MSG_EXITO_INFORMES, error);
		}
		else{
			return irAPadrinosCorporativos(request, model, unIs1, resultado, MSG_EXITO_INFORMES, error);
		}
	}

	private String obtenerNombrePorTipoPadrino(List<Informe> informes, int i) 
	{
		String padrino = "";
		String nombre = "";
		if(informes.get(i).getPadrino().getDatosPersonales() != null)
			padrino = informes.get(0).getPadrino().getDatosPersonales().getNombre();
		else if(informes.get(i).getPadrino().getEmpresa() != null)
		{
			if(informes.get(i).getPadrino().getEmpresa().getContacto1() != null)
			{
				if(informes.get(i).getPadrino().getEmpresa().getContacto1().contains(";"))
				{
					String[] contactos = informes.get(i).getPadrino().getEmpresa().getContacto1().split(";");
					if(contactos[0].contains(","))
					{
						String[] nombreApellidoContacto = contactos[0].split(",");
						nombre = nombreApellidoContacto[0];
					}
					else if(contactos[0].contains(" "))
					{
						String[] nombreApellidoContacto = contactos[0].split(" ");
						nombre = nombreApellidoContacto[0];
					}
				}
				else
				{
					if(informes.get(i).getPadrino().getEmpresa().getContacto1().contains(","))
					{
						String[] nombreApellidoContacto = informes.get(i).getPadrino().getEmpresa().getContacto1().split(",");
						nombre = nombreApellidoContacto[0];
					}
					else if(informes.get(i).getPadrino().getEmpresa().getContacto1().contains(" "))
					{
						String[] nombreApellidoContacto = informes.get(i).getPadrino().getEmpresa().getContacto1().split(" ");
						nombre = nombreApellidoContacto[0];
					}
				}
				padrino = nombre;
			}
			else
				padrino = informes.get(0).getPadrino().getEmpresa().getDenominacion();
		}
			
		return padrino;
	}
	
	private TipoPadrino obtenerTipoPadrino(List<Informe> informes, int i){
		return informes.get(0).getPadrino().getTipo();
	}
	
	private ModelAndView esUnaFP(HttpServletRequest request, Map<String, Object> model,Boolean ok, List<Informe> informes, Long cantidad){
		Boolean resultado;
//		String nombreApellidoAlumno = "";
		FichaPresentacion unaFicha = null;
		List<InformeFPDTO> listInformeFPDTO = new ArrayList<InformeFPDTO>();
		Persona personaLogeada = this.obtenerPersona(request);
		Persona alumno = null;
		String usuarioDi = personaLogeada.getNombre() + " " + personaLogeada.getApellido();
		String mensaje = "";
		int i = 0;
//		String padrino = "";
//		padrino = obtenerNombrePorTipoPadrino(informes, i);
		Texto texto = null; 
		String error = "";
		String titulo = "";
		CicloPrograma ciclo = informes.get(0).getCicloActual();
		if(cantidad > 1){
//			mensaje = FormateadorMail.getContenidoVariasFp(padrino, usuarioDi,obtenerTipoPadrino(informes, i));
			texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, ConstantesInformes.nombreInformeFP, 
					FormateadorMail.getTipoMailGrupal(), null, null);
		}		
		for (Informe informe : informes){
			FichaPresentacion unInforme = (FichaPresentacion) informe;
			if(unInforme != null)
			{
				unaFicha = unInforme;
			//	nombreApellidoAlumno = unaFicha.getBecado().getDatosPersonales().getNombre() + " " + unaFicha.getBecado().getDatosPersonales().getApellido();
				alumno = unaFicha.getBecado().getDatosPersonales();
				if(cantidad <= 1){
//					mensaje = FormateadorMail.getContenidoFp(padrino, nombreApellidoAlumno, usuarioDi,obtenerTipoPadrino(informes, i));
					texto = srvTexto.obtenerTextoPorCicloTipoInfTipoMailYMotivo(ciclo, ConstantesInformes.nombreInformeFP, 
							FormateadorMail.getTipoMailIndividual(), null, null);
				}
				cargarFPDTO(listInformeFPDTO, unaFicha); 
			}
			i = i + 1;
		}
		try{			
			mensaje = this.obtenerMensajePadrino(texto, informes.get(0).getPadrino().getTipo(), informes.get(0).getPadrino(), alumno, 
					personaLogeada,  informes.get(0).getBeca().getZona(),"");

			if(StringUtils.isNotBlank(mensaje)){
				Map<String,Object> parametros = new HashMap<String, Object>();
				String url = this.getServletContext().getRealPath(PATH_SUBREPORTES);
				parametros.put("SUBREPORT_DIR", url);
				resultado = this.guardarReporteJasper("INFORME FICHA PRESENTACION.pdf", "informeFP.jasper",ok,listInformeFPDTO, parametros);
				Boolean result = null;
				if(unaFicha.getPadrino().getDatosPersonales() != null){
					titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreInformeFP, 
							FormateadorMail.getTipoMailIndividual());
					if(StringUtils.isNotBlank(titulo)){						
						//String mail=unaFicha.getPadrino().getDatosPersonales().getMail()+";"+unaFicha.getEaPerfil().getDatosPersonales().getMail();						 
						String mail=unaFicha.getPadrino().getDatosPersonales().getMail();
						String [] recipients=mail.split(";");
						String bcc="";
						result = mailsService.enviarMailSistema(titulo,mensaje, recipients,bcc, resultado, getProps().getProperty("base.path.fp"));
						actualizarFechaEnvioInforme(informes, result);
						cambiarEstadoInformesFP(informes, EstadoInforme.ENVIADO);
						return irAPadrinosIndividuales(request, model, unaFicha, result, MSG_EXITO_INFORMES, MSG_ERROR_MAIL);
					}
					else{
						cambiarEstadoInformesFP(informes, EstadoInforme.NO_ENVIADO);
						resultado = false;
						error = MSG_ERROR_TEXTO_PADRINO;
					}	
				}
				else {
					titulo = srvTexto.obtenerTituloPorCicloTipoInfYTipoMail(ciclo, ConstantesInformes.nombreInformeFP, 
							FormateadorMail.getTipoMailGrupal());
					if(StringUtils.isNotBlank(titulo)){
						//String mail=unaFicha.getPadrino().getDatosPersonales().getMail()+";"+unaFicha.getEaPerfil().getDatosPersonales().getMail();						 
						String mail=unaFicha.getPadrino().getEmpresa().getMailContacto1();
						String [] recipients=mail.split(";");
						String bcc="";
						result = mailsService.enviarMailSistema(titulo,mensaje, recipients,bcc, resultado, getProps().getProperty("base.path.fp"));
						
						actualizarFechaEnvioInforme(informes, result);
						cambiarEstadoInformesFP(informes, EstadoInforme.ENVIADO);
						return irAPadrinosCorporativos(request, model, unaFicha, result, MSG_EXITO_INFORMES, MSG_ERROR_MAIL);
					}
					else{
						cambiarEstadoInformesFP(informes, EstadoInforme.NO_ENVIADO);
						resultado = false;
						error = MSG_ERROR_TEXTO_PADRINO;
					}	
				}
			}
			else{
				cambiarEstadoInformesFP(informes, EstadoInforme.NO_ENVIADO);
				resultado = false;
				error = MSG_ERROR_TEXTO_PADRINO;
			}			
		} 
		catch (Exception e)	{
			resultado = false;
			e.printStackTrace();
			cambiarEstadoInformesFP(informes, EstadoInforme.NO_ENVIADO);
			error = MSG_ERROR_GRAL;
		}
		if(unaFicha.getPadrino().getDatosPersonales() != null){			
			return irAPadrinosIndividuales(request, model, unaFicha, resultado, MSG_EXITO_INFORMES, error);
		}
		else{
			return irAPadrinosCorporativos(request, model, unaFicha, resultado, MSG_EXITO_INFORMES, error);
		}
	}

	/**
	 * @param informe
	 * @param result
	 */
	private void actualizarFechaEnvioInforme(List<Informe> informes, Boolean result){
		
		if(result)
		{
			for (Informe informe : informes) 
			{
				
				////System.out.println(informe.getFechaCambioUltimoEstado());
				////System.out.println(informe.getFechaEnvio());
				if (informe.getFechaEnvio()!=null){
					
				}else{
					informe.setFechaCambioUltimoEstado(new Date());
				}
				informe.setFechaEnvio(new Date());
				
				srvInforme.guardarInforme(informe);
			}			
		}
	}

	
	/**
	 * Cambia el estado de todos los informes fp enviados
	 * @param becados
	 * @param estadoInforme 
	 */
	private void cambiarEstadoInformesFP(List<Informe> informes, EstadoInforme estadoInforme) 
	{
		for (Informe informe : informes) 
		{
			FichaPresentacion unInforme = (FichaPresentacion) informe;
			if(unInforme != null && 
				   (unInforme.getEstado().equals(EstadoInforme.FINALIZADO) || 
					unInforme.getEstado().equals(EstadoInforme.ENVIADO) ||
					unInforme.getEstado().equals(EstadoInforme.NO_ENVIADO))) 
			{
				
				unInforme.setEstado(estadoInforme);
				srvInforme.guardarInforme(unInforme);
			}
		}
	}
	
	/**
	 * Cambia el estado de todos los informes is1 enviados
	 * @param becados
	 */
	private void cambiarEstadoInformesIS1(List<Informe> informes, EstadoInforme estadoInforme) 
	{
		for (Informe informe : informes) 
		{
			InformeIS1 unInforme = (InformeIS1) informe;
			if(unInforme != null && 
				   (unInforme.getEstado().equals(EstadoInforme.FINALIZADO) || 
					unInforme.getEstado().equals(EstadoInforme.ENVIADO) ||
					unInforme.getEstado().equals(EstadoInforme.NO_ENVIADO))) 
			{
				unInforme.setEstado(estadoInforme);
				srvInforme.guardarInforme(unInforme);
			}
		}
	}
	
	/**
	 * Cambia el estado de todos los informes is2 enviados
	 * @param becados
	 */
	private void cambiarEstadoInformesIS2(List<Informe> informes, EstadoInforme estadoInforme) 
	{
		for (Informe informe : informes) 
		{
			InformeIS2 unInforme = (InformeIS2) informe;
			if(unInforme != null && 
				   (unInforme.getEstado().equals(EstadoInforme.FINALIZADO) || 
					unInforme.getEstado().equals(EstadoInforme.ENVIADO) ||
					unInforme.getEstado().equals(EstadoInforme.NO_ENVIADO))) 
			{
				unInforme.setEstado(estadoInforme);
				srvInforme.guardarInforme(unInforme);
			}
		}
	}
	
	/**
	 * Cambia el estado de todos los informes is3 enviados
	 * @param becados
	 */
	private void cambiarEstadoInformesIS3(List<Informe> informes, EstadoInforme estadoInforme) {
		for (Informe informe : informes) 
		{
			InformeIS3 unInforme = (InformeIS3) informe;
			if(unInforme != null && 
				   (unInforme.getEstado().equals(EstadoInforme.FINALIZADO) || 
				    unInforme.getEstado().equals(EstadoInforme.ENVIADO) ||
					unInforme.getEstado().equals(EstadoInforme.NO_ENVIADO))) 
			{
				unInforme.setEstado(estadoInforme);
				srvInforme.guardarInforme(unInforme);
			}
		}
	}

	/**
	 * Cambia el estado de todos los informes is2 enviados
	 * @param becados
	 */
	private void cambiarEstadoInformesCesacion(List<Informe> informes, EstadoInforme estadoInforme) {
		for (Informe informe : informes) 
		{
			InformeCesacion unInforme = (InformeCesacion) informe;
			if(unInforme != null && 
				   (unInforme.getEstado().equals(EstadoInforme.FINALIZADO) || 
					unInforme.getEstado().equals(EstadoInforme.ENVIADO) ||
					unInforme.getEstado().equals(EstadoInforme.NO_ENVIADO))) 
			{
				unInforme.setEstado(estadoInforme);
				srvInforme.guardarInforme(unInforme);
			}
		}
	}

	private void cargarIS2DTO(List<InformeIS2DTO> listInformeIS2DTO,InformeIS2 informe, Long cantidadTotalBecadosIS2){
		InformeIS2DTO informeDTO = new InformeIS2DTO();
		informeDTO.setAlumno(informe.getBecado().getDatosPersonales().getNombre() + " " + informe.getBecado().getDatosPersonales().getApellido());
		String fecha = Formateador.formatearFechas(informe.getBecado().getDatosPersonales().getFechaNacimiento(), "dd/MM/yyyy");
		Periodo periodoFechaPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informe.getFechaPBE());
		Escuela escuela = srvEscuela.obtenerEscuelaPorId(informe.getBecado().getEscuela().getId());
		int cantidadBecados = srvAlumno.cantidadAlumnosActivosMismaEscuela(escuela);
		informeDTO.setCantidadTotalBecadosIS2(Long.toString(cantidadTotalBecadosIS2));
		
		//2022
		informeDTO.setTarang(informe.getTarang());
		informeDTO.setPaa(informe.getPaa());
		informeDTO.setVtepa(informe.getVtepa());
		informeDTO.setVtepb(informe.getVtepb());
		informeDTO.setVtepc(informe.getVtepc());
		informeDTO.setVtepd(informe.getVtepd());
		informeDTO.setVtepe(informe.getVtepe());
		informeDTO.setVtepf(informe.getVtepf());
		informeDTO.setVtepg(informe.getVtepg());
		informeDTO.setVteph(informe.getVteph());
		informeDTO.setVtepi(informe.getVtepi());
		informeDTO.setIge(informe.getIge());
		informeDTO.setIatarni(informe.getIatarni());
		//informeDTO.setCantidadBecadosIS2(Long.toString(informe.getCantidadBecadosIS2()));
		informeDTO.setCantidadBecadosIS2(Long.toString(1));
		
		String inasPrimer = "";
		String inasSegundo = "";
		String inasTercer = "";
		String inasFinal = "";
		
		String totalPrim = "";
		String totalSeg = "";
		String totalTerc = "";
		String totalFinal = "";
		
		List<NotaMateria> notasPrimero = new ArrayList<NotaMateria>();
		List<NotaMateria> notasSegundo = new ArrayList<NotaMateria>();
		List<NotaMateria> notasTercero = new ArrayList<NotaMateria>();
		List<NotaMateria> notasFin = new ArrayList<NotaMateria>();
		List<NotaMateria> notasDiciembre = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMarzo = new ArrayList<NotaMateria>();
		
		List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
		
		//Se usa el mismo dto para las materias previas. Se dejan algunos campos vacios
		// y se utiliza el campo notaFin como nota de julio
		List<MateriaDTO> previas = new ArrayList<MateriaDTO>();
		
		
		informeDTO.setFechaNacimiento(fecha);
		if(informe.getBecado().getAnioEscolar() != null){
			informeDTO.setAnio(informe.getBecado().getAnioEscolar().getValor());
			
		}	
		informeDTO.setEae(informe.getBecado().getEscuela().getZonaCimientos().getEae());
		if(informe.getEdad() != null)
			informeDTO.setEdad(String.valueOf(informe.getEdad()));
		
		if(StringUtils.isNotBlank(informe.getBecado().getDatosPersonales().getLocalidad().getNombre()))
			informeDTO.setLocalidad(informe.getBecado().getDatosPersonales().getLocalidad().getNombre());
		
		informeDTO = (InformeIS2DTO)cargarDatosResposableAdulto(informe, informeDTO);
		
		
		
		informeDTO.setImagenCiclo(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/logoCiclo.JPG"));
		
		File file = new File(getProps().getProperty(ConstantesInformes.pathImagen) 
				+ informe.getBecado().getDatosPersonales().getDni().toString() + ConstantesInformes.extensionImagen);
		if(file.exists()){
			informeDTO.setFoto(getProps().getProperty(ConstantesInformes.pathImagen) 
					+ informe.getBecado().getDatosPersonales().getDni().toString() + ConstantesInformes.extensionImagen);			
		}
		else{
			informeDTO.setFoto(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/fotoPorDefecto.JPG"));
		}
//		if(informe.getBeca().getCiclo().getFechaInicio() != null)
//			informeDTO.setCicloLectivo(Formateador.formatearFechas(informe.getBeca().getCiclo().getFechaInicio(), "dd/MM/yyyy").substring(6, 10));
		
		if(informe.getCicloActual() != null)
			informeDTO.setCicloLectivo(informe.getCicloActual().getNombre());
		
		if(informe.getBecado().getAnioEscolar() != null){
			//informeDTO.setAnio(informe.getBecado().getAnioEscolar().getValor());
			//informeDTO.setAnioEgreso(0);
			//if (informe.getBecado().getAnioAdicional()!=null &&  informe.getBecado().getAnioAdicional() == true){
			//	informeDTO.setAnioEgreso(1);
			//}
			//System.out.println(informe.getBecado().getAnioAdicional());
			//if (informe.getBecado().getAnioAdicional()!=null){
				informeDTO.setAnioEgreso(0,informe.getBecado().getAnioAdicional());
			//}
			
			
		}	
		
		
		if(informe.getIncluirBoletinCheck()==null){
			informeDTO.setIncluirBoletin("0");
		}else{
			if(informe.getIncluirBoletinCheck().equals(true)){
				informeDTO.setIncluirBoletin("1");
			}else{		
				informeDTO.setIncluirBoletin("0");
			}
		}
		
		
		if(informe.getFechaPBE() != null)
			if(periodoFechaPBE != null)
				informeDTO.setFechaPBE(periodoFechaPBE.getNombre() + " " + periodoFechaPBE.getCiclo().getNombre());
			else
				informeDTO.setFechaPBE(Formateador.formatearFechas(informe.getFechaPBE(), "dd/MM/yyyy"));
		
		if(informe.getFechaReincorporacionPBE()!= null){ // es un chico reincorporado
			Periodo periodoFechaReincorporacionPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informe.getFechaReincorporacionPBE());
			if(periodoFechaReincorporacionPBE != null)
				informeDTO.setFechaReincorporacionPBE(periodoFechaReincorporacionPBE.getNombre() + " " + periodoFechaReincorporacionPBE.getCiclo().getNombre());
			else
				informeDTO.setFechaReincorporacionPBE(Formateador.formatearFechas(informe.getFechaReincorporacionPBE(), "dd/MM/yyyy"));
		}
		
		if(informe.getActividadAcompanamiento() != null)
			informeDTO.setActividadAcompanamiento(informe.getActividadAcompanamiento());
			
		
		if(informe.getHsTrabajarA�o() != null)
			informeDTO.setHsTrabajarA�o(informe.getHsTrabajarA�o());
		if(informe.getSarpepe() != null)
			informeDTO.setSarpepe(informe.getSarpepe());
		if(informe.getOsme() != null)
			informeDTO.setOsme(informe.getOsme());
		if(informe.getQtam() != null)
			informeDTO.setQtam(informe.getQtam());
		
		if(informe.getMensajePadrino() != null)
			informeDTO.setMensajePadrino(informe.getMensajePadrino());
		
		if(informe.getMateriasDesaprobadas() != null && informe.getMateriasDesaprobadas() != 0)
			informeDTO.setMateriasDesaprobadas("Cantidad de materias desaprobadas: " + String.valueOf(informe.getMateriasDesaprobadas()));
		else
			informeDTO.setMateriasDesaprobadas("Tengo todas las materias aprobadas");
			
		if(informe.getInasistencias() != null && informe.getInasistencias() != 0)
			informeDTO.setInasistencias("Cantidad de inasistencias a la escuela: " + String.valueOf(informe.getInasistencias()));
		else
			informeDTO.setInasistencias("No falt� nunca a la escuela");
		
		Boletin boletinAnioAnterior = informe.getBoletinActual();
		if(boletinAnioAnterior != null){

			if(boletinAnioAnterior.getPrevias() != null && boletinAnioAnterior.getPrevias().size() > 0){			
				List<NotaMateria> notasPreviasMarzo = new ArrayList<NotaMateria>();
				List<NotaMateria> notasPreviasJulio = new ArrayList<NotaMateria>();
				List<NotaMateria> notasPreviasDiciembre = new ArrayList<NotaMateria>();
				
				Trimestre previasJulio = boletinAnioAnterior.getPrevias().get(0);
				Trimestre previasDiciembre = boletinAnioAnterior.getPrevias().get(1);
				Trimestre previasMarzo = boletinAnioAnterior.getPrevias().get(2);
				
				for (NotaMateria notaMateria : previasMarzo.getMaterias()) {
					notasPreviasMarzo.add(notaMateria);
				}
				for (NotaMateria notaMateria : previasJulio.getMaterias()) {
					notasPreviasJulio.add(notaMateria);
				}
				for (NotaMateria notaMateria : previasDiciembre.getMaterias()) {
					notasPreviasDiciembre.add(notaMateria);
				}
				
				for (int i = 0; i < boletinAnioAnterior.getMateriasPrevias().size(); i++) {
					Materia materia = boletinAnioAnterior.getMateriasPrevias().get(i);
					MateriaDTO materiaDTO = new MateriaDTO();
					NotaMateria notaMarzo = notasPreviasMarzo.get(i);
					NotaMateria notaJulio = notasPreviasJulio.get(i);
					NotaMateria notaDic = notasPreviasDiciembre.get(i);
										
					if (materia.equals(notaMarzo.getMateria())) {
						materiaDTO.setNombre(notaMarzo.getMateria().getNombre());
						materiaDTO.setCiclo(notaMarzo.getCiclo());
						if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaMarzo.getCalificacion())
								|| CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaJulio.getCalificacion())
								|| CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaDic.getCalificacion())){
							materiaDTO.setNotaMarzo(notaMarzo.getCalificacion().getValor());
							materiaDTO.setNotaFin(notaJulio.getCalificacion().getValor());
							materiaDTO.setNotaDic(notaDic.getCalificacion().getValor());
						}
						previas.add(materiaDTO);
					}					
				}
			}
			informeDTO.setPreviasDTO(previas);
			
			totalPrim = String.valueOf(boletinAnioAnterior.getDiasHabilesPrimerTrimestre());
			totalSeg = String.valueOf(boletinAnioAnterior.getDiasHabilesSegundoTrimestre());
			totalTerc = String.valueOf(boletinAnioAnterior.getDiasHabilesTercerTrimestre());
			
			inasPrimer =  String.valueOf(boletinAnioAnterior.getInasistenciasPrimerTrimestre());
			inasSegundo =  String.valueOf(boletinAnioAnterior.getInasistenciasSegundoTrimestre());
			inasTercer =  String.valueOf(boletinAnioAnterior.getInasistenciasTercerTrimestre());
			
			if (isUnTrimestreConMaterias(boletinAnioAnterior)
					|| isBoletinSinMaterias(boletinAnioAnterior)) {
				Trimestre primero = boletinAnioAnterior.getTrimestres().get(0);
				Trimestre segundo = boletinAnioAnterior.getTrimestres().get(1);
				Trimestre tercero = boletinAnioAnterior.getTrimestres().get(2);
				Trimestre fin = boletinAnioAnterior.getTrimestres().get(3);
				Trimestre diciembre = boletinAnioAnterior.getTrimestres().get(4);
				Trimestre marzo = boletinAnioAnterior.getTrimestres().get(5);
				for (NotaMateria notaMateria : primero.getMaterias()) {
					notasPrimero.add(notaMateria);

				}
				for (NotaMateria notaMateria : segundo.getMaterias()) {
					notasSegundo.add(notaMateria);
				}
				for (NotaMateria notaMateria : tercero.getMaterias()) {
					notasTercero.add(notaMateria);
				}
				for (NotaMateria notaMateria : fin.getMaterias()) {
					notasFin.add(notaMateria);
				}
				for (NotaMateria notaMateria : diciembre.getMaterias()) {
					notasDiciembre.add(notaMateria);
				}
				for (NotaMateria notaMateria : marzo.getMaterias()) {
					notasMarzo.add(notaMateria);
				}
				for (int i = 0; i < boletinAnioAnterior.getMaterias().size(); i++) {
					Materia materia = boletinAnioAnterior.getMaterias().get(i);
					MateriaDTO materiaDTO = new MateriaDTO();
					NotaMateria notaPri = notasPrimero.get(i);
					NotaMateria notaSeg = notasSegundo.get(i);
					NotaMateria notaTerc = notasTercero.get(i);
					NotaMateria notaFin = notasFin.get(i);
					NotaMateria notaDic = notasDiciembre.get(i);
					NotaMateria notaMarzo = notasMarzo.get(i);
										
					if (materia.equals(notaPri.getMateria())) {
						if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaPri.getCalificacion())){
							this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia);
						}
						else{
							if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaSeg.getCalificacion())){
								this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia);
							}
							else{
								if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaTerc.getCalificacion())){
									this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia);
								}
								else{
									materiaDTO = null;
								}
							}
						}
					}
					if(materiaDTO != null){
						materias.add(materiaDTO);
					}					
				}
				informeDTO.setMateriasDto(materias);
			}
		}
		else{
			informeDTO.setMateriasDto(null);
			if(informe.getBecado().getAnioEscolar() != null)
				informeDTO.setAnio(informe.getBecado().getAnioEscolar().getValor());
		}
		
		if(informe.getBoletinActual() != null)
		{
			//inasistencias del bolet�n
			
			Float totalInas = boletinAnioAnterior.getTotalInasistencias();
			if(totalInas != null && totalInas != 0.0)
				inasFinal= String.valueOf(totalInas);
			if((inasPrimer.equals("0.0") && inasSegundo.equals("0.0") && inasTercer.equals("0.0")) || totalInas == 0F)
				inasFinal = null;
								
			Float totalDias = boletinAnioAnterior.getTotalDiasHabiles();
			if(totalDias != null && totalDias != 0.0)
				totalFinal = String.valueOf(totalDias);
			if((totalPrim.equals("0.0") && totalSeg.equals("0.0") && totalTerc.equals("0.0")) || totalDias == 0F)
				totalFinal = null;
				
				
			/*INASISTENCIAS 1� TRIMESTRE*/
			if(inasPrimer.equals("null") || StringUtils.isBlank(inasPrimer))
				informeDTO.setInasistenciasPrimerTrimestre(null);
			else 
				informeDTO.setInasistenciasPrimerTrimestre(inasPrimer);
			
			/*INASISTENCIAS 2� TRIMESTRE*/
			if(inasSegundo.equals("null") || StringUtils.isBlank(inasSegundo))
				informeDTO.setInasistenciasSegundoTrimestre(null);
			else 
				informeDTO.setInasistenciasSegundoTrimestre(inasSegundo);
			
			/*INASISTENCIAS 3� TRIMESTRE*/
			if(inasTercer.equals("null") || StringUtils.isBlank(inasTercer))
				informeDTO.setInasistenciasTercerTrimestre(null);
			else 
				informeDTO.setInasistenciasTercerTrimestre(inasTercer);
			
			informeDTO.setInasistenciasFinal(inasFinal);
			
			/*DIAS 1� TRIM.*/
			if(totalPrim.equals("null") || StringUtils.isBlank(totalPrim))
				informeDTO.setTotalDiasPrimero(null);
			else 
				informeDTO.setTotalDiasPrimero(totalPrim);
			
			/*DIAS 2� TRIM.*/
			if(totalSeg.equals("null") || StringUtils.isBlank(totalSeg))
				informeDTO.setTotalDiasSeg(null);
			else 
				informeDTO.setTotalDiasSeg(totalSeg);
			
			/*DIAS 3� TRIM.*/
			if(totalTerc.equals("null") || StringUtils.isBlank(totalTerc))
				informeDTO.setTotalDiasTerc(null);
			else 
				informeDTO.setTotalDiasTerc(totalTerc);
			
			informeDTO.setTotalDiasFinal(totalFinal);
		}		
		
		
			
		//this.setMateriasIS2(listaMaterias, informe.getMateriasInteres(), informeDTO, "interes");
		//this.setMateriasIS2(listaMaterias, informe.getMateriasCuestan(), informeDTO, "cuesta");

		
		informeDTO.setCantidadBecados(String.valueOf(cantidadBecados));
		
		if(StringUtils.isNotBlank(escuela.getNombre()))
			informeDTO.setNombreEscuela(escuela.getNombre());
		
		String texto = "";
		informeDTO.setImplementacionPrograma(escuela.getComienzoPBE().getNombre());
		if(escuela.getMatricula() != null)
			informeDTO.setMatriculaTotal(String.valueOf(escuela.getMatricula()));
		else
			informeDTO.setMatriculaTotal(null);
		//if(escuela.getPorcentajeInasistencia() != null)
		//	informeDTO.setPorcentajeInasistencia("entre " + Formateador.calcularIndicadorEscuela(escuela.getPorcentajeInasistencia(), ConstantesInformes.indicadorEscuela, "-")
		//			+ " y " + Formateador.calcularIndicadorEscuela(escuela.getPorcentajeInasistencia(), ConstantesInformes.indicadorEscuela, "+") + "%.");
		//else
		//	informeDTO.setPorcentajeInasistencia(null);
		//informeDTO.setModalidadTrabajoEscuela(escuela.getModalidadTrabajoEscuela().getValor());
		
		
		if(escuela.getModalidadTrabajoEscuela()!= null){			
			if(escuela.getModalidadTrabajoEscuela().getValor().equals(ModalidadTrabajoEscuela.CONTACTO_TELEFONICO.getValor()))
				informeDTO.setPathImgEscuela(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/escuela.JPG"));
			else{
				 texto = "";
				informeDTO.setImplementacionPrograma(escuela.getComienzoPBE().getNombre());
				if(escuela.getMatricula() != null)
					informeDTO.setMatriculaTotal(String.valueOf(escuela.getMatricula()));
				else
					informeDTO.setMatriculaTotal(null);
				if(escuela.getPorcentajeInasistencia() != null)
					informeDTO.setPorcentajeInasistencia("entre " + Formateador.calcularIndicadorEscuela(escuela.getPorcentajeInasistencia(), ConstantesInformes.indicadorEscuela, "-")
							+ " y " + Formateador.calcularIndicadorEscuela(escuela.getPorcentajeInasistencia(), ConstantesInformes.indicadorEscuela, "+") + "%.");
				else
					informeDTO.setPorcentajeInasistencia(null);
				informeDTO.setModalidadTrabajoEscuela(escuela.getModalidadTrabajoEscuela().getValor());
				informeDTO.setPathImgEscuela(null);
				texto = MSG_ESCUELA_PARTE1 + Formateador.calcularIndicadorEscuela(escuela.getIndicadorRepitencia(), ConstantesInformes.indicadorEscuela, "-");
				texto += MSG_ESCUELA_PARTE2 + Formateador.calcularIndicadorEscuela(escuela.getIndicadorRepitencia(), ConstantesInformes.indicadorEscuela, "+");
				texto += MSG_ESCUELA_PARTE3 + Formateador.calcularIndicadorEscuela(escuela.getIndicadorAbandono(), ConstantesInformes.indicadorEscuela, "-");
				texto += MSG_ESCUELA_PARTE2 + Formateador.calcularIndicadorEscuela(escuela.getIndicadorAbandono(), ConstantesInformes.indicadorEscuela, "+");
				texto += MSG_ESCUELA_PARTE4;
				informeDTO.setTextoEscuela(texto);
			}			
		}
		else
			informeDTO.setPathImgEscuela(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/escuela.JPG"));

		informeDTO.setPathImg(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/logoCarta.JPG"));
		informeDTO.setTitulo(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/tituloIS2.JPG"));
		informeDTO.setFooter(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/footerIS2.jpg"));
		listInformeIS2DTO.add(informeDTO);
		
	}
	
	private void cargarIS3DTO(List<InformeIS3DTO> listInformeIS3DTO,InformeIS3 informe) 
	{
		InformeIS3DTO informeDTO = new InformeIS3DTO();
		informeDTO = (InformeIS3DTO)cargarDatosResposableAdulto(informe, informeDTO);
		Boletin boletinActual = srvInforme.getBoletinCicloInforme(informe.getBecado(), informe.getCicloActual());
		Periodo periodoFechaPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informe.getFechaPBE());
		Escuela escuela = srvEscuela.obtenerEscuelaPorId(informe.getBecado().getEscuela().getId());
		int cantidadBecados = srvAlumno.cantidadAlumnosActivosMismaEscuela(escuela);
		
		
		informeDTO.setTarang(informe.getTarang());
		informeDTO.setPaa(informe.getPaa());
		informeDTO.setVtepa(informe.getVtepa());
		informeDTO.setVtepb(informe.getVtepb());
		informeDTO.setVtepc(informe.getVtepc());
		informeDTO.setVtepd(informe.getVtepd());
		informeDTO.setVtepe(informe.getVtepe());
		informeDTO.setVtepf(informe.getVtepf());
		informeDTO.setVtepg(informe.getVtepg());
		informeDTO.setVteph(informe.getVteph());
		informeDTO.setVtepi(informe.getVtepi());
		informeDTO.setIge(informe.getIge());
		informeDTO.setIatarni(informe.getIatarni());
		
		
		informeDTO.setEae(informe.getBecado().getEae());
		if(informe.getCicloActual() != null)
			informeDTO.setCicloLectivo(informe.getCicloActual().getNombre());
		
		
		if(boletinActual != null){			
			if(boletinActual.getAno() != null)
				informeDTO.setAnio(boletinActual.getAno().getValor());
				informeDTO.setAnioEgreso(0,informe.getBecado().getAnioAdicional());
				
		}
		else{
			if(informe.getBecado().getAnioEscolar() != null)
				informeDTO.setAnio(informe.getBecado().getAnioEscolar().getValor());
			informeDTO.setAnioEgreso(0,informe.getBecado().getAnioAdicional());
		}
		
		// MODIFICAR TODOS LOS A�OS
		if(informeDTO.getAnioEgreso().equals("0")){
			informeDTO.setAnioEgreso(informeDTO.getCicloLectivo());
		}

		informeDTO.setAlo(informe.getAlo());
		
		if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getNombre()))
			informeDTO.setNombreEscuela(informe.getBecado().getEscuela().getNombre());
		
		
		informeDTO.setAlumno(informe.getBecado().getDatosPersonales().getNombre() + " " + informe.getBecado().getDatosPersonales().getApellido());
		String fecha = Formateador.formatearFechas(informe.getBecado().getDatosPersonales().getFechaNacimiento(), "dd/MM/yyyy");
		informeDTO.setFechaNacimiento(fecha);
		
		if(informe.getFechaPBE() != null)
			if(periodoFechaPBE != null)
				informeDTO.setFechaPBE(periodoFechaPBE.getNombre() + " " + periodoFechaPBE.getCiclo().getNombre());
			else
				informeDTO.setFechaPBE(Formateador.formatearFechas(informe.getFechaPBE(), "dd/MM/yyyy"));
		
		if(informe.getFechaReincorporacionPBE()!= null){ // es un chico reincorporado
			Periodo periodoFechaReincorporacionPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informe.getFechaReincorporacionPBE());
			if(periodoFechaReincorporacionPBE != null)
				informeDTO.setFechaReincorporacionPBE(periodoFechaReincorporacionPBE.getNombre() + " " + periodoFechaReincorporacionPBE.getCiclo().getNombre());
			else
				informeDTO.setFechaReincorporacionPBE(Formateador.formatearFechas(informe.getFechaReincorporacionPBE(), "dd/MM/yyyy"));
		}
		
		
		
		if(informe.getEdad() != null)
			informeDTO.setEdad(String.valueOf(informe.getEdad()));
		
		if(StringUtils.isNotBlank(informe.getBecado().getDatosPersonales().getLocalidad().getNombre()))
			informeDTO.setLocalidad(informe.getBecado().getDatosPersonales().getLocalidad().getNombre());
		
		informeDTO.setPathImg(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/logoCarta.JPG"));
		
		informeDTO.setImagenCiclo(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/logoCiclo.JPG"));
		
		File file = new File(getProps().getProperty(ConstantesInformes.pathImagen) 
				+ informe.getBecado().getDatosPersonales().getDni().toString() + ConstantesInformes.extensionImagen);
		if(file.exists()){
			informeDTO.setFoto(getProps().getProperty(ConstantesInformes.pathImagen) 
					+ informe.getBecado().getDatosPersonales().getDni().toString() + ConstantesInformes.extensionImagen);			
		}
		else{
			informeDTO.setFoto(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/fotoPorDefecto.JPG"));
		}
						
		if(informe.getCicloActual() != null)
			informeDTO.setCicloLectivo(informe.getCicloActual().getNombre());
		
		if(informe.getActividadAcompanamiento() != null)
			informeDTO.setActividadAcompanamiento(informe.getActividadAcompanamiento());
			
		
		if(informe.getHsTrabajarA�o() != null)
			informeDTO.setHsTrabajarA�o(informe.getHsTrabajarA�o());
		if(informe.getSarpepe() != null)
			informeDTO.setSarpepe(informe.getSarpepe());
		if(informe.getOsme() != null)
			informeDTO.setOsme(informe.getOsme());
		if(informe.getQtam() != null)
			informeDTO.setQtam(informe.getQtam());
		
		informeDTO.setSituacionRenovacion(informe.getSituacionRenovacion());
		
		
		if(informe.getActividadAcompanamiento() != null)
			informeDTO.setActividadAcompanamiento(informe.getActividadAcompanamiento());
		
		if(informe.getMensajePadrino() != null)
			informeDTO.setMensajePadrino(informe.getMensajePadrino());
		
		if(informe.getMateriasDesaprobadas() != null && informe.getMateriasDesaprobadas() != 0)
			informeDTO.setMateriasDesaprobadas("Cantidad de materias desaprobadas: " + String.valueOf(informe.getMateriasDesaprobadas()));
		else
			informeDTO.setMateriasDesaprobadas("Tengo todas las materias aprobadas");
			
		if(informe.getInasistencias() != null && informe.getInasistencias() != 0)
			informeDTO.setInasistencias("Cantidad de inasistencias a la escuela: " + String.valueOf(informe.getInasistencias()));
		else
			informeDTO.setInasistencias("No falt� nunca a la escuela");
		
		/*
		if(informe.getCicloActual() != null)
			informeDTO.setCicloLectivo(informe.getCicloActual().getNombre());
		
		if(informe.getBecado().getAnioEscolar() != null){
			//informeDTO.setAnio(informe.getBecado().getAnioEscolar().getValor());
			informeDTO.setAnioEgreso(0);
			if (informe.getBecado().getAnioAdicional()!=null &&  informe.getBecado().getAnioAdicional() == true){
				informeDTO.setAnioEgreso(1);
			}
		}	
		*/
		
		List<Materia> listaMaterias = new ArrayList<Materia>();
		if(boletinActual != null)
			listaMaterias = boletinActual.getMaterias();		
		else
			listaMaterias = srvMateria.obtenerMateriasBasicas(true);
			
		this.setMateriasIS3(listaMaterias, informe.getMateriasInteres(), informeDTO, "interes");
		this.setMateriasIS3(listaMaterias, informe.getMateriasCuestan(), informeDTO, "cuesta");
		
		if(informe.getSuspensionesCantidad() != null && informe.getSuspensionesCantidad() > 0){
			informeDTO.setSuspensionesCantidad(String.valueOf(informe.getSuspensionesCantidad()));
			informeDTO.setSuspensionesPeriodo(informe.getSuspensionesPeriodo());
			informeDTO.setSuspensiones(informe.getSuspensiones());
		}	
		else{
			informeDTO.setPathImagenSuspensiones(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/sinsuspensiones.JPG"));
		}
	
		informeDTO.setPathImg(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/logoCarta.JPG"));
		informeDTO.setTitulo(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/tituloIS3.JPG"));
		
		if(informe.getActividadAcompanamiento() != null)
			informeDTO.setActividadAcompanamiento(informe.getActividadAcompanamiento());
	
		informeDTO.setUtilizacionBeca(informe.getUtilizacionBeca());
			
		if(informe.getEvalRenovacionBeca() != null){			
			informeDTO.setSituacionRenovacion(informe.getEvalRenovacionBeca());
		}
	
		if(informe.getSituacionRenovacion()!= null)
			informeDTO.setEvalRenovacionBeca(informe.getSituacionRenovacion());
		
		if(informe.getProyAnioProximo() != null)
			informeDTO.setProyeccionAnioProx(informe.getProyAnioProximo());		
		
		if(informe.getMotivoNoRenovacion() != null)
			informeDTO.setMotivoNoRenovacion(informe.getMotivoNoRenovacion());
		
		
		listInformeIS3DTO.add(informeDTO);
	}
	
	private void cargarICDTO(List<InformeCesacionDTO> listInformeCesacionDTO,InformeCesacion informe) 
	{
		InformeCesacionDTO informeDTO = new InformeCesacionDTO();
		String inasPrimer = "";
		String inasSegundo = "";
		String inasTercer = "";
		String inasFinal = "";
		
		String totalPrim = "";
		String totalSeg = "";
		String totalTerc = "";
		String totalFinal = "";
		
		List<NotaMateria> notasPrimero = new ArrayList<NotaMateria>();
		List<NotaMateria> notasSegundo = new ArrayList<NotaMateria>();
		List<NotaMateria> notasTercero = new ArrayList<NotaMateria>();
		List<NotaMateria> notasFin = new ArrayList<NotaMateria>();
		List<NotaMateria> notasDiciembre = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMarzo = new ArrayList<NotaMateria>();
		
		List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
		
		//Se usa el mismo dto para las materias previas. Se dejan algunos campos vacios
		// y se utiliza el campo notaFin como nota de julio
		List<MateriaDTO> previas = new ArrayList<MateriaDTO>();
		
		informeDTO = (InformeCesacionDTO)cargarDatosResposableAdulto(informe, informeDTO);

		Periodo periodoFechaPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informe.getFechaPBE());
		
		Boletin boletinActual = srvInforme.getBoletinCicloInforme( informe.getBecado(), informe.getCicloActual());
		
		if(informe.getIncluirBoletinCheck()){		
			if(boletinActual != null){
				if(boletinActual.getAno() != null)
					informeDTO.setAnio(boletinActual.getAno().getValor());
				
				if(boletinActual.getPrevias() != null && boletinActual.getPrevias().size() > 0){			
					List<NotaMateria> notasPreviasMarzo = new ArrayList<NotaMateria>();
					List<NotaMateria> notasPreviasJulio = new ArrayList<NotaMateria>();
					List<NotaMateria> notasPreviasDiciembre = new ArrayList<NotaMateria>();
							
					Trimestre previasJulio = boletinActual.getPrevias().get(0);
					Trimestre previasDiciembre = boletinActual.getPrevias().get(1);
					Trimestre previasMarzo = boletinActual.getPrevias().get(2);
			
					for (NotaMateria notaMateria : previasJulio.getMaterias()) {
						notasPreviasJulio.add(notaMateria);
					}
					for (NotaMateria notaMateria : previasDiciembre.getMaterias()) {
						notasPreviasDiciembre.add(notaMateria);
					}
					for (NotaMateria notaMateria : previasMarzo.getMaterias()) {
						notasPreviasMarzo.add(notaMateria);
					}
					
					for (int i = 0; i < boletinActual.getMateriasPrevias().size(); i++) {
						Materia materia = boletinActual.getMateriasPrevias().get(i);
						MateriaDTO materiaDTO = new MateriaDTO();
						NotaMateria notaJulio = notasPreviasJulio.get(i);
						NotaMateria notaDic = notasPreviasDiciembre.get(i);
						NotaMateria notaMarzo = notasPreviasMarzo.get(i);
						
						if (materia.equals(notaMarzo.getMateria())) {
							materiaDTO.setNombre(notaMarzo.getMateria().getNombre());
							materiaDTO.setCiclo(notaMarzo.getCiclo());
							if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaMarzo.getCalificacion())
									|| CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaJulio.getCalificacion())
									|| CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaDic.getCalificacion())){
								materiaDTO.setNotaFin(notaJulio.getCalificacion().getValor());
								materiaDTO.setNotaDic(notaDic.getCalificacion().getValor());
								materiaDTO.setNotaMarzo(notaMarzo.getCalificacion().getValor());
							}
							previas.add(materiaDTO);
						}					
					}
					informeDTO.setPreviasDTO(previas);
				}
				else{
					informeDTO.setPreviasDTO(null);
				}
				
				totalPrim = String.valueOf(boletinActual.getDiasHabilesPrimerTrimestre());
				totalSeg = String.valueOf(boletinActual.getDiasHabilesSegundoTrimestre());
				totalTerc = String.valueOf(boletinActual.getDiasHabilesTercerTrimestre());
				
				inasPrimer =  String.valueOf(boletinActual.getInasistenciasPrimerTrimestre());
				inasSegundo =  String.valueOf(boletinActual.getInasistenciasSegundoTrimestre());
				inasTercer =  String.valueOf(boletinActual.getInasistenciasTercerTrimestre());

				if (isUnTrimestreConMaterias(boletinActual)
						|| isBoletinSinMaterias(boletinActual)) {
					Trimestre primero = boletinActual.getTrimestres().get(0);
					Trimestre segundo = boletinActual.getTrimestres().get(1);
					Trimestre tercero = boletinActual.getTrimestres().get(2);
					Trimestre fin = boletinActual.getTrimestres().get(3);
					Trimestre diciembre = boletinActual.getTrimestres().get(4);
					Trimestre marzo = boletinActual.getTrimestres().get(5);
	
					for (NotaMateria notaMateria : primero.getMaterias()) {
						notasPrimero.add(notaMateria);
	
					}
					for (NotaMateria notaMateria : segundo.getMaterias()) {
						notasSegundo.add(notaMateria);
					}
					for (NotaMateria notaMateria : tercero.getMaterias()) {
						notasTercero.add(notaMateria);
					}
					for (NotaMateria notaMateria : fin.getMaterias()) {
						notasFin.add(notaMateria);
					}
					for (NotaMateria notaMateria : diciembre.getMaterias()) {
						notasDiciembre.add(notaMateria);
					}
					for (NotaMateria notaMateria : marzo.getMaterias()) {
						notasMarzo.add(notaMateria);
					}
					for (int i = 0; i < boletinActual.getMaterias().size(); i++) {
						Materia materia = boletinActual.getMaterias().get(i);
						NotaMateria notaPri = notasPrimero.get(i);
						NotaMateria notaSeg = notasSegundo.get(i);
						NotaMateria notaTerc = notasTercero.get(i);
						NotaMateria notaFin = notasFin.get(i);
						NotaMateria notaDic = notasDiciembre.get(i);
						NotaMateria notaMarzo = notasMarzo.get(i);
						MateriaDTO materiaDTO = new MateriaDTO();
						
						if (materia.equals(notaPri.getMateria())) {
							if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaPri.getCalificacion())){
								this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia);
							}
							else{
								if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaSeg.getCalificacion())){
									this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia);
								}
								else{
									if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaTerc.getCalificacion())){
										this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia);
									}
									else{
										materiaDTO = null;
									}
								}
							}
						}
						if(materiaDTO != null){
							materias.add(materiaDTO);
						}	
						informeDTO.setMaterias(materias);
					} 
				}
				else{
					informeDTO.setMaterias(null);
					if(informe.getBecado().getAnioEscolar() != null)
						informeDTO.setAnio(informe.getBecado().getAnioEscolar().getValor());
				}
			}
			else{
				informeDTO.setMaterias(null);
				informeDTO.setPreviasDTO(null);
				if(informe.getBecado().getAnioEscolar() != null)
					informeDTO.setAnio(informe.getBecado().getAnioEscolar().getValor());
			}
		}
		else{
			informeDTO.setMaterias(null);
			informeDTO.setPreviasDTO(null);
			if(informe.getBecado().getAnioEscolar() != null)
				informeDTO.setAnio(informe.getBecado().getAnioEscolar().getValor());
		}
		
		
		informeDTO.setEa(informe.getEaPerfil().getDatosPersonales().getNombre() + " " + informe.getEaPerfil().getDatosPersonales().getApellido());
		informeDTO.setAlumno(informe.getBecado().getDatosPersonales().getNombre() + " " + informe.getBecado().getDatosPersonales().getApellido());
		String fecha = Formateador.formatearFechas(informe.getBecado().getDatosPersonales().getFechaNacimiento(), "dd/MM/yyyy");
		informeDTO.setFechaNacimiento(fecha);
		
		if(informe.getFechaPBE() != null)
			if(periodoFechaPBE != null)
				informeDTO.setFechaPBE(periodoFechaPBE.getNombre() + " " + periodoFechaPBE.getCiclo().getNombre());
			else
				informeDTO.setFechaPBE(Formateador.formatearFechas(informe.getFechaPBE(), "dd/MM/yyyy"));
		
		if(informe.getFechaReincorporacionPBE()!= null){ // es un chico reincorporado
			Periodo periodoFechaReincorporacionPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informe.getFechaReincorporacionPBE());
			if(periodoFechaReincorporacionPBE != null)
				informeDTO.setFechaReincorporacionPBE(periodoFechaReincorporacionPBE.getNombre() + " " + periodoFechaReincorporacionPBE.getCiclo().getNombre());
			else
				informeDTO.setFechaReincorporacionPBE(Formateador.formatearFechas(informe.getFechaReincorporacionPBE(), "dd/MM/yyyy"));
		}
		
		if(informe.getEdad() != null)
			informeDTO.setEdad(String.valueOf(informe.getEdad()));
		
		
		
		if(StringUtils.isNotBlank(informe.getBecado().getDatosPersonales().getLocalidad().getNombre()))
			informeDTO.setLocalidad(informe.getBecado().getDatosPersonales().getLocalidad().getNombre());
		
		if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getNombre()))
			informeDTO.setEscuela(informe.getBecado().getEscuela().getNombre());
		
		if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getLocalidad().getNombre()))
			informeDTO.setEscuelaLocalidad(informe.getBecado().getEscuela().getLocalidad().getNombre());

		
		String padrino = "";
		informeDTO.setPathImg(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/logoCarta.JPG"));
		
		if(informe.getPadrino() != null)
		{
			if(informe.getPadrino().getEmpresa() != null){
				padrino = informe.getPadrino().getEmpresa().getDenominacion();
			}else{
				padrino = informe.getPadrino().getDatosPersonales().getApellido() + ", " +
				informe.getPadrino().getDatosPersonales().getNombre();
			}
		}
		informeDTO.setPadrino(padrino);
		
		if(informe.getDetallePagosSuspendidos() != null)
			if(!informe.getDetallePagosSuspendidos().equals("0,"))
				informeDTO.setSuspensiones(informe.getDetallePagosSuspendidos());


		//inasistencias del bolet�n
		if(informe.getIncluirBoletinCheck()){		
			if(boletinActual != null)
			{			
				//inasistencias del bolet�n
				
				Float totalInas = boletinActual.getTotalInasistencias();
				if(totalInas != null && totalInas != 0.0)
					inasFinal= String.valueOf(totalInas);
				if((inasPrimer.equals("0.0") && inasSegundo.equals("0.0") && inasTercer.equals("0.0")) || totalInas == 0F)
					inasFinal = null;
									
				Float totalDias = boletinActual.getTotalDiasHabiles();
				if(totalDias != null && totalDias != 0.0)
					totalFinal = String.valueOf(totalDias);
				if((totalPrim.equals("0.0") && totalSeg.equals("0.0") && totalTerc.equals("0.0")) || totalDias == 0F)
					totalFinal = null;
					
					
				/*INASISTENCIAS 1� TRIMESTRE*/
				if(inasPrimer.equals("null") || StringUtils.isBlank(inasPrimer))
					informeDTO.setInasistenciasPrimerTrimestre(null);
				else 
					informeDTO.setInasistenciasPrimerTrimestre(inasPrimer);
				
				/*INASISTENCIAS 2� TRIMESTRE*/
				if(inasSegundo.equals("null") || StringUtils.isBlank(inasSegundo))
					informeDTO.setInasistenciasSegundoTrimestre(null);
				else 
					informeDTO.setInasistenciasSegundoTrimestre(inasSegundo);
				
				/*INASISTENCIAS 3� TRIMESTRE*/
				if(inasTercer.equals("null") || StringUtils.isBlank(inasTercer))
					informeDTO.setInasistenciasTercerTrimestre(null);
				else 
					informeDTO.setInasistenciasTercerTrimestre(inasTercer);
				
				informeDTO.setInasistenciasFinal(inasFinal);
				
				/*DIAS 1� TRIM.*/
				if(totalPrim.equals("null") || StringUtils.isBlank(totalPrim))
					informeDTO.setTotalDiasPrimero(null);
				else 
					informeDTO.setTotalDiasPrimero(totalPrim);
				
				/*DIAS 2� TRIM.*/
				if(totalSeg.equals("null") || StringUtils.isBlank(totalSeg))
					informeDTO.setTotalDiasSeg(null);
				else 
					informeDTO.setTotalDiasSeg(totalSeg);
				
				/*DIAS 3� TRIM.*/
				if(totalTerc.equals("null") || StringUtils.isBlank(totalTerc))
					informeDTO.setTotalDiasTerc(null);
				else 
					informeDTO.setTotalDiasTerc(totalTerc);
				
				informeDTO.setTotalDiasFinal(totalFinal);
			}		
		}
			
		if(informe.getDatosEstimadosCheck()){
			//datos estimados del boletin
			if(informe.getMateriasAprobadas() != null && informe.getMateriasDesaprobadas() != null && informe.getInasistencias() != null )
			{
				String datosEstimadosBoletin = getMensajeDatosEstimadosBoletin(informe.getMateriasAprobadas(), informe.getMateriasDesaprobadas(), informe.getInasistencias(), informe.getObsBoletin(), informeDTO.getAlumno());
				informeDTO.setDatosEstimadosBoletin(datosEstimadosBoletin);
			}
		}
				
		if(informe.getActividadAcompanamiento() != null)
			informeDTO.setActividadAcompanamiento(informe.getActividadAcompanamiento());
		
		if(informe.getComentariosCesacion() != null)
			informeDTO.setComentariosCesacion(informe.getComentariosCesacion());
		
		if(informe.getComentarios() != null)
			informeDTO.setComentarios(informe.getComentarios());
		
		if(informe.getObservaciones() != null)
			informeDTO.setObservaciones(informe.getObservaciones());
		
		if(informe.getConducta() != null)
			informeDTO.setConducta(informe.getConducta().getValor());
		
		if(informe.getBeca().getCiclo().getFechaInicio() != null)
			informeDTO.setAnioActual(Formateador.formatearFechas(informe.getBeca().getCiclo().getFechaInicio(), "dd/MM/yyyy").substring(6, 10));
		
		if(informe.getAsistenciaBecadoAEntrevista() != null)
			informeDTO.setAsistenciaBecadoAEntrevista(informe.getAsistenciaBecadoAEntrevista().getValor());
		
		if(informe.getAsistenciaRAEntrevista() != null)
			informeDTO.setAsistenciaRAEntrevista(informe.getAsistenciaRAEntrevista().getValor());
		
		if(informe.getEsfuerzo() != null)
			informeDTO.setEsfuerzo(informe.getEsfuerzo().getValor());
		
		if(informe.getCompromisoEscolaridad() != null)
			informeDTO.setCompromisoAlumno(informe.getCompromisoEscolaridad().getValor());
		
		if(informe.getCompromisoRa() != null)
			informeDTO.setCompromisoRa(informe.getCompromisoRaPBE().getValor());
		
		if(informe.getPresentacionMaterial() != null)
			informeDTO.setPresentacionMaterial(informe.getPresentacionMaterial().getValor());
		
		if(informe.getDetalle() != "")
			informeDTO.setDetalle(informe.getDetalle());
		
		if(informe.getMesCesacion() != null)
			informeDTO.setMesCesacion(String.valueOf(informe.getMesCesacion()));
		
		if(informe.getMotivoCesacion() != null)
			informeDTO.setMotivoCesacion(informe.getMotivoCesacion());
		
		listInformeCesacionDTO.add(informeDTO);
	}
	
	private void cargarIS1DTO(List<InformeIS1DTO> listInformeIS1DTO,InformeIS1 informe) 
	{
		InformeIS1DTO informeDTO = new InformeIS1DTO();
		String inasPrimer = "";
		String inasSegundo = "";
		String inasTercer = "";
		String inasFinal = "";
		
		String totalPrim = "";
		String totalSeg = "";
		String totalTerc = "";
		String totalFinal = "";
		
		List<NotaMateria> notasPrimero = new ArrayList<NotaMateria>();
		List<NotaMateria> notasSegundo = new ArrayList<NotaMateria>();
		List<NotaMateria> notasTercero = new ArrayList<NotaMateria>();
		List<NotaMateria> notasFin = new ArrayList<NotaMateria>();
		List<NotaMateria> notasDiciembre = new ArrayList<NotaMateria>();
		List<NotaMateria> notasMarzo = new ArrayList<NotaMateria>();
		
		List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
		
		//Se usa el mismo dto para las materias previas. Se dejan algunos campos vacios
		// y se utiliza el campo notaFin como nota de julio
		List<MateriaDTO> previas = new ArrayList<MateriaDTO>();

		informeDTO = (InformeIS1DTO)cargarDatosResposableAdulto(informe, informeDTO);
		
		informeDTO.setAlumno(informe.getBecado().getDatosPersonales().getNombre() + " " + informe.getBecado().getDatosPersonales().getApellido());
		String fecha = Formateador.formatearFechas(informe.getBecado().getDatosPersonales().getFechaNacimiento(), "dd/MM/yyyy");
		informeDTO.setFechaNacimiento(fecha);
		String fechaPBE = Formateador.formatearFechas(informe.getFechaPBE(), "dd/MM/yyyy");
		informeDTO.setFechaPBE(fechaPBE);
		
		//2018
	
		
		informeDTO.setEscuela(informe.getBecado().getEscuela().getNombre());
		
		informeDTO.setInformacionEscuela(informe.getBecado().getEscuela().getObservaciones());
		
		informeDTO.sethSE(informe.getHsTrabajarA�o());
		
		if(informe.getBecado().getEscuela().getEspacioApoyo()!= null)
			informeDTO.setEspacioEscuela(parsearListaEspacios(informe.getBecado().getEscuela().getEspacioApoyo(),informe.getBecado().getEscuela().getCualOtroEspacioApoyo()));
		//2021
		File file = new File(getProps().getProperty(ConstantesInformes.pathImagen) 
				+ informe.getBecado().getDatosPersonales().getDni().toString() + ConstantesInformes.extensionImagen);
		
		if(file.exists()){
			informeDTO.setFoto(getProps().getProperty(ConstantesInformes.pathImagen) 
					+ informe.getBecado().getDatosPersonales().getDni().toString() + ConstantesInformes.extensionImagen);			
		}
		else{
			informeDTO.setFoto(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/fotoPorDefecto.JPG"));
		}
		
		
		
		informeDTO.setEae(informe.getBecado().getEae());
		
		if(informe.getInformacionSuspension() != null)
			informeDTO.setInformacionSuspension(informe.getInformacionSuspension());
		else
			informeDTO.setInformacionSuspension(null);
		
		if(StringUtils.isNotBlank(informe.getCicloActual().getNombre()))
			informeDTO.setCicloLectivo(informe.getCicloActual().getNombre());
		
		if(informe.getPropositoAnioComienza() != null)
			informeDTO.setPropositoAnioComienza(informe.getPropositoAnioComienza());
		else
			informeDTO.setPropositoAnioComienza(null);
		
		if(StringUtils.isNotBlank(informe.getEaPerfil().getDatosPersonales().getNombre()) && StringUtils.isNotBlank(informe.getEaPerfil().getDatosPersonales().getApellido()))
			informeDTO.setEa(informe.getEaPerfil().getDatosPersonales().getNombre() + " " + informe.getEaPerfil().getDatosPersonales().getApellido());
		
		if(informe.getEdad() != null)
			informeDTO.setEdad(String.valueOf(informe.getEdad()));
		
		if(StringUtils.isNotBlank(informe.getBecado().getDatosPersonales().getLocalidad().getNombre()))
			informeDTO.setLocalidad(informe.getBecado().getDatosPersonales().getLocalidad().getNombre());
		
		if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getNombre()))
			informeDTO.setEscuela(informe.getBecado().getEscuela().getNombre());
		
		if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getLocalidad().getNombre()))
			informeDTO.setEscuelaLocalidad(informe.getBecado().getEscuela().getLocalidad().getNombre());
		
		if(StringUtils.isNotBlank(informe.getBecado().getAnioEscolar().getValor())){				
			informeDTO.setAnio(informe.getBecado().getAnioEscolar().getValor());
			informeDTO.setAnioEgreso(0,informe.getBecado().getAnioAdicional());
			if (informe.getBecado().getAnioAdicional()!=null){
				informeDTO.setAnioEgreso(0,informe.getBecado().getAnioAdicional());
			}
		}
		
		
		
		Boletin boletinAnioAnterior = informe.getBoletinAnioAnterior();
		if(boletinAnioAnterior != null){

			if(boletinAnioAnterior.getPrevias() != null && boletinAnioAnterior.getPrevias().size() > 0){			
				List<NotaMateria> notasPreviasMarzo = new ArrayList<NotaMateria>();
				List<NotaMateria> notasPreviasJulio = new ArrayList<NotaMateria>();
				List<NotaMateria> notasPreviasDiciembre = new ArrayList<NotaMateria>();
				
				Trimestre previasJulio = boletinAnioAnterior.getPrevias().get(0);
				Trimestre previasDiciembre = boletinAnioAnterior.getPrevias().get(1);
				Trimestre previasMarzo = boletinAnioAnterior.getPrevias().get(2);
				
				for (NotaMateria notaMateria : previasMarzo.getMaterias()) {
					notasPreviasMarzo.add(notaMateria);
				}
				for (NotaMateria notaMateria : previasJulio.getMaterias()) {
					notasPreviasJulio.add(notaMateria);
				}
				for (NotaMateria notaMateria : previasDiciembre.getMaterias()) {
					notasPreviasDiciembre.add(notaMateria);
				}
				
				for (int i = 0; i < boletinAnioAnterior.getMateriasPrevias().size(); i++) {
					Materia materia = boletinAnioAnterior.getMateriasPrevias().get(i);
					MateriaDTO materiaDTO = new MateriaDTO();
					NotaMateria notaMarzo = notasPreviasMarzo.get(i);
					NotaMateria notaJulio = notasPreviasJulio.get(i);
					NotaMateria notaDic = notasPreviasDiciembre.get(i);
										
					if (materia.equals(notaMarzo.getMateria())) {
						materiaDTO.setNombre(notaMarzo.getMateria().getNombre());
						materiaDTO.setCiclo(notaMarzo.getCiclo());
						if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaMarzo.getCalificacion())
								|| CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaJulio.getCalificacion())
								|| CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaDic.getCalificacion())){
							materiaDTO.setNotaMarzo(notaMarzo.getCalificacion().getValor());
							materiaDTO.setNotaFin(notaJulio.getCalificacion().getValor());
							materiaDTO.setNotaDic(notaDic.getCalificacion().getValor());
						}
						previas.add(materiaDTO);
					}					
				}
			}
			informeDTO.setPreviasDTO(previas);
			
			totalPrim = String.valueOf(boletinAnioAnterior.getDiasHabilesPrimerTrimestre());
			totalSeg = String.valueOf(boletinAnioAnterior.getDiasHabilesSegundoTrimestre());
			totalTerc = String.valueOf(boletinAnioAnterior.getDiasHabilesTercerTrimestre());
			
			inasPrimer =  String.valueOf(boletinAnioAnterior.getInasistenciasPrimerTrimestre());
			inasSegundo =  String.valueOf(boletinAnioAnterior.getInasistenciasSegundoTrimestre());
			inasTercer =  String.valueOf(boletinAnioAnterior.getInasistenciasTercerTrimestre());
			
			if (isUnTrimestreConMaterias(boletinAnioAnterior)
					|| isBoletinSinMaterias(boletinAnioAnterior)) {
				Trimestre primero = boletinAnioAnterior.getTrimestres().get(0);
				Trimestre segundo = boletinAnioAnterior.getTrimestres().get(1);
				Trimestre tercero = boletinAnioAnterior.getTrimestres().get(2);
				Trimestre fin = boletinAnioAnterior.getTrimestres().get(3);
				Trimestre diciembre = boletinAnioAnterior.getTrimestres().get(4);
				Trimestre marzo = boletinAnioAnterior.getTrimestres().get(5);
				for (NotaMateria notaMateria : primero.getMaterias()) {
					notasPrimero.add(notaMateria);

				}
				for (NotaMateria notaMateria : segundo.getMaterias()) {
					notasSegundo.add(notaMateria);
				}
				for (NotaMateria notaMateria : tercero.getMaterias()) {
					notasTercero.add(notaMateria);
				}
				for (NotaMateria notaMateria : fin.getMaterias()) {
					notasFin.add(notaMateria);
				}
				for (NotaMateria notaMateria : diciembre.getMaterias()) {
					notasDiciembre.add(notaMateria);
				}
				for (NotaMateria notaMateria : marzo.getMaterias()) {
					notasMarzo.add(notaMateria);
				}
				for (int i = 0; i < boletinAnioAnterior.getMaterias().size(); i++) {
					Materia materia = boletinAnioAnterior.getMaterias().get(i);
					MateriaDTO materiaDTO = new MateriaDTO();
					NotaMateria notaPri = notasPrimero.get(i);
					NotaMateria notaSeg = notasSegundo.get(i);
					NotaMateria notaTerc = notasTercero.get(i);
					NotaMateria notaFin = notasFin.get(i);
					NotaMateria notaDic = notasDiciembre.get(i);
					NotaMateria notaMarzo = notasMarzo.get(i);
										
					if (materia.equals(notaPri.getMateria())) {
						if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaPri.getCalificacion())){
							this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia);
						}
						else{
							if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaSeg.getCalificacion())){
								this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia);
							}
							else{
								if(CalificacionMateria.getListaCalificacionesAptasParaBoletinIS1().contains(notaTerc.getCalificacion())){
									this.getMateriaParaBoletinIS1(materiaDTO, notaPri, notaSeg, notaTerc, notaFin, notaDic, notaMarzo, materia);
								}
								else{
									materiaDTO = null;
								}
							}
						}
					}
					if(materiaDTO != null){
						materias.add(materiaDTO);
					}					
				}
				informeDTO.setMateriasDto(materias);
			}
		}
		else{
			informeDTO.setMateriasDto(null);
			if(informe.getBecado().getAnioEscolar() != null)
				informeDTO.setAnio(informe.getBecado().getAnioEscolar().getValor());
		}		
		String padrino = "";
		
		if(informe.getPadrino() != null)
		{
			if(informe.getPadrino().getEmpresa() != null){
				padrino = informe.getPadrino().getEmpresa().getDenominacion();
			}else{
				padrino = informe.getPadrino().getDatosPersonales().getNombre() + " " +
				informe.getPadrino().getDatosPersonales().getApellido();
			}
		}
		informeDTO.setPadrino(padrino);
		
		if(informe.getFechaPBE() != null)
			informeDTO.setFechaPBE(Formateador.formatearFechas(informe.getFechaPBE(), "dd/MM/yyyy"));

		informeDTO.setPathImg(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/logoCarta1_viejo.JPG"));
		//informeDTO.setPathImg("C:/imagenes/pablo.JPG");

		if(informe.getBoletinAnioAnterior() != null)
		{
			//inasistencias del bolet�n
			
			Float totalInas = boletinAnioAnterior.getTotalInasistencias();
			if(totalInas != null && totalInas != 0.0)
				inasFinal= String.valueOf(totalInas);
			if((inasPrimer.equals("0.0") && inasSegundo.equals("0.0") && inasTercer.equals("0.0")) || totalInas == 0F)
				inasFinal = null;
								
			Float totalDias = boletinAnioAnterior.getTotalDiasHabiles();
			if(totalDias != null && totalDias != 0.0)
				totalFinal = String.valueOf(totalDias);
			if((totalPrim.equals("0.0") && totalSeg.equals("0.0") && totalTerc.equals("0.0")) || totalDias == 0F)
				totalFinal = null;
				
				
			/*INASISTENCIAS 1� TRIMESTRE*/
			if(inasPrimer.equals("null") || StringUtils.isBlank(inasPrimer))
				informeDTO.setInasistenciasPrimerTrimestre(null);
			else 
				informeDTO.setInasistenciasPrimerTrimestre(inasPrimer);
			
			/*INASISTENCIAS 2� TRIMESTRE*/
			if(inasSegundo.equals("null") || StringUtils.isBlank(inasSegundo))
				informeDTO.setInasistenciasSegundoTrimestre(null);
			else 
				informeDTO.setInasistenciasSegundoTrimestre(inasSegundo);
			
			/*INASISTENCIAS 3� TRIMESTRE*/
			if(inasTercer.equals("null") || StringUtils.isBlank(inasTercer))
				informeDTO.setInasistenciasTercerTrimestre(null);
			else 
				informeDTO.setInasistenciasTercerTrimestre(inasTercer);
			
			informeDTO.setInasistenciasFinal(inasFinal);
			
			/*DIAS 1� TRIM.*/
			if(totalPrim.equals("null") || StringUtils.isBlank(totalPrim))
				informeDTO.setTotalDiasPrimero(null);
			else 
				informeDTO.setTotalDiasPrimero(totalPrim);
			
			/*DIAS 2� TRIM.*/
			if(totalSeg.equals("null") || StringUtils.isBlank(totalSeg))
				informeDTO.setTotalDiasSeg(null);
			else 
				informeDTO.setTotalDiasSeg(totalSeg);
			
			/*DIAS 3� TRIM.*/
			if(totalTerc.equals("null") || StringUtils.isBlank(totalTerc))
				informeDTO.setTotalDiasTerc(null);
			else 
				informeDTO.setTotalDiasTerc(totalTerc);
			
			informeDTO.setTotalDiasFinal(totalFinal);
		}		
		if(StringUtils.isNotBlank(informe.getObservaciones()))
			informeDTO.setObservacionesEntrevistaRenovacion(informe.getObservaciones());
		
		if(StringUtils.isNotBlank(informe.getActividadesVacaciones()))
			informeDTO.setActividadesVacaciones(informe.getActividadesVacaciones()); //Informaci�n adicional del estudiante para compartir con su padrino
		
		if(StringUtils.isNotBlank(informe.getEscolaridadCompromisoAnterior()))
			informeDTO.setEscolaridadCompromisoAnterior(informe.getEscolaridadCompromisoAnterior());
		
		if(StringUtils.isNotBlank(informe.getUtilizacionBeca()))
			informeDTO.setUtilizacionBeca(informe.getUtilizacionBeca());
		
		if(StringUtils.isNotBlank(informe.getObservacionesExcepcion()))
			informeDTO.setObservacionesExcepcion(informe.getObservacionesExcepcion());
		
		
		if(StringUtils.isNotBlank(informe.getExpectativasRA()))
			informeDTO.setExpectativasRA(informe.getExpectativasRA());
		
		if(informe.getSituacion() != null)
			informeDTO.setSituacionEscolar(informe.getSituacion().getValor());
		
		if(informe.getEr().getEvaluacionRenovacionMergeada() != null)
			informeDTO.setEstadoRenovacion(informe.getEr().getEvaluacionRenovacionMergeada().getValor());
		
		if(informe.getPropositoAnioComienzaList() != null)
			informeDTO.setPropositoAnioComienzaList(parsearListaPropositos(informe.getPropositoAnioComienzaList()));
		
		//if(informe.getGustosTiempoLibre() != null)
		//	informeDTO.setGustosTiempoLibre(parsearLista(informe.getGustosTiempoLibre()));
		if(StringUtils.isNotBlank(informe.getActividadesVacaciones()))
			informeDTO.setGustosTiempoLibre(informe.getActividadesVacaciones());
		
		
		
		
		if(informe.getBecado().getEscuela().getMatricula()!=null){
			informeDTO.setMatriculaTotal(informe.getBecado().getEscuela().getMatricula().toString());
		}else{
			informeDTO.setMatriculaTotal("-");
		}
		
		
		
		
		
		if(informe.getBecado().getEscuela().getOrientacion()!=null){
			if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getOrientacion()))
				informeDTO.setOrientacion(informe.getBecado().getEscuela().getOrientacion());
		}else{
			informeDTO.setOrientacion("-");
		}
		
		
		
		
		
		
		if(informe.getBecado().getEscuela().getObservaciones()!=null){
			if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getObservaciones()))
				informeDTO.setDescripcionEscuela(informe.getBecado().getEscuela().getObservaciones());
			
		}else{
			informeDTO.setDescripcionEscuela("-");
		}
		
		
		
		if (informe.getBecado().getEscuela().getComienzoPBE().getNombre() !=null){
			if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getComienzoPBE().getNombre()))
				informeDTO.setAnioIncorporacion(informe.getBecado().getEscuela().getComienzoPBE().getNombre());
		}else{
			informeDTO.setAnioIncorporacion("-");
		}
			
		
		
		
		informeDTO.setPathImg(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/logoCarta.JPG"));
		informeDTO.setTitulo(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/tituloIS1.JPG"));
		informeDTO.setFooter(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/footerIS1.jpg"));
		listInformeIS1DTO.add(informeDTO);
		
	}
	
	private String parsearListaPropositos(List<PropositoAnioComienza> propositoAnioComienzaList) {
		StringBuffer valor = new StringBuffer("");
		if(!propositoAnioComienzaList.isEmpty()){
			for (PropositoAnioComienza proposito : propositoAnioComienzaList) {
				valor.append( proposito.getValor().toLowerCase() + ", ");			
			}
			valor.replace(0, propositoAnioComienzaList.get(0).getValor().length(), propositoAnioComienzaList.get(0).getValor());		
			valor.deleteCharAt(valor.lastIndexOf(","));
			valor.deleteCharAt(valor.length() - 1);
			valor.append(".");			
		}
		return valor.toString();
	}

	private String parsearLista(List<GustosTiempoLibre> gustosTiempoLibre) {
		StringBuffer valor = new StringBuffer("");
		if(!gustosTiempoLibre.isEmpty()){
			for (GustosTiempoLibre gusto : gustosTiempoLibre) {
				valor.append( gusto.getValor().toLowerCase() + ", ");			
			}
			valor.replace(0, gustosTiempoLibre.get(0).getValor().length(), gustosTiempoLibre.get(0).getValor());		
			valor.deleteCharAt(valor.lastIndexOf(","));
			valor.deleteCharAt(valor.length() - 1);
			valor.append(".");			
		}
		return valor.toString();
	}
	
	private String parsearListaEspacios(List<EspacioApoyo> espacioApoyo, String otroEspacioApoyo) {
		StringBuffer valor = new StringBuffer("");
		if(!espacioApoyo.isEmpty()){
			for (EspacioApoyo espacio : espacioApoyo) {
				valor.append( espacio.getValor().toLowerCase() + ", ");			
			}
			valor.append( otroEspacioApoyo.toLowerCase() + ", ");			
			
			valor.replace(0, espacioApoyo.get(0).getValor().length(), espacioApoyo.get(0).getValor());		
			valor.deleteCharAt(valor.lastIndexOf(","));
			valor.deleteCharAt(valor.length() - 1);
			valor.append(".");			
		}
		System.out.println("###### valor parseado: "+valor.toString());
		return valor.toString();
	}

	private void cargarFPDTO(List<InformeFPDTO> listInformeFPDTO, FichaPresentacion informe) 
	{
		InformeFPDTO informeDTO = new InformeFPDTO();
		informeDTO.setAlumno(informe.getBecado().getDatosPersonales().getNombre() + " " + informe.getBecado().getDatosPersonales().getApellido());
		String fecha = Formateador.formatearFechas(informe.getBecado().getDatosPersonales().getFechaNacimiento(), "dd/MM/yyyy");
		informeDTO.setFechaNacimiento(fecha);
		List<BoletinSeleccion> boletinesSeleccion = informe.getBoletinSeleccions();
		List<MateriaDTO> materias = new ArrayList<MateriaDTO>();
		List<FichaFamiliarDTO> fichas = new ArrayList<FichaFamiliarDTO>();
		informeDTO = (InformeFPDTO)cargarDatosResposableAdulto(informe, informeDTO);
		Periodo periodoFechaPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informe.getFechaPBE());
		if(informe.getIncluirBoletinCheck()){
			if(boletinesSeleccion.size() != 0)
			{
				for (BoletinSeleccion boletinMatriaSeleccion : boletinesSeleccion) 
				{
					MateriaDTO materiaDTO = new MateriaDTO();
					
					if(StringUtils.isNotBlank(boletinMatriaSeleccion.getMateria().getNombre()))
						materiaDTO.setNombre(boletinMatriaSeleccion.getMateria().getNombre());
					else
						materiaDTO.setNombre("-");
					
					if (boletinMatriaSeleccion.getNotaPrimTrim() != null)
						materiaDTO.setNotaPrimero(String.valueOf(boletinMatriaSeleccion.getNotaPrimTrim()));
					else
						materiaDTO.setNotaPrimero("-");
	
					if (boletinMatriaSeleccion.getNotaSegTrim() != null)
						materiaDTO.setNotaSegundo(String.valueOf(boletinMatriaSeleccion.getNotaSegTrim()));
					else
						materiaDTO.setNotaSegundo("-");
	
					if (boletinMatriaSeleccion.getNotaTerTrim() != null)
						materiaDTO.setNotaTercero(String.valueOf(boletinMatriaSeleccion.getNotaTerTrim()));
					else
						materiaDTO.setNotaTercero("-");
	
					if (boletinMatriaSeleccion.getNotaFinal() != null)
						materiaDTO.setNotaFin(String.valueOf(boletinMatriaSeleccion.getNotaFinal()));
					else
						materiaDTO.setNotaFin("-");
	
					if (boletinMatriaSeleccion.getNotaDiciembre() != null)
						materiaDTO.setNotaDic(String.valueOf(boletinMatriaSeleccion.getNotaDiciembre()));
					else
						materiaDTO.setNotaDic("-");
	
					if (boletinMatriaSeleccion.getNotaMarzo() != null)
						materiaDTO.setNotaMarzo(String.valueOf(boletinMatriaSeleccion.getNotaMarzo()));
					else
						materiaDTO.setNotaMarzo("-");
	
					informeDTO.addMateria(materiaDTO);
					materias.add(materiaDTO);
	
				}
				informeDTO.setMaterias(materias);
			}
			else
				informeDTO.setMaterias(null);
		}
		else{
			informeDTO.setMaterias(null);
		}
		
		if(informe.getBecado().getFichaFamiliar().size() != 0)
		{
			for (FichaFamiliar fichaFamiliar : informe.getConvivientes()) 
			{
				
				if(fichaFamiliar.getConvive()!= null)
					if(fichaFamiliar.getConvive().equals(Convive.SI)){
						FichaFamiliarDTO fichaDTO = new FichaFamiliarDTO();
						if(fichaFamiliar.getEdad() != null)
							fichaDTO.setEdad(String.valueOf(fichaFamiliar.getEdad()));
						else
							fichaDTO.setEdad("-");
						//System.out.println(fichaFamiliar.getVinculo().getValor());
						if(fichaFamiliar.getVinculo().getValor().equals("Candidato") ){
							fichaDTO.setEdad(String.valueOf(informe.getEdad()));
						}
						if(fichaFamiliar.getVinculo().getValor().equals("Candidata") ){
							fichaDTO.setEdad(String.valueOf(informe.getEdad()));
						}
						if(fichaFamiliar.getNombre() != null && fichaFamiliar.getApellido() != null)
							fichaDTO.setNombreApellido(fichaFamiliar.getNombre() + " " + fichaFamiliar.getApellido());
						else if(fichaFamiliar.getNombre() == null && fichaFamiliar.getApellido() != null)
								fichaDTO.setNombreApellido(fichaFamiliar.getApellido());
							else if(fichaFamiliar.getNombre() != null && fichaFamiliar.getApellido() == null)
									fichaDTO.setNombreApellido(fichaFamiliar.getNombre());
								else
									fichaDTO.setNombreApellido("");					
						if(fichaFamiliar.getNivelEducativo() != null)
							fichaDTO.setNivelEstudio(fichaFamiliar.getNivelEducativo().getValor());
						else
							fichaDTO.setNivelEstudio("-");
						if(fichaFamiliar.getVinculo() != null)
							fichaDTO.setVinculo(fichaFamiliar.getVinculo().getValor());
						else
							fichaDTO.setVinculo("-");
						if(StringUtils.isNotBlank(fichaFamiliar.getOcupacionLaboral()))
							fichaDTO.setOcupacion(fichaFamiliar.getOcupacionLaboral());
						else
							fichaDTO.setOcupacion("-");
						informeDTO.addFicha(fichaDTO);
						fichas.add(fichaDTO);
					}
			}
			informeDTO.setConvivientes(fichas);
		}
		else
			informeDTO.setConvivientes(null);
		
		if(StringUtils.isNotBlank(informe.getMateriasInteres()))
			informeDTO.setMateriasInteres(informe.getMateriasInteres());
		else
			informeDTO.setMateriasInteres(null);
		
		informeDTO.setPathImg(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/logoCarta.JPG"));
		
		if(informe.getEdad() != null)
			informeDTO.setEdad(String.valueOf(informe.getEdad()));
				
		if(informe.getFechaPBE() != null)
			if(periodoFechaPBE != null)
				informeDTO.setFechaPBE(periodoFechaPBE.getNombre() + " " + periodoFechaPBE.getCiclo().getNombre());
			else
				informeDTO.setFechaPBE(Formateador.formatearFechas(informe.getFechaPBE(), "dd/MM/yyyy"));
		
		if(informe.getFechaReincorporacionPBE()!= null){ // es un chico reincorporado
			Periodo periodoFechaReincorporacionPBE = srvPeriodo.obtenerPeriodoPorFechaFP(informe.getFechaReincorporacionPBE());
			if(periodoFechaReincorporacionPBE != null)
				informeDTO.setFechaReincorporacionPBE(periodoFechaReincorporacionPBE.getNombre() + " " + periodoFechaReincorporacionPBE.getCiclo().getNombre());
			else
				informeDTO.setFechaReincorporacionPBE(Formateador.formatearFechas(informe.getFechaReincorporacionPBE(), "dd/MM/yyyy"));
		}
		
		informeDTO.setEae(informe.getBecado().getEae());
		
		//2018
		
			informeDTO.setInformacionEscuela(informe.getBecado().getEscuela().getObservaciones());
			
			informeDTO.setPropositoAnual(informe.getCuandoTermine());
			
			informeDTO.setTiempoLibre(informe.getTiempoLibre());
			
			if(informe.getBecado().getEscuela().getEspacioApoyo()!= null)
				informeDTO.setEspacioEscuela(parsearListaEspacios(informe.getBecado().getEscuela().getEspacioApoyo(),informe.getBecado().getEscuela().getCualOtroEspacioApoyo()));
		
			if(StringUtils.isNotBlank(informe.getMateriasMasCuesta()))
				informeDTO.setMateriasCuestan(informe.getMateriasMasCuesta());
			else
				informeDTO.setMateriasCuestan(null);

			if(StringUtils.isNotBlank(informe.getEaPerfil().getDatosPersonales().getNombre()) && StringUtils.isNotBlank(informe.getEaPerfil().getDatosPersonales().getApellido()))
				informeDTO.setEa(informe.getEaPerfil().getDatosPersonales().getNombre() + " " + informe.getEaPerfil().getDatosPersonales().getApellido());
		
			// mail ea
							
				informeDTO.setMailEA(informe.getEaPerfil().getDatosPersonales().getMail());
			
		
		if(StringUtils.isNotBlank(informe.getBecado().getDatosPersonales().getLocalidad().getNombre()))
			informeDTO.setLocalidad(informe.getBecado().getDatosPersonales().getLocalidad().getNombre());
		
		
		
		if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getNombre()))
			informeDTO.setEscuela(informe.getBecado().getEscuela().getNombre());
		
		if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getLocalidad().getNombre()))
			informeDTO.setEscuelaLocalidad(informe.getBecado().getEscuela().getLocalidad().getNombre());
		
		String padrino = "";
		informeDTO.setEae(informe.getBecado().getEscuela().getZonaCimientos().getEae());
		if(informe.getPadrino() != null)
		{
			if(informe.getPadrino().getEmpresa() != null){
				padrino = informe.getPadrino().getEmpresa().getDenominacion();
			}else{
				padrino = informe.getPadrino().getDatosPersonales().getNombre() + " " +
				informe.getPadrino().getDatosPersonales().getApellido();
			}
		}
		informeDTO.setPadrino(padrino);
		
		if(informe.getCicloActual().getFechaInicio() != null)
			informeDTO.setAnioActual(Formateador.formatearFechas(informe.getCicloActual().getFechaInicio(), "dd/MM/yyyy").substring(6, 10));
		
		if(informe.getBecado().getAnioEscolar() != null){
			informeDTO.setAnio(informe.getBecado().getAnioEscolar().getValor());
			informeDTO.setAnioEgreso(0);
			if (informe.getBecado().getAnioAdicional()!=null){
				informeDTO.setAnioEgreso(1);
			}
		}
		
		
		
		if(informe.getBecado().getEscuela().getMatricula()!=null){
			informeDTO.setMatriculaTotal(informe.getBecado().getEscuela().getMatricula().toString());
		}else{
			informeDTO.setMatriculaTotal("-");
		}
		
		//informeDTO.setVosMismo(informe.getVosMismo());
		
		//2023
		informeDTO.setRealizadoVacaciones(informe.getRealizadoVacaciones());
		
		informeDTO.setCuandoTermine(informe.getCuandoTermine());
		
		
		
		if(informe.getBecado().getEscuela().getOrientacion()!=null){
			if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getOrientacion()))
				informeDTO.setOrientacion(informe.getBecado().getEscuela().getOrientacion());
		}else{
			informeDTO.setOrientacion("-");
		}
		
		//2023
				informeDTO.setVosMismo(informe.getVosMismo());
				informeDTO.setSituacionEscolar(informe.getSituacionEscolar());
				informeDTO.setIncorporacion(informe.getIncorporacion());
				informeDTO.setObservacionesNoIncorporacion(informe.getObservacionesNoIncorporacion());
				informeDTO.setPropositoAnual(informe.getPropositoAnual());
				informeDTO.setMatriculaTotal(Integer.toString(informe.getBecado().getEscuela().getMatricula()));
				informeDTO.setDescripcionEscuela(informe.getBecado().getEscuela().getDescripcionEscuela());
				if(informe.getBecado().getEscuela().getAnioIncorporacion()==null){
					informeDTO.setAnioIncorporacion("sin dato");
				}else{
				informeDTO.setAnioIncorporacion(Integer.toString(informe.getBecado().getEscuela().getAnioIncorporacion()));
				}
		
		
		
		
		if(informe.getBecado().getEscuela().getObservaciones()!=null){
			if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getObservaciones()))
				informeDTO.setDescripcionEscuela(informe.getBecado().getEscuela().getObservaciones());
			
		}else{
			informeDTO.setDescripcionEscuela("-");
		}
		
		
		
		if (informe.getBecado().getEscuela().getComienzoPBE().getNombre() !=null){
			if(StringUtils.isNotBlank(informe.getBecado().getEscuela().getComienzoPBE().getNombre()))
				informeDTO.setAnioIncorporacion(informe.getBecado().getEscuela().getComienzoPBE().getNombre());
		}else{
			informeDTO.setAnioIncorporacion("-");
		}
		
		
		File file = new File(getProps().getProperty(ConstantesInformes.pathImagen) 
				+ informe.getBecado().getDatosPersonales().getDni().toString() + ConstantesInformes.extensionImagen);
		if(file.exists()){
			informeDTO.setFoto(getProps().getProperty(ConstantesInformes.pathImagen) 
					+ informe.getBecado().getDatosPersonales().getDni().toString() + ConstantesInformes.extensionImagen);			
		}
		else{
			informeDTO.setFoto(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/fotoPorDefecto.JPG"));
		}
		
		
		
		
		
		
		
		
		
		
		
		informeDTO.setPathImg(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/logoCarta.JPG"));
		informeDTO.setTitulo(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/tituloFP.JPG"));
		informeDTO.setFooter(this.getServletContext().getRealPath("WEB-INF/jasperTemplates/images/footerIS1.jpg"));
		
		
		listInformeFPDTO.add(informeDTO);
		
	}
	
	private Boolean isUnTrimestreConMaterias(Boletin boletin)
	{
		Boolean tieneUnTrimestreCargado = false;
		
			Trimestre primero = boletin.getTrimestres().get(0);
			Trimestre segundo = boletin.getTrimestres().get(1);
			Trimestre tercero = boletin.getTrimestres().get(2);
			Trimestre fin = boletin.getTrimestres().get(3);
			Trimestre diciembre = boletin.getTrimestres().get(4);
			Trimestre marzo = boletin.getTrimestres().get(5);

			if ((primero.getMaterias().size() != 0)
					|| (segundo.getMaterias().size() != 0)
					|| (tercero.getMaterias().size() != 0)
					|| (fin.getMaterias().size() != 0)
					|| (diciembre.getMaterias().size() != 0)
					|| (marzo.getMaterias().size() != 0)) {
				tieneUnTrimestreCargado = true;
			}
		
		return tieneUnTrimestreCargado;
	}

	private Boolean isBoletinSinMaterias(Boletin boletin)
	{
		Trimestre primero = boletin.getTrimestres().get(0);
		Trimestre segundo = boletin.getTrimestres().get(1);
		Trimestre tercero = boletin.getTrimestres().get(2);
		Trimestre fin = boletin.getTrimestres().get(3);
		Trimestre diciembre = boletin.getTrimestres().get(4);
		Trimestre marzo = boletin.getTrimestres().get(5);
		Boolean boletinSinMaterias = false;
		
		if((primero.getMaterias().size() != 0) && (segundo.getMaterias().size() != 0) 
			&& (tercero.getMaterias().size() != 0) && (fin.getMaterias().size() != 0) && (diciembre.getMaterias().size() != 0)
			&& (marzo.getMaterias().size() != 0))
		{
			boletinSinMaterias = true;
		}
		return boletinSinMaterias;
	}
	
	private String getMensajeDatosEstimadosBoletin(Integer materiasAprobadas,  Integer materiasDesaprobadas, Float inasistencias, String obsBoletin, String nombreApellido)
	{
		return MSG_DATOS_ESTIMADOS_BOLETIN_PARTE1 + nombreApellido + MSG_DATOS_ESTIMADOS_BOLETIN_PARTE2 + materiasAprobadas + 
			   MSG_DATOS_ESTIMADOS_BOLETIN_PARTE3 + materiasDesaprobadas + MSG_DATOS_ESTIMADOS_BOLETIN_PARTE4 + 
			   MSG_DATOS_ESTIMADOS_BOLETIN_PARTE5 + inasistencias + MSG_DATOS_ESTIMADOS_BOLETIN_PARTE6 + obsBoletin;
	}
	
	private void getMateriaParaBoletinIS1(MateriaDTO materiaDTO, NotaMateria notaPri, NotaMateria notaSeg, 
			NotaMateria notaTerc, NotaMateria notaFin, NotaMateria notaDic, NotaMateria notaMarzo, 
			Materia materiaBoletin){
		
		materiaDTO.setNombre(notaPri.getMateria().getNombre());
		materiaDTO.setNotaPrimero(notaPri.getCalificacion().getValor());
		materiaDTO.setNotaSegundo(notaSeg.getCalificacion().getValor());		
		materiaDTO.setNotaTercero(notaTerc.getCalificacion().getValor());
		materiaDTO.setNotaFin(notaFin.getCalificacion().getValor());
		materiaDTO.setNotaDic(notaDic.getCalificacion().getValor());
		materiaDTO.setNotaMarzo(notaMarzo.getCalificacion().getValor());				
	}
	
	private Object cargarDatosResposableAdulto(Informe informe, Object informeDTO){
		String respAdulto = "";
		String vinculo = "";		
		if(informe.getBecado().getResponsable2() != null){
			if(StringUtils.isNotBlank(informe.getBecado().getResponsable2().getNombre()) && StringUtils.isNotBlank(informe.getBecado().getResponsable2().getApellido())){
				respAdulto = informe.getBecado().getResponsable2().getNombre() + " " + informe.getBecado().getResponsable2().getApellido();
				if(informe.getBecado().getResponsable2().getIdVinculo() != null)
					vinculo = informe.getBecado().getResponsable2().getIdVinculo().getValor();
				else
					vinculo = null;
			}
			else{
				respAdulto = null;
			}
		}
		else{
			if(StringUtils.isNotBlank(informe.getBecado().getResponsable1().getNombre()) && StringUtils.isNotBlank(informe.getBecado().getResponsable1().getApellido())){
				respAdulto = informe.getBecado().getResponsable1().getNombre() + " " + informe.getBecado().getResponsable1().getApellido();
				if(informe.getBecado().getResponsable1().getIdVinculo() != null)
					vinculo = informe.getBecado().getResponsable1().getIdVinculo().getValor();
				else
					vinculo = null;
			}
			else{
				respAdulto = null;
			}
		}
		if(informe.getNombre().equals(ConstantesInformes.nombreInformeFP)){
			InformeFPDTO informeFPDTO = (InformeFPDTO)informeDTO;
			informeFPDTO.setResponsable(respAdulto);
			informeFPDTO.setRelacion(vinculo);
			return informeFPDTO;
		}
		else{
			if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS1)){
				InformeIS1DTO informeIS1DTO = (InformeIS1DTO)informeDTO;
				informeIS1DTO.setResponsable(respAdulto);
				informeIS1DTO.setRelacion(vinculo);
				return informeIS1DTO;
			}
			else{
				if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS2)){
					InformeIS2DTO informeIS2DTO = (InformeIS2DTO)informeDTO;
					informeIS2DTO.setResponsable(respAdulto);
					informeIS2DTO.setRelacion(vinculo);
					return informeIS2DTO;
				}
				else{
					if(informe.getNombre().equals(ConstantesInformes.nombreInformeIS3)){
						InformeIS3DTO informeIS3DTO = (InformeIS3DTO)informeDTO;
						informeIS3DTO.setResponsable(respAdulto);
						informeIS3DTO.setRelacion(vinculo);
						return informeIS3DTO;
					}
					else{
						if(informe.getNombre().equals(ConstantesInformes.nombreInformeCesacion)){
							InformeCesacionDTO informeCesacionDTO = (InformeCesacionDTO)informeDTO;
							informeCesacionDTO.setResponsable(respAdulto);
							informeCesacionDTO.setRelacion(vinculo);
							return informeCesacionDTO;
						}
					}
				}
			}				
		}
		return informeDTO;
	}
	
	private void setMateriasIS2(List<Materia> listaMaterias, String materiasInforme, InformeIS2DTO informeDTO, String tipoMateria){
		String primerMateria = "";
		String segundaMateria = "";
		String tercerMateria = "";
		if(tipoMateria.equals("interes")){
			if (materiasInforme!= null && !materiasInforme.equals("")){
				List<Long> listLocalMateriasInteres = null;
				listLocalMateriasInteres = new ArrayList<Long>();
				listLocalMateriasInteres = Formateador.toListOfLongs(materiasInforme);
				int cantMateriasInteres = listLocalMateriasInteres.size();
				if(cantMateriasInteres == 1){
					primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(0));
					informeDTO.setPrimerMateriaInteres(primerMateria);
				}
				else{
					if(cantMateriasInteres == 2){
						primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(0));
						informeDTO.setPrimerMateriaInteres(primerMateria);
						segundaMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(1));
						informeDTO.setSegundaMateriaInteres(segundaMateria);
					}
					else{
						if(cantMateriasInteres == 3){
							primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(0));
							informeDTO.setPrimerMateriaInteres(primerMateria);
							segundaMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(1));
							informeDTO.setSegundaMateriaInteres(segundaMateria);
							tercerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(2));
							informeDTO.setTercerMateriaInteres(tercerMateria);
						}				
					}		
				}
			}
		}
		else{
			if (materiasInforme!= null && !materiasInforme.equals("")){
				List<Long> listLocalMateriasCuestan = null;
				listLocalMateriasCuestan = new ArrayList<Long>();
				listLocalMateriasCuestan = Formateador.toListOfLongs(materiasInforme);
				int cantMateriasCuestan = listLocalMateriasCuestan.size();
				if(cantMateriasCuestan == 1){
					primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(0));
					informeDTO.setPrimerMateriaCuesta(primerMateria);
				}
				else{
					if(cantMateriasCuestan == 2){
						primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(0));
						informeDTO.setPrimerMateriaCuesta(primerMateria);
						segundaMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(1));
						informeDTO.setSegundaMateriaCuesta(segundaMateria);
					}
					else{
						if(cantMateriasCuestan == 3){
							primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(0));
							informeDTO.setPrimerMateriaCuesta(primerMateria);
							segundaMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(1));
							informeDTO.setSegundaMateriaCuesta(segundaMateria);
							tercerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(1));
							informeDTO.setTercerMateriaCuesta(segundaMateria);
						}				
					}		
				}
			}				
		}		
	}
	
	private void setMateriasIS3(List<Materia> listaMaterias, String materiasInforme, InformeIS3DTO informeDTO, String tipoMateria){
		String primerMateria = "";
		String segundaMateria = "";
		String tercerMateria = "";
		if(tipoMateria.equals("interes")){
			if (materiasInforme!= null && !materiasInforme.equals("")){
				List<Long> listLocalMateriasInteres = null;
				listLocalMateriasInteres = new ArrayList<Long>();
				listLocalMateriasInteres = Formateador.toListOfLongs(materiasInforme);
				int cantMateriasInteres = listLocalMateriasInteres.size();
				if(cantMateriasInteres == 1){
					primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(0));
					informeDTO.setPrimerMateriaInteres(primerMateria);
				}
				else{
					if(cantMateriasInteres == 2){
						primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(0));
						informeDTO.setPrimerMateriaInteres(primerMateria);
						segundaMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(1));
						informeDTO.setSegundaMateriaInteres(segundaMateria);
					}
					else{
						if(cantMateriasInteres == 3){
							primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(0));
							informeDTO.setPrimerMateriaInteres(primerMateria);
							segundaMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(1));
							informeDTO.setSegundaMateriaInteres(segundaMateria);
							tercerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasInteres.get(2));
							informeDTO.setTercerMateriaInteres(tercerMateria);
						}				
					}		
				}
			}
		}
		else{
			if (materiasInforme!= null && !materiasInforme.equals("")){
				List<Long> listLocalMateriasCuestan = null;
				listLocalMateriasCuestan = new ArrayList<Long>();
				listLocalMateriasCuestan = Formateador.toListOfLongs(materiasInforme);
				int cantMateriasCuestan = listLocalMateriasCuestan.size();
				if(cantMateriasCuestan == 1){
					primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(0));
					informeDTO.setPrimerMateriaCuesta(primerMateria);
				}
				else{
					if(cantMateriasCuestan == 2){
						primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(0));
						informeDTO.setPrimerMateriaCuesta(primerMateria);
						segundaMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(1));
						informeDTO.setSegundaMateriaCuesta(segundaMateria);
					}
					else{
						if(cantMateriasCuestan == 3){
							primerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(0));
							informeDTO.setPrimerMateriaCuesta(primerMateria);
							segundaMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(1));
							informeDTO.setSegundaMateriaCuesta(segundaMateria);
							tercerMateria = this.obtenerMateriaSeleccionada(listaMaterias, listLocalMateriasCuestan.get(1));
							informeDTO.setTercerMateriaCuesta(segundaMateria);
						}				
					}		
				}
			}				
		}		
	}

	private String obtenerMateriaSeleccionada(List<Materia> listaMaterias, Long pos){
		int i = 0;
		String materia = "";
		boolean encontro = false;
		while (i< listaMaterias.size() && !encontro) {
			if(listaMaterias.get(i).getId().equals(pos)){
				materia = listaMaterias.get(i).getNombre();
				encontro = true;
			}
			i++;
		}
		return materia;
	}
	
	
	private String obtenerMensajePadrino(Texto texto, TipoPadrino tipoPadrino, PerfilPadrino padrino, Persona alumno, Persona usuarioDi, 
			ZonaCimientos zona, String otroMotivo){		
		boolean reemplazar = false;
		String mail = "";
		String destinatario = "";
		String cuerpo = "";
		String firma = "";
		String nombrePadrino = "";
		String apellidoPadrino = "";
		String nombreBecado = "";
		String apellidoBecado = "";
		String zonaBeca = "";
		String nombreUsuario = "";
		String apellidoUsuario = "";

		if(texto != null){
			if(tipoPadrino!= null){
				if(tipoPadrino.equals(TipoPadrino.INDIVIDUAL)){
					if(padrino.getDatosPersonales()!=null){
						reemplazar = true;
						nombrePadrino = Formateador.reemplazarAcentosHtml(padrino.getDatosPersonales().getNombre());
						apellidoPadrino = Formateador.reemplazarAcentosHtml(padrino.getDatosPersonales().getApellido());
					}
				}
				else{
					if(tipoPadrino.equals(TipoPadrino.CORPORATIVO)){
						if(padrino.getEmpresa()!=null){
							if(padrino.getEmpresa().getContacto1() != null){								
								String nombre = "";
								if(padrino.getEmpresa().getContacto1().contains(";")){
									String[] contactos = padrino.getEmpresa().getContacto1().split(";");
									if(contactos[0].contains(",")){
										String[] nombreApellidoContacto = contactos[0].split(",");
										nombre = nombreApellidoContacto[0];										
									}
									else if(contactos[0].contains(" ")){
										String[] nombreApellidoContacto = contactos[0].split(" ");
										nombre = nombreApellidoContacto[0];
									}
								}
								else{
									if(padrino.getEmpresa().getContacto1().contains(",")){
										String[] nombreApellidoContacto = padrino.getEmpresa().getContacto1().split(",");
										nombre = nombreApellidoContacto[0];
									}
									else if(padrino.getEmpresa().getContacto1().contains(" ")){
										String[] nombreApellidoContacto = padrino.getEmpresa().getContacto1().split(" ");
										nombre = nombreApellidoContacto[0];
									}
								}
								nombrePadrino = Formateador.reemplazarAcentosHtml(nombre);
							}
							else
								nombrePadrino = Formateador.reemplazarAcentosHtml(padrino.getEmpresa().getDenominacion());
							reemplazar = true;
						}
					}
				}
			}
			if(alumno != null){
				nombreBecado = Formateador.reemplazarAcentosHtml(alumno.getNombre());
				apellidoBecado = Formateador.reemplazarAcentosHtml(alumno.getApellido());
				reemplazar = true;
			}			
			if(usuarioDi != null){
				nombreUsuario = Formateador.reemplazarAcentosHtml(usuarioDi.getNombre());
				apellidoUsuario = Formateador.reemplazarAcentosHtml(usuarioDi.getApellido());
				reemplazar = true;
			}				
			if(zona != null){
				zonaBeca = Formateador.reemplazarAcentosHtml(zona.getNombre());
				reemplazar=true;
			}
			if(reemplazar){
				String cuerpo1="";
				String cuerpo2="";
				String cuerpo3="";
				String cuerpo4="";
				destinatario = texto.getDestinatario().replace("[nombrePadrino]", nombrePadrino);
				destinatario = destinatario.replace("[apellidoPadrino]", apellidoPadrino);
				cuerpo1=texto.getCuerpo();
				cuerpo2=cuerpo1.replace("[nombreBecado]", nombreBecado);
				cuerpo3 = cuerpo2.replace("[apellidoBecado]", apellidoBecado);
				cuerpo4=cuerpo3.replace("[zonaBeca]", zonaBeca);
				cuerpo=cuerpo4;
				//cuerpo = texto.getCuerpo().replace("[nombreBecado]", nombreBecado);
				//cuerpo = texto.getCuerpo().replace("[nombrePadrino]", nombrePadrino);
				//cuerpo = texto.getCuerpo().replace("[apellidoBecado]", apellidoBecado);
				//cuerpo = texto.getCuerpo().replace("[zonaBeca]", zonaBeca);
				// arreglado por carlos 04-04-2014
				if(otroMotivo==null){
					otroMotivo="";
				}
				cuerpo= cuerpo.replace("[textoEntrev.Comun.Pent-Otro]", otroMotivo);
				firma = texto.getFirma().replace("[nombreUsuario]", nombreUsuario);
				
				firma= firma.replace("[apellidoUsuario]", apellidoUsuario);	
				if(padrino != null)
					mail = destinatario;
				mail = mail + cuerpo;
				 
				//if(usuarioDi !=  null)
					mail = mail + firma;
				
				
			}
			
		}		
		return mail;
	}
}
