package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dto.EntrevistaTSDTO;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.FichaFamiliar;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.entrevistaTS.EntrevistaTS;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.seleccion.EntrevistaSeleccion;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.EntrevistaSeleccionSrv;
import org.cimientos.intranet.servicio.EntrevistaTSSrv;
import org.cimientos.intranet.servicio.LocalidadSrv;
import org.cimientos.intranet.servicio.ProvinciaSrv;
import org.cimientos.intranet.utils.ConstantesMenu;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.utils.PeriodoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cimientos.intranet.enumerativos.Convive;
import com.cimientos.intranet.enumerativos.NivelEducativo;
import com.cimientos.intranet.enumerativos.RecomendacionesTS;
import com.cimientos.intranet.enumerativos.Vinculo;
import com.cimientos.intranet.enumerativos.entrevista.MotivoEnvioTS;
import com.cimientos.intranet.enumerativos.entrevista.MotivoRechazo;


@Controller
@RequestMapping("/entrevistaTrabajadorSocial/*")
public class EntrevistaTrabajadorSocialController extends BaseController{


	@Autowired 
	AlumnoSrv alumnoService;
		
	@Autowired
	EntrevistaSeleccionSrv entrevistaSeleccionSrv;
	
	@Autowired
	EntrevistaTSSrv entrevistaTSService;
	@Autowired
	ProvinciaSrv provinciaSrv;
	@Autowired
	LocalidadSrv localidadSrv;
	@Autowired
	CicloProgramaSrv cicloProgramaSrv;
	
	
	/**
	 * Va a la lista de alumnos con estadoAlumno = PRESELECCIONADO.
	 *
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/entrevistaTrabajadorSocial/listaEntrevistaTSSeleccion.do")
	public ModelAndView listaEntrevistaSeleccion(HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<EstadoAlumno> estados = new ArrayList<EstadoAlumno>();
		estados.add(EstadoAlumno.PRESELECCIONADO);
		PerfilTS perfilTS = getPerfilTS(request);
		List<PerfilAlumno> lista = alumnoService.obtenerAlumnoParaTS(perfilTS, new Boolean(true));
		result.put("alumnos", lista);
		
		return forward("/entrevistaTrabajadorSocial/listaEntrevistaTSSel", result);
	}
	
	
	/**
	 * Va al alta de entrevista TS del alumno.
	 *
	 * @param idAlumno the id alumno
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/entrevistaTrabajadorSocial/altaEntrevistaTS.do")
	public ModelAndView irAlta(
			@RequestParam ("idAlumno") long idAlumno,
			@RequestParam ("seleccion") Boolean seleccion
			){
		Map<String, Object> result = new HashMap<String, Object>();
		
		EntrevistaTSDTO entrevistaTSDTO = new EntrevistaTSDTO();
		EntrevistaTS entrevistaTS = new EntrevistaTS();
		
		PerfilAlumno alumno = alumnoService.obtenerAlumno(idAlumno);
		EntrevistaSeleccion entrevistaSeleccion = entrevistaSeleccionSrv.obtenerEntrevistaSeleccionPorAlumno(alumno);
		entrevistaTS.setIngresosTotales(entrevistaSeleccion.getIngresosTotalesFichaFamiliar());
		entrevistaTS.setObservacionesEgresoIngreso(entrevistaSeleccion.getObservacionesEgresoIngreso());
		entrevistaTS.setPercepcionesSobreRA(alumno.getResponsable1().getPercepcionesSobreRA());
		entrevistaTS.setObservacionesGenerales(entrevistaSeleccion.getObservacionesGenerales());
		entrevistaTS.setMotivoVisita(entrevistaSeleccion.getMotivoEnvioTS() == null ? null : entrevistaSeleccion.getMotivoEnvioTS());
		entrevistaTS.setPerfilAlumno(alumno);
		entrevistaTSDTO.setEntrevistaTS(entrevistaTS);
		entrevistaTSDTO.setListaRecomendacionTS(RecomendacionesTS.getListaRecomendacionesTS());
		
		
		entrevistaTSDTO.setEdadAlumno(Formateador.obtenerEdad(alumno.getDatosPersonales().getFechaNacimiento()));
		entrevistaTSDTO.setEdadResponsable(Formateador.obtenerEdad(alumno.getResponsable1().getFechaNacimiento()));

		entrevistaTSDTO.setLocalidades(localidadSrv.obtenerTodos());
		entrevistaTSDTO.setListProvincias(provinciaSrv.obtenerTodas());

		entrevistaTSDTO.setListVinculo(Vinculo.getListaVinculos());
		entrevistaTSDTO.setListConvive(Convive.getListaConvives());
		entrevistaTSDTO.setListNivelEducativo(NivelEducativo.getListaNivelEducativo());
		entrevistaTSDTO.setIsEntrevistaTS(true);
		entrevistaTSDTO.setIsDetalleEntrevista(false);
		entrevistaTSDTO.setSeleccion(seleccion);
		result.put("entrevistaTSDTO", entrevistaTSDTO);
		return forward("/entrevistaTrabajadorSocial/altaEntrevistaTS", result);
	}
	
	/**
	 * Guardar.
	 *
	 * @param request the request
	 * @param entrevistaTS the entrevista ts
	 * @param idEstadoAlumno the id estado alumno
	 * @param idAlumno the id alumno
	 * @param volver the volver
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/entrevistaTrabajadorSocial/guardar.do")
	public ModelAndView guardar(
			HttpServletRequest request,
			@ModelAttribute("entrevistaTSDTO") EntrevistaTSDTO entrevistaTSDTO
			
			){
		Map<String, Object> result = new HashMap<String, Object>();
		PerfilTS perfilTS = getPerfilTS(request);
		EntrevistaTS ts =  entrevistaTSDTO.getEntrevistaTS();
		ts.setPerfilTS(perfilTS);
		
		//Guardo trabajador social
		PerfilAlumno alumno = alumnoService.obtenerAlumno(entrevistaTSDTO.getIdAlumno());
		
		Persona personaDB = alumno.getDatosPersonales();
		PerfilAlumno alumnoTS = ts.getPerfilAlumno(); 
		copiarDatosPersonales(alumno.getResponsable1(), alumnoTS.getDatosPersonales(), entrevistaTSDTO);
		if(alumno.getResponsable2() != null ){
			copiarDatosPersonales(alumno.getResponsable2(), alumnoTS.getDatosPersonales(), entrevistaTSDTO);
		}
		copiarDatosPersonales(personaDB,alumnoTS.getDatosPersonales(),entrevistaTSDTO);
		alumno.setTelefono1(alumnoTS.getTelefono1());
		RecomendacionesTS re = RecomendacionesTS.getRecomendacionesTS(entrevistaTSDTO.getRecomendacionTSId());
		ts.setMotivoVisita(MotivoEnvioTS.getMotivoEnvioTS(entrevistaTSDTO.getIdMotivoVisita()));
		ts.setRecomendacionesTS(re);
		alumno.setFichaFamiliar(populateFichaFamiliar(entrevistaTSDTO));
		alumno.setEntrevistaTS(new Boolean(true));
		ts.setPerfilAlumno(alumno);
		CicloPrograma cicloPrograma = cicloProgramaSrv.obtenerCicloActual();
		ts.setFechaCargaEntrevista(new Date());
		ts.setNombreCiclo(cicloPrograma.getNombre());
		Periodo periodo = PeriodoHelper.getPeriodoActual(cicloPrograma.getPeriodos(), ts.getFechaCargaEntrevista());
		ts.setNombrePeriodo(periodo.getNombre());
		ts.setMotivoRechazo(entrevistaTSDTO.getIdMotivoRechazo() == null ? null : MotivoRechazo.getMotivoRechazo(entrevistaTSDTO.getIdMotivoRechazo()));
		
		entrevistaTSService.guardarEntrevista(ts);

		result.put("mensaje", "Se cargo exitosamente la entrevists TS para el alumno " + alumno.getDatosPersonales().getNombre() + " ," +alumno.getDatosPersonales().getApellido() );
		if(entrevistaTSDTO.getSeleccion()){
			List<PerfilAlumno> lista = alumnoService.obtenerAlumnoParaTS(perfilTS,new Boolean(true));
			result.put("alumnos", lista);
			return forward("/entrevistaTrabajadorSocial/listaEntrevistaTSSel", result);
		}else{
			List<PerfilAlumno> lista = alumnoService.obtenerAlumnoParaTS(perfilTS,new Boolean(false));
			result.put("alumnos", lista);
			return forward("/entrevistaTrabajadorSocial/listaEntrevistasTSAcom", result);
		}
	}
	
	
	/**
	 * Reporte ts.
	 *
	 * @param request the request
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/entrevistaTrabajadorSocial/reporteEntrevistaTS.do")
	public ModelAndView reporteTS(HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<EntrevistaTS> listaEntrevistas = entrevistaTSService.obtenerPorTS(getPerfilTS(request).getIdPerfilTS());
		result.put("listaEntrevistas", listaEntrevistas);
		result.put("listaCiclos", cicloProgramaSrv.obtenerTodos());
		HttpSession session = request.getSession();
		session.setAttribute("menu", ConstantesMenu.menuTS);
		return forward("/entrevistaTrabajadorSocial/reporteEntrevistaTS", result);
	}
	
	/**
	 * Ir a modificar reporte ts.
	 *
	 * @param idEntrevista the id entrevista
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */

	@RequestMapping("/entrevistaTrabajadorSocial/detalleEntrevista.do")
	public ModelAndView irADetalleEntrevistaTS(
			@RequestParam ("idEntrevista") Long idEntrevista
		){
		Map<String, Object> result = new HashMap<String, Object>();
		
		EntrevistaTS entrevistaTS =  entrevistaTSService.obtenerEntrevistaTS(idEntrevista);
		EntrevistaTSDTO entrevistaTSDTO = new EntrevistaTSDTO();
		entrevistaTSDTO.setEntrevistaTS(entrevistaTS);
		entrevistaTSDTO.setListaRecomendacionTS(RecomendacionesTS.getListaRecomendacionesTS());
		entrevistaTSDTO.setLocalidades(localidadSrv.obtenerTodos());
		entrevistaTSDTO.setListProvincias(provinciaSrv.obtenerTodas());

		entrevistaTSDTO.setListVinculo(Vinculo.getListaVinculos());
		entrevistaTSDTO.setListConvive(Convive.getListaConvives());
		entrevistaTSDTO.setListNivelEducativo(NivelEducativo.getListaNivelEducativo());
		entrevistaTSDTO.setIsEntrevistaTS(true);
		entrevistaTSDTO.setIsDetalleEntrevista(true);
		entrevistaTSDTO.setEdadAlumno(Formateador.obtenerEdad(entrevistaTS.getPerfilAlumno().getDatosPersonales().getFechaNacimiento()));
		entrevistaTSDTO.setEdadResponsable(Formateador.obtenerEdad(entrevistaTS.getPerfilAlumno().getResponsable1().getFechaNacimiento()));
		result.put("entrevistaTSDTO", entrevistaTSDTO);
		return forward("/entrevistaTrabajadorSocial/altaEntrevistaTS", result);
	}
	

	/**
	 * Populate ficha familiar.
	 *
	 * @param entrevistaTSDTO the entrevista tsdto
	 * @return the list
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	private List<FichaFamiliar> populateFichaFamiliar(EntrevistaTSDTO entrevistaTSDTO) {
		List<FichaFamiliar> listFichaFamiliars = new ArrayList<FichaFamiliar>();
		FichaFamiliar fichaFamiliar = null;
		List<String> nombreFichas = entrevistaTSDTO.getNombreFichas();
		if(nombreFichas != null){
			for (int i = 0; i < nombreFichas.size(); i++) {
				fichaFamiliar = new FichaFamiliar();
				if(StringUtils.isEmpty(nombreFichas.get(i))){
					break;
				}
				if(entrevistaTSDTO.getIdFichaFamiliars() != null && entrevistaTSDTO.getIdFichaFamiliars().size() > i ){
					fichaFamiliar.setId(entrevistaTSDTO.getIdFichaFamiliars().get(i));
				}
				
				fichaFamiliar.setNombre(nombreFichas.get(i));
				fichaFamiliar.setApellido(entrevistaTSDTO.getApellidoFichas().get(i));
				try{
					fichaFamiliar.setEdad(Integer.parseInt(entrevistaTSDTO.getEdadFichas().get(i)) );
				}catch(NumberFormatException e){};
				if(entrevistaTSDTO.getConviveFichas().get(i) != null){
					fichaFamiliar.setConvive(Convive.getConvive(entrevistaTSDTO.getConviveFichas().get(i)));
				}
				if(entrevistaTSDTO.getNivelEducativoFichas().get(i) != null){
					fichaFamiliar.setNivelEducativo(NivelEducativo.getNivelEducativo(entrevistaTSDTO.getNivelEducativoFichas().get(i)));
				}
				if(entrevistaTSDTO.getAbandonoRepitenciaFichas().get(i) != null){
					fichaFamiliar.setAbandonoRepitencia(entrevistaTSDTO.getAbandonoRepitenciaFichas().get(i));
				}
				if(entrevistaTSDTO.getEstabilidadLaboralFichas().get(i) != null){
					fichaFamiliar.setEstabilidadLaboral(entrevistaTSDTO.getEstabilidadLaboralFichas().get(i));
				}
				try{
					fichaFamiliar.setRenumeracion(Integer.parseInt(entrevistaTSDTO.getRenumeracionFichas().get(i)));
				}catch(NumberFormatException e){};
				if(entrevistaTSDTO.getOtrosIngresosFichas().get(i) != null){
					fichaFamiliar.setOtrosIngresos(entrevistaTSDTO.getOtrosIngresosFichas().get(i));
				}
				if(entrevistaTSDTO.getOcupacionLaboralFichas().get(i) != null){
					fichaFamiliar.setOcupacionLaboral(entrevistaTSDTO.getOcupacionLaboralFichas().get(i));
				}
				if(entrevistaTSDTO.getVinculoFFs().get(i) != null){
					fichaFamiliar.setVinculo(Vinculo.getVinculo(entrevistaTSDTO.getVinculoFFs().get(i)));
				}
				if(entrevistaTSDTO.getObservacionesTSList().get(i) != null ){
					fichaFamiliar.setObservacionesTS((String)entrevistaTSDTO.getObservacionesTSList().get(i));
				}
				listFichaFamiliars.add(fichaFamiliar);
			}
			
		}
		return listFichaFamiliars;
	}
	
	/**
	 * Copiar datos personales ra.
	 *
	 * @param raDest the ra dest
	 * @param persona the persona
	 * @since 01-abr-2011
	 * @author cfigueroa
	 */
	public void copiarDatosPersonales(Object raDest,Persona persona, EntrevistaTSDTO entrevistaTSDTO){
		if (raDest instanceof ResponsableAdulto) {
			ResponsableAdulto ra = (ResponsableAdulto) raDest;
			ra.setDireccion(persona.getDireccion());
			ra.setNroCalle(String.valueOf(persona.getNumeroCalle()));
			ra.setPiso(String.valueOf(persona.getPiso()));
			ra.setCodigoPostal(persona.getCodigoPostal());
			ra.setDpto(persona.getDepartamento());
			ra.setEntreCalles(persona.getEntreCalles());
			ra.setIdLocalidad(persona.getLocalidad());
			ra.setTelefono(persona.getTelefono());
			ra.setTelefono1(persona.getTelefono());
//			ra.setEgresosTotales(entrevistaTSDTO.getEntrevistaTS().getPerfilAlumno().getResponsable1().getEgresosTotales());
			ra.setEgresosTotales(entrevistaTSDTO.getEntrevistaTS().getEgresosTotales().toString());
		}else{
			Persona alumno = (Persona) raDest;
			alumno.setDireccion(persona.getDireccion());
			alumno.setNumeroCalle(persona.getNumeroCalle());
			alumno.setPiso(persona.getPiso());
			alumno.setCodigoPostal(persona.getCodigoPostal());
			alumno.setDepartamento(persona.getDepartamento());
			alumno.setEntreCalles(persona.getEntreCalles());
			alumno.setLocalidad(persona.getLocalidad());
			alumno.setTelefono(persona.getTelefono());
			alumno.setBarrio(persona.getBarrio());
			alumno.setProvincia(persona.getProvincia());
		}
		
		
	}
	
	/**
	 * Filtrar entrevista por ciclo.
	 *
	 * @param idCiclo the id ciclo
	 * @param request the request
	 * @return the model and view
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	@RequestMapping("/entrevistaTrabajadorSocial/filtrarEntrevistasPorCiclo.do")
	public ModelAndView filtrarEntrevistaPorCiclo(@RequestParam("idCiclo")Long idCiclo,
										  HttpServletRequest request	){
		Map<String, Object> result = new HashMap<String, Object>();
		CicloPrograma cicloPrograma = cicloProgramaSrv.obtenerCiclo(idCiclo);
		PerfilTS perfilTS = getPerfilTS(request);
		List<EntrevistaTS> list = entrevistaTSService.obtnerEntrevistaTSPorCiclo(cicloPrograma.getNombre(), perfilTS);
		result.put("listaEntrevistas", list);
		result.put("listaCiclos", cicloProgramaSrv.obtenerTodos());
		return forward("/entrevistaTrabajadorSocial/reporteEntrevistaTS", result);
		
	}
	
	/**
	 * Va a la lista de alumnos con estadoAlumno = PRESELECCIONADO.
	 *
	 * @return the model and view
	 * @author hhrodriguez
	 * @since 02-feb-2011
	 */
	@RequestMapping("/entrevistaTrabajadorSocial/listaEntrevistaTSAcompaniamiento.do")
	public ModelAndView listaEntrevistaAcompaniamiento(HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		
		PerfilTS perfilTS = getPerfilTS(request);

		List<PerfilAlumno> lista = alumnoService.obtenerAlumnoParaTS(perfilTS,new Boolean(false));
		result.put("alumnos", lista);
		
		return forward("/entrevistaTrabajadorSocial/listaEntrevistasTSAcom", result);
	}
	
}
