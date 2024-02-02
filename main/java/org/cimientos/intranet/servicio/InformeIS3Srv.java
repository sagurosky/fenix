package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.InformeIS3Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.InformeIS3;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class InformeIS3Srv {
	
	@Autowired
	private InformeIS3Dao daoInformeIS3;
	
	

	public void guardarInformeIS3 (InformeIS3 informe){		
		daoInformeIS3.guardar(informe);
		daoInformeIS3.flush();
	}
	
	
	public void eliminarInformeIS3(InformeIS3 informe){
		daoInformeIS3.eliminar(informe);
		daoInformeIS3.flush();
	}
	
	
	public InformeIS3 obtenerInformeIS3(Long id){
		return daoInformeIS3.obtener(id);
	}
	
	
	public List<InformeIS3> obtenerTodosIS3(Long id){		
		return daoInformeIS3.obtenerTodos();
	}


	public InformeIS3 obtenerInformePorAlumno(Long id, CicloPrograma cicloActual) {
		return daoInformeIS3.obtenerInformePorAlumno(id,cicloActual);
	}
	
	public Boolean verSiAlumnoTieneIS3(Long idAlumno) {
		return daoInformeIS3.verSiAlumnoTieneIS3(idAlumno);
	}
	
	public InformeIS3 obtenerInformePorIdEntrevista(Long idEntrevista){
		return daoInformeIS3.obtenerInformePorIdEntrevista(idEntrevista);
	}
}
