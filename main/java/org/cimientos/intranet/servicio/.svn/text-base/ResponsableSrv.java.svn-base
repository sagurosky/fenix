package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.ResponsableDao;
import org.cimientos.intranet.modelo.ResponsableAdulto;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.displaytag.properties.SortOrderEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author msagarduy
 *
 */
@Service
@Transactional
public class ResponsableSrv {

	@Autowired
	private ResponsableDao dao;
	
	
	/**
	 * @param responsable
	 */
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public void agregarResponsable(ResponsableAdulto responsable){
		dao.guardar(responsable);
		dao.flush();
	}
	
	/**
	 * @param responsable
	 */
	public void eliminarResponsable(ResponsableAdulto responsable){
		dao.eliminar(responsable);
		dao.flush();
	}
	
	/**
	 * @param id
	 * @return
	 */
	public ResponsableAdulto obtenerPorId(long id){
		return dao.obtener(id);
	}
	
	/**
	 * @return
	 */
	public List<ResponsableAdulto> obtenerTodos(){
		return dao.obtenerTodos();
	}
	
	/**
	 * @param idProperty
	 * @param ids
	 * @return
	 */
	public List<ResponsableAdulto> obtenerGrupo(String idProperty, List<Long> ids){
		return dao.obtenerGrupo(idProperty, ids);
	}
	
	
	/**
	 * @param id
	 * @param nombre
	 * @return
	 */
	public boolean obtenerPorNombreId(String id, String nombre){
		return dao.obtenerResponsablePorNombre(nombre, id) != null;
	}
	
	/**
	 * @param nombre
	 * @return
	 */
	public boolean obtenerPorIgualNombre(String nombre){
		return dao.obtenerResponsablePorIgualNombre(nombre) != null;
	}

	/**
	 * @param cuil
	 * @return
	 */
	public ResponsableAdulto obtenerResponsablePorCuil(String cuil) {
		return dao.obtenerResponsablePorCuil(cuil);
	}
	
	/**
	 * @param perfilAlumno
	 * @return
	 */
	public ResponsableAdulto obtenerPorPerfilAlumno(PerfilAlumno perfilAlumno) {
		return dao.obtenerPorPerfilAlumno(perfilAlumno);
	}

	/**
	 * Chequea si ya existe el numero de cuenta creada
	 * @param nroCuenta
	 * @return
	 */
	public boolean existeNumeroCuenta(String nroCuenta) {
		return dao.existeNumeroCuenta(nroCuenta);
	}

	public int obtenerCantidadCuentasInactivas(Banco bancoSeleccionado,	String becado, String titular, String numCuenta, Integer dniRA, Long zonaId) {
		return dao.obtenerCantidadCuentasInactivas(bancoSeleccionado,becado,titular,numCuenta, dniRA, zonaId);
	}

	public List<ResponsableAdulto> obtenerCuentasInactivas(Banco bancoSeleccionado, String becado, String titular, String numCuenta, Integer dniRA, Long zonaId,
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {
		return dao.obtenerCuentasInactivas(bancoSeleccionado,becado,titular,numCuenta,dniRA, zonaId,firstResult, maxResults,sortDirection,sortCriterion);
	}
	

}
