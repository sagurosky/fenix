package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.dao.PersonaDao;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.persona.Persona;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.googlecode.ehcache.annotations.Cacheable;

@Service
@Transactional
public class PersonaSrv {
	
	@Autowired
	PersonaDao dao;
	
	/**
	 * Persiste un persona en la base de datos.
	 * @param persona
	 */
	public void agregarPersona(Persona persona){
		dao.guardar(persona);
		dao.flush();
	}
	
	/**
	 * Persiste una Persona modificada en la base de datos
	 * @param perfilStaff
	 */
	public void modificarPersona(Persona persona){
		dao.guardar(persona);
		dao.flush();
	}
	
	/**
	 * Elimina un Persona de la base de datos
	 * @param Persona
	 */
	public void eliminarPersona(Persona persona){
		dao.eliminar(persona);
		dao.flush();
	}
	
	/**
	 * Recupera, si es que existe, la Persona con id=id
	 * @param id
	 * @return 
	 */
	public Persona obtenerPersona(long id){
		return dao.obtener(id);
	}
	
	/**
	 * Recupera en una lista todos los Persona de la base de datos
	 * @return
	 */
	public List<Persona> obtenerTodos(){
		return dao.obtenerTodos();
	}

	/**
	 * Busca si hay Persona con mismo Cuil en la base de datos
	 * @return
	 */
	public Persona buscarPorCuil(String cuil) {		
		return dao.buscarPorCuil(cuil);
	}

	public Persona buscarPorIgualCuil(String cuilCuit, Long id) {		
		return  dao.buscarPorIgualCuil(cuilCuit, id);
	}

	/**
	 * Retorna todas las personas que estan en condiciones para crear un usuario.
	 * Dichas condiciones son que la persona tenga un perfilStaff o perfilEA y que la persona
	 * no tenga un usuario creado
	 * @param idsPersona lista de ids de personas con usuario creado
	 * @return
	 */
	public List<Persona> obtenerParaUsuarios(ArrayList<Long> idsPersona) {
		return dao.obtenerParaUsuarios(idsPersona);
	}

	/**
	 * @param nombre
	 * @return
	 */
	public List<Persona> buscarPorNombre(String nombre) {
		return dao.buscarNombreApellido(nombre);
	}

	@Cacheable(cacheName = "org.cimientos.intranet.modelo.persona.Persona")
	public Object buscarPorDNI(Integer dni) {
		return dao.buscarPorDNI(dni);
	}
	
	/**
	 * @param perfilAlumno
	 * @return
	 */
	public Persona buscarPorPerfilAlumno(PerfilAlumno perfilAlumno) {
		return dao.buscarPorPerfilAlumno(perfilAlumno);
	}
	
	public List<Persona> buscarCorrectoraPorNombre(String nombre) {
		return dao.buscarCorrectoraPorNombre(nombre);
	}

}
