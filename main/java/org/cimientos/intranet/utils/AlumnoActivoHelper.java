package org.cimientos.intranet.utils;

import java.util.ArrayList;
import java.util.List;
import org.cimientos.intranet.dto.AlumnoActivoDTO;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.servicio.CicloProgramaSrv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AlumnoActivoHelper {

	@Autowired
	private CicloProgramaSrv srvCiclo;
	
	/**
	 * Dada una lista de PerfilAlumno, retorna una lista de DTO's
	 * @param alumnos
	 * @return
	 */
	public List<AlumnoActivoDTO> obtenerAlumnos(List<PerfilAlumno> alumnos) {
		CicloPrograma ciclo = srvCiclo.obtenerCicloActual();
		List<AlumnoActivoDTO> result = new ArrayList<AlumnoActivoDTO>();
		AlumnoActivoDTO alum = null;
		for (PerfilAlumno pa : alumnos) {
			if(esActivo(pa,ciclo)){				
				alum = new AlumnoActivoDTO();
				alum.setId(pa.getId());
				alum.setNombreEa(pa.getEa().getDatosPersonales().getApellidoNombre());
				alum.setNombreZona(pa.getEscuela().getZonaCimientos().getNombre());
				alum.setNombreAlumno(pa.getDatosPersonales().getApellidoNombre());
				alum.setTipoDni(pa.getDatosPersonales().getTipoDni());
				alum.setDni(pa.getDatosPersonales().getDni());
				alum.setFechaPBE(pa.getFechaPBE());
				alum.setEstadoAlumno(pa.getEstadoAlumno());
				alum.setNombreEscuela(pa.getEscuela().getNombre());
				alum.setAnioEscolar(pa.getAnioEscolar());
				alum.setAnioAdicional(pa.getAnioAdicional());
				alum.setNombrePadrino(obtenerPadrino(pa));
				alum.setEstadoRenovacion(pa.getEstadoRenovacion());
				alum.setIdEcuela(pa.getEscuela().getId());
				result.add(alum);
			}
		}
		return result;
	}

	/**
	 * Los alumnos activos son aquellos que tienen beca asignada o tuvieron durante el ciclo actual
	 * @param pa
	 * @param ciclo
	 * @return
	 */
	private boolean esActivo(PerfilAlumno pa, CicloPrograma ciclo) {
		if(pa.getBeca() != null)
			return true;
		else{
			for (Beca beca : pa.getHistorialBeca()) {
				if(beca.getCiclo().equals(ciclo))
					if(pa.getEstadoAlumno().equals(EstadoAlumno.NO_RENOVADO)){
						return pa.getFechaBaja().after(ciclo.getPeriodos().get(ciclo.getPeriodos().size() - 1).getFechaInicio());
					}						
					else
						return true;
					
			}
			return false;	
		}			
	}
	

	/**
	 * Obtiene el nombre del padrino de la beca si es que tiene beca activa, sino va a buscar el ultimo
	 * padrino al historial de la beca
	 * @param ciclo 
	 * */	
	private String obtenerPadrino(PerfilAlumno pa) {
		if(pa.getBeca() != null){
			if(pa.getBeca().getPadrino().getEmpresa() != null)
				return pa.getBeca().getPadrino().getEmpresa().getDenominacion();
			else
				return pa.getBeca().getPadrino().getDatosPersonales().getApellidoNombre();
		}
		else{
			String nombre = "";		
			int orden = 0;
			for (Beca beca : pa.getHistorialBeca()) {
				if(beca.getCiclo().getOrden() > orden){
					orden = beca.getCiclo().getOrden();
					if(beca.getPadrino().getEmpresa() != null)
						nombre = beca.getPadrino().getEmpresa().getDenominacion();
					else
						nombre = beca.getPadrino().getDatosPersonales().getApellidoNombre();
				}
			}
			return nombre;
		}
			
	}

}
