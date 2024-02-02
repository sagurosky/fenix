package org.cimientos.intranet.dao;

import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.informe.InformeCesacion;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;

public interface InformeCesacionDao extends Dao<InformeCesacion>
{
	public List<InformeCesacion> obtenerInformesConstruccion(CicloPrograma ciclo);
	
	public List<InformeCesacion> obtenerInformesSupervision(CicloPrograma ciclo);
	
	public List<InformeCesacion> obtenerInformesCorreccion(CicloPrograma ciclo);
	
	public List<InformeCesacion> obtenerInformesFinalizados(CicloPrograma ciclo);

	public List<InformeCesacion> obtenerInformesRevision(CicloPrograma ciclo);

	public List<Informe> obtenerRevisionPorEA(PerfilEA perfilEA,CicloPrograma ciclo);

	public List<Informe> obtenerSupervisionPorRR(PerfilRR perfilRR,CicloPrograma ciclo);

	public InformeCesacion obtenerInformeCesacionPorAlumno(Long idPerfilAlumno,	CicloPrograma cicloActual);
}
