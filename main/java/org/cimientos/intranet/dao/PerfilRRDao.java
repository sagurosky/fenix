/**
 * 
 */
package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

/**
 * @author nlopez
 *
 */
public interface PerfilRRDao extends Dao<PerfilRR>{

	boolean existeRRPorPersona(Persona persona);

	void initEas(PerfilRR perfilRR);

	/**
	 * 
	 */
	List<PerfilRR> obtenerEasConZona();

	/**
	 * @param zona
	 * @param texto
	 * @return
	 */
	List<PerfilRR> obtenerRRsPorNombreYZona(ZonaCimientos zona, String texto);

	List<PerfilRR> obtenerRRsPorNombre(String texto);
}
