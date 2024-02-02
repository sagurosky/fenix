package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.PerfilPadrinoDao;
import org.cimientos.intranet.modelo.perfilPadrino.PerfilPadrino;
import org.displaytag.properties.SortOrderEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author plabaronnie
 * Clase utilizada para el manejo de la logica de negocios del objeto Padrino
 */
@Service
@Transactional
public class PerfilPadrinoSvr {

	@Autowired
	PerfilPadrinoDao dao;


	/**
	 * registra o actualiza un padrino
	 * 
	 * @param padrino
	 */
	public void guardarPadrino(PerfilPadrino padrino) {
		dao.guardar(padrino);
		dao.flush();
	}
	
	/**
	 * elimina un padrino
	 * 
	 * @param padrino
	 */
	public void eliminarPadrino(PerfilPadrino padrino){
		dao.eliminar(padrino);
		dao.flush();
	}
	
	
	/**
	 * retorna un padrino en base a su id
	 * 
	 * @param id
	 * @return el padrino encontrado por id
	 */
	public PerfilPadrino obtenerPorId(long id) {
		return dao.obtener(id);
	}
	
	
	/**
	 * retorna todos los padrinos
	 * 
	 * @return la lista de todos los padrinos persistidos
	 */
	public List<PerfilPadrino> obtenerTodos() {
		return dao.obtenerPadrinosActivos();
	}

	/**
	 * retorna el padrino que coincida con el nombre buscado
	 * 
	 * @param nombre
	 * 
	 * @return el padrino encontrado en la busqueda
	 */
	public PerfilPadrino buscarPorIgualNombre(String nombre){
		return dao.obtenerPadrinoPorIgualNombre(nombre);
	}
	
	/**
	 * retorna un padrino con igual nombre y que no tenga ese id
	 * 
	 * @param nombre
	 * @param id
	 * 
	 * @return retorna el padrino encontrado en la busqueda
	 */
	public PerfilPadrino buscarPadrinoPorNombre(String nombre, String id){
		return dao.obtenerPadrino(nombre, id);
	}

	/**
	 * obtiene la lista de padrinos activos
	 * 
	 * @return la lista de padrinos activos persistidos en la bd
	 */
	public List<PerfilPadrino> obtenerActivos() {
		return dao.obtenerPadrinosActivos();
	}

	/**
	 * retorna el padrino que coincida con el cuit buscado
	 * 
	 * @param cuit_cuil el cuit del padrino
	 * @return retorna el padrino encontrado en la busqueda
	 */
	public PerfilPadrino buscarPorIgualCUIT(String cuit_cuil, Long id) {
		return dao.buscarPorIgualCUIT(cuit_cuil, id);
	}
	
	/**
	 * retorna el padrino que coincida con el cuil buscado
	 * 
	 * @param cuit_cuil el cuil del padrino
	 * @return retorna el padrino encontrado en la busqueda
	 */
	public PerfilPadrino buscarPorIgualCUIL(String cuit_cuil, Long id) {
		return dao.buscarPorIgualCUIL(cuit_cuil, id);
	}
	
	/**
	 * retorna el padrino que coincida con el cuit buscado
	 * 
	 * @param cuit_cuil el cuit del padrino
	 * @return {@link Padrino} objeto padrino
	 */
	public PerfilPadrino buscarPorCUIT(String cuit_cuil){
		return dao.buscarPorCUIT(cuit_cuil);
	}

	/**
	 * retorna el padrino que coincide con el nombre o la denominacion
	 * @param texto
	 * @param cantidadMax
	 * @return
	 */
	public List<PerfilPadrino> buscarPorNombreDenominacion(String texto,int cantidadMax) {
		return dao.buscarPorNombreDenominacion(texto, cantidadMax);
	}

	/**
	 * @param idTipo
	 * @param cuitCuil
	 * @param padrinoId
	 * @return
	 */
	public int obtenerCantidadPadrinosAExportar(Integer idTipo,String cuitCuil, Long padrinoId) {
		return dao.obtenerCantidadPadrinosAExportar(idTipo,	cuitCuil, padrinoId);
	}

	/**
	 * @param idTipo
	 * @param cuitCuil
	 * @param padrinoId
	 * @param i
	 * @param totalRows
	 * @param sortDirection
	 * @param sortCriterion
	 * @return
	 */
	public List<PerfilPadrino> obtenerPadrinosAExportar(Integer idTipo,
			String cuitCuil, Long padrinoId, int pagesize, int totalRows,
			SortOrderEnum sortDirection, String sortCriterion) {
		return dao.obtenerPadrinosAExportar(idTipo,cuitCuil, padrinoId,  pagesize,  totalRows,
				sortDirection, sortCriterion);
	}

	/**
	 * Retorna todos los padrinos,tanto los activos como los inactivos
	 * @param texto
	 * @param cantidadMax
	 * @return
	 */
	public List<PerfilPadrino> buscarTodosPorNombreDenominacion(String texto,int cantidadMax) {
		return dao.buscarTodosPorNombreDenominacion(texto, cantidadMax);
	}
	
}
