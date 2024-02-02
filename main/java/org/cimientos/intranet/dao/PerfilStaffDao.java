package org.cimientos.intranet.dao;

import java.util.List;
import java.util.Set;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfilstaff.PerfilStaff;
import org.cimientos.intranet.modelo.persona.Persona;
import org.displaytag.properties.SortOrderEnum;


public interface PerfilStaffDao extends Dao<PerfilStaff> {
	
	/**
	 * Chequea si existe un perfil Staff para la persona pasada como parametro
	 * @param persona
	 * @return
	 */
	boolean existeStaffPorPersona(Persona persona);

	/**
	 * @param ciclo
	 * @return
	 */
	int obtenerCantidadStaffAExportar(Banco banco);
	
	/**
	 * @return List<PerfilStaff>
	 */
	List<PerfilStaff> obtenerPerfilStaffPorNombre(String nombre);
	
	/**
	 * @return
	 */
	List<PerfilStaff> obtenerStaffSinNroCuenta(Banco banco);

	/**
	 * @param cuils
	 * @return
	 */
	List<PerfilStaff> obtenerStaffPorCuils(Set<String> cuils);

	/**
	 * @param cuil
	 * @return
	 */
	PerfilStaff obtenerPerfilStaffPorCuil(String cuil);

	/**
	 * @param banco
	 * @return
	 */
	List<PerfilStaff> obtenerStaffPorBanco(Banco banco, int firstResult, int maxResults,
            SortOrderEnum sortDirection, String sortCriterion);

	List<PerfilStaff> obtenerStaffFiltrados(Banco banco, String titular, String numCuenta, Integer idEstadoCuenta,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion);


	Integer obtenerCantidadStaffFiltradosAExportar(Banco banco, String titular, String numCuenta, Integer idEstadoCuenta);

}
