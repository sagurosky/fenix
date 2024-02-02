package org.cimientos.intranet.servicio;

import java.util.LinkedList;
import java.util.List;

import org.cimientos.intranet.dao.PersonaDao;
import org.cimientos.intranet.dao.UsuarioDao;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.usuario.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * SeguridadSrv	
 * @author Juan Irungaray
 *
 */
@Service
@Component("seguridadSrv")
@Transactional
public class SeguridadSrv implements UserDetailsService{

	
	@Autowired
	UsuarioDao dao;
	
	@Autowired
	PersonaDao personaDao;
	
	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetailsService#loadUserByUsername(java.lang.String)
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException{
		Usuario temp = dao.obtenerPorUsername(username,true);
		if(temp == null){
			throw new UsernameNotFoundException("No se encontro el usuario");
		}
		boolean activo = temp.isActivo();
		if(activo){
			Persona persona=  temp.getPersona();
			return  new User(temp.getUsuario(), temp.getPassword(), activo, activo, activo, activo, armarAuthorities(persona.obtenerPerfiles()));
		}else{
			return  new User(temp.getUsuario(), temp.getPassword(), activo, activo, activo, activo, armarAuthoritiesHArcodeados(temp.getUsuario()));
		}
		
	}
	/**
	 * @param perfiles
	 * @return
	 */
	private List<GrantedAuthority> armarAuthorities(List<String> perfiles){
		List<GrantedAuthority> result = new LinkedList<GrantedAuthority>();
		for (String perfil : perfiles) 
		{
		result.add(new GrantedAuthorityImpl(perfil));	
		}
		return result;
	}
	private List<GrantedAuthority> armarAuthoritiesHArcodeados(String usuario){
		List<GrantedAuthority> result = new LinkedList<GrantedAuthority>();
		return result;
	}

	
}
