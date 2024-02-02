package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.SupervisorEscolarDao;
import org.cimientos.intranet.modelo.supervisorescolar.SupervisorEscolar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author nlopez
 *
 */

@Service
@Transactional
public class SupervisorEscolarSrv {

	@Autowired
	private SupervisorEscolarDao dao;
	

	public void agregarSupervisorEscolar( SupervisorEscolar supervisorEscolar ){
		supervisorEscolar.setActivo(true);
		dao.guardar(supervisorEscolar);
		dao.flush();
	}
	
	/**
	 * Recupera en una lista todos los Registros Consultas SE persistidos
	 * 
	 * de la base de datos.
	 *
	 * @return una Lista de los Registros Consultas SE que representa a todos 
	 * los objetos persistidos.
	 * @since 04-nov-2010
	 * @author nlopez
	 */
	
	public List<SupervisorEscolar> obtenerTodos(){
		return dao.obtenerTodos();
	}
	
	public SupervisorEscolar obtenerPorId(long id){
		return dao.obtener(id);
	}
	
	/**
	 * El eliminado es un borrado logico, se pone a false el campo activo
	 *
	 * @param supervisorEscolar the supervisor escolar
	 * @since 01-feb-2011
	 * @author cfigueroa
	 */
	public void eliminar(SupervisorEscolar supervisorEscolar){
		supervisorEscolar.setActivo(false);
		dao.guardar(supervisorEscolar);
	}
}
