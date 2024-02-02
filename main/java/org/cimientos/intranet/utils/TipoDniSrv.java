/**
 * 
 */
package org.cimientos.intranet.utils;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cimientos.intranet.enumerativos.TipoDni;

/**
 * @author msagarduy
 * @param 
 */
@Service
public class TipoDniSrv {

	public List<TipoDni> obtenerTiposDnis() {
		return TipoDni.getListaTipos();
	}
}
