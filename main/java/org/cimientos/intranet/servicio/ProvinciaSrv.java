package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.ProvinciaDao;
import org.cimientos.intranet.modelo.ubicacion.Provincia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author msagarduy
 * 
 */
@Service
@Transactional
public class ProvinciaSrv {
	
	@Autowired
	private ProvinciaDao dao;
	

	public List<Provincia> obtenerTodas(){
		return dao.obtenerTodos();
	}
	
	/**
	 * Persiste una provincia en la base de datos.
	 * 
	 * @param provincia
	 */
	public void guardarProvincia(Provincia provincia){
		dao.guardar(provincia);
		dao.flush();
	}
	
	/**
	 * Elimina una provincia de la base de datos.
	 * 
	 * @param provincia
	 */
	public void eliminarProvincia(Provincia provincia){
		dao.eliminar(provincia);
		dao.flush();
	}
	
	/**
	 * Recupera una provincia por id de la base de datos.
	 * 
	 * @param id
	 * @return {@link Provincia}
	 */
	public Provincia obtenerPorId(long id){
		return dao.obtener(id);
	}
	
	/**
	 * @param descripcion
	 * @return
	 */
	public boolean obtenerPorDescripcion(String descripcion){
		Provincia provincia = dao.obtenerPorDescripcion(descripcion);
		return provincia != null;
	}
	
	/**
	 * retorna true si existe y false en caso contrario
	 * @param descripcion
	 * @param id
	 * @return
	 */
	public boolean buscarProvinciaPorDescripcion(String descripcion, String id){
		Provincia provinciaExiste =  dao.obtenerProvinciaSiExiste(descripcion, id);
		return provinciaExiste != null; 
	}

	public List<Provincia> obtenerProvinciasTexto(String texto) {
		return dao.obtenerProvinciasTexto(texto);
	}
}

