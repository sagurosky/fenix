package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.NotaMateriaDao;
import org.cimientos.intranet.modelo.NotaMateria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author msagarduy
 * 
 */
@Service
@Transactional
public class NotaMateriaSrv {

	@Autowired
	private NotaMateriaDao dao;
	
	/**
	 * @param notaMateria
	 */
	public void agregarNotaMateria(NotaMateria notaMateria){
		dao.guardar(notaMateria);
		dao.flush();
	}
	
	/**
	 * @param notaMateria
	 */
	public void agregarTodasNotasMaterias(List<NotaMateria> notaMateria){
		dao.guardar(notaMateria);
		dao.flush();
	}
	
	/**
	 * @param notaMateria
	 */
	public void eliminarNotaMateria(NotaMateria notaMateria){
		dao.eliminar(notaMateria);
		dao.flush();
	}
	
	/**
	 * @param id
	 * @return
	 */
	public NotaMateria obtenerPorId(long id){
		return dao.obtener(id);
	}
	
	/**
	 * @return
	 */
	public List<NotaMateria> obtenerTodos(){
		return dao.obtenerTodos();
	}
	
	/**
	 * @param ids
	 * @return
	 */
	public List<NotaMateria> obtenerGrupo(List<Long> ids){
		return dao.obtenerGrupo("id", ids);
	}
}
