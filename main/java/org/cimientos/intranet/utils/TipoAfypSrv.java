/**
 * 
 */
package org.cimientos.intranet.utils;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cimientos.intranet.enumerativos.TipoAfyp;

/**
 * @author msagarduy
 *  
 */
@Service
public class TipoAfypSrv {

	public List<TipoAfyp> obtenerTiposAfip() {
		return TipoAfyp.getListaTipos();
	}
}
