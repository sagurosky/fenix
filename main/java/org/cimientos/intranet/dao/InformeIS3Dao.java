package org.cimientos.intranet.dao;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.InformeIS3;

public interface InformeIS3Dao extends Dao<InformeIS3> {

	InformeIS3 obtenerInformePorAlumno(Long id, CicloPrograma cicloActual);
	
	public Boolean verSiAlumnoTieneIS3(Long idAlumno);
	
	InformeIS3 obtenerInformePorIdEntrevista(Long idEntrevista);

}
