package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.perfil.AlumnoPanelEA;

public interface AlumnoPanelEADao extends Dao<AlumnoPanelEA>{

	List<AlumnoPanelEA> obtenerAlumnosPorEa(long idEa);

	void desactivarAlumnosCierreCiclo();
	
	void activarAlumnos(List<Long> becados);
	
	AlumnoPanelEA obtenerAlumnoPanelPorIdPerfilAlumno(long idAlumno);
	
	List<AlumnoPanelEA> obtenerAlumnosParaActivar(List<Long> becados);

	List<AlumnoPanelEA> obtenerPorIdPerfilAlumno(List<Long> list); 
	
	
	
}
