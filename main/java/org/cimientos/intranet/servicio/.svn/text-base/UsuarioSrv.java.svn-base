package org.cimientos.intranet.servicio;


import java.util.List;

import org.cimientos.intranet.dao.UsuarioDao;
import org.cimientos.intranet.modelo.Parametro;
import org.cimientos.intranet.modelo.usuario.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author msagarduy
 * Clase utilizada para el manejo de la logica de negocios del objeto Usuario
 */
@Service
@Transactional
public class UsuarioSrv {


	@Autowired
	UsuarioDao dao;

	@Autowired
	ParametroSrv parametroSrv;
	


	/**
	 * registra o actualiza un usuario
	 * 
	 * @param usuario
	 */
	public void guardarUsuario(Usuario usuario) {
		dao.guardar(usuario);
		dao.flush();
		dao.clear();
	}
	
	/**
	 * elimina un usuario
	 * @param usuario
	 */
	public void eliminarUsuario(Usuario usuario){
		dao.eliminar(usuario);
		dao.flush();
	}

	
	/**
	 * retorna un usuario en base a su id
	 * @param id
	 * @return
	 */
	public Usuario obtenerPorId(long id) {
		return dao.obtener(id);
	}
	
	/**
	 * retorna un Usuario en base a su nombre de usuario y su estado
	 * @param usuario
	 * @param soloActivos
	 * @return
	 */
	public Usuario obtenerPorUsuario(String usuario, boolean soloActivos) {
		return dao.obtenerPorUsername(usuario,soloActivos);
	}
	
	/**
	 * retorna todos los usuarios
	 * @return
	 */
	public List<Usuario> obtenerTodos() {
		return dao.obtenerTodos();
	}

	/**
	 * retorna todos los perfiles de usuario
	 * @param id
	 * @return
	 */
	public List<Usuario> obtenerPerfiles (long id){
		return dao.obtenerPorPerfil(id);
	}

	/**
	 * retorna true si el usuario buscado ya fue dado de alta y false en caso contrario
	 * @param usuario
	 * @return
	 */
	public boolean buscarPorIgualUsuario(String usuario){
		return dao.obtenerUsuarioPorIgualUsuario(usuario) != null;  
	}
	
	/**
	 * retorna true si existe y false en caso contrario
	 * @param usuario
	 * @param id
	 * @return
	 */
	public boolean buscarUsuarioPorUsuario(String usuario, String id){
		return  dao.obtenerUsuario(usuario, id) != null;
	}
	
	/**
	 * Metodo que registra el usuario que le llega como parametro por contrasena olvidada. 
	 * Encripta la contrasena del usuario y envia un email con mensaje de bienvenida al usuario
	 * para activacion de la cuenta.
	 * @param usuario
	 * @param server
	 * @param port
	 * @throws Exception
	 */
	/**
	 * Activa el usuario buscado y lo persiste en la DB.
	 * @param id
	 * @param nuevaPass
	 */
	public void activarUsuario(long id, String nuevaPass) {
		Usuario usuario = dao.obtener(id);
		usuario.setActivo(true);
		usuario.setPassword(nuevaPass);
		dao.guardar(usuario);
		dao.flush();
	}
	
	/**
	 * Retorna el usuario por email
	 * @param email
	 * @return
	 */
	public Usuario obtenerUsuarioPorEmailExistente(String email){
		return dao.buscarPorEmail(email);
	}
	

	/**
	 * Retorna la lista de usuarios con perfil del tipo corrector.
	 * 
	 * @return List<Usuario>
	 */
	public List<Usuario> obtenerCorrectores() {
		Parametro perfilCorrector = null;
		for(Parametro perfil : parametroSrv.obtenerAreas()){
			if(perfil.getValor().equalsIgnoreCase("Corrector")){
				perfilCorrector = perfil;
				break;
			}
		}
		return obtenerPerfiles(perfilCorrector.getId());
	}

	public Usuario obtenerUsuarioPorDni(Integer dni){
		return dao.obtenerUsuarioPorDni(dni);
	}

} 
