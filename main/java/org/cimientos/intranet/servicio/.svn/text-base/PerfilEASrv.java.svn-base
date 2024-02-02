package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.dao.PerfilEADao;
import org.cimientos.intranet.modelo.perfil.AlumnoPanelEA;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * PerfilEA
 * @author Nicolas Lopez
 *
 */

@Service
@Transactional
public class PerfilEASrv {
	
	@Autowired
	private PerfilEADao dao;

	@Autowired
	private AlumnoPanelEASrv srvAlumnoPanel;
	
	/**
	 * Persiste un PerfilEA en la base de datos.
	 * 
	 * @param perfilEA
	 */
	public void agregarPerfilEA( PerfilEA perfilEA ){
		dao.guardar(perfilEA);
		dao.flush();
	}
	
	/**
	 * @param perfilesEas
	 */
	public void agregarTodos(List<PerfilEA> perfilesEas){
		dao.guardar(perfilesEas);
		dao.flush();
	}
	
	/**
	 * Persiste un PerfilEA modificado en la base de datos
	 * 
	 * @param perfilEA
	 */
	public void modificarPerfilEA( PerfilEA perfilEA ){
		dao.guardar(perfilEA);
		dao.flush();

	}
	
	/**
	 * Elimina un PerfilEA de la base de datos
	 * 
	 * @param perfilEA
	 */
	public void eliminarPerfilEA(PerfilEA perfilEA){
		dao.eliminar(perfilEA);
		dao.flush();
	}
	
	/**
	 * Recupera, si es que existe, el PerfilEA con id=id
	 * 
	 * @param id
	 * @return id
	 */
	
	public PerfilEA obtenerPerfilEA(long id){
		return dao.obtener(id);
	}
	
	/**
	 * Recupera en una lista todos los PerfilEA persistidos
	 * 
	 * de la base de datos
	 * 
	 * @return una Lista de PerfilEA que representa a todos los objetos persistidos.
	 */
	
	public List<PerfilEA> obtenerTodos(){
		return dao.obtenerTodos();
	}
	/**
	 * Recupera la lista de perfilesEA con los ids pasados por parametro.
	 * 
	 * @param list la lista de ids
	 * @return lista de perfilesEA 
	 */
	public List<PerfilEA> obtenerEAsPorIds(List<Long> list) {
		return dao.obtenerGrupo("idPerfilEA", list);
	}
	
	

	/**
	 * Recupera la lista de perfilesEA con los ids pasados por parametro.
	 * 
	 * @param list la lista de ids
	 * @return lista de perfilesEA 
	 */
	public List<PerfilEA> obtenerPagosEAsPorIds(List<Long> list) {
		List<PerfilEA> perfilesEas =  dao.obtenerGrupo("idPerfilEA", list);
		List<PerfilEA> perfilesConRR = new ArrayList<PerfilEA>();
		for (PerfilEA perfilEa : perfilesEas) 
		{
			if(perfilEa.getRr() != null)
			{
				perfilesConRR.add(perfilEa);
			}
				
		}
		return perfilesConRR;
		
	}

	/**
	 * Recupera la lista de EAs que aun no han sido asignados a ningun RR
	 * 
	 * @return lista de perfilesEA
	 */
	public List<PerfilEA> obtenerEAsSinAsignacionRR() {
		return dao.obtenerEAsSinAsignacionRR();
	}

	/**
	 * Asigna los alumnos al EA seleccionado.
	 * 
	 * @param perfilEASeleccionado
	 * @param perfilesAlumnos
	 */
	public void asignarBecadoEA(PerfilEA perfilEASeleccionado,
			List<PerfilAlumno> perfilesAlumnos) {
		for (PerfilAlumno alumno : perfilesAlumnos) {
			//se agregaron estas validaciones porque no refrescaba la grilla con las cantidades 
			if(alumno.getEa() != null ){
				alumno.getEa().getBecados().remove(alumno);
			}
			alumno.setEa(perfilEASeleccionado);
			
			//acutalización para el panel de control
			AlumnoPanelEA alumnoPanel = null;
			alumnoPanel = srvAlumnoPanel.obtenerAlumnoPanelPorIdPerfilAlumno(alumno.getId());

			alumnoPanel.setIdPerfilEA(perfilEASeleccionado.getIdPerfilEA());
			srvAlumnoPanel.modificarAlumnoPanelEA(alumnoPanel);

			if(!perfilEASeleccionado.getBecados().contains(alumno)){
				perfilEASeleccionado.getBecados().add(alumno);
			}
			
		}
		dao.guardar(perfilEASeleccionado);
		dao.flush();
	}

	/**
	 * Obtiene la lista de eas con rr asignado
	 * 
	 * @return la lista de eas
	 */
	public List<PerfilEA> obtenerEasConRRAsignado() {
		return dao.obtenerEasConRRAsignado();
	}
	
	

	/**
	 * Obtiene la lista de eas con becados asignados
	 * 
	 * @return la lista de eas
	 */
	public List<PerfilEA> obtenerEasConBecadosAsignados() {
		return dao.obtenerEasConBecadosAsignados();
	}

	/**
	 * Desasigna los alumnos a su respectivo EA .
	 * 
	 * @param perfilesAlumnos
	 */
	public void desasignarBecadoEA(List<PerfilAlumno> perfilesAlumnos) {
		PerfilEA ea = perfilesAlumnos.get(0).getEa();
		for (PerfilAlumno alumno : perfilesAlumnos) {
			alumno.setEa(null);
			
			//acutalización para el panel de control
			AlumnoPanelEA alumnoPanel = srvAlumnoPanel.obtenerAlumnoPanelPorIdPerfilAlumno(alumno.getId());
			alumnoPanel.setIdPerfilEA(null);
			srvAlumnoPanel.modificarAlumnoPanelEA(alumnoPanel);
		}
		ea.getBecados().removeAll(perfilesAlumnos);
		dao.guardar(ea);
		dao.flush();
		
	}

	/**
	 * Chequea si existe un perfil EA para la persona pasada como parametro
	 * @param persona
	 * @return
	 */
	public boolean existeEAPorPersona(Persona persona) {
		return dao.existeEAPorPersona(persona);
	}

	/**
	 * @param zona
	 * @return
	 */
	public List<PerfilEA> obtenerEAsSegunZonaRR(PerfilRR rrSeleccionado) {
		return dao.obtenerEAsSegunZonaRR(rrSeleccionado);
	}
	
	public List<Long> obtenerIdsAlumnosEas(List<Long> idsEas){
		return dao.obtenerIdsBecadosEas(idsEas);
	}
	
	public List<Long> obtenerIdsAlumnosBecadosEas(List<Long> idsEas){
		return dao.obtenerIdsAltaBecadosEas(idsEas);
	}

	/**
	 * @param rrSeleccionado
	 * @return
	 */
	public List<PerfilEA> obtenerEAsParaReasignacionSegunZonaRR(PerfilRR rrSeleccionado) {
		return dao.obtenerEAsParaReasignacionSegunZonaRR(rrSeleccionado);
	}

	public List<PerfilEA> obtenerTodos(boolean activos) {
		return dao.obtenerTodos(activos);
	}

	public List<PerfilEA> obtenerEasConBecadosAsignadosYRR() {
		return dao.obtenerEasConBecadosAsignadosYRR();
	}
	
	/**
	 * Obtener e as por zona.
	 *
	 * @param zona the zona
	 * @return the list
	 * @since 26-abr-2011
	 * @author cfigueroa
	 * @param cantidadMax 
	 */
	public List<PerfilEA> obtenerEasPorNombreYZona(ZonaCimientos  zona,String texto, int cantidadMax){
		return dao.obtenerEasPorNombreYZona(zona,texto,cantidadMax);
	}
	/**
	 * @param rr
	 * @param texto
	 * @return
	 */
	public List<PerfilEA> obtenerEAsPorNombreYRR(PerfilRR rr, String texto) {
		return dao.obtenerEAsPorNombreYRR(rr, texto);
	}

	
	public List<PerfilEA> obtenerEAsPorNombre(String texto) {
		return dao.obtenerEAsPorNombre(texto);
	}

	/**
	 * Retorno todos los Ea, tanto los activos como los inactivos
	 * @param texto
	 * @return
	 */
	public List<PerfilEA> obtenerTodosEAsPorNombre(String texto) {
		return dao.obtenerTodosEAsPorNombre(texto);
	}
}
