/**
 * 
 */
package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.ConvocatoriaDao;
import org.cimientos.intranet.modelo.candidato.convocatoria.Convocatoria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author nlopez
 *
 */

@Service
@Transactional
public class ReporteConvocatoriaServ {
	
	@Autowired
	private ConvocatoriaDao dao;	
		
	public List<Convocatoria> obtenerConvocatorias(){
		return dao.obtenerTodos();
	}
}
