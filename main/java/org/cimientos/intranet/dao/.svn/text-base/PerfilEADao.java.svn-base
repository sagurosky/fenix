/**
 * 
 */
package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;

/**
 * @author nlopez
 *
 */
public interface PerfilEADao extends Dao<PerfilEA>{

	/**
	 * @return
	 */
	List<PerfilEA> obtenerEAsSinAsignacionRR();

	List<Long> obtenerIdsBecadosEas(List<Long> idsEas);
	
	List<Long> obtenerIdsAltaBecadosEas(List<Long> idsEas);

	/**
	 * @return
	 */
	List<PerfilEA> obtenerEasConRRAsignado();

	/**
	 * Obtiene la lista de eas con becados asignados
	 * 
	 * @return la lista de eas
	 */
	List<PerfilEA> obtenerEasConBecadosAsignados();

	
	/**
	 * Chequea si existe un perfil EA para la persona pasada como parametro
	 * @param persona
	 * @return
	 */
	boolean existeEAPorPersona(Persona persona);

	/**
	 * @param rrSeleccionado
	 * @return
	 */
	List<PerfilEA> obtenerEAsSegunZonaRR(PerfilRR rrSeleccionado);

	/**
	 * @param rrSeleccionado
	 * @return
	 */
	List<PerfilEA> obtenerEAsParaReasignacionSegunZonaRR(PerfilRR rrSeleccionado);

	/**
	 * @param activos
	 * @return lista de perfiles EA activos
	 */
	List<PerfilEA> obtenerTodos(boolean activos);

	List<PerfilEA> obtenerEasConBecadosAsignadosYRR();

	/**
	 * Obtener eas por zona.
	 *
	 * @param zona the zona
	 * @return the list
	 * @since 26-abr-2011
	 * @author cfigueroa
	 * @param cantidadMax 
	 */
	public List<PerfilEA> obtenerEasPorNombreYZona(ZonaCimientos zona,String texto, int cantidadMax);

	/**
	 * @param rr
	 * @param texto
	 * @return
	 */
	List<PerfilEA> obtenerEAsPorNombreYRR(PerfilRR rr, String texto);
	
	List<PerfilEA> obtenerEAsPorNombre(String texto);

	List<PerfilEA> obtenerTodosEAsPorNombre(String texto);

}
