package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.InformeIS2Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.InformeIS2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class InformeIS2Srv {

	@Autowired
	private InformeIS2Dao daoInforme;
	
	@Autowired
	private CicloProgramaSrv srvCiclo;
	

	public void guardarInformeIS2(InformeIS2 informe){		
		daoInforme.guardar(informe);
		daoInforme.flush();
	}
	
	public InformeIS2 obtenerInformeIS2(long id){
		return daoInforme.obtener(id);
	}
	
	public List<InformeIS2> obtenerTodos(){
		return daoInforme.obtenerTodos();
	}
	
	public void eliminarInformeIS2(InformeIS2 informe){
		daoInforme.eliminar(informe);
		daoInforme.flush();
	}
	
	public List<InformeIS2> obtenerConstruccion(){
		return daoInforme.obtenerInformesConstruccion(srvCiclo.obtenerCicloActual());
	}
	
	public List<InformeIS2> obtenerSupervision(){
		return daoInforme.obtenerInformesSupervision(srvCiclo.obtenerCicloActual());
	}
	
	public List<InformeIS2> obtenerCorreccion(){
		return daoInforme.obtenerInformesCorreccion(srvCiclo.obtenerCicloActual());
	}
	
	public List<InformeIS2> obtenerFinalizados(){
		return daoInforme.obtenerInformesFinalizados(srvCiclo.obtenerCicloActual());
	}

	public List<InformeIS2> obtenerRevision(){
		return daoInforme.obtenerInformesRevision(srvCiclo.obtenerCicloActual());
	}

	public InformeIS2 obtenerInformePorAlumno(Long idAlumno,CicloPrograma cicloActual) {
		return daoInforme.obtenerInformePorAlumno(idAlumno,cicloActual);
	}

	public Object obtenerTodosInformesPorEA(Long idEA,CicloPrograma cicloActual) {
		return daoInforme.obtenerTodosInformesPorEA(idEA,cicloActual);
	}
	
	public Boolean verSiAlumnoTieneIS2(Long idAlumno) {
		return daoInforme.verSiAlumnoTieneIS2(idAlumno);
	}
	
	public InformeIS2 obtenerInformePorIdAlumno(Long idAlumno, CicloPrograma ciclo){
		return daoInforme.obtenerInformeIS2(idAlumno,ciclo);
	}
}
