package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.PerfilTSDao;
import org.cimientos.intranet.dao.ZonaCimientosDao;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * PerfilTsSrv
 * @author Nicolas Lopez
 *
 */

@Service
@Transactional
public class PerfilTSSrv {

	@Autowired
	private PerfilTSDao dao;
	
	@Autowired
	private ZonaCimientosDao zonaCimientosDao;
	
	/**
	 * Persiste un PerfilTS en la base de datos.
	 * 
	 * @param perfilTs
	 */
	public void agregarPerfilTS(PerfilTS perfilTS){
		dao.guardar(perfilTS);
		dao.flush();
	}
	
	/**
	 * Persiste un PerfilTS modificado en la base de datos
	 * 
	 * @param perfilTs
	 */
	public void modificarPerfilTS(PerfilTS perfilTS){
		dao.guardar(perfilTS);
		dao.flush();
	}
	
	/**
	 * Elimina un PerfilTS de la base de datos
	 * 
	 * @param perfilTs
	 */
	public void eliminarPerfilTS(PerfilTS perfilTS){
		dao.eliminar(perfilTS);
		dao.flush();
	}
	
	/**
	 * Recupera, si es que existe, el PerfilTS con id=id
	 * 
	 * @param id
	 * @return id
	 */
	public PerfilTS obtenerPerfilTS(long id){
		return dao.obtener(id);
	}
	
	
	/**
	 * Obtener zona cimientos.
	 *
	 * @return the list
	 * @since 19-nov-2010
	 * @author cfigueroa
	 */
	public List<ZonaCimientos> obtenerZonaCimientos(){
		return zonaCimientosDao.obtenerTodos();
	}
	
	
	
	/**
	 * Recupera en una lista todos los PerfilTS persistidos
	 * 
	 * de la base de datos
	 * 
	 * @return una Lista de PerfilTS que representa a todos los objetos persistidos.
	 */
	public List<PerfilTS> obtenerTodos(){
		return dao.obtenerTodos();
	}

	/**
	 * Chequea si existe un perfil TS para la persona pasada como parametro
	 * @param persona
	 * @return
	 */
	public boolean existeTSPorPersona(Persona persona) {
		return dao.existeTSPorPersona(persona);
	}

	public List<PerfilTS> obtenerTSPorNombre(String texto, int maxResults) {
		return dao.obtenerTSPorNombre(texto, maxResults);
	}
	
		
}
