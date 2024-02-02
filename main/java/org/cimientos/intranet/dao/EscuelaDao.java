package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.escuela.EscuelaSeleccion;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

import com.cimientos.intranet.enumerativos.EstadoEscuela;

/**
 * The Interface EscuelaDao.
 */
public interface EscuelaDao extends Dao<Escuela> {
		
	/**
	 * Obtener escuelas por estado.
	 *
	 * @param estadoEscuela the estado escuela
	 * @return the list
	 * @since 25-nov-2010
	 * @author cfigueroa
	 */
	public List<Escuela> obtenerEscuelasPorEstado(EstadoEscuela estadoEscuela);

	/**
	 * @param texto
	 * @param cantidadMax
	 * @return
	 */
	public List<Escuela> getPorNombreConAjax(String texto, int cantidadMax);

	/**
	 * @return
	 */
	public List<Escuela> obtenerEscuelasActivas();

	/**
	 * @param texto
	 * @param cantidadMax
	 * @param idEA
	 * @return
	 */
	public List<Escuela> getPorEAyNombre(String texto, int cantidadMax,
			PerfilEA ea);
	

	/**
	 * @param escuela
	 */
	void guardarEscuelaSeleccion(EscuelaSeleccion escuela);

	/**
	 * @param escuela
	 */
	void guardarEscuelaSeleccion(Escuela escuela);
	
	/**
	 * @param zona
	 * @return
	 */
	public List<Escuela> obtenerEscuelasPorZona(ZonaCimientos zona);
}
