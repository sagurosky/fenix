package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.ComunicadoNoRenovacionDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.ComunicadoNoRenovacion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ComunicadoNoRenovacionSrv{

	 @Autowired
	 private ComunicadoNoRenovacionDao dao;
	 

	 public void agregarComunicadoNoRenovacion(ComunicadoNoRenovacion comunicado){
		 dao.guardar(comunicado);
	 }
	 

	 public void eliminarComunicadoNoRenovacion(ComunicadoNoRenovacion comunicado){
		 dao.eliminar(comunicado);
	 }
	 
	 public ComunicadoNoRenovacion obtener(Long id){
		 return dao.obtener(id);
	 }
	 
	 public List<ComunicadoNoRenovacion> obtenerTodos(){
		 return dao.obtenerTodos();
	 }
	 
	 public ComunicadoNoRenovacion obtenerComunicadoNoRenovacionPorAlumno(Long idPerfilAlumno,	CicloPrograma cicloActual) {
		return dao.obtenerComunicadoNoRenovacionPorAlumno(idPerfilAlumno,cicloActual);
	}
	 
}
