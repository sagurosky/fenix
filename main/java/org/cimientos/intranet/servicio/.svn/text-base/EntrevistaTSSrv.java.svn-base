package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.EntrevistaTSDao;
import org.cimientos.intranet.modelo.entrevistaTS.EntrevistaTS;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EntrevistaTSSrv {

	@Autowired
	EntrevistaTSDao entrevistaTSDao;
	

	public void guardarEntrevista(EntrevistaTS entrevista){
		entrevistaTSDao.guardar(entrevista);
		entrevistaTSDao.flush();
	}
	
	public List<EntrevistaTS> listaEntrevistas(){
		return entrevistaTSDao.obtenerTodos();
	}
	
	public EntrevistaTS obtenerEntrevistaTS(Long id){
		return entrevistaTSDao.obtener(id);
	}
	

	public void eliminarEntrevistaTS(EntrevistaTS entrevista){
		entrevistaTSDao.eliminar(entrevista);
	}
	
	public List<EntrevistaTS> obtenerTodos(){
		return entrevistaTSDao.obtenerTodos();
	}
	
	public List<EntrevistaTS> obtenerPorTS(Long idTS){
		return entrevistaTSDao.obtenerPorTS(idTS);
	}
	public EntrevistaTS obtenerEntrevistaTSPorAlumno(Long idAlumno){
		return entrevistaTSDao.obtenerEntrevistaTSPorAlumno(idAlumno);
	}
	
	/**
	 * Obtner entrevista ts por ciclo.
	 *
	 * @param nombreCiclo the nombre ciclo
	 * @param perfilTS the perfil ts
	 * @return the list
	 * @since 05-abr-2011
	 * @author cfigueroa
	 */
	public List<EntrevistaTS> obtnerEntrevistaTSPorCiclo(String nombreCiclo, PerfilTS perfilTS){
		return entrevistaTSDao.obtnerEntrevistaTSPorCiclo(nombreCiclo, perfilTS);
	}
	
}
