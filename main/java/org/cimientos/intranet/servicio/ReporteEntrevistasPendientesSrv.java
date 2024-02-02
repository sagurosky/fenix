package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.dao.BecaDao;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.reporteentrevistaspendientes.ReporteEntrevistasPendientesDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class ReporteEntrevistasPendientesSrv {

	/** The beca dao. */
	@Autowired
	private BecaDao becaDao;
	

	
	/**
	 * Obtener todos.
	 *
	 * @return the list
	 * @since 26-nov-2010
	 * @author nlopez
	 */
	public List<ReporteEntrevistasPendientesDTO> obtenerTodos(){
		List<Beca> list = becaDao.obtenerTodos();
		List<ReporteEntrevistasPendientesDTO> listReporte = new ArrayList<ReporteEntrevistasPendientesDTO>();
		ReporteEntrevistasPendientesDTO dto = null;
		for( Beca beca : list){
			dto = new ReporteEntrevistasPendientesDTO();
			dto.setBeca(beca);
			listReporte.add(dto);
		}
		return listReporte;
	}
}
