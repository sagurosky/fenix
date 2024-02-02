package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.MateriaDao;
import org.cimientos.intranet.modelo.Materia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author msagarduy
 * @param 
 */
@Service
@Transactional
public class MateriaSrv {

	@Autowired
	private MateriaDao dao;
	

	public void agregarMateria(Materia materia){
		dao.guardar(materia);
		dao.flush();
	}
	

	public void eliminarMateria(Materia materia){
		dao.eliminar(materia);
		dao.flush();
	}
	
	public Materia obtenerPorId(long id){
		return dao.obtener(id);
	}
	
	public List<Materia> obtenerTodos(){
		return dao.obtenerTodos();
	}
	
	public List<Materia> obtenerGrupo(List<Long> ids){
		return dao.obtenerGrupo("id", ids);
	}

	/**
	 * Obtiene las materias basicas si traerBasicas esta en true
	 * si no obtiene las materias que son no basicas
	 * @return
	 */
	public List<Materia> obtenerMateriasBasicas(boolean traerBasicas) {
		return dao.obtenerMateriasBasicas(traerBasicas);
	}
}
