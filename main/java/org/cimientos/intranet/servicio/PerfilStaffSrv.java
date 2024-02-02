package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.PerfilStaffDao;
import org.cimientos.intranet.modelo.perfilstaff.PerfilStaff;
import org.cimientos.intranet.modelo.persona.Persona;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PerfilStaffSrv {
	
	@Autowired
	private PerfilStaffDao dao;
	
	/**
	 * Persiste un perfilStaff en la base de datos.
	 * @param perfilStaff
	 */
	public void agregarPerfilStaff(PerfilStaff perfilStaff){
		dao.guardar(perfilStaff);
		dao.flush();
	}
	
	/**
	 * Persiste un perfilStaff modificado en la base de datos
	 * @param perfilStaff
	 */
	public void modificarPerfilStaff(PerfilStaff perfilStaff){
		dao.guardar(perfilStaff);
		dao.flush();
	}
	
	/**
	 * Elimina un perfilStaff de la base de datos
	 * @param perfilStaff
	 */
	public void eliminarPerfilStaff(PerfilStaff perfilStaff){
		dao.eliminar(perfilStaff);
		dao.flush();
	}
	
	/**
	 * Recupera, si es que existe, el perfilStaff con id=id
	 * @param id
	 * @return 
	 */
	public PerfilStaff obtenerPerfilStaff(long id){
		return dao.obtener(id);
	}
	
	/**
	 * Recupera en una lista todos los perfilStaff de la base de datos
	 * @return
	 */
	public List<PerfilStaff> obtenerTodos(){
		return dao.obtenerTodos();
	}
	
	/**
	 * Chequea si existe un perfil Staff para la persona pasada como parametro
	 * @param persona
	 * @return
	 */
	public boolean existeStaffPorPersona(Persona persona) {
		return dao.existeStaffPorPersona(persona);
	}
	
	/**
	 * @param idProperty
	 * @param ids
	 * @return
	 */
	public List<PerfilStaff> obtenerGrupo(String idProperty, List<Long> ids){
		return dao.obtenerGrupo(idProperty, ids);
	}

	/**
	 * @param cuil
	 * @return
	 */
	public PerfilStaff obtenerPerfilStaffPorCuil(String cuil) {
		return dao.obtenerPerfilStaffPorCuil(cuil);
	}
			
}
