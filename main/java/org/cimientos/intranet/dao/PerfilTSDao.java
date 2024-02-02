package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.cimientos.intranet.modelo.persona.Persona;

/**
 * PerfilTSDao
 * @author Nicolas Lopez
 *
 */
public interface PerfilTSDao extends Dao<PerfilTS>{

	/**
	 * Chequea si existe un perfil TS para la persona pasada como parametro
	 * @param persona
	 * @return
	 */
	boolean existeTSPorPersona(Persona persona);

	/**
	 * Obtener ts por nombre.
	 *
	 * @param texto the texto
	 * @param maxResults the max results
	 * @return the list
	 * @since 04-may-2011
	 * @author cfigueroa
	 */
	List<PerfilTS> obtenerTSPorNombre(String texto, int maxResults);

}
