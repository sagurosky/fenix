/**
 * 
 */
package org.cimientos.intranet.dao;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;

/**
 * @author msagarduy
 * 
 */
public interface BoletinDao extends Dao<Boletin>{

	/**
	 * @param alumno
	 * @return
	 */
	Boletin obtenerBoletinCicloAnterior(PerfilAlumno alumno);

	/**
	 * @param alumno, ciclo
	 * @return 
	 */
	Boletin obtenerBoletinCicloInforme(PerfilAlumno alumno, CicloPrograma ciclo);

}
