package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.TrimestreDao;
import org.cimientos.intranet.modelo.Trimestre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TrimestreSrv {
	
	@Autowired
	private TrimestreDao dao;
	

	public void agregarTrimestre(Trimestre trimestre){
		dao.guardar(trimestre);
		dao.flush();
	}
	

	public void agregarTodosTrimestres(List<Trimestre> trimestres){
		dao.guardar(trimestres);
		dao.flush();
	}
	

	public void eliminarTrimestre(Trimestre trimestre){
		dao.eliminar(trimestre);
		dao.flush();
	}
	
	public Trimestre obtenerTrimestre(Long id){
		return dao.obtener(id);
	}
	
	public List<Trimestre> obtenerTodos(){
		return dao.obtenerTodos();
	}
	
	public List<Trimestre> obtenerGrupo(List<Long> ids){
		return dao.obtenerGrupo("id", ids);
	}
}
