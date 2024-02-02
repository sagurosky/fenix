/**
 * 
 */
package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.candidato.convocatoria.Convocatoria;
import org.cimientos.intranet.modelo.candidato.convocatoria.ConvocatoriaSeleccion;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

/**
 * The Interface ConvocatoriaDao.
 *
 * @author nlopez
 */
public interface ConvocatoriaDao extends Dao<Convocatoria> {

	List<Convocatoria> obtenerPorCiclo(CicloPrograma cicloActual);

	/**
	 * Guardar convocatoria seleccion.
	 *
	 * @param convocatoria the convocatoria
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public void guardarConvocatoriaSeleccion(Convocatoria convocatoria);

	/**
	 * Obtener convocatoria seleccion.
	 *
	 * @param id the id
	 * @return the convocatoria seleccion
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public ConvocatoriaSeleccion obtenerConvocatoriaSeleccion(Long id);

	/**
	 * Obtener convocatorias por zona.
	 *
	 * @param zona the zona
	 * @return the list
	 * @since 26-abr-2011
	 * @author cfigueroa
	 * @param cantidadMax 
	 * @param texto 
	 */
	public List<Convocatoria> obtenerConvocatoriasPorZonaYNombre(ZonaCimientos zona, String texto, int cantidadMax);
	
	public List<Convocatoria> obtenerConvocatoriasPorNombre(String texto, int cantidadMax);

	List<Convocatoria> obtenerConvocatoriasDisponibles();

	List<Convocatoria> obtenerConvocatoriasDisponiblesPorNombre(String texto);


	
}
