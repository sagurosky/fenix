package org.cimientos.intranet.dao;

import java.util.List;
import java.util.Set;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.displaytag.properties.SortOrderEnum;


/**
 * @author msagarduy
 *
 */
public interface ResponsableDao extends Dao<ResponsableAdulto>{

	public List<ResponsableAdulto> obtenerResponsablesFiltrados(Banco banco, String becado,String titular,String numCuenta, Long zonaId,String rr, Long idRr, Integer idEstadoCuenta, Integer dniRA,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion);
	
	
	int obtenerCantidadResponsablesFiltradosAExportar(Banco Banco, String becado,String titular, String numCuenta, Long zonaId,String rr, Long idRr, Integer idEstadoCuenta, Integer dniRA);
	
	/**
	 * @param nombre
	 * @param id
	 * @return
	 */
	public ResponsableAdulto obtenerResponsablePorNombre(String nombre, String id);

	/**
	 * @param nombre
	 * @return
	 */
	public List<ResponsableAdulto> obtenerResponsablesPorNombreSimilar(String nombre);

	/**
	 * @param nombre
	 * @return
	 */	
	public List<ResponsableAdulto> obtenerResponsablesPorTitularSimilar(String titularCuenta);

	/**
	 * @param nombre
	 * @return
	 */
	public ResponsableAdulto obtenerResponsablePorIgualNombre(String nombre);

	/**
	 * @param banco 
	 * @return
	 */
	public List<ResponsableAdulto> obtenerResponsablesSinNroCuenta(Banco banco, boolean traerCuentasMenosIndustrial);

	/**
	 * @param cuils
	 * @return
	 */
	public List<ResponsableAdulto> obtenerResponsablesPorCuils(Set<String> cuils);

	/**
	 * @param cuil
	 * @return
	 */
	public ResponsableAdulto obtenerResponsablePorCuil(String cuil);

	/**
	 * @param banco
	 * @return
	 */
	public List<ResponsableAdulto> obtenerResponsablesPorBanco(Banco banco, int firstResult, int maxResults,
            SortOrderEnum sortDirection, String sortCriterion);


	public ResponsableAdulto obtenerPorPerfilAlumno(PerfilAlumno perfilAlumno);

	/**
	 * Chequea si ya existe el numero de cuenta creada
	 * @param nroCuenta
	 * @return
	 */
	public boolean existeNumeroCuenta(String nroCuenta);


	public int obtenerCantidadCuentasInactivas(Banco bancoSeleccionado, String becado, String titular, String numCuenta, Integer dniRA, Long zonaId);


	public List<ResponsableAdulto> obtenerCuentasInactivas(Banco bancoSeleccionado,String becado, String titular, String numCuenta, Integer dniRA, Long zonaId,
			int firstResult, int maxResults, SortOrderEnum sortDirection,String sortCriterion);	

}
