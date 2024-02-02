package org.cimientos.intranet.dao;

import java.util.List;
import java.util.Map;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.dto.PanelControlSeleccionDTO;
import org.cimientos.intranet.modelo.Beca;

public interface PanelControlSeleccionDao extends Dao<PanelControlSeleccionDTO> {
	/**
	 * Este metodo trae las becas que estan en el ciclo actual,
	 * El query que arma solo mapea de beca las id y nombre  de Zona,Periodo,Ciclo,Beca
	 *
	 * @return the list
	 * @since 11-mar-2011
	 * @author cfigueroa
	 */
	public List<PanelControlSeleccionDTO> obtenerBecasActual();

	/**
	 * Obtener cantidad becados.
	 *
	 * @return the map
	 * @since 12-may-2011
	 * @author cfigueroa
	 */
	public Map<String, Long> cantidadBecadosPorZona();
	
	
	
}
