package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.EscuelaSeleccionDAO;
import org.cimientos.intranet.modelo.escuela.EscuelaSeleccion;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional
public class EscuelaSeleccionSrv {
	@Autowired
	private EscuelaSeleccionDAO escuelaSeleccionDAO;
	
	/**
	 * Obtener escuela por id.
	 *
	 * @param id the id
	 * @return the escuela seleccion
	 * @since 29-abr-2011
	 * @author cfigueroa
	 */
	public EscuelaSeleccion obtenerEscuelaPorId(Long id){
		return escuelaSeleccionDAO.obtener(id);
	} 
	
	/**
	 * Obtener escuela pornombre y zona.
	 *
	 * @param texto the texto
	 * @param zona the zona
	 * @param maxResults the max results
	 * @return the list
	 * @since 29-abr-2011
	 * @author cfigueroa
	 */
	public List<EscuelaSeleccion> obtenerEscuelaPornombreYZona(String texto, int maxResults,
			ZonaCimientos zona){
		return escuelaSeleccionDAO.obtenerEscuelaPornombreYZona(texto,maxResults,zona);
	}
}
