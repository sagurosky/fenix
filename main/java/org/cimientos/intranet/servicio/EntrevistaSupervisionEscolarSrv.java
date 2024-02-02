package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.EntrevistaSupervisionEscolarDao;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaSupervisionEscolar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EntrevistaSupervisionEscolarSrv {

	@Autowired
	EntrevistaSupervisionEscolarDao dao;

	/**
	 * Persiste un InformeSA en la base de datos.
	 * 
	 * @param InformeSA
	 */
	public void agregarEntrevistaSupervisionEscolar(EntrevistaSupervisionEscolar entrevistaSupervisionEscolar) {
		dao.guardar(entrevistaSupervisionEscolar);
		dao.flush();
	}

	public EntrevistaSupervisionEscolar obtenerEntrevistaSE(long id) {
		return dao.obtener(id);
	}
	
	/**
	 * Obtener todos.
	 *
	 * @return the list
	 * @since 01-feb-2011
	 * @author cfigueroa
	 */
	public List<EntrevistaSupervisionEscolar> obtenerTodos(){
		return dao.obtenerTodos();
	}

}
