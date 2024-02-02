/**
 * 
 */
package org.cimientos.intranet.utils;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cimientos.intranet.enumerativos.RolUsuario;

/**
 * @author msagarduy
 * 
 */
@Service
public class RolUsuarioSrv {
	
	public List<RolUsuario> obtenerPerfilesUsuario() {
		return RolUsuario.getListaRoles();
	}
	
}
