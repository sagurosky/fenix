package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.ComunicadoPendienteDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.ComunicadoPendiente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ComunicadoPendienteSrv {

	@Autowired
	private ComunicadoPendienteDao dao;
	

	public void agregarComunicadoPendiente(ComunicadoPendiente comunicado){
		dao.guardar(comunicado);
	}
	

	public void eliminarComunicadoPendiente(ComunicadoPendiente comunicado){
		dao.eliminar(comunicado);
	}
	 
	public ComunicadoPendiente obtener(Long id){
		return dao.obtener(id);
	}
	 
	public List<ComunicadoPendiente> obtenerTodos(){
		return dao.obtenerTodos();
	}
	 
	public ComunicadoPendiente obtenerComunicadoPendientePorAlumno(Long idPerfilAlumno,CicloPrograma cicloActual){
		return dao.obtenerComunicadoPendientePorAlumno(idPerfilAlumno,cicloActual);
	}
}
