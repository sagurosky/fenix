package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.PerfilRRDao;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author nlopez
 *
 */

@Service
@Transactional
public class PerfilRRSrv {

	@Autowired
	private PerfilRRDao dao;
	
	/**
	 * Persiste un PerfilRR en la base de datos.
	 * 
	 * @param perfilTs
	 */
	public void agregarPerfilRR( PerfilRR perfilRR ) {
		dao.guardar(perfilRR);
		dao.flush();
	}
	
	/**
	 * @param perfilesRR
	 */
	public void agregarPerfilesRR( List<PerfilRR> perfilesRR ) {
		dao.guardar(perfilesRR);
		dao.flush();
	}
	/**
	 * Persiste un PerfilRR modificado en la base de datos
	 * 
	 * @param perfilRR
	 */
	public void modificarPerfilRR( PerfilRR perfilRR ){
		dao.guardar(perfilRR);
		dao.flush();
	}
	
	/**
	 * Elimina un PerfilRR de la base de datos
	 * 
	 * @param perfilRR
	 */
	public void eliminarPerfilRR(PerfilRR perfilRR){
		dao.eliminar(perfilRR);
		dao.flush();
	}
	
	/**
	 * Recupera, si es que existe, el PerfilRR con id=id
	 * 
	 * @param id
	 * @return id
	 */
	
	public PerfilRR obtenerPerfilRR(long id){
		return dao.obtener(id);
	}
	
	/**
	 * Recupera en una lista todos los PerfilRR persistidos
	 * 
	 * de la base de datos
	 * 
	 * @return una Lista de PerfilRR que representa a todos los objetos persistidos.
	 */
	
	public List<PerfilRR> obtenerTodos(){
		return dao.obtenerTodos();
	}

	/**
	 * Asigna la lista de perfilesEa al perfilRR seleccionado
	 * 
	 * @param perfilrrSeleccionada
	 * @param perfilesEA
	 */
	public void asignarEARR(PerfilRR perfilrrSeleccionado,List<PerfilEA> perfilesEA) {
		for (PerfilEA perfilEA : perfilesEA) {
			//se agregaron estas validaciones porque no refrescaba la grilla con las cantidades 
			if(perfilEA.getRr() != null ){
				perfilEA.getRr().getEas().remove(perfilEA);
			}
			perfilEA.setRr(perfilrrSeleccionado);
			if(!perfilrrSeleccionado.getEas().contains(perfilEA)){
				perfilrrSeleccionado.getEas().add(perfilEA);
			}
		}
		dao.guardar(perfilrrSeleccionado);
		dao.flush();		
	}

	
	/**
	 * Chequea si existe un perfil RR para la persona pasada como parametro
	 * @param persona
	 * @return
	 */
	public boolean existeRRPorPersona(Persona persona) {
		return dao.existeRRPorPersona(persona);
	}

	/**
	 * @param perfilRR
	 */
	public void initEas(PerfilRR perfilRR) {
		dao.initEas(perfilRR);
	}
	
	public List<PerfilRR> obtenerEasConZona(){
		return dao.obtenerEasConZona();
	}

	/**
	 * @param zona
	 * @param texto
	 * @return
	 */
	public List<PerfilRR> obtenerRRsPorNombreYZona(ZonaCimientos zona,String texto) {
		return dao.obtenerRRsPorNombreYZona(zona, texto);
	}
	
	public List<PerfilRR> obtenerRRsPorNombre(String texto) {
		return dao.obtenerRRsPorNombre( texto);
	}
}
