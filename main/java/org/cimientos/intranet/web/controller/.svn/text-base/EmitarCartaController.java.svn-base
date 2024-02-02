package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dto.CartaDTO;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.EscuelaSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.cimientos.intranet.utils.paginacion.ExtendedPaginatedList;
import org.cimientos.intranet.utils.paginacion.PaginateListFactory;
import org.displaytag.tags.TableTagParameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.cimientos.intranet.enumerativos.EmitioCarta;


/**
 * The Class EmitarCartaController.
 */
@Controller
@RequestMapping("/emitirCarta/*")
public class EmitarCartaController extends BaseController {
	
	@Autowired
	private AlumnoSrv alumnoSrv;
	
	private Map<String,Object> map;
	
	@Autowired
	private PaginateListFactory paginateListFactory;
	@Autowired
	private ZonaCimientosSrv zonaCimientosSrv;

	@Autowired
	private EscuelaSrv escuelaSrv;
	
	@Autowired
	private CicloProgramaSrv cicloSrv;
	
	/**
	 * Lista alumnos.
	 *
	 * @return the model and view
	 * @since 23-nov-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/emitirCarta/listaAlumnosCarta.do")
	public ModelAndView listaAlumnos(HttpServletRequest request, 
									 @RequestParam(value="nombreAlumno",required=false) String nombreAlumno,
									 @RequestParam(value="idZonaCimientos",required=false) Long idZonaCimientos,
									 @RequestParam(value="idEscuela",required=false) Long idEscuela,
									 @RequestParam(value="idEstadoAlumno", required=false) Integer idEstadoAlumno,
									 @RequestParam(value="idEmisionCarta",required=false)Integer idEmisionCarta,
									 @RequestParam(required=false,value="_chk") List<Long> idCartas,
									 @RequestParam(required= false, value="limpiarChks") Boolean limpiarChecks,
									 @RequestParam(required= false, value="sort") String sort,
									 @RequestParam(required= false, value="dir") String dir,
									 @RequestParam(required= false, value="page") Long page,
									 @RequestParam(required= false, value="cicloId") String cicloId){
		map = new HashMap<String, Object>();
		EstadoAlumno estadoAlumno=null;
		ZonaCimientos zona = null;
		Escuela escuela = null;
		EmitioCarta emitioCarta = null;
		Integer estadoAlumnoId = idEstadoAlumno != null && idEstadoAlumno.equals(0) ? null : idEstadoAlumno;
		Integer emisionCartaId = idEmisionCarta != null && idEmisionCarta.equals(0) ? null : idEmisionCarta;
		
		Long idCiclo = null;
		if(StringUtils.isNotBlank(cicloId)){
			idCiclo = Long.parseLong(cicloId);
		}else {
			idCiclo = cicloSrv.obtenerCicloActual().getId();
			cicloId = idCiclo.toString();
		}
		
		if(estadoAlumnoId != null){
			 estadoAlumno= EstadoAlumno.getEstados(estadoAlumnoId);
			map.put("estado", estadoAlumno);
		}
		if(idZonaCimientos != null){
			 zona = zonaCimientosSrv.obtenerZonaCimientos(idZonaCimientos);
			map.put("zonaCimientos", zona);
		}
		
		if(idEscuela != null){
			escuela = escuelaSrv.obtenerEscuelaPorId(idEscuela);
			map.put("escuela", escuela);
		}
		if(emisionCartaId != null ){
			emitioCarta = EmitioCarta.getEmisionCarta(emisionCartaId);
			map.put("emitioCarta", emitioCarta);
		}
		
		ExtendedPaginatedList alumnos = paginadoAlumnos(request,nombreAlumno,estadoAlumno,zona,escuela,emitioCarta,idCiclo);
		
        map.put("ciclos", cicloSrv.obtenerCiclosConvocatoria());
		map.put("cicloId", cicloId);
		map.put("limpiarChks", null);
		map.put("page", page);
		map.put("sort", sort);
		map.put("dir", dir);
		map.put("nombreAlumno", nombreAlumno);
		map.put("listEstadoAlumnos", cargarEstadosAlumnos());
		map.put("listEmitioCarta", EmitioCarta.getEmisionCartas());
		map.put("listaAlumnos", alumnos);
		WebUtils.setSessionAttribute(request, "listaAlumnos", alumnos);
		return forward("emitirCarta/emisionCartas", map);
	}
	
	/**
	 * Impresion carta.
	 *
	 * @param idCartas the id alumnos
	 * @param response the response
	 * @param cartaAceptacion the carta aceptacion
	 * @return the model and view
	 * @since 24-nov-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/emitirCarta/impresionCarta.do")
	public ModelAndView impresionCarta(HttpServletResponse response,HttpServletRequest request,
									   @RequestParam(required=false,value="_chk") List<Long> idCartas)
	{
		List<PerfilAlumno> listaAlumnos = alumnoSrv.obtenerAlumnosPorIds(idCartas);
		List<CartaDTO> listCartaDTO = new ArrayList<CartaDTO>();
		CartaDTO cartaDTO = null;
		
		for (PerfilAlumno alumno : listaAlumnos) {
			cartaDTO = new CartaDTO();
			cartaDTO.setNombre(alumno.getDatosPersonales().getApellido());
			cartaDTO.setPathImg(this.getServletContext().getRealPath(
					"WEB-INF/jasperTemplates/images/logoCarta.JPG"));
			alumno.setEmitioCarta(EmitioCarta.TIENE_CARTA);
			if (alumno.getEstadoAlumno().equals(EstadoAlumno.RECHAZADO)
					|| alumno.getEstadoAlumno().equals(
							EstadoAlumno.RECHAZADO_TS)) {
				cartaDTO.setEstadoAlumno("rechazado");
				cartaDTO
						.setTextCarta("no ha sido seleccionado/a para participar del Programa Futuros Egresados,"
								+ "ya que no reúne los requisitos necesarios. De todos modos, agradecemos su interés y participación.\n"
								+ "Cordialmente,");
			}
			if (alumno.getEstadoAlumno().equals(EstadoAlumno.LISTA_ESPERA)
					|| alumno.getEstadoAlumno().equals(
							EstadoAlumno.LISTA_ESPERA_TS)) {
				cartaDTO.setEstadoAlumno("listaEspera");
				cartaDTO
						.setTextCarta("ha quedado en lista de espera debido a la falta de cupo. "
								+ "Teniendo en cuenta que hoy reúne las condiciones para participar del Programa Futuros Egresados, "
								+ "nos contactaremos con usted en el caso de que surja una nueva posibilidad. "
								+ "Agradecemos su participación.\n"
								+ "\n"
								+ "Cordialmente,");

			}
			if (alumno.getEstadoAlumno().equals(
					EstadoAlumno.LISTA_ESPERA_MATERIAS)
					|| alumno.getEstadoAlumno().equals(
							EstadoAlumno.LISTA_ESPERA_MATERIA_TS)) {
				cartaDTO.setEstadoAlumno("listaEsperaMaterias");
				cartaDTO
						.setTextCarta("ha quedado en lista de espera, ya que adeuda materias.\n"
								+ "Si llegara a aprobar las materias que adeuda y aún existieran vacantes, "
								+ "entonces tendría posibilidades de ingresar al Programa Futuros Egresados. "
								+ "Por eso les solicitamos que notifiquen a Cimientos sobre la situación académica de los candidatos, "
								+ "llamando de 9 a 18 hs al (011) 4829-8600, de modo que puedan seguir siendo tenidos en cuenta.\n"
								+ "\n" + "Cordialmente,");
			}
			listCartaDTO.add(cartaDTO);
		}
		return this.exportarReporteJasper(response, listCartaDTO,
				"Cartas.pdf", "cartasPDF");
		

	}
	
	
	/**
	 * Paginado alumnos.
	 *
	 * @param request the request
	 * @return the extended paginated list
	 * @since 28-abr-2011
	 * @author cfigueroa
	 * @param emitioCarta 
	 * @param escuela 
	 * @param zona 
	 * @param estadoAlumno 
	 * @param nombreAlumno 
	 * @param idCiclo 
	 */
	private ExtendedPaginatedList paginadoAlumnos(HttpServletRequest request, String nombreAlumno, 
												  EstadoAlumno estadoAlumno, ZonaCimientos zona, 
												  Escuela escuela, EmitioCarta emitioCarta, Long idCiclo) {
		
		boolean export = request.getParameter(TableTagParameters.PARAMETER_EXPORTING) != null;
		List<EstadoAlumno> estadoAlumnos = cargarEstadosAlumnos();
		List<PerfilAlumno> dtos = null;
		
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		
		int totalRows = alumnoSrv.cantidadAlumnosEmisionCartas(estadoAlumnos, listaPaginada.getFirstRecordIndex(), 
															   listaPaginada.getPageSize(),listaPaginada.getSortDirection(), 
															   listaPaginada.getSortCriterion(),nombreAlumno,
															   estadoAlumno,zona,
															   escuela,emitioCarta,idCiclo);
	
		
		//Si es un export debo cargar toda la lista entera, si no lo es entonces se carga la lista de a una pagina por vez
		if(export){
			dtos = alumnoSrv.obtenerAlumnosParaEmisionCartas(estadoAlumnos,0, totalRows,listaPaginada.getSortDirection(), 
															listaPaginada.getSortCriterion(),nombreAlumno,
															   estadoAlumno,zona,
															   escuela,emitioCarta,idCiclo);
		}else{
			dtos = alumnoSrv.obtenerAlumnosParaEmisionCartas(estadoAlumnos,listaPaginada.getFirstRecordIndex(), 
													listaPaginada.getPageSize(),listaPaginada.getSortDirection(), 
													listaPaginada.getSortCriterion(),nombreAlumno,
													   estadoAlumno,zona,
													   escuela,emitioCarta,idCiclo);
		}
		listaPaginada.setList(dtos);
		listaPaginada.setTotalNumberOfRows(totalRows);

		return listaPaginada;
	
	}
	
	
	/**
	 * Cargar estados alumnos.
	 *
	 * @return the list
	 * @since 23-nov-2010
	 * @author cfigueroa
	 */
	private List<EstadoAlumno> cargarEstadosAlumnos(){
		List<EstadoAlumno> list = new ArrayList<EstadoAlumno>();
		list.add(EstadoAlumno.RECHAZADO);
		list.add(EstadoAlumno.LISTA_ESPERA);
		list.add(EstadoAlumno.LISTA_ESPERA_MATERIAS);
		return list;
	}
		
}
