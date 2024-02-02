package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.escuela.EscuelaSeleccion;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

/**
 * The Interface EscuelaSeleccionDAO.
 */
public interface EscuelaSeleccionDAO extends Dao<EscuelaSeleccion> {
	
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
	List<EscuelaSeleccion> obtenerEscuelaPornombreYZona(String texto, int maxResults,
			ZonaCimientos zona);
}
