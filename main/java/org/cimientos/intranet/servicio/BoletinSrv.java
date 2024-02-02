package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.impl.BoletinDaoImpl;
import org.cimientos.intranet.modelo.Boletin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author msagarduy
 * @param 
 */
@Service
@Transactional
public class BoletinSrv {

	@Autowired
	private BoletinDaoImpl dao;
	
	/**
	 * @param boletin
	 */
	public void agregarBoletin(Boletin boletin){
		dao.guardar(boletin);
		dao.flush();
	}
	
	
	/**
	 * @param boletin
	 */
	public void eliminarBoletin(Boletin boletin){
		dao.eliminar(boletin);
		dao.flush();
	}

	/**
	 * @param id
	 * @return
	 */
	public Boletin obtenerPorId(long id){
		return dao.obtener(id);
	}
	
	/**
	 * @return
	 */
	public List<Boletin> obtenerTodos(){
		return dao.obtenerTodos();
	}
	
	
	/**
	 * @param ids
	 * @return
	 */
	public List<Boletin> obtenerGrupo(List<Long> ids){
		return dao.obtenerGrupo("id", ids);
	}
}
