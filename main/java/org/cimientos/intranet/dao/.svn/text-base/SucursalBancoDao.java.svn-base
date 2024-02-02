package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.sucursalBanco.SucursalBanco;

public interface SucursalBancoDao extends Dao<SucursalBanco>{
	

	public List<SucursalBanco> obtenerPorSucursales(List<String> barriosSucursales);

	public List<SucursalBanco> obtenerPorBancoExistente(Banco banco, List<String> sucursales);
	
	public SucursalBanco obtenerPorBarrio(String barrio);

	public SucursalBanco obtenerSucursalSiExiste(String direccion, String id);

	public SucursalBanco obtenerPorDireccion(String direccion);
	
	public List<SucursalBanco> obtenerSucursalesSinAsignar();

	/**
	 * @param idBanco
	 * @return
	 */
	public List<SucursalBanco> buscarSucursalesPorBanco(Long idBanco);

	/**
	 * Obtener sucursal por zona.
	 *
	 * @param idZona the id zona
	 * @return the list
	 * @since 28-ene-2011
	 * @author cfigueroa
	 */
	public List<SucursalBanco> obtenerSucursalPorZona(Long idZona);

	public Boolean comprobarExistencia(SucursalBanco sucursalBanco);


}

