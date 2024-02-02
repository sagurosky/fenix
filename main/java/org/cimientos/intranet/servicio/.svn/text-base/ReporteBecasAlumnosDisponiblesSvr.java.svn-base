package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.BecaDao;
import org.cimientos.intranet.modelo.Beca;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author nlopez
 *
 */

@Service
@Transactional
public class ReporteBecasAlumnosDisponiblesSvr {

	@Autowired
	private BecaDao daoBeca;
	
	
	/**
	 * Obtener becas.
	 *
	 * @return the list
	 * @since 16-nov-2010
	 * @author nlopez
	 */
	public List<Beca> obtenerBecas(){
		return daoBeca.obtenerTodos();
	}

}
