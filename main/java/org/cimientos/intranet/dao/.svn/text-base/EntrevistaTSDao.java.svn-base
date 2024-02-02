package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.entrevistaTS.EntrevistaTS;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;

public interface EntrevistaTSDao extends Dao<EntrevistaTS>{

	public List<EntrevistaTS> obtenerPorTS(Long idTS);

	/**
	 * Obtener entrevista ts por alumno.
	 *
	 * @param idAlumno the id alumno
	 * @return the entrevista ts
	 * @since 04-abr-2011
	 * @author cfigueroa
	 */
	public EntrevistaTS obtenerEntrevistaTSPorAlumno(Long idAlumno);
	
	/**
	 * Obtner entrevista ts por ciclo.
	 *
	 * @param nombreCiclo the nombre ciclo
	 * @return the entrevista ts
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public List<EntrevistaTS> obtnerEntrevistaTSPorCiclo(String nombreCiclo,PerfilTS perfilTS);
	
}
