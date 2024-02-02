package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.AlumnoDao;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * The Class SeleccionarCandidatosBecasSrv.
 */
@Service
@Transactional
public class SeleccionarCandidatosBecasSrv {
	
	@Autowired
	private AlumnoDao alumnoDao;
	
	
	/**
	 * Obtener candidatos disponibles.
	 *
	 * @param estadosAlumnos the estados alumnos
	 * @return the list
	 * @since 16-nov-2010
	 * @author cfigueroa
	 */
	public List<PerfilAlumno> obtenerCandidatosDisponibles(List<EstadoAlumno> estadosAlumnos){
		return alumnoDao.obtenerAlumnosPorEstado(estadosAlumnos);
	}
	
	/**
	 * Obtener alumno por id.
	 *
	 * @param id the id
	 * @return the perfil alumno
	 * @since 17-nov-2010
	 * @author cfigueroa
	 */
	public PerfilAlumno obtenerAlumnoPorId(Long id){
		return alumnoDao.obtener(id);
	}
	
	/**
	 * Update alumno.
	 *
	 * @param perfilAlumno the perfil alumno
	 * @since 17-nov-2010
	 * @author cfigueroa
	 */
	public void updateAlumno(PerfilAlumno perfilAlumno){
		alumnoDao.guardar(perfilAlumno);
	}
}
