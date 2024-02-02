package org.cimientos.intranet.dao;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.ComunicadoPendiente;
import org.cimientos.intranet.modelo.informe.InformeCesacion;

public interface ComunicadoPendienteDao extends Dao<ComunicadoPendiente>
{
	public ComunicadoPendiente obtenerComunicadoPendientePorAlumno(Long idPerfilAlumno,	CicloPrograma cicloActual);

}
