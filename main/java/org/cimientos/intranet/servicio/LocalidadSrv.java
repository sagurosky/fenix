package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.dao.LocalidadDao;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.Provincia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * LocalidadSrv
 * 
 * @author msagarduy
 *
 */
@Service
@Transactional
public class LocalidadSrv {

	@Autowired
	private LocalidadDao dao;

	/**
	 * Persiste una localidad en la base de datos.
	 * 
	 * @param localidad
	 */
	public void agregarLocalidad(Localidad localidad) {
		dao.guardar(localidad);
		dao.flush();
	}

	/**
	 * Elimina una localidad de la base de datos.
	 * 
	 * @param localidad
	 */
	public void eliminarLocalidad(Localidad localidad) {
		dao.eliminar(localidad);
		dao.flush();
	}

	/**
	 * Recupera una localidad por id de la base de datos.
	 * 
	 * @param id
	 * @return localidad
	 */
	public Localidad obtenerLocalidad(long id) {
		return dao.obtener(id);
	}

	/**
	 * Recupera todas los localidades persistidas.
	 * 
	 * @return una Lista de localidades que representa a todos los objetos persistidos.
	 */
	public List<Localidad> obtenerTodos() {
		return dao.obtenerActivos();
	}
	
	public boolean obtenerPorNombre(String nombre){
		Localidad localidad = dao.obtenerPorNombre(nombre);
		return localidad != null;
	}
	
	/**
	 * Recupera la lista de las localidades en base a la lista de ids de localidades.
	 * @param localidadesIds
	 * @return la lista de localidades en base a los ids de las mismas
	 */
	public List<Localidad> obtenerGrupo(List<Long> localidadesIds){
		return dao.obtenerGrupo("id", localidadesIds);
	}
	
	/**
	 * Retorna true si existen localidades asociadas a una provincia y false en caso contrario
	 * @param nombresLocalidades
	 * @return 
	 */
	public boolean obtenerLocalidad(List<String> nombresLocalidades){
		List<Localidad> localidad = dao.obtenerPorLocalidades(nombresLocalidades);
	
		return localidad != null;
	}
	
	public List<String> obtenerNombresLocalidades(List<Long> localidadesIds){
		 List<Localidad> localidades = dao.obtenerGrupo("id", localidadesIds);
		 List<String> nombres = new ArrayList<String>();
		 for (Localidad localidad : localidades) {
			nombres.add(localidad.getNombre());
		}
		 return nombres;
	}
	
	/**
	 * Retorna true si existen localidades asociadas a la provincia existente y false en caso contrario
	 * @param provincia
	 * @param nombresLocalidades
	 * @return
	 */
	public boolean obtenerProvinciaConLocalidadExistente(Provincia provincia, List<String> nombresLocalidades){
		List<Localidad> localidad = dao.obtenerPorProvinciaExistente(provincia, nombresLocalidades);
		
		return localidad != null;
	}
	
	/**
	 * retorna true si existe y false en caso contrario
	 * @param nombre
	 * @param id
	 * @return
	 */
	public boolean buscarLocalidadPorNombre(String nombre, String id){
		Localidad localidadExiste =  dao.obtenerLocalidadSiExiste(nombre, id);
		return localidadExiste != null; 
	}
	
	public Localidad getLocalidadPorNombre(String nombre){
		return dao.obtenerPorNombre(nombre);
	}
	
	public List<Localidad> getPorNombreConAjax(String texto, int cantidadMax){
		return dao.buscarLocalidades(texto, cantidadMax);
	}

	public List<Localidad> obtenerLocalidadesSinZona() {
		return dao.obtenerLocalidadesSinZona();
	}
	
	public List<Localidad> obtenerLocalidadesSinProvincia() {
		return dao.obtenerLocalidadesSinProvincia();
	}
}