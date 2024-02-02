package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.EscuelaDao;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EscuelaSrv {

	@Autowired
	private EscuelaDao escuelaDao;

	public List<Escuela> getPorNombreConAjax(String texto) {
		return escuelaDao.getPorNombreConAjax(texto, 30);
	}
	/**
	 * Obtener escuela por id.
	 *
	 * @param id the id
	 * @return the escuela
	 * @since 18-nov-2010
	 * @author cfigueroa
	 */
	public Escuela obtenerEscuelaPorId(Long id){
		return escuelaDao.obtener(id);
	}
	
	/**
	 * Obtener todos.
	 *
	 * @return the list
	 * @since 01-feb-2011
	 * @author cfigueroa
	 */
	public List<Escuela> obtenerTodos(){
		return escuelaDao.obtenerTodos();
	}

}
