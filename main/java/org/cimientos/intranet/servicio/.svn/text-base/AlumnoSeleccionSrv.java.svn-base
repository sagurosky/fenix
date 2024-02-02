package org.cimientos.intranet.servicio;

import org.cimientos.intranet.dao.AlumnoSeleccionDao;
import org.cimientos.intranet.modelo.perfil.AlumnoSeleccion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AlumnoSeleccionSrv {

		@Autowired
		private AlumnoSeleccionDao dao;
		
		/**
		 * Persiste un alumnoSeleccion en la base de datos.
		 * @param alumno
		 */
		public void agregarAlumno(AlumnoSeleccion alumno)
		{	alumno.setActivo(true);
			dao.guardar(alumno);
			dao.flush();
			
		}
	
	
}
