package org.cimientos.intranet.web.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.cimientos.intranet.web.controller.Conexion;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.cimientos.intranet.dto.EntrevistaSeleccionDTO;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.FichaFamiliar;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.candidato.convocatoria.Convocatoria;
import org.cimientos.intranet.modelo.entrevistaTS.EntrevistaTS;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.escuela.EscuelaSeleccion;
import org.cimientos.intranet.modelo.perfil.AlumnoSeleccion;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfil.Turno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.persona.PersonaSeleccion;
import org.cimientos.intranet.modelo.seleccion.BoletinSeleccion;
import org.cimientos.intranet.modelo.seleccion.EntrevistaSeleccion;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.servicio.AlumnoSeleccionSrv;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.ConvocatoriaSrv;
import org.cimientos.intranet.servicio.EntrevistaSeleccionSrv;
import org.cimientos.intranet.servicio.EntrevistaTSSrv;
import org.cimientos.intranet.servicio.EscuelaSeleccionSrv;
import org.cimientos.intranet.servicio.EscuelaSrv;
import org.cimientos.intranet.servicio.LocalidadSrv;
import org.cimientos.intranet.servicio.MateriaSrv;
import org.cimientos.intranet.servicio.PerfilTSSrv;
import org.cimientos.intranet.servicio.PersonaSrv;
import org.cimientos.intranet.servicio.ProvinciaSrv;
import org.cimientos.intranet.servicio.ResponsableSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.cimientos.intranet.utils.ConstantesInformes;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.utils.hilos.LiberarMemoria;
import org.cimientos.intranet.utils.paginacion.ExtendedPaginatedList;
import org.cimientos.intranet.utils.paginacion.PaginateListFactory;
import org.displaytag.tags.TableTagParameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.AnioEscolar;
import com.cimientos.intranet.enumerativos.Conducta;
import com.cimientos.intranet.enumerativos.Convive;
import com.cimientos.intranet.enumerativos.EmitioCarta;
import com.cimientos.intranet.enumerativos.EstadoCivil;
import com.cimientos.intranet.enumerativos.NivelEducativo;
import com.cimientos.intranet.enumerativos.TipoAfyp;
import com.cimientos.intranet.enumerativos.TipoDni;
import com.cimientos.intranet.enumerativos.Vinculo;
import com.cimientos.intranet.enumerativos.entrevista.Compromiso;
import com.cimientos.intranet.enumerativos.entrevista.CompromisoPBE;
import com.cimientos.intranet.enumerativos.entrevista.Entrevistador;
import com.cimientos.intranet.enumerativos.entrevista.EstadoEntrevista;
import com.cimientos.intranet.enumerativos.entrevista.MotivoEnvioTS;
import com.cimientos.intranet.enumerativos.entrevista.MotivoRechazo;
import com.cimientos.intranet.enumerativos.entrevista.RelacionVivienda;
import com.cimientos.intranet.enumerativos.entrevista.SiNoReveer;

/**
 * 
 * Esta clase mapea las vistas de los candidatos.
 * 
 * @author Nicolas Lopez
 * 
 */
;



@Controller
@RequestMapping("/entrevistaSeleccion/*")
public class EntrevistaSeleccionController extends BaseController {

	private static final Logger log = Logger
			.getLogger(EntrevistaSeleccionController.class);

	/** The registrar candidato srv. */
	@Autowired
	private EntrevistaSeleccionSrv entrevistaSeleccionSrv;
	@Autowired
	private ConvocatoriaSrv convocatoriaSrv;
	@Autowired
	private EscuelaSrv escuelaSrv;
	@Autowired
	private LocalidadSrv localidadSrv;
	@Autowired
	private PerfilTSSrv perfilTSSrv;
	@Autowired
	private CicloProgramaSrv cicloSrv;
	@Autowired
	private ProvinciaSrv provinciaSrv;
	@Autowired
	private AlumnoSrv alumnoSrv;
	@Autowired
	private PersonaSrv personaSrv;
	@Autowired
	private ResponsableSrv responsableSrv;
	@Autowired
	private AlumnoSeleccionSrv alumnoSeleccionSrv;
	@Autowired
	private MateriaSrv materiaSrv;
	@Autowired
	private ZonaCimientosSrv zonaCimientosSrv;
	@Autowired
	private PaginateListFactory paginateListFactory;
	@Autowired
	private EscuelaSeleccionSrv escuelaSeleccionSrv;
	@Autowired
	private EntrevistaTSSrv entrevistaTSService;

	private static final int IMG_WIDTH = 400;
	private static final int IMG_HEIGHT = 300;
	
	
	/**
	 * Mapea esta acción con initCandidato.jsp, pasándole como parámetro un
	 * Candidato nuevo.
	 * 
	 * @param req
	 *            the req
	 * @param user
	 *            the user
	 * @return el modelo con el objeto Candidato.
	 * @since 10-nov-2010
	 * @author cfigueroa
	 */
	
	
	
	@RequestMapping("/entrevistaSeleccion/entrevistaSeleccionView.do")
	public ModelAndView entrevistaSeleccionView() {

		EntrevistaSeleccionDTO entrevistaSeleccionDto = new EntrevistaSeleccionDTO();
		entrevistaSeleccionDto.setPerfilAlumno(new AlumnoSeleccion());
		entrevistaSeleccionDto
				.setEntrevistaSeleccion(new EntrevistaSeleccion());
		Map<String, Object> map = new HashMap<String, Object>();
		map = cargarObjetosFormulario(entrevistaSeleccionDto, false);

		List<PerfilTS> perfilesTS = perfilTSSrv.obtenerTodos();
		map.put("listPerfilTS", perfilesTS);
		map.put("listVinculo", Vinculo.getListaVinculos());
		map.put("isDetalleEntrevista", false);
		map.put("isNuevaEntrevista", true);
		map.put("isOtraEntrevista", false);
		map.put("accion", "alta");
		
		return forward("/entrevistaSeleccion/entrevistaSeleccionView", map);

	}

	/**
	 * Reporte entrevista seleccion.
	 * 
	 * @return the model and view
	 * @since 18-ene-2011
	 * 
	 * */
	@RequestMapping("/entrevistaSeleccion/reporteEntrevistaSeleccion.do")
	public ModelAndView reporteEntrevistaSeleccion(
			HttpServletRequest request,
			@RequestParam(required = false, value = "idCiclo") Long idCiclo,
			@RequestParam(required = false, value = "idZonaCimientos") Long idZonaCimientos,
			@RequestParam(required = false, value = "idEscuela") Long idEscuela,
			@RequestParam(required = false, value = "idAnioEscolar") Integer idAnioEscolar,
			@RequestParam(required = false, value = "nombreAlumno") String nombreAlumno,
			@RequestParam(required = false, value = "idConvocatoria") Long idConvocatoria,
			@RequestParam(required = false, value = "idEstadoAlumno") Integer idEstadoAlumno,
			@RequestParam(required = false, value = "fechaDesde") String fechaDesde,
			@RequestParam(required = false, value = "fechaHasta") String fechaHasta,
			@RequestParam(required = false, value = "mensaje") String mensaje,
			@RequestParam(required = false, value = "eae") String eae,
			@RequestParam(required = false, value = "error") String error) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		EstadoAlumno estadoAlumno = null;
		ZonaCimientos zona = null;
		Convocatoria convocatoria = null;
		CicloPrograma cicloPrograma = null;
		AnioEscolar anioEscolar = null;
		EscuelaSeleccion escuela = null;
		Long cicloId = idCiclo != null && idCiclo.equals(0) ? null : idCiclo;
		Integer estadoAlumnoId = idEstadoAlumno != null
				&& idEstadoAlumno.equals(0) ? null : idEstadoAlumno;
		Integer idAnio = idAnioEscolar != null && idAnioEscolar.equals(0) ? null
				: idAnioEscolar;
		List<EstadoAlumno> lisEstadosAlumnos = new ArrayList<EstadoAlumno>();
		lisEstadosAlumnos.add(EstadoAlumno.APROBADO);
		lisEstadosAlumnos.add(EstadoAlumno.RECHAZADO);
		lisEstadosAlumnos.add(EstadoAlumno.LISTA_ESPERA);
		lisEstadosAlumnos.add(EstadoAlumno.LISTA_ESPERA_MATERIAS);
		lisEstadosAlumnos.add(EstadoAlumno.PRESELECCIONADO);

		//System.out.println("eae ES "+eae);
		
		if (estadoAlumnoId != null) {
			estadoAlumno = EstadoAlumno.getEstados(estadoAlumnoId);
			map.put("estado", estadoAlumno);
		}
		if (idZonaCimientos != null) {
			zona = zonaCimientosSrv.obtenerZonaCimientos(idZonaCimientos);
			map.put("zonaCimientos", zona);
		}
		if (idConvocatoria != null) {
			convocatoria = convocatoriaSrv
					.obtenerConvocatoriaPorId(idConvocatoria);
			map.put("convocatoria", convocatoria);
		}
		if (cicloId != null) {
			cicloPrograma = cicloSrv.obtenerCiclo(cicloId);
			map.put("ciclo", cicloPrograma);
		}
		if (idEscuela != null) {
			escuela = escuelaSeleccionSrv.obtenerEscuelaPorId(idEscuela);
			map.put("escuela", escuela);
		}
		if (idAnio != null) {
			anioEscolar = AnioEscolar.getAnioEscolar(idAnio);
			map.put("anioEscolar", anioEscolar);
		}

		map.put("listaCiclos", cicloSrv.obtenerTodos());
		map.put("listaAnioEscolar", AnioEscolar.getAnioEscolares());

		map.put("listEstadoAlumnos", lisEstadosAlumnos);

		map.put("nombreAlumno", nombreAlumno);
		map.put("eae", eae);
		
		//map.put("fechaDesde", fechaDesde);
		//map.put("fechaHasta", fechaHasta);
		
		
		
		
		if (fechaDesde==null || fechaHasta==null){
			//System.out.println("null o null: "+fechaDesde);
			//System.out.println("null o null: "+fechaHasta);
			map.put("entrevistas",
					paginadoEntrevistas(request, estadoAlumno, zona, convocatoria,
					cicloPrograma, escuela, anioEscolar, nombreAlumno,null,null,eae));
		}else{
			if (fechaDesde=="" || fechaHasta==""){
				//System.out.println("vacio o vacio: "+fechaDesde);
				//System.out.println("vacio o vacio: "+fechaHasta);
				map.put("entrevistas",
						paginadoEntrevistas(request, estadoAlumno, zona, convocatoria,
								cicloPrograma, escuela, anioEscolar, nombreAlumno,null,null,eae));
			}else{
				//System.out.println("con fecha: "+fechaDesde);
				//System.out.println("con fecha: "+fechaHasta);
				
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String dateInString1 = fechaDesde;
				String dateInString2 = fechaHasta;
			 
				try {
			 
					Date fechaDesdeDate = formatter.parse(dateInString1);
					Date fechaHastaDate = formatter.parse(dateInString2);
					//System.out.println("en formato fecha: "+fechaDesdeDate);
					//System.out.println(formatter.format(fechaDesdeDate));
					//System.out.println(fechaHastaDate);
					//System.out.println(formatter.format(fechaHastaDate));
					
					map.put("entrevistas",
							paginadoEntrevistas(request, estadoAlumno, zona, convocatoria,
							cicloPrograma, escuela, anioEscolar, nombreAlumno, fechaDesdeDate,fechaHastaDate,eae));
			 
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				
				
			}
			
			
		}
			
		
		
			
		
		if (StringUtils.isNotBlank(mensaje))
			map.put("mensaje", mensaje);
		if (StringUtils.isNotBlank(error))
			map.put("error", error);

		Persona personaLogueada = obtenerPersona(request);
		if (personaLogueada.getPerfilSuperUsuario()) {
			map.put("tipoPerfil", "superUsuario");
		} else {
			map.put("tipoPerfil", "");
		}

		return forward("/entrevistaSeleccion/reporteEntrevistasSeleccion", map);
	}

	/**
	 * Guardar Candidato.
	 * 
	 * @return the model and view
	 * @since 10-nov-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/entrevistaSeleccion/altaEntrevistaSeleccion.do")
	public ModelAndView guardarEntrevista(
			@ModelAttribute("entrevistaSeleccionDto") EntrevistaSeleccionDTO entrevistaDTO,
			@RequestParam("fechaNacRes") String fechaNacRes,
			@RequestParam("fechaEntrevista") String fechaEntrevista,
			@RequestParam("accion") String accion,
			@RequestParam(required = false, value = "idEntrevista") Long idEntrevista,
			@RequestParam(required = false, value = "otroBecado") Boolean otroBecado,
			//@RequestParam(required = false, value = "excepcion") Boolean excepcion,
			@RequestParam("identrevistador") String identrevistador,
			@RequestParam("eae") String eae,
			@RequestParam("excepcion") String excepcion,
			@RequestParam("alumnoNacionalidad") String alumnoNacionalidad,
			@RequestParam("situacionEscolarAnioAnterior") String situacionEscolarAnioAnterior,
			@RequestParam("materiasPrevias") String materiasPrevias,
			@RequestParam("tiempoLibre") String tiempoLibre,
			@RequestParam(required=false, value="foto") Object foto,
			@RequestParam("responsableNacionalidad") String responsableNacionalidad,			
			@RequestParam("vosMismo") String vosMismo,			 
			@RequestParam("trabajas") String trabajas,			 
			@RequestParam("enQue") String enQue,			 
			@RequestParam("responsabilidad") String responsabilidad,			 
			@RequestParam("repetiste") String repetiste,			 
			@RequestParam("porQueRepetiste") String porQueRepetiste,			 
			@RequestParam("abandonaste") String abandonaste,			 
			@RequestParam("porQueAbandonaste") String porQueAbandonaste,			 
			@RequestParam("situacionEscolarAnioPasado") String situacionEscolarAnioPasado,			 
			@RequestParam("previas") String previas,			 
			@RequestParam("cualesPrevias") String cualesPrevias,			 
			@RequestParam("desempenio") String desempenio,			 
			@RequestParam("porQueDesempenio") String porQueDesempenio,			 
			@RequestParam("faltas") String faltas,			 
			@RequestParam("motivoFaltas") String motivoFaltas,			 
			@RequestParam("materiasPreferidas") String materiasPreferidas,			 
			@RequestParam("materiaCuesta") String materiaCuesta,			 
			@RequestParam("comentarioAdicional") String comentarioAdicional,			 
			@RequestParam("aportarPFE") String aportarPFE,			 
			@RequestParam("cognitivo") String cognitivo,			 
			@RequestParam("riesgoExtraEscolar") String riesgoExtraEscolar,
			@RequestParam("respoBanco") String bancoString,
			HttpServletRequest request) {
		ModelAndView modelAndView = null;
		
		
		
		
		if (excepcion==null){
			excepcion="No";
		}
		
		if (alumnoNacionalidad==null){
			alumnoNacionalidad="Argentina";
		}
		if (responsableNacionalidad==null){
			responsableNacionalidad="Argentina";
		}
		
		//System.out.println("Otro becado: " + otroBecado);
		if (otroBecado == null) {
		      otroBecado = false;
		}
		
		
		long banco=0;
		
		if (bancoString.equals("Galicia")){
			banco=2;
		}else {
			if (bancoString.equals("Macro")){
				banco=3;
			}else{
				if (bancoString.equals("Industrial")){
					banco=1;
				}else{
					if (bancoString.equals("Supervielle")){
						banco=4;
					}else{
						banco=1;
					}
				}
				
			}
		}
		
		
		
		
		//buscar id banco
		Connection cn = null;
        CallableStatement cl = null;
        ResultSet rs = null;
        String call=null;
        
        try {
        
	        call = "{CALL SP_BuscarIDBanco(?)}";
			cn = Conexion.getConexion();
	        cl = cn.prepareCall(call);
	        cl.setString(1, bancoString);
	        rs = cl.executeQuery();
	        while (rs.next()) {
	        	banco=rs.getLong("id");        	
	        }
	        Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
	        //System.out.println("el banco es " + bancoString + " y el id es: " + banco);        
        } 
        catch (SQLException e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        }    
		
		
		entrevistaDTO.setEdad(Formateador.calcularEdad(Formateador.parsearFecha(entrevistaDTO.getFechaNacimientoCandidato())));
		entrevistaDTO.setEae(eae);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Boolean puedeCargarEntrevista = true;
		Boolean puedeModificarEntrevista = (accion.equals("modificar")) ? true
				: false;
		Long entrevistaId = (idEntrevista != null && !idEntrevista.equals(0L)) ? idEntrevista
				: 0;
		// EntrevistaSeleccion entrevSeleccion =
		// entrevistaSeleccionSrv.obtenerEntrevistaPorDniAlumno(entrevistaDTO.getPerfilAlumno().getDatosPersonales().getDni());
		
		
		EntrevistaSeleccion entrevSeleccion = entrevistaSeleccionSrv
				.obtenerEntrevistaSeleccion(entrevistaId);
		EntrevistaSeleccion entrevistaSeleccion = new EntrevistaSeleccion();
		
		entrevSeleccion.setVosMismo(vosMismo);
		
		entrevSeleccion.setTrabajas(trabajas);
		entrevSeleccion.setEnQue(enQue);
		entrevSeleccion.setResponsabilidad(responsabilidad);
		entrevSeleccion.setRepetiste(repetiste);
		entrevSeleccion.setPorQueRepetiste(porQueRepetiste);
		entrevSeleccion.setAbandonaste(porQueAbandonaste);
		entrevSeleccion.setPorQueAbandonaste(porQueAbandonaste);
		entrevSeleccion.setSituacionEscolarAnioPasado(situacionEscolarAnioPasado);
		entrevSeleccion.setPrevias(previas);
		entrevSeleccion.setCualesPrevias(cualesPrevias);
		entrevSeleccion.setDesempenio(desempenio);
		entrevSeleccion.setPorQueDesempenio(porQueDesempenio);
		entrevSeleccion.setFaltas(faltas);
		entrevSeleccion.setMotivoFaltas(motivoFaltas);
		entrevSeleccion.setMateriasPreferidas(materiasPreferidas);
		entrevSeleccion.setMateriaCuesta(materiaCuesta);
		entrevSeleccion.setComentarioAdicional(comentarioAdicional);
		entrevSeleccion.setAportarPFE(aportarPFE);
		entrevSeleccion.setCognitivo(cognitivo);
		entrevSeleccion.setRiesgoExtraEscolar(riesgoExtraEscolar);
		//DMS agregados 2023
		//cuestionario EP
		entrevSeleccion.setCualBeca(entrevistaDTO.getEntrevistaSeleccion().getCualBeca());
		entrevSeleccion.setAccesoCelular(entrevistaDTO.getEntrevistaSeleccion().getAccesoCelular());
		entrevSeleccion.setCelularEp(entrevistaDTO.getEntrevistaSeleccion().getCelularEp());
		entrevSeleccion.setComputadora(entrevistaDTO.getEntrevistaSeleccion().getComputadora());
		entrevSeleccion.setConexion(entrevistaDTO.getEntrevistaSeleccion().getConexion());
		entrevSeleccion.setUsoCelular(entrevistaDTO.getEntrevistaSeleccion().getUsoCelular());
		entrevSeleccion.setConQuienVivis(entrevistaDTO.getEntrevistaSeleccion().getConQuienVivis());
		entrevSeleccion.setRutinaDiaria(entrevistaDTO.getEntrevistaSeleccion().getRutinaDiaria());
//DMS el metodo normalizaCheckBox soluciona el caso e que tomcat guarda "on" el checkbox tildado enn vez de "1"		
		entrevSeleccion.setAyudaTareas(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getAyudaTareas()));
		entrevSeleccion.setCuidaHnos(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCuidaHnos()));
		entrevSeleccion.setCuidaOtros(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCuidaOtros()));
		entrevSeleccion.setNoCuida(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getNoCuida()));
		entrevSeleccion.setCarpetaMama(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCarpetaMama()));
		entrevSeleccion.setCarpetaPapa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCarpetaPapa()));
		entrevSeleccion.setCarpetaHno(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCarpetaHno()));
		entrevSeleccion.setCarpetaNadie(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCarpetaNadie()));
		entrevSeleccion.setCarpetaOtros(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCarpetaOtros()));
		entrevSeleccion.setFallecimientoEp(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getFallecimientoEp()));
		entrevSeleccion.setEnfermedadEp(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getEnfermedadEp()));
		entrevSeleccion.setMaternidadEp(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getMaternidadEp()));
		entrevSeleccion.setMudanzaEp(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getMudanzaEp()));
		entrevSeleccion.setCambioEstructuraEp(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCambioEstructuraEp()));
		entrevSeleccion.setEconomicaEp(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getEconomicaEp()));
		entrevSeleccion.setViolenciaEp(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getViolenciaEp()));
		entrevSeleccion.setConsumoEp(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getConsumoEp()));
		entrevSeleccion.setViolenciaEscolarEp(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getViolenciaEscolarEp()));
		entrevSeleccion.setOtraSituacionEp(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getOtraSituacionEp()));
		entrevSeleccion.setRegularmente(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getRegularmente()));
		entrevSeleccion.setPregunta(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getPregunta()));
		entrevSeleccion.setCuaderno(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCuaderno()));
		entrevSeleccion.setPadres(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getPadres()));
		entrevSeleccion.setCarpetas(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCarpetas()));
		entrevSeleccion.setCuenta(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCuenta()));
		entrevSeleccion.setNoSabe(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getNoSabe()));
		entrevSeleccion.setGrupo(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getGrupo()));
		entrevSeleccion.setOtroEnteras(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getOtroEnteras()));
		entrevSeleccion.setAgua(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getAgua()));
		entrevSeleccion.setLuz(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getLuz()));
		entrevSeleccion.setGasNatural(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getGasNatural()));
		entrevSeleccion.setGasGarrafa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getGasGarrafa()));
		entrevSeleccion.setTelefoniaFija(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getTelefoniaFija()));
		entrevSeleccion.setCelular(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCelular()));
		entrevSeleccion.setInternet(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getInternet()));
		entrevSeleccion.setTvcable(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getTvcable()));
		entrevSeleccion.setVehiculo(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getVehiculo()));
		entrevSeleccion.setOtroServicio(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getOtroServicio()));
		entrevSeleccion.setFallecimientoRa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getFallecimientoRa()));
		entrevSeleccion.setEnfermedadRa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getEnfermedadRa()));
		entrevSeleccion.setMaternidadRa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getMaternidadRa()));
		entrevSeleccion.setMudanzaRa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getMudanzaRa()));
		entrevSeleccion.setCambioEstructuraRa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getCambioEstructuraRa()));
		entrevSeleccion.setEconomiaRa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getEconomiaRa()));
		entrevSeleccion.setViolenciaRa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getViolenciaRa()));
		entrevSeleccion.setConsumoRa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getConsumoRa()));
		entrevSeleccion.setViolenciaEscolarRa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getViolenciaEscolarRa()));
		entrevSeleccion.setOtraSituacionRa(normalizaCheckbox(entrevistaDTO.getEntrevistaSeleccion().getOtraSituacionRa()));
		//fin checkbox
		entrevSeleccion.setComoTeLlevas(entrevistaDTO.getEntrevistaSeleccion().getComoTeLlevas());
		entrevSeleccion.setFaltasCuidado(entrevistaDTO.getEntrevistaSeleccion().getFaltasCuidado());
		entrevSeleccion.setTrabajas(entrevistaDTO.getEntrevistaSeleccion().getTrabajas());
		entrevSeleccion.setDeQueTrabajas(entrevistaDTO.getEntrevistaSeleccion().getDeQueTrabajas());
		entrevSeleccion.setComoTerminaste(entrevistaDTO.getEntrevistaSeleccion().getComoTerminaste());
		entrevSeleccion.setMateriasAdeuda(entrevistaDTO.getEntrevistaSeleccion().getMateriasAdeuda());
		entrevSeleccion.setDesempenioEscolar(entrevistaDTO.getEntrevistaSeleccion().getDesempenioEscolar());
		entrevSeleccion.setDesempenioPorque(entrevistaDTO.getEntrevistaSeleccion().getDesempenioPorque());
		entrevSeleccion.setInasistenciasPasado(entrevistaDTO.getEntrevistaSeleccion().getInasistenciasPasado());
		entrevSeleccion.setMotivoInasistenciasPasado(entrevistaDTO.getEntrevistaSeleccion().getMotivoInasistenciasPasado());
		entrevSeleccion.setInasistenciasActual(entrevistaDTO.getEntrevistaSeleccion().getInasistenciasActual());
		entrevSeleccion.setMotivoInasistenciasActual(entrevistaDTO.getEntrevistaSeleccion().getMotivoInasistenciasActual());
		entrevSeleccion.setRepetiste2(entrevistaDTO.getEntrevistaSeleccion().getRepetiste2());
		entrevSeleccion.setPorqueRepatiste(entrevistaDTO.getEntrevistaSeleccion().getPorqueRepatiste());
		entrevSeleccion.setAbandono2(entrevistaDTO.getEntrevistaSeleccion().getAbandono2());
		entrevSeleccion.setPorqueAbandono(entrevistaDTO.getEntrevistaSeleccion().getPorqueAbandono());
		entrevSeleccion.setSanciones(entrevistaDTO.getEntrevistaSeleccion().getSanciones());
		entrevSeleccion.setPorqueSanciones(entrevistaDTO.getEntrevistaSeleccion().getPorqueSanciones());
		entrevSeleccion.setElegiste(entrevistaDTO.getEntrevistaSeleccion().getElegiste());
		entrevSeleccion.setImportanteTerminar(entrevistaDTO.getEntrevistaSeleccion().getImportanteTerminar());
		entrevSeleccion.setPorqueImportante(entrevistaDTO.getEntrevistaSeleccion().getPorqueImportante());
		entrevSeleccion.setGustaria(entrevistaDTO.getEntrevistaSeleccion().getGustaria());
		entrevSeleccion.setParticiparReuniones(entrevistaDTO.getEntrevistaSeleccion().getParticiparReuniones());
		entrevSeleccion.setPorqueReuniones(entrevistaDTO.getEntrevistaSeleccion().getPorqueReuniones());
		entrevSeleccion.setPorqueReuniones(entrevistaDTO.getEntrevistaSeleccion().getPorqueReuniones());
		entrevSeleccion.setParticiparPrograma(entrevistaDTO.getEntrevistaSeleccion().getParticiparPrograma());
		entrevSeleccion.setPorquePrograma(entrevistaDTO.getEntrevistaSeleccion().getPorquePrograma());
		entrevSeleccion.setInformacionComplemetariaEp(entrevistaDTO.getEntrevistaSeleccion().getInformacionComplemetariaEp());
		entrevSeleccion.setAportePfe(entrevistaDTO.getEntrevistaSeleccion().getAportePfe());
		entrevSeleccion.setCognitivaEp(entrevistaDTO.getEntrevistaSeleccion().getCognitivaEp());
		entrevSeleccion.setRiesgoEscolarEp(entrevistaDTO.getEntrevistaSeleccion().getRiesgoEscolarEp());
		entrevSeleccion.setCualOtraSituacionEp(entrevistaDTO.getEntrevistaSeleccion().getCualOtraSituacionEp());
		//cuestionario RA
		entrevSeleccion.setDirias(entrevistaDTO.getEntrevistaSeleccion().getDirias());
		entrevSeleccion.setComplicacion(entrevistaDTO.getEntrevistaSeleccion().getComplicacion());
		entrevSeleccion.setCuandoTermine2(entrevistaDTO.getEntrevistaSeleccion().getCuandoTermine2());
		entrevSeleccion.setDisponibilidad(entrevistaDTO.getEntrevistaSeleccion().getDisponibilidad());
		entrevSeleccion.setPensas(entrevistaDTO.getEntrevistaSeleccion().getPensas());
		entrevSeleccion.setOtroBecado2(entrevistaDTO.getEntrevistaSeleccion().getOtroBecado2());
		entrevSeleccion.setAuh(entrevistaDTO.getEntrevistaSeleccion().getAuh());
		entrevSeleccion.setTotalAuh(entrevistaDTO.getEntrevistaSeleccion().getTotalAuh());
		entrevSeleccion.setOtroIngreso(entrevistaDTO.getEntrevistaSeleccion().getOtroIngreso());
		entrevSeleccion.setMontoOtroIngreso(entrevistaDTO.getEntrevistaSeleccion().getMontoOtroIngreso());
		entrevSeleccion.setIngresosTotales(entrevistaDTO.getEntrevistaSeleccion().getIngresosTotales());
		entrevSeleccion.setIngresoConviviente(entrevistaDTO.getEntrevistaSeleccion().getIngresoConviviente());
		entrevSeleccion.setIdTipoVivienda(entrevistaDTO.getEntrevistaSeleccion().getIdTipoVivienda());
		entrevSeleccion.setAmbientes(entrevistaDTO.getEntrevistaSeleccion().getAmbientes());
		entrevSeleccion.setComentariosAdicionalesRa(entrevistaDTO.getEntrevistaSeleccion().getComentariosAdicionalesRa());
		entrevSeleccion.setCobertura(entrevistaDTO.getEntrevistaSeleccion().getCobertura());
		entrevSeleccion.setSaludHijo(entrevistaDTO.getEntrevistaSeleccion().getSaludHijo());
		entrevSeleccion.setProblemaSaludHijo(entrevistaDTO.getEntrevistaSeleccion().getProblemaSaludHijo());
		entrevSeleccion.setInasistenciasSalud(entrevistaDTO.getEntrevistaSeleccion().getInasistenciasSalud());
		entrevSeleccion.setSaludFliar(entrevistaDTO.getEntrevistaSeleccion().getSaludFliar());
		entrevSeleccion.setProblemaSaludFliar(entrevistaDTO.getEntrevistaSeleccion().getProblemaSaludFliar());
		entrevSeleccion.setFaltaFliar(entrevistaDTO.getEntrevistaSeleccion().getFaltaFliar());
		entrevSeleccion.setInformacionComplementariaRa(entrevistaDTO.getEntrevistaSeleccion().getInformacionComplementariaRa());
		entrevSeleccion.setProblemaAprendizaje(entrevistaDTO.getEntrevistaSeleccion().getProblemaAprendizaje());
		entrevSeleccion.setRiesgoEscolarRa(entrevistaDTO.getEntrevistaSeleccion().getRiesgoEscolarRa());
		entrevSeleccion.setCualOtraSituacionRa(entrevistaDTO.getEntrevistaSeleccion().getCualOtraSituacionRa());
		entrevSeleccion.getPerfilAlumno().getResponsable1().setIdLocalidad(entrevistaDTO.getPerfilAlumno().getResponsable1().getIdLocalidad());
		entrevSeleccion.getPerfilAlumno().setAnioAdicional(entrevistaDTO.getPerfilAlumno().getAnioAdicional());
		

		
		
		String mensaje = "";
		entrevistaSeleccion.setExcepcion(excepcion);
		
		if (entrevSeleccion != null && !puedeModificarEntrevista) {
			PerfilAlumno alumno = alumnoSrv.obtenerAlumno(entrevSeleccion
					.getIdPerfilAlumno());
			//System.out.println(alumno.getDatosPersonales().getNacionalidad());
			alumno.getDatosPersonales().setNacionalidad(alumnoNacionalidad);
			entrevistaSeleccion.setSituacionEscolarAnioAnterior(situacionEscolarAnioAnterior);
			entrevistaSeleccion.setMateriasPrevias(materiasPrevias);
			entrevistaSeleccion.setTiempoLibre(tiempoLibre);			
			alumno.getResponsable1().setNacionalidad(responsableNacionalidad);
			alumno.setEae(eae);
			
			//System.out.println(alumno.getDatosPersonales().getNacionalidad());
			//System.out.println(alumno.getResponsable1().getNacionalidad());
			if (!alumno.getEstadoAlumno().equals(EstadoAlumno.APROBADO)
					&& !alumno.getEstadoAlumno().equals(EstadoAlumno.RECHAZADO)
					&& !alumno.getEstadoAlumno().equals(
							EstadoAlumno.LISTA_ESPERA)
					&& !alumno.getEstadoAlumno().equals(
							EstadoAlumno.LISTA_ESPERA_MATERIAS)
					&& !alumno.getEstadoAlumno().equals(
							EstadoAlumno.PRESELECCIONADO))
				puedeCargarEntrevista = false;
		}

		if (puedeCargarEntrevista) {
			// carga ficha familiar
			List<FichaFamiliar> listFichaFamiliars = populateFichaFamiliar(entrevistaDTO);

			// carga los datos del alumno
			populateCandidato(entrevistaDTO, listFichaFamiliars);
			
			
			
			// carga localidad RA
//			entrevistaDTO
//					.getPerfilAlumno()
//					.getResponsable1()
//					.setIdLocalidad(
//							entrevistaDTO.getPerfilAlumno()
//									.getDatosPersonales().getLocalidad());
			
			entrevistaDTO.getPerfilAlumno().getDatosPersonales().setNacionalidad(alumnoNacionalidad);
			entrevistaDTO.getPerfilAlumno().getResponsable1().setNacionalidad(responsableNacionalidad);
			entrevistaDTO.getPerfilAlumno().setEae(eae);
			
			// carga las notas para las distintas materias, del boletin
			List<BoletinSeleccion> listBoletin = populateBoletinSeleccion(entrevistaDTO);

			if (puedeModificarEntrevista) {
				entrevistaSeleccion = entrevSeleccion;
			} else {
				entrevistaSeleccion = entrevistaDTO.getEntrevistaSeleccion() == null ? new EntrevistaSeleccion()
						: entrevistaDTO.getEntrevistaSeleccion();
			}
			EstadoEntrevista estadoEntrevista = EstadoEntrevista
					.getEstadoEntrevista(entrevistaDTO.getEstadoEntrevista());

			entrevistaSeleccion = populateMateriasInteres(entrevistaDTO,
					entrevistaSeleccion);

			//DMS lo comento por ahora, despues veremos como lo quieren en el informe
//			List<AnioEscolar> aniosRepitio = null;
//			if (entrevistaDTO.getEntrevistaSeleccion().getRepitio()) {
//				if (entrevistaDTO.getIdAnioRepitio() != null
//						&& !entrevistaDTO.getIdAnioRepitio().isEmpty()) {
//					aniosRepitio = new ArrayList<AnioEscolar>();
//					for (Integer id : entrevistaDTO.getIdAnioRepitio()) {
//						aniosRepitio.add(AnioEscolar.getAnioEscolar(id));
//					}
//				}
//			}
			
			entrevistaSeleccion.setTiempoLibre(tiempoLibre);
			entrevistaSeleccion.setSituacionEscolarAnioAnterior(situacionEscolarAnioAnterior);
			entrevistaSeleccion.setMateriasPrevias(materiasPrevias);
//			entrevistaSeleccion.setAnioRepitio(aniosRepitio);
			entrevistaSeleccion.setRepitio(entrevistaDTO
					.getEntrevistaSeleccion().getRepitio());
			entrevistaSeleccion.setMotivoRepitencia(entrevistaDTO
					.getEntrevistaSeleccion().getMotivoRepitencia());

			//DMS lo comento por ahora despues hay que ver como lo quieren en en informe
//			List<AnioEscolar> aniosAbandono = null;
//			if (entrevistaDTO.getEntrevistaSeleccion().getAbandono()) {
//				if (entrevistaDTO.getIdAnioAbandono() != null
//						&& !entrevistaDTO.getIdAnioAbandono().isEmpty()) {
//					aniosAbandono = new ArrayList<AnioEscolar>();
//					for (Integer id : entrevistaDTO.getIdAnioAbandono()) {
//						aniosAbandono.add(AnioEscolar.getAnioEscolar(id));
//					}
//				}
//			}
			//entrevistaSeleccion.setAnioAbandono(aniosAbandono);
			entrevistaSeleccion.setAbandono(entrevistaDTO
					.getEntrevistaSeleccion().getAbandono());
			entrevistaSeleccion.setMotivoAbandono(entrevistaDTO
					.getEntrevistaSeleccion().getMotivoAbandono());

			entrevistaSeleccion
					.setConducta(entrevistaDTO.getIdConducta() == null ? null
							: Conducta.getConducta(entrevistaDTO
									.getIdConducta()));
			entrevistaSeleccion
					.setMotivoEnvioTS(entrevistaDTO.getIdMotivoTS() == null ? null
							: MotivoEnvioTS.getMotivoEnvioTS(entrevistaDTO
									.getIdMotivoTS()));
			entrevistaSeleccion.setMotivoRechazo(entrevistaDTO
					.getIdMotivoRechazo() == null ? null : MotivoRechazo
					.getMotivoRechazo(entrevistaDTO.getIdMotivoRechazo()));

			entrevistaDTO.getPerfilAlumno().setActivo(true);
			entrevistaDTO.getPerfilAlumno().getResponsable1().setActivo(true);

			String cuilConGuiones = entrevistaDTO.getPerfilAlumno()
					.getResponsable1().getCuilCuit();
			entrevistaDTO
					.getPerfilAlumno()
					.getResponsable1()
					.setCuilCuit(
							Formateador.formatearCuilSinGuiones(cuilConGuiones));
			
			entrevistaSeleccion.setExcepcion(excepcion);
			
			entrevistaSeleccion.setBoletinSeleccions(listBoletin);

			entrevistaSeleccion.setObservacionesEgresoIngreso(entrevistaDTO
					.getEntrevistaSeleccion().getObservacionesEgresoIngreso());
			entrevistaSeleccion.setObservacionesGenerales(entrevistaDTO
					.getEntrevistaSeleccion().getObservacionesGenerales());

			Date date = new Date();
			PerfilAlumno perfilAlumno = new PerfilAlumno(
					entrevistaDTO.getPerfilAlumno());
			Escuela escuela = escuelaSrv.obtenerEscuelaPorId(entrevistaDTO
					.getIdEscuela());
			entrevistaDTO.getPerfilAlumno().setEscuelaSeleccion(
					new EscuelaSeleccion(escuela));
			Long idAlumno = entrevistaDTO.getPerfilAlumno().getId();
			boolean error = false;
			Integer nombreFotoBoletin=entrevistaDTO.getPerfilAlumno().getDatosPersonales().getDni();
			System.out.println(nombreFotoBoletin);
			guardarFoto(foto, nombreFotoBoletin);
			try {
				if (idAlumno == null) {
					perfilAlumno.setEscuela(escuela);
					Persona persona = new Persona(entrevistaDTO
							.getPerfilAlumno().getDatosPersonales());
					persona.setPerfilAlumno(perfilAlumno);
					persona.setActivo(true);
					persona.setNacionalidad(alumnoNacionalidad);
					perfilAlumno.setDatosPersonales(persona);
					perfilAlumno.setEae(eae);
					perfilAlumno.setResponsable1(new ResponsableAdulto(
							entrevistaDTO.getPerfilAlumno().getResponsable1()));
					if (entrevistaDTO.getPerfilAlumno().getResponsable1()
							.getNoAsisteEntrevista() != null) {
						perfilAlumno.setResponsable2(new ResponsableAdulto(
								entrevistaDTO.getPerfilAlumno()
										.getResponsable2()));
						perfilAlumno.getResponsable2().setActivo(true);
						perfilAlumno.getResponsable2()
								.setIdAlumno(perfilAlumno);
					}
					perfilAlumno.getResponsable1().setIdAlumno(perfilAlumno);
					perfilAlumno.getResponsable1().setNacionalidad(responsableNacionalidad);
					// Se trae la fecha de nacimiento del RA1 como string para
					// poder parsearla
					if (StringUtils.isNotBlank(fechaNacRes))
						perfilAlumno.getResponsable1().setFechaNacimiento(
								Formateador.parsearFecha(fechaNacRes));
					
					
					perfilAlumno.getResponsable1().setIdEntrevistador(
							identrevistador);
					//perfilAlumno.getResponsable1().getBanco().setId(banco);
					perfilAlumno.getResponsable1().getBanco();
					//System.out.println(perfilAlumno.getResponsable1().getBanco());
					////System.out.println(perfilAlumno.getResponsable1().getBanco().getId());
					if(perfilAlumno.getResponsable1().getBanco()!=null){
						
					}else{
						
						Banco banco1 =new Banco();
						banco1.setActivo(true);
						banco1.setId(banco);
						banco1.setNombre("Galicia");												
						perfilAlumno.getResponsable1().setBanco(banco1) ;
						//System.out.println(perfilAlumno.getResponsable1().getBanco().getId());
					}
						
					perfilAlumno.setMotivoEnvioTS(entrevistaSeleccion
							.getMotivoEnvioTS());
					perfilAlumno.setEntrevistaTSSeleccion(entrevistaSeleccion
							.getMotivoEnvioTS() != null ? true : false);
					perfilAlumno.setEmitioCarta(EmitioCarta.NO_TIENE_CARTA);
					perfilAlumno.setFechaEntrevista(date);
					//System.out.println("1: " + fechaEntrevista);
					if (StringUtils.isNotBlank(fechaEntrevista)){
						entrevistaSeleccion.setFechaEntrevista(Formateador.parsearFecha(fechaEntrevista));
					}
					//System.out.println("2: " +entrevistaSeleccion.getFechaEntrevista());
					
					perfilAlumno.getDatosPersonales().setNacionalidad(alumnoNacionalidad);
					perfilAlumno.getResponsable1().setNacionalidad(responsableNacionalidad);
					alumnoSrv.agregarAlumno(perfilAlumno);
					entrevistaSeleccion.setIdPerfilAlumno(perfilAlumno.getId());
					entrevistaSeleccion.setFechaCargaEntrevista(date);
					entrevistaDTO.getPerfilAlumno().setFechaEntrevista(date);
				} else {
					entrevistaSeleccion.getPerfilAlumno().getDatosPersonales().setNacionalidad(alumnoNacionalidad);
					entrevistaSeleccion.getPerfilAlumno().setEae(eae);
					entrevistaSeleccion.getPerfilAlumno().getResponsable1().setNacionalidad(responsableNacionalidad);
					// alumnoSeleccionSrv.agregarAlumno(entrevistaDTO.getPerfilAlumno());
					/*
					if (entrevistaSeleccion.getPerfilAlumno().getFechaEntrevista() != null){
						entrevistaDTO.getPerfilAlumno().setFechaEntrevista(entrevistaSeleccion.getPerfilAlumno().getFechaEntrevista());
					}
					*/
					//System.out.println("12: " + fechaEntrevista);
					entrevistaSeleccion.setFechaEntrevista(Formateador.parsearFecha(fechaEntrevista));
					//System.out.println("22: " +entrevistaSeleccion.getFechaEntrevista());
					entrevistaDTO.setFechaEntrevista(fechaEntrevista);
					//System.out.println("23: "+ entrevistaDTO.getFechaEntrevista());
				}
				//System.out.println("31: " + fechaEntrevista);
				entrevistaSeleccion.setFechaEntrevista(Formateador.parsearFecha(fechaEntrevista));
				//System.out.println("32: " +entrevistaSeleccion.getFechaEntrevista());
				entrevistaDTO.setFechaEntrevista(fechaEntrevista);
				//System.out.println("33: "+ entrevistaDTO.getFechaEntrevista());
			} catch (DataIntegrityViolationException e) {
				error = true;
			}
			if (error) {
				map.put("error",
						"Ya existe una persona con el DNI ingresado. Por favor ingrese un nuevo DNI");
				modelAndView = new ModelAndView(
						"redirect:/entrevistaSeleccion/reporteEntrevistaSeleccion.do?mensaje="
								+ map.get("mensaje"));
				return modelAndView;
			} else {
				alumnoSrv.clearObjetoCache();
				if (!puedeModificarEntrevista) {
					mensaje = "Se dio de alta la entrevista de selección para el candidato: "
							+ entrevistaDTO.getPerfilAlumno()
									.getDatosPersonales().getNombre()
							+ " "
							+ entrevistaDTO.getPerfilAlumno()
									.getDatosPersonales().getApellido();

				} else {
					mensaje = "Se modificó la entrevista de selección del candidato: "
							+ entrevistaDTO.getPerfilAlumno()
									.getDatosPersonales().getNombre()
							+ " "
							+ entrevistaDTO.getPerfilAlumno()
									.getDatosPersonales().getApellido();
				}

				entrevistaSeleccion.setPerfilAlumno(entrevistaDTO
						.getPerfilAlumno());
				if (perfilAlumno.getResponsable2() == null)
					entrevistaSeleccion.getPerfilAlumno().setResponsable2(null);
				entrevistaSeleccion.setRecibeOtraBeca(entrevistaDTO
						.getEntrevistaSeleccion().getRecibeOtraBeca());
				entrevistaSeleccion.setOtroBecado(otroBecado);
				entrevistaSeleccion.setEstadoEntrevista(estadoEntrevista);
				entrevistaSeleccion.setEstadoEntrevistaAlumno(entrevistaDTO
						.getPerfilAlumno().getEstadoAlumno());
				// Se trae la fecha de nacimiento del RA1 como string para poder
				// parsearla
				if (StringUtils.isNotBlank(fechaNacRes))
					entrevistaSeleccion
							.getPerfilAlumno()
							.getResponsable1()
							.setFechaNacimiento(
									Formateador.parsearFecha(fechaNacRes));

				/*
				 * Se obtiene la convocatoria seleccionada en la entrevista para
				 * obtener el nombre del ciclo a setear en la entrevista
				 */
				Convocatoria convocatoria = convocatoriaSrv
						.obtenerConvocatoriaPorId(entrevistaDTO
								.getIdConvocatoria());
				entrevistaSeleccion.setConvocatoria(convocatoriaSrv
						.obtenerConvocatoriaSeleccion(entrevistaDTO
								.getIdConvocatoria()));
				entrevistaSeleccion.setNombreCiclo(convocatoria
						.getCicloPrograma().getNombre());
				
				
				
				
				entrevistaSeleccion.getPerfilAlumno().getResponsable1().setIdEntrevistador(identrevistador);
				entrevistaSeleccionSrv.guardarEntrevista(entrevistaSeleccion);
				
				

				map.put("mensaje", mensaje);
				modelAndView = new ModelAndView(
						"redirect:/entrevistaSeleccion/reporteEntrevistaSeleccion.do?mensaje="
								+ map.get("mensaje"));
				
				return modelAndView;
			}
		} else {
			map.put("error",
					"No se pudo dar de alta la entrevista de selección para el candidato: "
							+ entrevistaDTO.getPerfilAlumno()
									.getDatosPersonales().getNombre()
							+ " "
							+ entrevistaDTO.getPerfilAlumno()
									.getDatosPersonales().getApellido()
							+ " porque NO se encuentra dentro del proceso de selección");
			modelAndView = new ModelAndView(
					"redirect:/entrevistaSeleccion/reporteEntrevistaSeleccion.do?mensaje="
							+ map.get("mensaje"));
			
			
			
			return modelAndView;
		}
		
		//String nombreFotoBoletin=entrevistaSeleccion.getPerfilAlumno().getDatosPersonales().getDni();
		
		
	}

	
	
	
	private String normalizaCheckbox(String checkBox) {
		
		if(checkBox==null)return "0";
		if(checkBox.equals("on"))return "1";
		return "";
	}

	/**
	 * 
	 * @param entrevistaDTO
	 * @param request
	 * @return
	 */
	@RequestMapping("/entrevistaSeleccion/altaNuevaEntrevistaSeleccion.do")
	public ModelAndView guardarEntrevistaNueva(
			@ModelAttribute("entrevistaSeleccionDto") EntrevistaSeleccionDTO entrevistaDTO,
			@RequestParam("fechaNacRes") String fechaNacRes,
			@RequestParam("eae") String eae,
			HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();


		//System.out.println("EAE: "+eae);
		
		// carga ficha familiar
		List<FichaFamiliar> listFichaFamiliars = populateFichaFamiliar(entrevistaDTO);

		// carga localidad RA
		entrevistaDTO
				.getPerfilAlumno()
				.getResponsable1()
				.setIdLocalidad(
						entrevistaDTO.getPerfilAlumno().getDatosPersonales()
								.getLocalidad());

		// carga las notas para las distintas materias, del boletin
		List<BoletinSeleccion> listBoletin = populateBoletinSeleccion(entrevistaDTO);

		EntrevistaSeleccion entrevistaSeleccion = entrevistaDTO
				.getEntrevistaSeleccion();
		EstadoEntrevista estadoEntrevista = EstadoEntrevista
				.getEstadoEntrevista(entrevistaDTO.getEstadoEntrevista());
		entrevistaSeleccion.setRecibeOtraBeca(entrevistaDTO
				.getEntrevistaSeleccion().getRecibeOtraBeca());
		
		List<AnioEscolar> aniosRepitio = null;
		if (entrevistaDTO.getEntrevistaSeleccion().getRepitio()) {
			if (entrevistaDTO.getIdAnioRepitio() != null
					&& !entrevistaDTO.getIdAnioRepitio().isEmpty()) {
				aniosRepitio = new ArrayList<AnioEscolar>();
				for (Integer id : entrevistaDTO.getIdAnioRepitio()) {
					aniosRepitio.add(AnioEscolar.getAnioEscolar(id));
				}
			}
		}
		entrevistaSeleccion.setAnioRepitio(aniosRepitio);
		entrevistaSeleccion.setRepitio(entrevistaDTO.getEntrevistaSeleccion()
				.getRepitio());
		entrevistaSeleccion.setMotivoRepitencia(entrevistaDTO
				.getEntrevistaSeleccion().getMotivoRepitencia());

		List<AnioEscolar> aniosAbandono = null;
		if (entrevistaDTO.getEntrevistaSeleccion().getAbandono()) {
			if (entrevistaDTO.getIdAnioAbandono() != null
					&& !entrevistaDTO.getIdAnioAbandono().isEmpty()) {
				aniosAbandono = new ArrayList<AnioEscolar>();
				for (Integer id : entrevistaDTO.getIdAnioAbandono()) {
					aniosAbandono.add(AnioEscolar.getAnioEscolar(id));
				}
			}
		}
		entrevistaSeleccion.setAnioAbandono(aniosAbandono);
		entrevistaSeleccion.setAbandono(entrevistaDTO.getEntrevistaSeleccion()
				.getAbandono());
		entrevistaSeleccion.setMotivoAbandono(entrevistaDTO
				.getEntrevistaSeleccion().getMotivoAbandono());

		entrevistaSeleccion
				.setConducta(entrevistaDTO.getIdConducta() == null ? null
						: Conducta.getConducta(entrevistaDTO.getIdConducta()));
		entrevistaSeleccion
				.setMotivoEnvioTS(entrevistaDTO.getIdMotivoTS() == null ? null
						: MotivoEnvioTS.getMotivoEnvioTS(entrevistaDTO
								.getIdMotivoTS()));
		entrevistaSeleccion
				.setMotivoRechazo(entrevistaDTO.getIdMotivoRechazo() == null ? null
						: MotivoRechazo.getMotivoRechazo(entrevistaDTO
								.getIdMotivoRechazo()));
		entrevistaSeleccion.setBoletinSeleccions(listBoletin);
		Date date = new Date();
		Escuela escuela = escuelaSrv.obtenerEscuelaPorId(entrevistaDTO
				.getIdEscuela());
		entrevistaDTO.getPerfilAlumno().setEscuelaSeleccion(
				new EscuelaSeleccion(escuela));

		PerfilAlumno perfilAlumnoBase = alumnoSrv.obtenerAlumno(entrevistaDTO
				.getEntrevistaSeleccion().getIdPerfilAlumno());
		PerfilAlumno perfilAlumno = cargarPerfilAlumno(entrevistaDTO,
				perfilAlumnoBase, listFichaFamiliars, fechaNacRes);
		
		
		perfilAlumno.setEscuela(escuela);

		Persona persona = cargarPersona(entrevistaDTO,
				personaSrv.buscarPorPerfilAlumno(perfilAlumno));
		persona.setPerfilAlumno(perfilAlumno);
		perfilAlumno.setDatosPersonales(persona);
		perfilAlumno.setMotivoEnvioTS(entrevistaSeleccion.getMotivoEnvioTS());
		perfilAlumno.setEae(eae);
		perfilAlumno.setEntrevistaTSSeleccion(entrevistaSeleccion
				.getMotivoEnvioTS() != null ? true : false);
		perfilAlumno.setEmitioCarta(EmitioCarta.NO_TIENE_CARTA);
		perfilAlumno.setFechaEntrevista(date);

		// Esto se hace para las nuevas entrevistas de los alumnos que se
		// quieren reincorporar
		if (perfilAlumnoBase.getPeriodoDeBaja() != null) {
			perfilAlumno.setFechaPBE(perfilAlumnoBase.getFechaPBE());
			perfilAlumno.setPeriodoDeBaja(perfilAlumnoBase.getPeriodoDeBaja());
			perfilAlumno.setPeriodoDeEgreso(perfilAlumnoBase
					.getPeriodoDeEgreso());
			perfilAlumno.setMotivoBaja(perfilAlumnoBase.getMotivoBaja());
			perfilAlumno.setFechaBaja(perfilAlumnoBase.getFechaBaja());
			perfilAlumno.setSituacionEscolar(perfilAlumnoBase
					.getSituacionEscolar());
			perfilAlumno.setSituacionEscolarUltimaEntevista(perfilAlumnoBase
					.getSituacionEscolarUltimaEntevista());
			perfilAlumno.setProyeccionEntrevistaFinal(perfilAlumnoBase
					.getProyeccionEntrevistaFinal());
			perfilAlumno.setUltimaActualizacion(perfilAlumnoBase
					.getUltimaActualizacion());
			perfilAlumno.setFechaSituacionActual(perfilAlumnoBase
					.getFechaSituacionActual());
			perfilAlumno.setOtraSituacion(perfilAlumnoBase.getOtraSituacion());
			perfilAlumno.setFechaProyeccionDeseada(perfilAlumnoBase
					.getFechaProyeccionDeseada());
			perfilAlumno.setProyeccionDeseada(perfilAlumnoBase
					.getProyeccionDeseada());
			perfilAlumno
					.setOtraProyeccion(perfilAlumnoBase.getOtraProyeccion());
			perfilAlumno.setObsPostPBE(perfilAlumnoBase.getObsPostPBE());
			perfilAlumno.setSituacionActual(perfilAlumnoBase
					.getSituacionActual());
			perfilAlumno.setHistorialBeca(perfilAlumnoBase.getHistorialBeca());
			perfilAlumno.setHistorialBoletin(perfilAlumnoBase
					.getHistorialBoletin());
			perfilAlumno.setHistorialEa(perfilAlumnoBase.getHistorialEa());
			perfilAlumno.setHistorialEntrevistas(perfilAlumnoBase
					.getHistorialEntrevistas());
			perfilAlumno.setHistorialEscuela(perfilAlumnoBase
					.getHistorialEscuela());
		}

		alumnoSrv.modificarAlumno(perfilAlumno);

		AlumnoSeleccion alumnoSeleccion = new AlumnoSeleccion(perfilAlumno);
		alumnoSeleccion.setId(null);
		alumnoSeleccion.setEae(eae);
		alumnoSeleccion.getResponsable1().setId(null);
		if (perfilAlumno.getResponsable2() != null)
			alumnoSeleccion.getResponsable2().setId(null);
		else
			alumnoSeleccion.setResponsable2(null);
		alumnoSeleccion.getDatosPersonales().setId(null);
		alumnoSeleccionSrv.agregarAlumno(alumnoSeleccion);

		entrevistaSeleccion.setIdPerfilAlumno(perfilAlumno.getId());
		entrevistaSeleccion.setPerfilAlumno(alumnoSeleccion);
		entrevistaSeleccion.setEstadoEntrevista(estadoEntrevista);
		entrevistaSeleccion.setEstadoEntrevistaAlumno(entrevistaDTO
				.getPerfilAlumno().getEstadoAlumno());
		entrevistaSeleccion.setFechaCargaEntrevista(date);

		/*
		 * Se obtiene la convocatoria seleccionada en la entrevista para obtener
		 * el nombre del ciclo a setear en la entrevista
		 */
		Convocatoria convocatoria = convocatoriaSrv
				.obtenerConvocatoriaPorId(entrevistaDTO.getIdConvocatoria());
		entrevistaSeleccion
				.setConvocatoria(convocatoriaSrv
						.obtenerConvocatoriaSeleccion(entrevistaDTO
								.getIdConvocatoria()));
		entrevistaSeleccion.setNombreCiclo(convocatoria.getCicloPrograma()
				.getNombre());
		entrevistaSeleccionSrv.guardarEntrevista(entrevistaSeleccion);

		map.put("mensaje",
				"Se dio de alta la entrevista de selección para el candidato: "
						+ entrevistaDTO.getPerfilAlumno().getDatosPersonales()
								.getNombre()
						+ " "
						+ entrevistaDTO.getPerfilAlumno().getDatosPersonales()
								.getApellido());
		// Esto es para los filtros del reporte de entrevista seleccion
		map.put("entrevistas",
				paginadoEntrevistas(request, null, null, null, null, null,
						null, null,null,null,null));
		map.put("listaCiclos", cicloSrv.obtenerTodos());
		map.put("listaAnioEscolar", AnioEscolar.getAnioEscolares());
		map.put("listEstadoAlumnos", EstadoAlumno.getListaEstadoAlumnos());

		return forward("/entrevistaSeleccion/reporteEntrevistasSeleccion", map);
	}

	/**
	 * Populate boletin seleccion.
	 * 
	 * @param entrevistaDTO
	 *            the entrevista dto
	 * @return the list
	 * @since 10-feb-2011
	 * @author cfigueroa
	 */
	private List<BoletinSeleccion> populateBoletinSeleccion(
			EntrevistaSeleccionDTO entrevistaDTO) {
		List<BoletinSeleccion> listBoletin = new ArrayList<BoletinSeleccion>();
		BoletinSeleccion boletinSeleccion = null;
		int index = 0;
		for (Integer idMateria : entrevistaDTO.getIdMateria()) {

			boletinSeleccion = new BoletinSeleccion();

			boletinSeleccion.setMateria(materiaSrv.obtenerPorId(idMateria));
			boletinSeleccion.setNotaPrimTrim(entrevistaDTO.getNotaPrimTrim()
					.get(index));
			boletinSeleccion.setNotaSegTrim(entrevistaDTO.getNotaSegTrim().get(
					index));
			boletinSeleccion.setNotaTerTrim(entrevistaDTO.getNotaTerTrim().get(
					index));
			boletinSeleccion.setNotaFinal(entrevistaDTO.getNotaFinal().get(
					index));
			boletinSeleccion.setNotaDiciembre(entrevistaDTO.getNotaDiciembre()
					.get(index));
			boletinSeleccion.setNotaMarzo(entrevistaDTO.getNotaMarzo().get(
					index));
			listBoletin.add(boletinSeleccion);

			index++;
		}
		return listBoletin;
	}

	/**
	 * Populate candidato.
	 * 
	 * @param candidato
	 *            the candidato
	 * @param estadoAlumno
	 *            the estado alumno
	 * @param dni
	 *            the dni
	 * @param estadoCivil
	 *            the estado civil
	 * @param tipoAfyp
	 *            the tipo afyp
	 * @param vinculo
	 *            the vinculo
	 * @param fechaNacimientoCandidato
	 *            the fecha nacimiento candidato
	 * @param listFichaFamiliars
	 *            the list ficha familiars
	 * @since 03-dic-2010
	 * @author cfigueroa
	 * @param idCompromisoPBE
	 * @param idCompromiso
	 * @param idAnioRepitio
	 * @param idAnioAbandono
	 * @param anioEscuela
	 */

	private void populateCandidato(EntrevistaSeleccionDTO entrevistaDTO,
			List<FichaFamiliar> listFichaFamiliars) {

		AlumnoSeleccion alumno = entrevistaDTO.getPerfilAlumno();
		alumno.setFichaFamiliar(listFichaFamiliars);
		alumno.setEstadoAlumno(EstadoAlumno.getEstados(Integer
				.parseInt(entrevistaDTO.getEstados())));
		alumno.getDatosPersonales().setTipoDni(
				TipoDni.getTipoDni(entrevistaDTO.getTipo()));
		alumno.getDatosPersonales().setSexo(
				entrevistaDTO.getPerfilAlumno().getDatosPersonales().isSexo());
		alumno.getResponsable1().setIdTipoDni(
				TipoDni.getTipoDni(entrevistaDTO.getDni()));
		alumno.getResponsable1().setIdVinculo(
				Vinculo.getVinculo(entrevistaDTO.getVinculoRA()));
		alumno.getResponsable1().setTelefono(
				alumno.getDatosPersonales().getTelefono());
		alumno.getResponsable1().setTelefono1(
				entrevistaDTO.getPerfilAlumno().getResponsable1()
						.getTelefono1());
		alumno.getResponsable1().setTelefono2(
				entrevistaDTO.getPerfilAlumno().getResponsable1()
						.getTelefono2());
		if (alumno.getResponsable2() != null
				&& entrevistaDTO.getVinculoRA2() != null) {
			alumno.getResponsable2().setIdVinculo(
					Vinculo.getVinculo(entrevistaDTO.getVinculoRA2()));
		}
		alumno.getDatosPersonales().setFechaNacimiento(
				Formateador.parsearFecha(entrevistaDTO
						.getFechaNacimientoCandidato()));
		
		alumno.getDatosPersonales().setEdad(Formateador.calcularEdad(alumno.getDatosPersonales().getFechaNacimiento()));
		
		alumno.setTurno(Turno.getTurnos(entrevistaDTO.getTurno()));
		
		alumno.setCompromisoEscolaridad(Compromiso.getCompromiso(entrevistaDTO
				.getIdCompromiso()));
		alumno.setCompromisoPbe(CompromisoPBE.getCompromisoPBE(entrevistaDTO
				.getIdCompromisoPBE()));
		alumno.setAnioEscolar(entrevistaDTO.getAnioEscuela());

		alumno.getResponsable1().setIdRelacionVivienda(
				RelacionVivienda.getRelacionVivienda(entrevistaDTO
						.getRelacionVivienda()));

		alumno.getResponsable1().setEgresosTotales(
				entrevistaDTO.getPerfilAlumno().getResponsable1()
						.getEgresosTotales());

		// Enum Compromiso Options-> Excelente - Muy Bueno - Bueno - Bueno -
		// Malo.
		alumno.getResponsable1().setIdCompromiso(
				Compromiso.getCompromiso(entrevistaDTO
						.getCompromisoEscolaridad()));

		// Enum CompromisoPBE Options-> Si - No - Reveer.
		alumno.getResponsable1().setIdCompromisoPBE(
				CompromisoPBE.getCompromisoPBE(entrevistaDTO
						.getPosibilidadCompromisoPBE()));

		// Enum CompromisoPBE Options-> Si - No - Reveer.
		alumno.getResponsable1().setIdAptoComoRA(
				CompromisoPBE.getCompromisoPBE(entrevistaDTO.getAptoComoRA())); // Actua
																				// sobre:
																				// AptoComoRA.
		if (entrevistaDTO.getEntrevistador() != null)
		 // alumno.getResponsable1().setIdEntrevistador(Entrevistador.getEntrevistador(entrevistaDTO.getEntrevistador()));
			alumno.getResponsable1().setIdEntrevistador(entrevistaDTO.getEntrevistador());
		else
			alumno.getResponsable1().setIdEntrevistador(null);

	}

	private PerfilAlumno cargarPerfilAlumno(
			EntrevistaSeleccionDTO entrevistaDTO, PerfilAlumno perfilAlumno,
			List<FichaFamiliar> listFichaFamiliars, String fechaNacRes) {

		long idAlumno = perfilAlumno.getId();
		long idResponsable = perfilAlumno.getResponsable1().getId();
		ResponsableAdulto responsable2 = null;
		if (perfilAlumno.getResponsable2() != null) {
			responsable2 = responsableSrv.obtenerPorId(perfilAlumno
					.getResponsable2().getId());
		} else {
			responsable2 = new ResponsableAdulto();
		}
		AlumnoSeleccion alumno = entrevistaDTO.getPerfilAlumno();
		alumno.setFichaFamiliar(listFichaFamiliars);
		alumno.setEstadoAlumno(EstadoAlumno.getEstados(Integer
				.parseInt(entrevistaDTO.getEstados())));
		alumno.getDatosPersonales().setTipoDni(
				TipoDni.getTipoDni(entrevistaDTO.getTipo()));
		alumno.getDatosPersonales().setSexo(
				entrevistaDTO.getPerfilAlumno().getDatosPersonales().isSexo());
		alumno.getDatosPersonales().setFechaNacimiento(
				Formateador.parsearFecha(entrevistaDTO
						.getFechaNacimientoCandidato()));
		alumno.setEae(perfilAlumno.getEae());
		alumno.setTurno(Turno.getTurnos(entrevistaDTO.getTurno()));
		alumno.setCompromisoEscolaridad(Compromiso.getCompromiso(entrevistaDTO
				.getIdCompromiso()));
		alumno.setCompromisoPbe(CompromisoPBE.getCompromisoPBE(entrevistaDTO
				.getIdCompromisoPBE()));
		alumno.setAnioEscolar(entrevistaDTO.getAnioEscuela());

		perfilAlumno = new PerfilAlumno(alumno);
		perfilAlumno.setId(idAlumno);
		perfilAlumno.setActivo(true);

		ResponsableAdulto responsable1 = cargarResponsableAdulto(entrevistaDTO,
				responsableSrv.obtenerPorId(idResponsable));
		if (StringUtils.isNotBlank(fechaNacRes))
			responsable1.setFechaNacimiento(Formateador
					.parsearFecha(fechaNacRes));
		perfilAlumno.setResponsable1(responsable1);
		if (entrevistaDTO.getPerfilAlumno().getResponsable1()
				.getNoAsisteEntrevista() != null) {
			responsable2.setNombre(entrevistaDTO.getPerfilAlumno()
					.getResponsable2().getNombre());
			responsable2.setApellido(entrevistaDTO.getPerfilAlumno()
					.getResponsable2().getApellido());
			responsable2.setContactoTelefono1(entrevistaDTO.getPerfilAlumno()
					.getResponsable2().getContactoTelefono1());
			responsable2.setTelefono1(entrevistaDTO.getPerfilAlumno()
					.getResponsable2().getTelefono1());
			if (entrevistaDTO.getVinculoRA2() != null)
				responsable2.setIdVinculo(Vinculo.getVinculo(entrevistaDTO
						.getVinculoRA2()));
			responsable2.setActivo(true);
			perfilAlumno.setResponsable2(responsable2);
			perfilAlumno.getResponsable2().setIdAlumno(perfilAlumno);
		}

		return perfilAlumno;
	}

	private Persona cargarPersona(EntrevistaSeleccionDTO entrevistaDTO,
			Persona persona) {

		long idAPersona = persona.getId();
		PersonaSeleccion personaSeleccion = entrevistaDTO.getPerfilAlumno()
				.getDatosPersonales();
		persona = new Persona(personaSeleccion);
		persona.setId(idAPersona);
		persona.setActivo(true);
		return persona;
	}

	private ResponsableAdulto cargarResponsableAdulto(
			EntrevistaSeleccionDTO entrevistaDTO, ResponsableAdulto responsable) {

		responsable.setApellido(entrevistaDTO.getPerfilAlumno()
				.getResponsable1().getApellido());
		responsable.setNombre(entrevistaDTO.getPerfilAlumno().getResponsable1()
				.getNombre());
		responsable.setDni(entrevistaDTO.getPerfilAlumno().getResponsable1()
				.getDni());
		responsable.setIdTipoDni(TipoDni.getTipoDni(entrevistaDTO.getDni()));
		responsable.setNacionalidad(entrevistaDTO.getPerfilAlumno()
				.getResponsable1().getNacionalidad());		
		responsable.setSexo(entrevistaDTO.getPerfilAlumno().getResponsable1()
				.getSexo());
		responsable.setFechaNacimiento(entrevistaDTO.getPerfilAlumno()
				.getResponsable1().getFechaNacimiento());
		responsable.setCuilCuit(Formateador
				.formatearCuilSinGuiones(entrevistaDTO.getPerfilAlumno()
						.getResponsable1().getCuilCuit()));
		responsable.setContactoTelefono1(entrevistaDTO.getPerfilAlumno()
				.getResponsable1().getContactoTelefono1());
		responsable.setTelefono(entrevistaDTO.getPerfilAlumno()
				.getDatosPersonales().getTelefono());
		responsable.setTelefono1(entrevistaDTO.getPerfilAlumno()
				.getResponsable1().getTelefono1());
		responsable.setContactoTelefono2(entrevistaDTO.getPerfilAlumno()
				.getResponsable1().getContactoTelefono2());
		responsable.setTelefono2(entrevistaDTO.getPerfilAlumno()
				.getResponsable1().getTelefono2());
		responsable.setIdVinculo(Vinculo.getVinculo(entrevistaDTO
				.getVinculoRA()));
		responsable.setNoAsisteEntrevista(entrevistaDTO.getPerfilAlumno()
				.getResponsable1().getNoAsisteEntrevista());
		responsable.setBanco(entrevistaDTO.getPerfilAlumno().getResponsable1()
				.getBanco());
		////System.out.println(responsable.getBanco().getId());
		responsable.setInformacionComplementaria(entrevistaDTO
				.getPerfilAlumno().getResponsable1()
				.getInformacionComplementaria());
		responsable.setPercepcionesSobreRA(entrevistaDTO.getPerfilAlumno()
				.getResponsable1().getPercepcionesSobreRA());
		responsable.setIdRelacionVivienda(RelacionVivienda
				.getRelacionVivienda(entrevistaDTO.getRelacionVivienda()));
		responsable.setEgresosTotales(entrevistaDTO.getPerfilAlumno()
				.getResponsable1().getEgresosTotales());
		responsable.setIdCompromiso(Compromiso.getCompromiso(entrevistaDTO
				.getCompromisoEscolaridad()));
		responsable.setIdCompromisoPBE(CompromisoPBE
				.getCompromisoPBE(entrevistaDTO.getPosibilidadCompromisoPBE()));
		responsable.setIdAptoComoRA(CompromisoPBE
				.getCompromisoPBE(entrevistaDTO.getAptoComoRA()));
		responsable.setActivo(true);
		if (entrevistaDTO.getEntrevistador() != null)
			// responsable.setIdEntrevistador(Entrevistador.getEntrevistador(entrevistaDTO.getEntrevistador()));
			responsable.setIdEntrevistador(entrevistaDTO.getEntrevistador());
		else
			responsable.setIdEntrevistador(null);
		responsable.setNroCuenta(entrevistaDTO.getPerfilAlumno()
				.getResponsable1().getNroCuenta());

		return responsable;
	}

	/**
	 * Populate ficha familiar.
	 * 
	 * @param nombreFichas
	 *            the nombre fichas
	 * @param apellidoFichas
	 *            the apellido fichas
	 * @param edadFichas
	 *            the edad fichas
	 * @param conviveFichas
	 *            the convive fichas
	 * @param nivelEducativoFichas
	 *            the nivel educativo fichas
	 * @param abandonoRepitenciaFichas
	 *            the abandono repitencia fichas
	 * @param estabilidadLaboralFichas
	 *            the estabilidad laboral fichas
	 * @param renumeracionFichas
	 *            the renumeracion fichas
	 * @param otrosIngresosFichas
	 *            the otros ingresos fichas
	 * @param ocupacionLaboralFichas
	 *            the ocupacion laboral fichas
	 * @return the list
	 * @since 03-dic-2010
	 * @author cfigueroa
	 * 
	 */
	private List<FichaFamiliar> populateFichaFamiliar(
			EntrevistaSeleccionDTO entrevistaDTO) {
		List<FichaFamiliar> listFichaFamiliars = new ArrayList<FichaFamiliar>();
		FichaFamiliar fichaFamiliar = null;
		List<String> nombreFichas = entrevistaDTO.getNombreFichas();
		if (nombreFichas != null) {
			for (int i = 0; i < nombreFichas.size(); i++) {
				fichaFamiliar = new FichaFamiliar();
				if (StringUtils.isEmpty(nombreFichas.get(i))) {
					break;
				}

				fichaFamiliar.setNombre(nombreFichas.get(i));
				fichaFamiliar.setApellido(entrevistaDTO.getApellidoFichas()
						.get(i));
				try {
					fichaFamiliar.setEdad(Integer.parseInt(entrevistaDTO
							.getEdadFichas().get(i)));
				} catch (NumberFormatException e) {
				}
				;
				
				if (entrevistaDTO.getConviveFichas().get(i) != null) {
					fichaFamiliar.setConvive(Convive.getConvive(entrevistaDTO
							.getConviveFichas().get(i)));
				}
				if (entrevistaDTO.getNivelEducativoFichas().get(i) != null) {
					fichaFamiliar.setNivelEducativo(NivelEducativo
							.getNivelEducativo(entrevistaDTO
									.getNivelEducativoFichas().get(i)));
				}
				if (entrevistaDTO.getAbandonoRepitenciaFichas().get(i) != null) {
					fichaFamiliar.setAbandonoRepitencia(entrevistaDTO
							.getAbandonoRepitenciaFichas().get(i));
				}
				if (entrevistaDTO.getEstabilidadLaboralFichas().get(i) != null) {
					fichaFamiliar.setEstabilidadLaboral(entrevistaDTO
							.getEstabilidadLaboralFichas().get(i));
				}
				try {
					fichaFamiliar.setRenumeracion(Integer
							.parseInt(entrevistaDTO.getRenumeracionFichas()
									.get(i)));
				} catch (NumberFormatException e) {
				}
				;
				if (entrevistaDTO.getOtrosIngresosFichas().get(i) != null) {
					fichaFamiliar.setOtrosIngresos(entrevistaDTO
							.getOtrosIngresosFichas().get(i));
				}
				if (entrevistaDTO.getOcupacionLaboralFichas().get(i) != null) {
					fichaFamiliar.setOcupacionLaboral(entrevistaDTO
							.getOcupacionLaboralFichas().get(i));
				}
				if (entrevistaDTO.getCondicionLaboralFichas().get(i) != null) {
					fichaFamiliar.setCondicionLaboral(entrevistaDTO
							.getCondicionLaboralFichas().get(i));
				}
				if (entrevistaDTO.getTipoTrabajoFichas().get(i) != null) {
					fichaFamiliar.setTipoTrabajo(entrevistaDTO
							.getTipoTrabajoFichas().get(i));
				}
				if (entrevistaDTO.getVinculoFFs().get(i) != null) {
					fichaFamiliar.setVinculo(Vinculo.getVinculo(entrevistaDTO
							.getVinculoFFs().get(i)));
				}
				listFichaFamiliars.add(fichaFamiliar);
			}

		}
		return listFichaFamiliars;
	}

	private EntrevistaSeleccion populateMateriasInteres(
			EntrevistaSeleccionDTO entrevistaDTO,
			EntrevistaSeleccion entrevistaSeleccion) {

		entrevistaSeleccion.setMateriaCienciasNaturales(entrevistaDTO
				.getEntrevistaSeleccion().getMateriaCienciasNaturales());
		entrevistaSeleccion.setMateriaCiencSociales(entrevistaDTO
				.getEntrevistaSeleccion().getMateriaCiencSociales());
		entrevistaSeleccion.setMateriaEduArt(entrevistaDTO
				.getEntrevistaSeleccion().getMateriaEduArt());
		entrevistaSeleccion.setMateriaEduFisica(entrevistaDTO
				.getEntrevistaSeleccion().getMateriaEduFisica());
		entrevistaSeleccion.setMateriaInglesLengExt(entrevistaDTO
				.getEntrevistaSeleccion().getMateriaInglesLengExt());
		entrevistaSeleccion.setMateriaLengua(entrevistaDTO
				.getEntrevistaSeleccion().getMateriaLengua());
		entrevistaSeleccion.setMateriaMatem(entrevistaDTO
				.getEntrevistaSeleccion().getMateriaLengua());

		return entrevistaSeleccion;
	}

	/**
	 * Detalle de alumno
	 * 
	 * @param idCandidato
	 *            the id candidato
	 * @param req
	 *            the req
	 * @param user
	 *            the user
	 * @return the model and view
	 * @since 07-dic-2010
	 * @author cfigueroa
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 */
	@RequestMapping("/entrevistaSeleccion/detalleEntrevistaSeleccion.do")
	public ModelAndView detalleEntrevistaSeleccion(
			@RequestParam("idEntrevista") Long idEntrevista,
			@RequestParam("isDetalleEntrevista") Boolean isDetalleEntrevista,
			@RequestParam("accion") String accion)
			throws IllegalAccessException, InvocationTargetException {
		EntrevistaSeleccionDTO dto = new EntrevistaSeleccionDTO();
		EntrevistaSeleccion entrevistaSeleccion = entrevistaSeleccionSrv
				.obtenerEntrevistaSeleccion(idEntrevista);
		List<FichaFamiliar> fichas = new ArrayList<FichaFamiliar>();
		fichas.addAll(entrevistaSeleccion.getPerfilAlumno().getFichaFamiliar());
		dto.setFichasFamiliares(fichas);
		dto.setPerfilAlumno(entrevistaSeleccion.getPerfilAlumno());
		dto.setEntrevistaSeleccion(entrevistaSeleccion);
		// Este metodo inicia todos los objetos para el formulario
		Map<String, Object> map = new HashMap<String, Object>();
		map = cargarObjetosFormulario(dto, isDetalleEntrevista);
		
		
		
		map.put("isDetalleEntrevista", isDetalleEntrevista);// Si es True, se
															// muestran todos
															// los campos
															// grisados
		map.put("accion", accion);
		if (accion.equals("alta") || accion.equals("carga")) {
			map.put("isOtraEntrevista", !isDetalleEntrevista);
			map.put("isNuevaEntrevista", !isDetalleEntrevista);// si es True, se
																// muestran los
																// campos de
																// entrevista
																// seleccion
																// para
																// modificarlos.
			map.put("idEntrevista", "");
		} else { // se puede modificar la entrevista del alumno
			map.put("isOtraEntrevista", isDetalleEntrevista);
			map.put("isNuevaEntrevista", isDetalleEntrevista);// si es True, se
																// muestran los
																// campos de
																// entrevista
																// seleccion
																// para
																// modificarlos.
			// map.put("accion", "modificar");
			map.put("idEntrevista", idEntrevista);
		}
		
		return forward("/entrevistaSeleccion/entrevistaSeleccionView", map);
	}

	/**
	 * Este metodo inicia todos los objetos para el form
	 * 
	 * @param map
	 *            the map
	 * @param logeado
	 *            the logeado
	 * @since 07-dic-2010
	 * @author cfigueroa
	 */
	private Map<String, Object> cargarObjetosFormulario(
			EntrevistaSeleccionDTO entrevistaDTO, Boolean isDetalleEntrevista) {

		Map<String, Object> map = new HashMap<String, Object>();
		List<EstadoAlumno> lisEstadosAlumnos = new ArrayList<EstadoAlumno>();
		lisEstadosAlumnos.add(EstadoAlumno.APROBADO);
		lisEstadosAlumnos.add(EstadoAlumno.RECHAZADO);
		lisEstadosAlumnos.add(EstadoAlumno.LISTA_ESPERA);
		lisEstadosAlumnos.add(EstadoAlumno.LISTA_ESPERA_MATERIAS);
		lisEstadosAlumnos.add(EstadoAlumno.PRESELECCIONADO);

		List<Integer> idAnioAbandono = null;
		StringBuffer aniosAbandono = null;
		if (entrevistaDTO.getEntrevistaSeleccion().getAnioAbandono() != null
				&& !entrevistaDTO.getEntrevistaSeleccion().getAnioAbandono()
						.isEmpty()) {
			idAnioAbandono = new ArrayList<Integer>();
			aniosAbandono = new StringBuffer();
			for (AnioEscolar anioEscolar : entrevistaDTO
					.getEntrevistaSeleccion().getAnioAbandono()) {
				idAnioAbandono.add(anioEscolar.getId());
				aniosAbandono.append(anioEscolar.getValor() + ", ");
			}
			aniosAbandono.deleteCharAt(aniosAbandono.lastIndexOf(","));
		}
		entrevistaDTO.setIdAnioAbandono(idAnioAbandono);

		List<Integer> idAnioRepitio = null;
		StringBuffer aniosRepitio = null;
		if (entrevistaDTO.getEntrevistaSeleccion().getAnioRepitio() != null
				&& !entrevistaDTO.getEntrevistaSeleccion().getAnioRepitio()
						.isEmpty()) {
			idAnioRepitio = new ArrayList<Integer>();
			aniosRepitio = new StringBuffer();
			for (AnioEscolar anioEscolar : entrevistaDTO
					.getEntrevistaSeleccion().getAnioRepitio()) {
				idAnioRepitio.add(anioEscolar.getId());
				aniosRepitio.append(anioEscolar.getValor() + ", ");
			}
			aniosRepitio.deleteCharAt(aniosRepitio.lastIndexOf(","));
		}
		entrevistaDTO.setIdAnioRepitio(idAnioRepitio);

		map.put("entrevistaSeleccionDTO", entrevistaDTO);
		map.put("aniosAbandono", aniosAbandono);
		map.put("aniosRepitio", aniosRepitio);
		map.put("listDni", TipoDni.getListaTipos());
		map.put("listEstadoCivil", EstadoCivil.getListaEstadosCiviles());
		map.put("listTipoAfyp", TipoAfyp.getListaTipos());
		map.put("listTurno", Turno.getListaTurnos());
		map.put("listVinculo", Vinculo.getListaVinculos());
		map.put("listEstadoAlumnos", lisEstadosAlumnos);
		map.put("listConvive", Convive.getListaConvives());
		map.put("listNivelEducativo", NivelEducativo.getListaNivelEducativo());
		map.put("listAnioEscolar", AnioEscolar.getAnioEscolares());		
		map.put("listCompromiso", Compromiso.getCompromiso());
		map.put("listCompromisoPBE", CompromisoPBE.getCompromisoPBEs());
		map.put("listConducta", Conducta.getConductas());
		map.put("listRelacionVivienda", RelacionVivienda.values());
		map.put("listCompromiso", Compromiso.getCompromiso());
		map.put("listPosibilidadCompromisoPBE", SiNoReveer.getSiNoReveers());
		map.put("listAptoComoRA", SiNoReveer.getSiNoReveers());
		map.put("listEntrevistador", Entrevistador.getEntrevistador());
		map.put("listPerfilTS", perfilTSSrv.obtenerTodos());
		map.put("localidades", localidadSrv.obtenerTodos());
		map.put("listProvincias", provinciaSrv.obtenerTodas());
		map.put("listMaterias", materiaSrv.obtenerMateriasBasicas(true));

		map.put("listMotivoRechazo", MotivoRechazo.getListaMotivosRechazo());
		map.put("listMotivoEnvioTS", MotivoEnvioTS.getListMotivoEnvioTS());

		return map;

	}

	@RequestMapping("/entrevistaSeleccion/exportarEntrevistaSeleccion.do")
	public ModelAndView exportarEntrevistaSeleccion(
			HttpServletRequest request,
			@RequestParam(required = false, value = "idCiclo") Long idCiclo,
			@RequestParam(required = false, value = "idZonaCimientos") Long idZonaCimientos,
			@RequestParam(required = false, value = "idEscuela") Long idEscuela,
			@RequestParam(required = false, value = "idAnioEscolar") Integer idAnioEscolar,
			@RequestParam(required = false, value = "nombreAlumno") String nombreAlumno,
			@RequestParam(required = false, value = "idConvocatoria") Long idConvocatoria,
			@RequestParam(required = false, value = "idEstadoAlumno") Integer idEstadoAlumno,
			@RequestParam(required = false, value = "mensaje") String mensaje,
			@RequestParam(required = false, value = "eae") String eae,
			@RequestParam(required = false, value = "error") String error) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		EstadoAlumno estadoAlumno = null;
		ZonaCimientos zona = null;
		Convocatoria convocatoria = null;
		CicloPrograma cicloPrograma = null;
		AnioEscolar anioEscolar = null;
		EscuelaSeleccion escuela = null;
		Long cicloId = idCiclo != null && idCiclo.equals(0) ? null : idCiclo;
		Integer estadoAlumnoId = idEstadoAlumno != null
				&& idEstadoAlumno.equals(0) ? null : idEstadoAlumno;
		Integer idAnio = idAnioEscolar != null && idAnioEscolar.equals(0) ? null
				: idAnioEscolar;
		List<EstadoAlumno> lisEstadosAlumnos = new ArrayList<EstadoAlumno>();
		lisEstadosAlumnos.add(EstadoAlumno.APROBADO);
		lisEstadosAlumnos.add(EstadoAlumno.RECHAZADO);
		lisEstadosAlumnos.add(EstadoAlumno.LISTA_ESPERA);
		lisEstadosAlumnos.add(EstadoAlumno.LISTA_ESPERA_MATERIAS);
		lisEstadosAlumnos.add(EstadoAlumno.PRESELECCIONADO);

		if (estadoAlumnoId != null) {
			estadoAlumno = EstadoAlumno.getEstados(estadoAlumnoId);
			map.put("estado", estadoAlumno);
		}
		if (idZonaCimientos != null) {
			zona = zonaCimientosSrv.obtenerZonaCimientos(idZonaCimientos);
			map.put("zonaCimientos", zona);
		}
		if (idConvocatoria != null) {
			convocatoria = convocatoriaSrv
					.obtenerConvocatoriaPorId(idConvocatoria);
			map.put("convocatoria", convocatoria);
		}
		if (cicloId != null) {
			cicloPrograma = cicloSrv.obtenerCiclo(cicloId);
			map.put("ciclo", cicloPrograma);
		}
		
		if (idEscuela != null) {
			escuela = escuelaSeleccionSrv.obtenerEscuelaPorId(idEscuela);
			map.put("escuela", escuela);
		}
		if (idAnio != null) {
			anioEscolar = AnioEscolar.getAnioEscolar(idAnio);
			map.put("anioEscolar", anioEscolar);
		}

		map.put("listaCiclos", cicloSrv.obtenerTodos());
		map.put("listaAnioEscolar", AnioEscolar.getAnioEscolares());
		
		
		map.put("listEstadoAlumnos", lisEstadosAlumnos);

		map.put("nombreAlumno", nombreAlumno);
		map.put("entrevistas",
				paginadoEntrevistas(request, estadoAlumno, zona, convocatoria,
						cicloPrograma, escuela, anioEscolar, nombreAlumno,null,null,eae));
		if (StringUtils.isNotBlank(mensaje))
			map.put("mensaje", mensaje);
		if (StringUtils.isNotBlank(error))
			map.put("error", error);

		Persona personaLogueada = obtenerPersona(request);
		if (personaLogueada.getPerfilSuperUsuario()) {
			map.put("tipoPerfil", "superUsuario");
		} else {
			map.put("tipoPerfil", "");
		}

		String excelView = null;
		excelView = "exportarEntrevistaSeleccionView";

		// return forward(excelView, map);
		return new ModelAndView(excelView, map);
	}

	@RequestMapping("/entrevistaSeleccion/exportarEntrevistaSeleccion2.do")
	public ModelAndView exportarEntrevistaSeleccion2(
			HttpServletRequest request,
			@RequestParam(required = false, value = "idCiclo") Long idCiclo,
			@RequestParam(required = false, value = "idZonaCimientos") Long idZonaCimientos,
			@RequestParam(required = false, value = "zonaCimientos") String zonaCimientos,
			@RequestParam(required = false, value = "idEscuela") Long idEscuela,
			@RequestParam(required = false, value = "escuela") String escuela,
			@RequestParam(required = false, value = "idAnioEscolar") Integer idAnioEscolar,
			@RequestParam(required = false, value = "nombreAlumno") String nombreAlumno,
			@RequestParam(required = false, value = "idConvocatoria") Long idConvocatoria,
			@RequestParam(required = false, value = "convocatoria") String convocatoria,
			@RequestParam(required = false, value = "idEstadoAlumno") Integer idEstadoAlumno,
			@RequestParam(required = false, value = "mensaje") String mensaje,
			@RequestParam(required = false, value = "eae") String eae,
			@RequestParam(required = false, value = "error") String error) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		EstadoAlumno estadoAlumno = null;
		ZonaCimientos zona = null;
		Convocatoria convocatoriaX = null;
		CicloPrograma cicloPrograma = null;
		AnioEscolar anioEscolar = null;
		EscuelaSeleccion escuelaX = null;
		Long cicloId = idCiclo != null && idCiclo.equals(0) ? null : idCiclo;
		Integer estadoAlumnoId = idEstadoAlumno != null
				&& idEstadoAlumno.equals(0) ? null : idEstadoAlumno;
		Integer idAnio = idAnioEscolar != null && idAnioEscolar.equals(0) ? null
				: idAnioEscolar;
		List<EstadoAlumno> lisEstadosAlumnos = new ArrayList<EstadoAlumno>();
		lisEstadosAlumnos.add(EstadoAlumno.APROBADO);
		lisEstadosAlumnos.add(EstadoAlumno.RECHAZADO);
		lisEstadosAlumnos.add(EstadoAlumno.LISTA_ESPERA);
		lisEstadosAlumnos.add(EstadoAlumno.LISTA_ESPERA_MATERIAS);
		lisEstadosAlumnos.add(EstadoAlumno.PRESELECCIONADO);

		// String ciclo1=null;
		String zona1 = null;
		String escuela1 = null;
		String anio1 = null;
		String alumno1 = null;
		String estado1 = null;
		String convocatoria1 = null;

		if (estadoAlumnoId != null) {
			estadoAlumno = EstadoAlumno.getEstados(estadoAlumnoId);
			estado1 = estadoAlumno.getValor();
			map.put("estado", estadoAlumno);
		}
		if (idZonaCimientos != null) {
			zona = zonaCimientosSrv.obtenerZonaCimientos(idZonaCimientos);
			// zona1=zona.getNombre();
			map.put("zonaCimientos", zona);
		}

		if (zonaCimientos != null) {
			if (zonaCimientos == "") {
				zona1 = null;
			} else {
				zona1 = zonaCimientos;
			}
		} else {
			zona1 = null;
		}

		if (idConvocatoria != null) {
			convocatoriaX = convocatoriaSrv
					.obtenerConvocatoriaPorId(idConvocatoria);
			convocatoria1 = convocatoriaX.getNombre();
			map.put("convocatoria", convocatoria);
		}

		if (cicloId != null) {
			cicloPrograma = cicloSrv.obtenerCiclo(cicloId);
			// ciclo1=cicloPrograma.getId();
			map.put("ciclo", cicloPrograma);
		}

		if (idEscuela != null) {
			escuelaX = escuelaSeleccionSrv.obtenerEscuelaPorId(idEscuela);
			escuela1 = escuelaX.getNombre();
			map.put("escuela", escuela);
		}

		if (idAnio != null) {
			anioEscolar = AnioEscolar.getAnioEscolar(idAnio);
			anio1 = anioEscolar.getValor();
			map.put("anioEscolar", anioEscolar);
		}

		map.put("listaCiclos", cicloSrv.obtenerTodos());
		map.put("listaAnioEscolar", AnioEscolar.getAnioEscolares());

		map.put("listEstadoAlumnos", lisEstadosAlumnos);

		map.put("nombreAlumno", nombreAlumno);
		alumno1 = nombreAlumno.toString();
		map.put("entrevistas",
				paginadoEntrevistas(request, estadoAlumno, zona, convocatoriaX,
						cicloPrograma, escuelaX, anioEscolar, nombreAlumno,null,null,eae));
		if (StringUtils.isNotBlank(mensaje))
			map.put("mensaje", mensaje);
		if (StringUtils.isNotBlank(error))
			map.put("error", error);

		Persona personaLogueada = obtenerPersona(request);
		if (personaLogueada.getPerfilSuperUsuario()) {
			map.put("tipoPerfil", "superUsuario");
		} else {
			map.put("tipoPerfil", "");
		}

		// valores que paso al excelview

		if (cicloPrograma == null) {
			map.put("ciclo1", null);
		} else {
			map.put("ciclo1", cicloPrograma.getNombre());
		}

		if (escuela != null) {
			if (escuela == "") {
				escuela1 = null;
			} else {
				escuela1 = escuela;
			}
		} else {
			escuela1 = null;
		}

		if (convocatoria != null) {
			if (convocatoria == "") {
				convocatoria1 = null;
			} else {
				convocatoria1 = convocatoria;
			}
		} else {
			convocatoria1 = null;
		}

		map.put("zona1", zona1);
		map.put("eae", eae);
		map.put("escuela1", escuela1);
		map.put("anio1", anio1);
		if (alumno1 == "") {
			alumno1 = null;
		}
		map.put("alumno1", alumno1);
		map.put("estado1", estado1);
		map.put("convocatoria1", convocatoria1);

		String excelView = null;
		excelView = "exportarEntrevistaSeleccionView";

		// return forward(excelView, map);
		return new ModelAndView(excelView, map);
	}

	/**
	 * Paginado alumnos.
	 * 
	 * @param request
	 *            the request
	 * @return the extended paginated list
	 * @since 28-abr-2011
	 * @author cfigueroa
	 * @param anioEscolar
	 * @param escuela
	 * @param cicloPrograma
	 * @param convocatoria
	 * @param zona
	 * @param estadoAlumno
	 */
	private ExtendedPaginatedList paginadoEntrevistas(
			HttpServletRequest request, EstadoAlumno estadoAlumno,
			ZonaCimientos zona, Convocatoria convocatoria,
			CicloPrograma cicloPrograma, EscuelaSeleccion escuela,
			AnioEscolar anioEscolar, String nombreAlumno, Date fechaDesde, Date fechaHasta, String eae) {

		boolean export = request
				.getParameter(TableTagParameters.PARAMETER_EXPORTING) != null;
		List<EntrevistaSeleccion> dtos = null;

		ExtendedPaginatedList listaPaginada = paginateListFactory
				.getPaginatedListFromRequest(request);

		int totalRows = entrevistaSeleccionSrv.obtenterCantidadEntrevistas(
				estadoAlumno, zona, convocatoria, cicloPrograma, escuela,
				anioEscolar, nombreAlumno, fechaDesde, fechaHasta, listaPaginada.getFirstRecordIndex(),
				listaPaginada.getPageSize(), listaPaginada.getSortDirection(),
				listaPaginada.getSortCriterion(),eae);

		// Si es un export debo cargar toda la lista entera, si no lo es
		// entonces se carga la lista de a una pagina por vez
//		export=true;
		if (export) {
			dtos = entrevistaSeleccionSrv.obtenerEntrevistasFinalizadas(
					estadoAlumno, zona, convocatoria, cicloPrograma, escuela,
					anioEscolar, nombreAlumno, fechaDesde, fechaHasta, 0, totalRows,
					listaPaginada.getSortDirection(),
					listaPaginada.getSortCriterion(),eae);
		} else {
			dtos = entrevistaSeleccionSrv.obtenerEntrevistasFinalizadas(
					estadoAlumno, zona, convocatoria, cicloPrograma, escuela,
					anioEscolar, nombreAlumno, fechaDesde, fechaHasta,
					listaPaginada.getFirstRecordIndex(),
					listaPaginada.getPageSize(),
					listaPaginada.getSortDirection(),
					listaPaginada.getSortCriterion(),eae);
		}
		listaPaginada.setList(dtos);
		listaPaginada.setTotalNumberOfRows(totalRows); 
		

		return listaPaginada;

	}
	
	
	
	

	@RequestMapping("/entrevistaSeleccion/eliminarEntrevistaSeleccion.do")
	public ModelAndView eliminarEntrevistaSeleccionView(
			@RequestParam("idEntrevista") Long idEntrevista) {

		ModelAndView modelView = new ModelAndView();
		String mensaje = "Se eliminó la entrevista de selección";
		String error = "";
		EntrevistaSeleccion entrevistaSeleccion = entrevistaSeleccionSrv
				.obtenerEntrevistaSeleccion(idEntrevista);

		try {
			if (entrevistaSeleccion != null) {
				Long idAlumno = entrevistaSeleccion.getIdPerfilAlumno();
				PerfilAlumno perfilAlumno = alumnoSrv.obtenerAlumno(idAlumno);
				if (perfilAlumno != null) {
					List<EntrevistaSeleccion> entrevistas = entrevistaSeleccionSrv
							.obtenerEntrevistasSeleccionPorIdAlumno(perfilAlumno
									.getId());
					if (entrevistas != null) {
						if (EstadoAlumno.getListaEstadoSeleccion().contains(
								perfilAlumno.getEstadoAlumno())) {
							if (entrevistaSeleccion.getEstadoEntrevistaAlumno()
									.equals(EstadoAlumno.PRESELECCIONADO)) {
								EntrevistaTS ts = entrevistaTSService
										.obtenerEntrevistaTSPorAlumno(perfilAlumno
												.getId());
								if (ts != null && ts.getId() != null) {// el
																		// becado
																		// tiene
																		// realizada
																		// la
																		// entrevista
																		// de TS
																		// elimino
																		// la
																		// entrevista
																		// de ts
									entrevistaTSService
											.eliminarEntrevistaTS(ts);
									mensaje = mensaje + ", el Informe TS";
								}
								if (entrevistas.size() > 1) {
									perfilAlumno.setEntrevistaTS(null);
									perfilAlumno
											.setEntrevistaTSSeleccion(false);
									perfilAlumno.setMotivoEnvioTS(null);
									perfilAlumno.setPerfilTS(null);
									alumnoSrv.modificarAlumno(perfilAlumno);
								}
							}
							if (entrevistas.size() > 1) { // solo elimino al
															// entrevista
															// seleccionada, no
															// el perfil alumno
								mensaje = mensaje
										+ " del alumno/a "
										+ perfilAlumno.getDatosPersonales()
												.getApellidoNombre();
							} else { // no solo elimino la entrevista
										// seleccionada sino tambien el perfil
										// alumno
								alumnoSrv.eliminarAlumno(perfilAlumno);
								mensaje = mensaje
										+ " y el alumno/a "
										+ perfilAlumno.getDatosPersonales()
												.getApellidoNombre();
							}
							entrevistaSeleccionSrv
									.eliminarEntrevista(entrevistaSeleccion);
						} else {
							if (EstadoAlumno.getListaEstadoAcompaniamiento()
									.contains(perfilAlumno.getEstadoAlumno())
									|| EstadoAlumno.getListaEstadosInactivos()
											.contains(
													perfilAlumno
															.getEstadoAlumno())) {
								if (entrevistaSeleccion
										.getEstadoEntrevistaAlumno().equals(
												EstadoAlumno.PRESELECCIONADO)) {
									EntrevistaTS ts = entrevistaTSService
											.obtenerEntrevistaTSPorAlumno(perfilAlumno
													.getId());
									if (ts != null && ts.getId() != null) {// el
																			// becado
																			// tiene
																			// realizada
																			// la
																			// entrevista
																			// de
																			// TS
																			// elimino
																			// la
																			// entrevista
																			// de
																			// ts
										entrevistaTSService
												.eliminarEntrevistaTS(ts);
										mensaje = mensaje + ", el Informe TS";
									}
									if (entrevistas.size() > 1) {
										perfilAlumno.setEntrevistaTS(null);
										perfilAlumno
												.setEntrevistaTSSeleccion(false);
										perfilAlumno.setMotivoEnvioTS(null);
										perfilAlumno.setPerfilTS(null);
										alumnoSrv.modificarAlumno(perfilAlumno);
									}
								}
								if (entrevistas.size() > 1) { // solo elimino al
																// entrevista
																// seleccionada,
																// no el perfil
																// alumno
									entrevistaSeleccionSrv
											.eliminarEntrevista(entrevistaSeleccion);
									mensaje = mensaje
											+ " del alumno/a "
											+ perfilAlumno.getDatosPersonales()
													.getApellidoNombre();
								} else { // no se puede eliminar la entrevista
											// ya que posee una sola.
									error = "No se puede eliminar la entrevista de selección selecionada porque el alumno no se encuentra en el proceso de "
											+ "selección y posee una sola entrevista registrada";
								}
							} else {
								if (perfilAlumno.getEstadoAlumno().equals(
										EstadoAlumno.PRESELECCIONADO)) {
									if (entrevistas.size() > 1) { // solo
																	// elimino
																	// al
																	// entrevista
																	// seleccionada,
																	// no el
																	// perfil
																	// alumno
										if (entrevistaSeleccion
												.getEstadoEntrevistaAlumno()
												.equals(EstadoAlumno.PRESELECCIONADO)) {
											if (perfilAlumno
													.getEntrevistaTSSeleccion()) {
												if (perfilAlumno
														.getEntrevistaTS() != null
														&& perfilAlumno
																.getEntrevistaTS()) { // el
																						// becado
																						// tiene
																						// realizada
																						// la
																						// entrevista
																						// de
																						// TS
													EntrevistaTS ts = entrevistaTSService
															.obtenerEntrevistaTSPorAlumno(perfilAlumno
																	.getId());
													if (ts != null
															&& ts.getId() != null) { // elimino
																						// la
																						// entrevista
																						// de
																						// ts
														entrevistaTSService
																.eliminarEntrevistaTS(ts);
														mensaje = mensaje
																+ ", el Informe TS";
													}
												}
												perfilAlumno
														.setEntrevistaTS(null);
												perfilAlumno
														.setEntrevistaTSSeleccion(false);
												perfilAlumno
														.setMotivoEnvioTS(null);
												perfilAlumno.setPerfilTS(null);
												alumnoSrv
														.modificarAlumno(perfilAlumno);
											}
										}
										entrevistaSeleccionSrv
												.eliminarEntrevista(entrevistaSeleccion);
										mensaje = mensaje
												+ " del alumno/a "
												+ perfilAlumno
														.getDatosPersonales()
														.getApellidoNombre();
									} else { // no solo elimino la entrevista
												// seleccionada sino tambien el
												// perfil alumno
										if (entrevistaSeleccion
												.getEstadoEntrevistaAlumno()
												.equals(EstadoAlumno.PRESELECCIONADO)) {
											if (perfilAlumno
													.getEntrevistaTSSeleccion()) {// el
																					// becado
																					// tiene
																					// realizada
																					// la
																					// entrevista
																					// de
																					// TS
												EntrevistaTS ts = entrevistaTSService
														.obtenerEntrevistaTSPorAlumno(perfilAlumno
																.getId());
												if (ts != null
														&& ts.getId() != null) { // elimino
																					// la
																					// entrevista
																					// de
																					// ts
													entrevistaTSService
															.eliminarEntrevistaTS(ts);
													mensaje = mensaje
															+ ", el Informe TS";
												}
											}
										}
										entrevistaSeleccionSrv
												.eliminarEntrevista(entrevistaSeleccion);
										alumnoSrv.eliminarAlumno(perfilAlumno);
										mensaje = mensaje
												+ " y el alumno/a "
												+ perfilAlumno
														.getDatosPersonales()
														.getApellidoNombre();
									}
								}
							}
						}
					} else {
						error = "Se produjo un error al querer eliminar la entrevista de selección seleccionada. Por favor intentelo más tarde.";
					}
				} else {
					error = "Se produjo un error al querer eliminar la entrevista de selección seleccionada. Por favor intentelo más tarde.";
				}
			} else {
				error = "Se produjo un error al querer eliminar la entrevista de selección seleccionada. Por favor intentelo más tarde.";
			}
			modelView = new ModelAndView(
					"redirect:/entrevistaSeleccion/reporteEntrevistaSeleccion.do?error="
							+ error);
		} catch (Exception e) {
			error = "Se produjo un error al querer eliminar la entrevista de selección seleccionada";
			log.error("****************************", e.getCause());
			////System.out.println("Error + " + e.getMessage());
			modelView = new ModelAndView(
					"redirect:/entrevistaSeleccion/reporteEntrevistaSeleccion.do?error="
							+ error);
		}
		if (StringUtils.isNotBlank(error))
			return modelView;
		else
			return new ModelAndView(
					"redirect:/entrevistaSeleccion/reporteEntrevistaSeleccion.do?mensaje="
							+ mensaje);
	}
	
	@RequestMapping("/entrevistaSeleccion/mostrarImagen.do")
	public void mostrarFirma(HttpServletResponse response,@RequestParam("dni") String dni) {		
		response.setContentType("image/jpeg");
		OutputStream output = null;
		FileInputStream input = null;
		File file = null;
		System.out.println(dni);
		System.out.println(dni.toString());
		if(dni.equals("0"))
			file = new File(getProps().getProperty(ConstantesInformes.pathImagenBoletinesSeleccion) + ConstantesInformes.imagenGenerica + ConstantesInformes.extensionImagenBoletinesSeleccion);
		else
			file = new File(getProps().getProperty(ConstantesInformes.pathImagenBoletinesSeleccion) + dni.toString() + ConstantesInformes.extensionImagenBoletinesSeleccion);
			
		try {
			output = response.getOutputStream();
			input = new FileInputStream(file);
			byte[] buffer = new byte[(int) file.length()];
			input.read(buffer);
			response.setContentLength(buffer.length);
			output.write(buffer);
		} catch (Exception e) {
			file = new File(getProps().getProperty(ConstantesInformes.pathImagenBoletinesSeleccion)+"sinfoto.jpg");
			try {
				output = response.getOutputStream();
				input = new FileInputStream(file);
				byte[] buffer = new byte[(int) file.length()];
				input.read(buffer);
				response.setContentLength(buffer.length);
				output.write(buffer);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			//e.printStackTrace();
		} finally {
			try {
				input.close();
				output.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	
	
	private void guardarFoto(Object foto, Integer dni) {
		try {
			CommonsMultipartFile imagen = (CommonsMultipartFile) foto;
			if((imagen.getFileItem().getName().contains(".jpg") || imagen.getFileItem().getName().contains(".JPG"))){ 
				File file = new File(getProps().getProperty(ConstantesInformes.pathImagenBoletinesSeleccion) 
						+ dni.toString() + ConstantesInformes.extensionImagenBoletinesSeleccion);
				imagen.transferTo(file);
				
				BufferedImage originalImage = ImageIO.read(file);
				int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
				
				//Reduce solo las imagenes mayores al tamaño que predefinimos(400x300) 
				//if(originalImage.getWidth() > IMG_WIDTH){					
				//	BufferedImage resizeImageJpg = resizeImage(originalImage, type);
				//	ImageIO.write(resizeImageJpg, "jpg", file); 
				//}
			}
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
    private static BufferedImage resizeImage(BufferedImage originalImage, int type){
    	BufferedImage resizedImage;
    	if(originalImage.getHeight() > originalImage.getWidth())
    		resizedImage = new BufferedImage(IMG_HEIGHT,IMG_WIDTH, type);
    	else
    		resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
    	
    	Graphics2D g = resizedImage.createGraphics();
    	if(originalImage.getHeight() > originalImage.getWidth())
    		g.drawImage(originalImage, 0, 0, IMG_HEIGHT,IMG_WIDTH, null);
    	else
    		g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
    	g.dispose();
     
    	return resizedImage;
        }

	
}