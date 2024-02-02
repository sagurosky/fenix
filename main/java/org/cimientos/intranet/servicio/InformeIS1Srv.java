package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.BoletinDao;
import org.cimientos.intranet.dao.InformeIS1Dao;
import org.cimientos.intranet.modelo.Boletin;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.informe.InformeIS1;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class InformeIS1Srv {


	@Autowired
	private InformeIS1Dao daoInforme;
	
	@Autowired
	private BoletinDao boletinDao;
	
	@Autowired
	private CicloProgramaSrv srvCiclo;
	

	public void guardarInformeIS1(InformeIS1 informe){
		daoInforme.guardar(informe);
		daoInforme.flush();
	}
	

	public void eliminarInformeIS1(InformeIS1 informe){
		daoInforme.eliminar(informe);
		daoInforme.flush();
	}
	
	public InformeIS1 obtenerInformeIS1(long id){
		return daoInforme.obtener(id);
	}
	
	public List<InformeIS1> obtenerTodos(){
		return daoInforme.obtenerTodos();
	}
	
	public List<InformeIS1> obtenerGrupo(List<Long> ids){
		return daoInforme.obtenerGrupo("id", ids);
	}
	
	
	public List<InformeIS1> obtenerRevision(){
		return daoInforme.obtenerInformesRevision(srvCiclo.obtenerCicloActual());
	}
	
	public List<InformeIS1> obtenerSupervisor(){
		return daoInforme.obtenerInformesSupervisor(srvCiclo.obtenerCicloActual());
	}
	
	
	public List<InformeIS1> obtenerCorreccion(){
		return daoInforme.obtenerInformesCorreccion(srvCiclo.obtenerCicloActual());
	}
	
	public List<InformeIS1> obtenerFinalizados(){
		return daoInforme.obtenerInformesFinalizados(srvCiclo.obtenerCicloActual());
	}
	public List<InformeIS1> obtenerInformesAEnviar() {
		return daoInforme.obtenerInformesAEnviar(srvCiclo.obtenerCicloActual());
	}

	/**
	 * @param alumno
	 * @return
	 */
	public Boletin getBoletinAnioAnterior(PerfilAlumno alumno) {
		return boletinDao.obtenerBoletinCicloAnterior(alumno);
	}

	public List<Informe> obtenerRevisionPorEA(PerfilEA perfilEA) {
		return daoInforme.obtenerRevisionPorEA(srvCiclo.obtenerCicloActual(),perfilEA);
	}

	public List<Informe> obtenerSupervisionPorRR(PerfilRR perfilRR) {
		return daoInforme.obtenerSupervisorPorRR(srvCiclo.obtenerCicloActual(),perfilRR);
	}
	
	public InformeIS1 obtenerInformePorAlumno(Long idAlumno,CicloPrograma cicloActual) {
		return daoInforme.obtenerInformePorAlumno(idAlumno,cicloActual);
	}
	
	public Boolean verSiAlumnoTieneIS1(Long idAlumno) {
		return daoInforme.verSiAlumnoTieneIS1(idAlumno);
	}
}
