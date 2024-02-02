package org.cimientos.intranet.servicio;


import java.util.List;

import org.cimientos.intranet.dao.InformeSADao;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.InformeSA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class InformeSASrv {
	
	@Autowired
	InformeSADao dao;


	/**
	 * Persiste un InformeSA en la base de datos.
	 * @param InformeSA
	 */
	public void agregarInformeSA(InformeSA informeSA){
		dao.guardar(informeSA);
		dao.flush();
	}
	
	/**
	 * Persiste un InformeSA modificado en la base de datos
	 * @param InformeSA
	 */
	public void modificarInformeSA(InformeSA informeSA){
		dao.guardar(informeSA);
		dao.flush();
	}
	
	/**
	 * Elimina un InformeSA de la base de datos
	 * @param InformeSA
	 */
	public void eliminarInformeSA(InformeSA informeSA){
		dao.eliminar(informeSA);
		dao.flush();
	}
	
	/**
	 * Recupera, si es que existe, el InformeSA con id=id
	 * @param id
	 * @return 
	 */
	public InformeSA obtenerInformeSA(long id){
		return dao.obtener(id);
	}
	
	/**
	 * Recupera en una lista todos los InformeSA de la base de datos
	 * @return
	 */
	public List<InformeSA> obtenerTodos(){
		return dao.obtenerTodos();
	}
}
