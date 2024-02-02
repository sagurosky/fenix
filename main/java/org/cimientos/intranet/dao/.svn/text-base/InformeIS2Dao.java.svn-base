package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.InformeIS2;


public interface InformeIS2Dao extends Dao<InformeIS2>{

	public List<InformeIS2> obtenerInformesConstruccion(CicloPrograma ciclo);
	
	public List<InformeIS2> obtenerInformesSupervision(CicloPrograma ciclo);
	
	public List<InformeIS2> obtenerInformesCorreccion(CicloPrograma ciclo);
	
	public List<InformeIS2> obtenerInformesFinalizados(CicloPrograma ciclo);

	public List<InformeIS2> obtenerInformesRevision(CicloPrograma ciclo);

	public InformeIS2 obtenerInformePorAlumno(Long idAlumno, CicloPrograma cicloActual);

	public Object obtenerTodosInformesPorEA(Long idEA, CicloPrograma cicloActual);
	
	public Boolean verSiAlumnoTieneIS2(Long idAlumno);
	
	public InformeIS2 obtenerInformeIS2(Long idAlumno, CicloPrograma ciclo);
}
