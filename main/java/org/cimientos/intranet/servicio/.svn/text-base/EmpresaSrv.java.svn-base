package org.cimientos.intranet.servicio;


import java.util.List;

import org.cimientos.intranet.dao.EmpresaDao;
import org.cimientos.intranet.modelo.empresa.Empresa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author plabaronnie
 * Clase utilizada para el manejo de la logica de negocios del objeto Empresa
 */
@Service
@Transactional
public class EmpresaSrv {


	@Autowired
	EmpresaDao dao;


	/**
	 * registra o actualiza un empresa
	 * 
	 * @param empresa
	 */
	public void guardarEmpresa(Empresa empresa) {
		dao.guardar(empresa);
		dao.flush();
	}
	
	/**
	 * elimina un empresa
	 * 
	 * @param empresa
	 */
	public void eliminarEmpresa(Empresa empresa){
		dao.eliminar(empresa);
		dao.flush();
	}
	
	
	/**
	 * retorna un empresa en base a su id
	 * 
	 * @param id
	 * @return el empresa encontrado por id
	 */
	public Empresa obtenerPorId(long id) {
		return dao.obtener(id);
	}
	
	
	/**
	 * retorna todos los empresas
	 * 
	 * @return la lista de todos los empresas persistidos
	 */
	public List<Empresa> obtenerTodos() {
		return dao.obtenerEmpresasActivos();
	}

	/**
	 * retorna el empresa que coincida con el nombre buscado
	 * 
	 * @param nombre
	 * 
	 * @return el empresa encontrado en la busqueda
	 */
	public Empresa buscarPorIgualNombre(String nombre){
		return dao.obtenerEmpresaPorIgualNombre(nombre);
	}
	
	/**
	 * retorna un empresa con igual nombre y que no tenga ese id
	 * 
	 * @param nombre
	 * @param id
	 * 
	 * @return retorna el empresa encontrado en la busqueda
	 */
	public Empresa buscarEmpresaPorNombre(String nombre, String id){
		return dao.obtenerEmpresa(nombre, id);
	}

	/**
	 * obtiene la lista de empresas activos
	 * 
	 * @return la lista de empresas activos persistidos en la bd
	 */
	public List<Empresa> obtenerActivos() {
		return dao.obtenerEmpresasActivos();
	}
	
	/**
	 * @param cuit
	 * @return
	 */
	public Empresa buscarPorCUIT(String cuit){
		return dao.buscarPorCUIT(cuit);
	}

	/**
	 * @param cuit
	 * @param id
	 * @return
	 */
	public Empresa buscarPorIgualCUIT(String cuit, Long id) {
		return dao.buscarPorIgualCUIT(cuit, id);
	}
} 
