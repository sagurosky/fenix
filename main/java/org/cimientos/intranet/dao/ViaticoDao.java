/**
 * 
 */
package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.viatico.Viatico;

/**
 * The Interface ViaticoDao.
 *
 * @author nlopez
 */
public interface ViaticoDao extends Dao<Viatico>{

	public List<Viatico> obtenerViaticosPorEA(PerfilEA perfilEA);
	
	public List<Viatico> obtenerViaticosPorRR(PerfilRR perfilRR);
}
