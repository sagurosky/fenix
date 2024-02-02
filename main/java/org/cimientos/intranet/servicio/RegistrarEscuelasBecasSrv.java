package org.cimientos.intranet.servicio;

import java.util.Collection;
import java.util.List;

import org.cimientos.intranet.dao.EscuelaDao;
import org.cimientos.intranet.dao.LocalidadDao;
import org.cimientos.intranet.dao.ProvinciaDao;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.Provincia;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cimientos.intranet.enumerativos.EstadoEscuela;
import com.googlecode.ehcache.annotations.Cacheable;

@Service
@Transactional
public class RegistrarEscuelasBecasSrv {
	
	@Autowired
	private EscuelaDao escuelaDao;
	
	@Autowired
	private LocalidadDao localidadDao;
		
	@Autowired
	private ProvinciaDao provinciaDao;
	
	/**
	 * Guardar escuela.
	 *
	 * @param escuela the escuela
	 * @since 17-nov-2010
	 * @author cfigueroa
	 */
	public void guardarEscuela(Escuela escuela){
		escuela.setActivo(true);
		escuelaDao.guardar(escuela);
		escuelaDao.flush();
	}
	
	
	
	/**
	 * Obtener localidades.
	 *
	 * @return the collection
	 * @since 18-nov-2010
	 * @author cfigueroa
	 */
	public Collection<Localidad> obtenerLocalidades(){
		return localidadDao.obtenerTodos();
	}
	
	/**
	 * Obtener provincias.
	 *
	 * @return the collection
	 * @since 18-nov-2010
	 * @author cfigueroa
	 */
	public Collection<Provincia> obtenerProvincias(){
		return provinciaDao.obtenerTodos();
	}
	
	/**
	 * Obtener todas escuelas.
	 *
	 * @return the list
	 * @since 18-nov-2010
	 * @author cfigueroa
	 */
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.escuela.Escuela")
	public List<Escuela> obtenerTodasEscuelas(){
		return escuelaDao.obtenerEscuelasActivas();
	}
	
	/**
	 * Obtener escuela por id.
	 *
	 * @param id the id
	 * @return the escuela
	 * @since 18-nov-2010
	 * @author cfigueroa
	 */
	public Escuela obtenerEscuelaPorId(Long id){
		return escuelaDao.obtener(id);
	}
	
	/**
	 * Obtener escuela por estado.
	 *
	 * @param estadoEscuela the estado escuela
	 * @return the list
	 * @since 25-nov-2010
	 * @author cfigueroa
	 */
	public List<Escuela> obtenerEscuelaPorEstado(EstadoEscuela estadoEscuela ){
		return escuelaDao.obtenerEscuelasPorEstado(estadoEscuela);
	}
	
	/**
	 * Eliminar escuela.
	 *
	 * @param escuela the escuela
	 * @since 06-dic-2010
	 * @author cfigueroa
	 */
	public void eliminarEscuela(Escuela escuela){
		 escuela.setActivo(false);
		 escuelaDao.guardar(escuela);		 
		 escuelaDao.flush();
	}

	/**
	 * Gets the por nombre con ajax.
	 *
	 * @param texto the texto
	 * @param cantidadMax the cantidad max
	 * @return the por nombre con ajax
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public List<Escuela> getPorNombreConAjax(String texto, int cantidadMax) {
		return escuelaDao.getPorNombreConAjax(texto, cantidadMax);
	}



	/**
	 * Gets the por e ay nombre.
	 *
	 * @param texto the texto
	 * @param cantidadMax the cantidad max
	 * @param ea the ea
	 * @return the por e ay nombre
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public List<Escuela> getPorEAyNombre(String texto, int cantidadMax,	PerfilEA ea) {
		return escuelaDao.getPorEAyNombre(texto, cantidadMax, ea);
	}
	
	/**
	 * Este metodo es para guardar la escuela para que quede un registro para entrevista seleccion
	 *
	 * @param escuela the escuela
	 * @since 17-feb-2011
	 * @author cfigueroa
	 */
	public void guardarEscuelaSeleccion(Escuela escuela){
		escuelaDao.guardarEscuelaSeleccion(escuela);
	} 
	
	/**
	 * Obtiene las escuelas por zona
	 * 
	 * @param zona
	 * @return
	 */
	public List<Escuela> obtenerEscuelasPorZona(ZonaCimientos zona){
		return escuelaDao.obtenerEscuelasPorZona(zona);
	}
}
