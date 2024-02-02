
package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cimientos.intranet.dto.ObjetivoSeleccionDTO;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.objetivoseleccion.ObjetivoSeleccion;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.cimientos.intranet.servicio.ObjetivoSeleccionSrv;
import org.cimientos.intranet.servicio.PeriodoSrv;
import org.cimientos.intranet.servicio.ZonaCimientosSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/objetivoSeleccion/*")
public class ObjetivoSeleccionController extends BaseController{


	@Autowired
	private ObjetivoSeleccionSrv objetivoSeleccionSrv;

	@Autowired
	private CicloProgramaSrv cicloProgramaSrv; 

	@Autowired
	private ZonaCimientosSrv zonaCimientosSrv;

	@Autowired
	private PeriodoSrv periodoSrv;
	
		
	/**
	 * Alta objetivos seleccion view.
	 *
	 * @param idCiclo the id ciclo
	 * @param idPeriodo the id periodo
	 * @return the model and view
	 * @since 03-ene-2011
	 * @author cfigueroa
	 */
	@RequestMapping("/objetivoSeleccion/altaObjetivoSeleccionView.do")
	public ModelAndView altaObjetivosSeleccionView(@RequestParam("idCiclo")Long idCiclo,@RequestParam("idPeriodo") Long idPeriodo
												    ){
		Map<String, Object> map = new HashMap<String, Object>();
		CicloPrograma ciclo = cicloProgramaSrv.obtenerCiclo(idCiclo);
		Periodo periodo = periodoSrv.obtenerPeriodo(idPeriodo);
		List<ObjetivoSeleccionDTO> listDTO = new ArrayList<ObjetivoSeleccionDTO>();
		ObjetivoSeleccionDTO dto =cargarDTOPorCicloPeriodo(ciclo, periodo);
		listDTO.add(dto);
		map.put("listObjSelDTO", listDTO);
		map.put("isAltaObjetivoSeleccion", new Boolean(true));
		map.put("0bjetivoSeleccionDTO", new ObjetivoSeleccionDTO());
		map.put("cicloSelect", idCiclo);
		return forward("/objetivoSeleccion/objetivoSeleccionView", map);
			
	}
	
	/**
	 * Lista objetivos seleccion anio actual.
	 *
	 * @return the model and view
	 * @since 07-ene-2011
	 * @author cfigueroa
	 */
	@RequestMapping("/objetivoSeleccion/listaObjetivoSeleccionAnioActual.do")
	public ModelAndView listarObjetivosSeleccionPorCiclo(@RequestParam(required=false,value="idCiclo") Long idCiclo){
		Map<String, Object> map = new HashMap<String, Object>();
		List<CicloPrograma> ciclos = new ArrayList<CicloPrograma>();
		CicloPrograma ciclo = null;
		
		if(idCiclo == null){
			ciclo = cicloProgramaSrv.obtenerCicloActual();
			ciclos.add(ciclo);
		}else{
			ciclo = cicloProgramaSrv.obtenerCiclo(idCiclo);
			ciclos.add(cicloProgramaSrv.obtenerCicloActual());
		}
		CicloPrograma cicloSiguiente = cicloProgramaSrv.obtenerSiguienteCiclo();
		if(cicloSiguiente != null)		
			ciclos.add(cicloSiguiente);
		
		List<ObjetivoSeleccionDTO> listDTO = new ArrayList<ObjetivoSeleccionDTO>();
		populateListObjSelDTO(ciclo, listDTO);
		map.put("listObjSelDTO", listDTO);
		map.put("listaCiclos", ciclos);
		map.put("cicloSelect", idCiclo);
		return forward("/objetivoSeleccion/listaObjetivoSeleccionAnioActual", map);
			
	}
	
	/**
	 * Este metodo es para armar una lista de objetivo seleccion dto , para un ciclo en particular.
	 *
	 * @param ciclo the ciclo
	 * @param listDTO the list dto
	 * @since 07-ene-2011
	 * @author cfigueroa
	 */
	private void populateListObjSelDTO(CicloPrograma ciclo,
			List<ObjetivoSeleccionDTO> listDTO) {
		ObjetivoSeleccionDTO dto = null;
		for (Periodo periodo : ciclo.getPeriodos()) {
			dto = cargarDTOPorCicloPeriodo(ciclo, periodo);
			listDTO.add(dto);
		}
	}

	/**
	 * Este metodo setea en el DTO, los distintos objetivos seleccion que estan para ese ciclo y periodo.
	 *
	 * @param ciclo the ciclo
	 * @param periodo the periodo
	 * @return the objetivo seleccion dto
	 * @since 07-ene-2011
	 * @author cfigueroa
	 */
	private ObjetivoSeleccionDTO cargarDTOPorCicloPeriodo(CicloPrograma ciclo, Periodo periodo) {
		ObjetivoSeleccionDTO dto;
		List<ObjetivoSeleccion> list = objetivoSeleccionSrv.obtenerObjetivoSeleccionPorPeriodoCiclo(periodo, ciclo);
		dto = initializeObjSeleccionDTO();
		dto.setPeriodo(periodo);
		dto.setCicloPrograma(ciclo);
		for (ObjetivoSeleccion objetivoSeleccion : list) {
			dto.getIdObjetivoSeleccion().add(objetivoSeleccion.getId());
			dto.getCantidadBecas().add(objetivoSeleccion.getCantidadBecas());
			dto.getCantidadBecasCesadas().add(objetivoSeleccion.getCantidadBecasCesadas());
			dto.getCantidadBecasDisponiblesPorEgreso().add(objetivoSeleccion.getCantidadBecasDisponiblesPorEgreso());
			dto.getZonaCimientos().add(objetivoSeleccion.getZona());
		}
		return dto;
	}
		
	/**
	 * Guardar objetivo seleccion.
	 *
	 * @param zonaIds the zona ids
	 * @param listCantidadBecas the list cantidad becas
	 * @param idPeriodo the id periodo
	 * @param idCiclo the id ciclo
	 * @param listBecadosCesados the list becados cesados
	 * @param listBecadosADisponerEgreso the list becados a disponer egreso
	 * @return the model and view
	 * @since 03-ene-2011
	 * @author cfigueroa
	 */
	@RequestMapping("/objetivoSeleccion/guardarObjetivoSeleccion.do")
	public ModelAndView guardarObjetivoSeleccion( @ModelAttribute("0bjetivoSeleccionDTO") ObjetivoSeleccionDTO dto,
			@RequestParam(required=false,value="idPeriodo") Long idPeriodo,
			@RequestParam("idCiclo") Long idCiclo
			){
		
		Map<String, Object> map = new HashMap<String, Object>();
		ObjetivoSeleccion objetivoSeleccion = null;
		List<ObjetivoSeleccion> listObjetivoSeleccion = new ArrayList<ObjetivoSeleccion>();
		CicloPrograma ciclo = cicloProgramaSrv.obtenerCiclo(idCiclo);
		Periodo periodo = periodoSrv.obtenerPeriodo(idPeriodo);
		if(dto.getIdZona() != null ){
			int cont = dto.getIdZona().size();
			for (int index = 0 ; index < cont ; index++ ) {
				if (dto.getIdZona().get(index)!=null){
					ZonaCimientos zona = zonaCimientosSrv.obtenerZonaCimientos(dto.getIdZona().get(index)); 
					objetivoSeleccion = new ObjetivoSeleccion();
					objetivoSeleccion.setActivo(true);
					objetivoSeleccion.setPeriodo(periodo);
					objetivoSeleccion.setCicloPrograma(ciclo);
					objetivoSeleccion.setCantidadBecas(dto.getCantidadBecas().get(index));
					objetivoSeleccion.setCantidadBecasCesadas(dto.getCantidadBecasCesadas().get(index));
					objetivoSeleccion.setCantidadBecasDisponiblesPorEgreso(dto.getCantidadBecasDisponiblesPorEgreso().get(index));
					objetivoSeleccion.setZona(zona);
					listObjetivoSeleccion.add(objetivoSeleccion);
				}
			}
			objetivoSeleccionSrv.guardarObjetivoSeleccion(listObjetivoSeleccion);
			
			map.put("mensaje", "Se dio de alta el periodo: " +periodo.getNombre() );
		}else{
			map.put("error", "Debe cargar al menos un objetivo para dar de Alta " );
		}
		
		List<ObjetivoSeleccionDTO> listDTO = new ArrayList<ObjetivoSeleccionDTO>();
		populateListObjSelDTO(ciclo, listDTO);
		List<CicloPrograma> ciclos = new ArrayList<CicloPrograma>();
		ciclos.add(cicloProgramaSrv.obtenerCicloActual());
		ciclos.add(cicloProgramaSrv.obtenerSiguienteCiclo());
		map.put("listaCiclos", ciclos);
		map.put("cicloSelect", idCiclo);
		map.put("listObjSelDTO", listDTO);
		return forward("/objetivoSeleccion/listaObjetivoSeleccionAnioActual", map);
	}

	/**
	 * Listar objetivo seleccion.
	 *
	 * @return the model and view
	 * @since 07-ene-2011
	 * @author cfigueroa
	 */
	@RequestMapping("/objetivoSeleccion/listarObjetivoSeleccion.do")
	public ModelAndView listarObjetivoSeleccion(){
		Map<String, Object> map = new HashMap<String, Object>();

		List<ObjetivoSeleccion> listObjSel = objetivoSeleccionSrv.obtenerTodos();
		map.put("listObjSelDTO", listObjSel);
		return forward("/objetivoSeleccion/listaObjetivoSelecciones", map);
	}
	
	/**
	 * Este metodo inicializa las lista del Objeto ObjetivoSeleccionDTO.
	 *
	 * @return the objetivo seleccion dto
	 * @since 05-ene-2011
	 * @author cfigueroa
	 */
	private ObjetivoSeleccionDTO initializeObjSeleccionDTO() {
		ObjetivoSeleccionDTO dto = new ObjetivoSeleccionDTO();
		dto.setCantidadBecas(new ArrayList<Long>());
		dto.setCantidadBecasCesadas(new ArrayList<Long>());
		dto.setCantidadBecasDisponiblesPorEgreso(new ArrayList<Long>());
		dto.setZonaCimientos(new ArrayList<ZonaCimientos>());
		dto.setIdObjetivoSeleccion(new ArrayList<Long>());
		return dto;
	}
	
	
	/**
	 * Este metodo carga el objetivo que se quiere modificar 
	 *
	 * @param idCiclo the id ciclo
	 * @param idPeriodo the id periodo
	 * @return the model and view
	 * @since 17-ene-2011
	 * @author cfigueroa
	 */
	@RequestMapping("/objetivoSeleccion/modificarObjetivoSeleccionView.do")
	public ModelAndView modificarObjetivoSeleccionView(@RequestParam("idCiclo") Long idCiclo , @RequestParam("idPeriodo") Long idPeriodo ){
		Map<String, Object> map = new HashMap<String, Object>();
		CicloPrograma ciclo = cicloProgramaSrv.obtenerCiclo(idCiclo);
		Periodo periodo = periodoSrv.obtenerPeriodo(idPeriodo);
		List<ObjetivoSeleccionDTO> listDTO = new ArrayList<ObjetivoSeleccionDTO>();
		ObjetivoSeleccionDTO dto =cargarDTOPorCicloPeriodo(ciclo, periodo);
		listDTO.add(dto);
		map.put("listObjSelDTO", listDTO);
		map.put("0bjetivoSeleccionDTO", dto);
		map.put("isAltaObjetivoSeleccion", new Boolean(false));
		map.put("cicloSelect", idCiclo);
		return forward("/objetivoSeleccion/objetivoSeleccionView", map);
	}
	
	/**
	 * Este metodo guarda el objetivo con las cambios realizados
	 *
	 * @param dtoTemp the dto temp
	 * @return the model and view
	 * @since 17-ene-2011
	 * @author cfigueroa
	 */
	@RequestMapping("/objetivoSeleccion/modificarObjetivoSeleccion.do")
	public ModelAndView modificarObjetivoSeleccion(@ModelAttribute("0bjetivoSeleccionDTO") ObjetivoSeleccionDTO dtoTemp){
		Map<String, Object> map = new HashMap<String, Object>();
		List<ObjetivoSeleccion> listObjetivoSeleccionTemp = objetivoSeleccionSrv.obtenerObjetivoSeleccion(dtoTemp.getIdObjetivoSeleccion());
		List<ObjetivoSeleccion> listObjetivoSeleccion = new ArrayList<ObjetivoSeleccion>();
		CicloPrograma cicloPrograma = null;
		Periodo periodo = null;
		int index = 0;
		//modificar los objetivos ya cargados
		for (ObjetivoSeleccion objetivo : listObjetivoSeleccionTemp) {
			
			periodo = objetivo.getPeriodo();
			cicloPrograma = objetivo.getCicloPrograma();
			if(dtoTemp.getIdObjetivoDelete() != null){
				objetivo.setActivo(false);
				listObjetivoSeleccion.add(objetivo);
				
			}else{
				if (dtoTemp.getIdZona().get(index)!=null){
				ZonaCimientos zona = zonaCimientosSrv.obtenerZonaCimientos(dtoTemp.getIdZona().get(index));
				objetivo.setActivo(true);
				objetivo.setCantidadBecas(dtoTemp.getCantidadBecas().get(index));
				objetivo.setCantidadBecasCesadas(dtoTemp.getCantidadBecasCesadas().get(index));
				objetivo.setCantidadBecasDisponiblesPorEgreso(dtoTemp.getCantidadBecasDisponiblesPorEgreso().get(index));
				objetivo.setZona(zona);
				listObjetivoSeleccion.add(objetivo);
				}
			}
			index++;
		}
		if(dtoTemp.getIdObjetivoDelete() != null){
			ObjetivoSeleccion obSeleccion = null;
			if (dtoTemp.getIdZona() !=null){	
				for (int i=0; i < dtoTemp.getIdZona().size(); i++) {
					obSeleccion = new ObjetivoSeleccion();
					obSeleccion.setActivo(true);
					obSeleccion.setCicloPrograma(cicloPrograma);
					obSeleccion.setPeriodo(periodo);
					obSeleccion.setCantidadBecas(dtoTemp.getCantidadBecas().get(i));
					obSeleccion.setCantidadBecasCesadas(dtoTemp.getCantidadBecasCesadas().get(i));
					obSeleccion.setCantidadBecasDisponiblesPorEgreso(dtoTemp.getCantidadBecasDisponiblesPorEgreso().get(i));
					obSeleccion.setZona(zonaCimientosSrv.obtenerZonaCimientos(dtoTemp.getIdZona().get(i)));
					listObjetivoSeleccion.add(obSeleccion);
				}
			 }	
			}
			
		else{
		//Agregar mas objetivos a la lista 
		int size = dtoTemp.getIdZona() == null ? listObjetivoSeleccionTemp.size(): dtoTemp.getIdZona().size();
		if(listObjetivoSeleccionTemp.size() != size){
			ObjetivoSeleccion obSeleccion = null;
			for (int i=0; index < dtoTemp.getIdZona().size(); i++) {
				obSeleccion = new ObjetivoSeleccion();
				obSeleccion.setActivo(true);
				obSeleccion.setCicloPrograma(cicloPrograma);
				obSeleccion.setPeriodo(periodo);
				obSeleccion.setCantidadBecas(dtoTemp.getCantidadBecas().get(index));
				obSeleccion.setCantidadBecasCesadas(dtoTemp.getCantidadBecasCesadas().get(index));
				obSeleccion.setCantidadBecasDisponiblesPorEgreso(dtoTemp.getCantidadBecasDisponiblesPorEgreso().get(index));
				obSeleccion.setZona(zonaCimientosSrv.obtenerZonaCimientos(dtoTemp.getIdZona().get(index)));
				listObjetivoSeleccion.add(obSeleccion);
				index++;
			}
			
		}
		}
		
		objetivoSeleccionSrv.guardarObjetivoSeleccion(listObjetivoSeleccion);
		
		List<ObjetivoSeleccionDTO> listDTO = new ArrayList<ObjetivoSeleccionDTO>();
		List<CicloPrograma> ciclos = new ArrayList<CicloPrograma>();
		ciclos.add(cicloProgramaSrv.obtenerCicloActual());
		ciclos.add(cicloProgramaSrv.obtenerSiguienteCiclo());
		map.put("listaCiclos", ciclos);
	
		if(dtoTemp.getIdZona() != null){
			populateListObjSelDTO(cicloPrograma, listDTO);
			map.put("mensaje", "Se modificó el periodo: " +periodo.getNombre() );
		}else{
			Calendar calendar = Calendar.getInstance();
			Integer anio = calendar.get(Calendar.YEAR);;
			CicloPrograma ciclo = cicloProgramaSrv.obtenerCicloPorAnio(String.valueOf(anio));
			populateListObjSelDTO(ciclo, listDTO);
			map.put("listObjSelDTO", listDTO);
			return forward("/objetivoSeleccion/listaObjetivoSeleccionAnioActual", map);
		}
		
		map.put("listObjSelDTO", listDTO);
		return forward("/objetivoSeleccion/listaObjetivoSeleccionAnioActual", map);
	}
}	
