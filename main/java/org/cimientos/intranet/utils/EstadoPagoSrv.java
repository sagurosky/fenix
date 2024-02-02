/**
 * 
 */
package org.cimientos.intranet.utils;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cimientos.intranet.enumerativos.EstadoPago;

/**
 * @author msagarduy
 *  
 */
@Service
public class EstadoPagoSrv {

	public List<EstadoPago> obtenerEstadoPagos() {
		return EstadoPago.getListaEstados();
	}
}
