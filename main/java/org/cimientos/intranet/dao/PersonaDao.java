package org.cimientos.intranet.dao;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.persona.Persona;

public interface PersonaDao extends Dao<Persona>{

	Persona buscarPorCuil(String cuil);

	Persona buscarPorIgualCuil(String cuilCuit, Long id);

	List<Persona> obtenerParaUsuarios(ArrayList<Long> idsPersona);

	List<Persona> buscarNombreApellido(String nombre);

	Persona buscarPorDNI(Integer dni);
	
	Persona buscarPorPerfilAlumno(PerfilAlumno perfilAlumno);
	
	List<Persona> buscarCorrectoraPorNombre(String nombre);
	
}
