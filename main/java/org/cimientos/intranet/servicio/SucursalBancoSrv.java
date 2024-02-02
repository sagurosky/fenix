package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.dao.SucursalBancoDao;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.sucursalBanco.SucursalBanco;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SucursalBancoSrv  {
	
	@Autowired
	private SucursalBancoDao dao;
	
	/**
	 * Persiste un SucursalBanco en la base de datos.
	 * 
	 * @param SucursalBanco
	 */
	public void agregarSucursalBanco(SucursalBanco sucursalBanco) {
		dao.guardar(sucursalBanco);
		dao.flush();
	}

	/**
	 * Elimina un SucursalBanco de la base de datos.
	 * 
	 * @param SucursalBanco
	 */
	public void eliminarSucursalBanco(SucursalBanco sucursalBanco) {
		dao.eliminar(sucursalBanco);
		dao.flush();
	}

	/**
	 * Recupera un SucursalBanco por id de la base de datos.
	 * 
	 * @param id
	 * @return SucursalBanco
	 */
	public SucursalBanco obtenerSucursalBanco(long id) {
		return dao.obtener(id);
	}
	
	
	public boolean obtenerPorDireccion(String direccion){
		return dao.obtenerPorDireccion(direccion) != null;
	}

	/**
	 * Recupera todos los SucursalBanco persistidos.
	 * 
	 * @return una Lista de SucursalBanco que representa a todos los objetos persistidos.
	 */
	public List<SucursalBanco> obtenerTodos() {
		return dao.obtenerTodos();
	}

	public List<SucursalBanco> obtenerGrupo(List<Long> sucursalesIds){
		return dao.obtenerGrupo("id", sucursalesIds);
	}

	
	public boolean obtenerSucursalConBanco(List<String> direccionSucursales){
		return dao.obtenerPorSucursales(direccionSucursales) != null;
	}
	
	
	public List<String> obtenerBarriosSucursales(List<Long> sucursalesIds)
	{
		 List<String> barrios = new ArrayList<String>();
		 
		 return barrios;
	}
	

	public boolean obtenerSucursalConBancoExistente(Banco banco, List<String> barriosSucursales){
		return dao.obtenerPorBancoExistente(banco, barriosSucursales) != null;
	}
	
	/**
	 * retorna true si existe y false en caso contrario
	 * @param nombre
	 * @param id
	 * @return
	 */
	public boolean buscarSucursalesPorDireccion(String direccion, String id)	{
		return  dao.obtenerSucursalSiExiste(direccion, id) != null; 
	}
	
	public List<SucursalBanco> obtenerSucursalesSinAsignar(){		
		return dao.obtenerSucursalesSinAsignar();
	}

	/**
	 * @param idBanco
	 * @return
	 */
	public List<SucursalBanco> buscarSucursalesPorBanco(Long idBanco) {
		return dao.buscarSucursalesPorBanco(idBanco);
	}
	
	/**
	 * Obtener sucursal por zona.
	 *
	 * @param idZona the id zona
	 * @return the list
	 * @since 28-ene-2011
	 * @author cfigueroa
	 */
	public List<SucursalBanco> obtenerSucursalPorZona(Long idZona){
		return dao.obtenerSucursalPorZona(idZona);
	}

	public Boolean comprobarExistencia(SucursalBanco sucursalBanco) {
		return dao.comprobarExistencia(sucursalBanco);
	}

}
