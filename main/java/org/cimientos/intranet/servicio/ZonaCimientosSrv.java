package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.dao.LocalidadDao;
import org.cimientos.intranet.dao.ZonaCimientosDao;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author msagarduy
 *
 */
@Service
@Transactional
public class ZonaCimientosSrv {

	@Autowired
	private ZonaCimientosDao dao;
	
	@Autowired
	private LocalidadDao daoLocalidad;
	
	/**
	 * Persiste una Zona en la base de datos.
	 * 
	 * @param ZonaCimientos
	 */
	public void agregarZona(ZonaCimientos ZonaCimientos) {
		dao.guardar(ZonaCimientos);
		dao.flush();
	}

	/**
	 * Elimina una ZonaCimientos de la base de datos.
	 * 
	 * @param ZonaCimientos
	 */
	public void eliminarZonaCimientos(ZonaCimientos ZonaCimientos) {
		dao.eliminar(ZonaCimientos);
		dao.flush();
	}

	/**
	 * Recupera una ZonaCimientos por id de la base de datos.
	 * 
	 * @param id
	 * @return ZonaCimientos
	 */
	public ZonaCimientos obtenerZonaCimientos(long id) {
		return dao.obtener(id);
	}
	
	public boolean getZonaPorNombre(String nombre){
		return dao.obtenerPorNombre(nombre) != null;
	}

	/**
	 * Recupera todas los ZonaCimientoses persistidas.
	 * 
	 * @return una Lista de ZonaCimientoses que representa a todos los objetos persistidos.
	 */
	public List<ZonaCimientos> obtenerTodos() {
		return dao.obtenerActivos();
	}
	
	/**
	 * Retorna true si existen localidades asociadas a una provincia y false en caso contrario
	 * @param nombresLocalidades
	 * @return 
	 */
	public boolean obtenerLocalidad(List<String> nombresLocalidades){
		return daoLocalidad.obtenerPorLocalidadesZona(nombresLocalidades) != null;
	}
	
	public List<String> obtenerNombresLocalidades(List<Long> localidadesIds){
		 List<Localidad> localidades = daoLocalidad.obtenerGrupo("id", localidadesIds);
		 List<String> nombres = new ArrayList<String>();
		 for (Localidad localidad : localidades) {
			nombres.add(localidad.getNombre());
		}
		 return nombres;
	}
	
	/**
	 * Retorna true si existen localidades asociadas a la zona existente y false en caso contrario
	 * @param zona
	 * @param nombresLocalidades
	 * @return
	 */
	public boolean obtenerPorLocalidadExistente(ZonaCimientos zona, List<String> nombresLocalidades){
		return daoLocalidad.obtenerPorZonaExistente(zona, nombresLocalidades) != null;
	}
	
	public boolean buscarZonaPorNombre(String nombre, String id){
		return dao.obtenerZonaSiExiste(nombre, id) != null;
	}

	public List<ZonaCimientos> obtenerPorIds(List<Long> zonasCimientos) {
		return dao.obtenerGrupo("id", zonasCimientos);
	}

	public List<ZonaCimientos> getPorNombreConAjax(String texto) {
		return dao.buscarLocalidades(texto);
	}

	public List<Escuela> getEscuelasZonaConAjax(long idZona, String texto) {
		return dao.buscarEscuelasZona(idZona, texto);
	}

	public List<ZonaCimientos> getTodasPorNombreConAjax(String texto) {
		return dao.buscarTodasLocalidades(texto);
	}
	
}
