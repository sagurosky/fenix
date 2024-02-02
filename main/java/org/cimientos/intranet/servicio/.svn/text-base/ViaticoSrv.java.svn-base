package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.ViaticoDao;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.viatico.Viatico;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author nlopez
 *
 */

@Service
@Transactional
public class ViaticoSrv {

	@Autowired
	private ViaticoDao dao;
	
	/**
	 * Agregar viatico.
	 *
	 * @param viatico the viatico
	 * @since 28-dic-2010
	 * @author nlopez
	 */
	public void agregarViatico( Viatico viatico ){
		dao.guardar(viatico);
		dao.flush();
	}
	

	public void modificarViatico( Viatico viatico ){
		dao.guardar(viatico);
		dao.flush();
	}
	

	public void eliminarViatico( Viatico viatico ){
		dao.eliminar(viatico);
		dao.flush();
	}
	
	public Viatico obtenerViatico( Long id ){
		return dao.obtener(id);
	}
	
	public List<Viatico> obtenerTodos(){
		return dao.obtenerTodos();
	}
	
	public List<Viatico> obtenerViaticosPorEa(PerfilEA perfilEA){
		return dao.obtenerViaticosPorEA(perfilEA);
	}
	
	public List<Viatico> obtenerViaticosPorRr(PerfilRR perfilRR){
		return dao.obtenerViaticosPorRR(perfilRR);
	}
}
