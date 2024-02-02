package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dto.AlumnoActivoDTO;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.PerfilPadrinoSvr;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.cimientos.intranet.utils.paginacion.ExtendedPaginatedList;
import org.cimientos.intranet.utils.paginacion.PaginateListFactory;
import org.displaytag.tags.TableTagParameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.AnioEscolar;

/**
 * @author msagarduy
 * 
 */
@Controller
@RequestMapping("/reporteBecadosAB/*")
public class ReporteBecadosAltaBecadosController extends BaseController{

	@Autowired
	private AlumnoSrv srvAlumno;
	
	@Autowired
	private ZonaCimientosSrv zonaCimientosSrv;
	
	@Autowired
	private PerfilPadrinoSvr padrinoSvr;
	
	@Autowired
	private CicloProgramaSrv cicloSrv;
	
	/** The paginate list factory. */
	@Autowired
	private PaginateListFactory paginateListFactory;
	

	@RequestMapping("/reporteBecadosAB/reporteBecadosABPaginadoViewEa.do")
	public ModelAndView reporteBecadosABPaginadoViewEa(HttpServletRequest request,
			@RequestParam(required=false,value="idEstadoAlumno")Integer idEstadoAlumno,
			@RequestParam(required=false,value="idAnioEscolar")Integer idAnioEscolar,
			@RequestParam(required=false,value="anioAdicional")String anioAdicional,
			@RequestParam(required=false,value="idZonaCimientos")Long idZonaCimientos,
			@RequestParam(required=false,value="idPadrino")Long idPadrino,
			@RequestParam(required=false,value="nombreAlumno")String nombreAlumno,
			@RequestParam(required=false,value="idEa")Long idEa,
			@RequestParam(required=false, value="mensaje") String mensaje,
			@RequestParam(required=false, value="error") String error){
		
		boolean export = request.getParameter(TableTagParameters.PARAMETER_EXPORTING) != null;
		PerfilEA ea = this.getPerfilEA(request);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		EstadoAlumno estadoAlumno = null;
		AnioEscolar anio = null;
		Boolean adicional = null;
		ZonaCimientos zona = null;
		PerfilPadrino padrino = null;

		List<EstadoAlumno> estadosParaExportacion = new ArrayList<EstadoAlumno>();
		//Filtros de busqueda

		Integer estadoAlumnoId = idEstadoAlumno != null && idEstadoAlumno.equals(0) ? null : idEstadoAlumno;
		Integer idAnio = idAnioEscolar != null && idAnioEscolar.equals(0) ? null : idAnioEscolar;
		
		if(estadoAlumnoId != null){
			estadoAlumno= EstadoAlumno.getEstados(estadoAlumnoId);
			map.put("estado", estadoAlumno);
		}		
		if(idAnio != null){
			anio= AnioEscolar.getAnioEscolar(idAnio);
			map.put("anio", anio);
		}
		if(anioAdicional != null){
			adicional = generarAdicional(anioAdicional);
			map.put("adicional", anioAdicional);
		}		
		if(idZonaCimientos != null){
			zona = zonaCimientosSrv.obtenerZonaCimientos(idZonaCimientos);
			map.put("zonaCimientos", zona);
		}

		if(idPadrino != null ){
			padrino = padrinoSvr.obtenerPorId(idPadrino);
			map.put("padrino", padrino);
		}
		
		if(nombreAlumno != null){
			if(nombreAlumno == "")
				nombreAlumno=null;
			map.put("nombreAlumno", nombreAlumno);
		}
		
		ExtendedPaginatedList listaPaginada = paginarAlumnos(export,request,null,ea.getIdPerfilEA(),estadoAlumno,zona,padrino,nombreAlumno,anio,adicional);
		llenarComboEstadoAlumno(estadosParaExportacion);		
		ArrayList<String> listaAdicional = generarListaAdicional();
		map.put("listAdicional", listaAdicional);
		map.put("listEstadoAlumnos",estadosParaExportacion);
		map.put("listAniosEscolares", AnioEscolar.getAnioEscolares());
		map.put("ea",ea);
		map.put("alumnos",listaPaginada);
		
		if(StringUtils.isNotBlank(mensaje))
			map.put("mensaje", mensaje);
		if(StringUtils.isNotBlank(error))
			map.put("error", error);
		
		return forward("/reporteBecadosAB/reporteBecadosABPaginado", map);
	}
	
	private void llenarComboEstadoAlumno(List<EstadoAlumno> estadosParaExportacion){
		EstadoAlumno pendiente = EstadoAlumno.PENDIENTE_RENOVACION_SIN_ASIGNACION;
		pendiente.setValor("Pendiente");
		EstadoAlumno enCondicionesDeRenovar = EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION;
		enCondicionesDeRenovar.setValor("En condiciones de renovar");
		estadosParaExportacion.add(EstadoAlumno.ALTA_BECADO);
		estadosParaExportacion.add(EstadoAlumno.NO_RENOVADO);
		estadosParaExportacion.add(EstadoAlumno.RENOVADO);
		estadosParaExportacion.add(EstadoAlumno.INCORPORADO);
		estadosParaExportacion.add(EstadoAlumno.INCORPORACION_PENDIENTE);
		estadosParaExportacion.add(EstadoAlumno.EGRESADO);
		estadosParaExportacion.add(pendiente);
		estadosParaExportacion.add(enCondicionesDeRenovar);
	}
	
	private Boolean generarAdicional(String anioAdicional) {
		if(anioAdicional.equals("Todos"))
			return null;
		else
			return anioAdicional.equals("Si");
	}

	private ArrayList<String> generarListaAdicional() {
		ArrayList<String> listaAdicional = new ArrayList<String>();
		listaAdicional.add("Si");
		listaAdicional.add("No");
		return listaAdicional;
	}
	
	
	private ExtendedPaginatedList paginarAlumnos(boolean export, HttpServletRequest request, Long idRr, Long idEa, EstadoAlumno estadoAlumno, ZonaCimientos zona, PerfilPadrino padrino, String nombreAlumno, AnioEscolar anio, Boolean adicional) {
		
		List<AlumnoActivoDTO> alumnos = null;
		
		ExtendedPaginatedList listaPaginada = paginateListFactory.getPaginatedListFromRequest(request);
		
		CicloPrograma cicloActual = cicloSrv.obtenerCicloActual();
		
		int totalRows = srvAlumno.obtenerCantidadBecados(idRr,idEa,estadoAlumno,zona,padrino,nombreAlumno,anio,adicional,cicloActual.getId());
		
		//Si es un export debo cargar toda la lista entera, si no lo es entonces se carga la lista de a una pagina por vez
		if(export){
			alumnos = srvAlumno.obtenerBecadosExportar(0, totalRows,listaPaginada.getSortDirection(), listaPaginada.getSortCriterion(),
					idRr,idEa,estadoAlumno,zona,padrino,nombreAlumno,anio,adicional,cicloActual.getId());
		}else{
			alumnos = srvAlumno.obtenerBecadosExportar(listaPaginada.getFirstRecordIndex(), 
													listaPaginada.getPageSize(),listaPaginada.getSortDirection(), 
													listaPaginada.getSortCriterion(),
													idRr,idEa,estadoAlumno,zona,padrino,nombreAlumno,anio,adicional,cicloActual.getId());
		}
		listaPaginada.setList(alumnos);
		listaPaginada.setTotalNumberOfRows(totalRows);

		return listaPaginada;
	}
	
	
	@RequestMapping("/reporteBecadosAB/reporteBecadosPaginadoABViewRr.do")
	public ModelAndView reporteBecadosPaginadoABViewRr(HttpServletRequest request,
			@RequestParam(required=false,value="idEstadoAlumno")Integer idEstadoAlumno,
			@RequestParam(required=false,value="idAnioEscolar")Integer idAnioEscolar,
			@RequestParam(required=false,value="anioAdicional")String anioAdicional,
			@RequestParam(required=false,value="idZonaCimientos")Long idZonaCimientos,
			@RequestParam(required=false,value="idPadrino")Long idPadrino,
			@RequestParam(required=false,value="nombreAlumno") String nombreAlumno,
			@RequestParam(required=false,value="idEa")Long idEa,
			@RequestParam(required=false,value="ea") String nombreEa,
			@RequestParam(required=false, value="mensaje") String mensaje,
			@RequestParam(required=false, value="error") String error){
		
		boolean export = request.getParameter(TableTagParameters.PARAMETER_EXPORTING) != null;
		PerfilRR rr = this.getPerfilRR(request);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		EstadoAlumno estadoAlumno = null;
		AnioEscolar anio = null;
		Boolean adicional = null;
		ZonaCimientos zona = null;
		PerfilPadrino padrino = null;

		List<EstadoAlumno> estadosParaExportacion = new ArrayList<EstadoAlumno>();
		//Filtros de busqueda
		
		Integer estadoAlumnoId = idEstadoAlumno != null && idEstadoAlumno.equals(0) ? null : idEstadoAlumno;
		Integer idAnio = idAnioEscolar != null && idAnioEscolar.equals(0) ? null : idAnioEscolar;
		
		if(estadoAlumnoId != null){
			estadoAlumno= EstadoAlumno.getEstados(estadoAlumnoId);
			map.put("estado", estadoAlumno);
		}		
		if(idAnio != null){
			anio= AnioEscolar.getAnioEscolar(idAnio);
			map.put("anio", anio);
		}
		if(anioAdicional != null){
			adicional = generarAdicional(anioAdicional);
			map.put("adicional", anioAdicional);
		}		
		if(idZonaCimientos != null){
			zona = zonaCimientosSrv.obtenerZonaCimientos(idZonaCimientos);
			map.put("zonaCimientos", zona);
		}

		if(idPadrino != null ){
			padrino = padrinoSvr.obtenerPorId(idPadrino);
			map.put("padrino", padrino);
		}
		
		if(nombreAlumno != null){
			if(nombreAlumno == "")
				nombreAlumno=null;
			map.put("nombreAlumno", nombreAlumno);
		}
		
		ExtendedPaginatedList listaPaginada = paginarAlumnos(export,request,rr.getIdPerfilRR(),idEa,estadoAlumno,zona,padrino,nombreAlumno,anio,adicional);
		llenarComboEstadoAlumno(estadosParaExportacion);		
		ArrayList<String> listaAdicional = generarListaAdicional();
		map.put("listAdicional", listaAdicional);
		map.put("listEstadoAlumnos",estadosParaExportacion);
		map.put("listAniosEscolares", AnioEscolar.getAnioEscolares());
		map.put("rr", rr);
		map.put("idEa", idEa);
		map.put("nombreEa", nombreEa);
		map.put("alumnos",listaPaginada);
		
		if(StringUtils.isNotBlank(mensaje))
			map.put("mensaje", mensaje);
		if(StringUtils.isNotBlank(error))
			map.put("error", error);
		
		return forward("/reporteBecadosAB/reporteBecadosABPaginado", map);
	}
}
