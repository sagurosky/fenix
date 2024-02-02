package org.cimientos.intranet.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.servicio.SeleccionarCandidatosBecasSrv;
import org.cimientos.intranet.utils.Formateador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/seleccionarCandidatosBecas/*")
public class SeleccionarCandidatosBecasController extends BaseController {
	

	@Autowired
	private SeleccionarCandidatosBecasSrv seleccionarCandidatosSrv;
	/**
	 * List candidatos disponibles.
	 *
	 * @return the model and view
	 * @since 16-nov-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/seleccionarCandidatosBecas/listCandidatosDisponibles") 
	public ModelAndView listCandidatosDisponibles(){
		Map<String, Object> map = new HashMap<String,Object>();
		
		loadObjectForm(map);
		
		return forward("seleccionarCandidatosBecas/listCandidatosDisponibles", map);
	}

	
	
	/**
	 * Guardar candidatos.
	 *
	 * @param idsPerfilAlumnos the ids perfil alumnos
	 * @return the model and view
	 * @since 17-nov-2010
	 * @author cfigueroa
	 */
	@RequestMapping("/seleccionarCandidatosBecas/guardarCandidatos") 
	public ModelAndView guardarCandidatos(@RequestParam("alumnosSeleccionados") String idsPerfilAlumnos){
		Map<String,Object> map = new HashMap<String, Object>();
		
		List<Long> ids = Formateador.toListOfLongs(idsPerfilAlumnos);
		StringBuffer buffer = new StringBuffer();
		for (Long id : ids) {
			PerfilAlumno perfilAlumno = seleccionarCandidatosSrv.obtenerAlumnoPorId(id);
			perfilAlumno.setEstadoAlumno(EstadoAlumno.getEstados(11));
			seleccionarCandidatosSrv.updateAlumno(perfilAlumno);
			buffer.append(" ");
			buffer.append(perfilAlumno.getDatosPersonales().getNombre());
			buffer.append(" ");
			buffer.append(perfilAlumno.getDatosPersonales().getApellido());
			buffer.append(",");
		}
		loadObjectForm(map);
		
		map.put("mensaje", "Se han actualizado los datos de los Alummnos: " + buffer.toString());
		return forward("seleccionarCandidatosBecas/listCandidatosDisponibles", map);
	}
	
	/**
	 * Load object form.
	 *
	 * @param map the map
	 * @param logeado the logeado
	 * @since 07-dic-2010
	 * @author cfigueroa
	 */
	private void loadObjectForm(Map<String, Object> map) {
		
		List<EstadoAlumno> listEstados = new ArrayList<EstadoAlumno>();
		listEstados.add(EstadoAlumno.getEstados(4));
		listEstados.add(EstadoAlumno.getEstados(15));
		List<PerfilAlumno> list = seleccionarCandidatosSrv.obtenerCandidatosDisponibles(listEstados);
		map.put("listCandidatos",list);
	}

}
