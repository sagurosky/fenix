package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.PerfilVoluntarioDao;
import org.cimientos.intranet.execption.CimientosExceptionHandler;
import org.cimientos.intranet.modelo.perfilvoluntario.PerfilVoluntario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


/**
 * The Class PerfilVoluntarioSrv.
 * @author cfigueroa
 */
@Service
@Transactional
public class PerfilVoluntarioSrv {
	
	/** The dao. */
	@Autowired
	private PerfilVoluntarioDao perfilvoluntarioDao;
	
	
	/**
	 * Agregar voluntario.
	 *
	 * @param perfilVoluntario the voluntario
	 * @return the string
	 * @since 20-oct-2010
	 * @author cfigueroa
	 * @throws Exception 
	 */
	@Transactional(propagation= Propagation.REQUIRES_NEW)
	public void agregarVoluntario(PerfilVoluntario perfilVoluntario) throws CimientosExceptionHandler{
		perfilVoluntario.setActivo(true);
		perfilvoluntarioDao.guardar(perfilVoluntario);
		perfilvoluntarioDao.flush();
	}
	
	/**
	 * Obtener voluntarios.
	 *
	 * @return the list
	 * @since 22-oct-2010
	 * @author cfigueroa
	 */
	public List<PerfilVoluntario> obtenerVoluntarios(){
		List<PerfilVoluntario> list = perfilvoluntarioDao.obtenerTodos();
		return list;
	}
	
	/**
	 * Obtener voluntario.
	 *
	 * @param idVoluntario the id voluntario
	 * @return the voluntario
	 * @since 22-oct-2010
	 * @author cfigueroa
	 */
	public PerfilVoluntario obtenerVoluntario(Long idVoluntario){
		return perfilvoluntarioDao.obtener(idVoluntario);
	}
	
	/**
	 * Delete voluntario.
	 *
	 * @param PerfilVoluntario
	 * @since 22-oct-2010
	 * @author cfigueroa
	 */
	@Transactional(propagation= Propagation.REQUIRES_NEW)
	public void deleteVoluntario(PerfilVoluntario perfilVoluntario){
		perfilvoluntarioDao.eliminar(perfilVoluntario);
		perfilvoluntarioDao.flush();
	}
}
