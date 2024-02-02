package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.informe.InformeIS1;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;

public interface InformeIS1Dao extends Dao<InformeIS1>
{
	public List<InformeIS1> obtenerInformesRevision(CicloPrograma ciclo);
	
	public List<InformeIS1> obtenerInformesSupervisor(CicloPrograma ciclo);
	
	public List<InformeIS1> obtenerInformesCorreccion(CicloPrograma ciclo);
	
	public List<InformeIS1> obtenerInformesFinalizados(CicloPrograma ciclo);
	
	public List<InformeIS1> obtenerInformesAEnviar(CicloPrograma ciclo);

	public List<Informe> obtenerRevisionPorEA(CicloPrograma ciclo,PerfilEA perfilEA);
	
	public List<Informe> obtenerSupervisorPorRR(CicloPrograma ciclo,PerfilRR perfilRR);

	public InformeIS1 obtenerInformePorAlumno(Long idAlumno,CicloPrograma cicloActual);
	
	public Boolean verSiAlumnoTieneIS1(Long idAlumno);

}
