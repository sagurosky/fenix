package org.cimientos.intranet.servicio;

import java.util.List;

import org.cimientos.intranet.dao.InformeCesacionDao;
import org.cimientos.intranet.dao.impl.EntrevistaDaoImpl;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.informe.InformeCesacion;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaIndividual;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class InformeCesacionSrv {

	@Autowired
	private EntrevistaDaoImpl dao;
	
	@Autowired
	private CicloProgramaSrv srvCiclo;
	
	@Autowired
	private InformeCesacionDao daoInforme;
	
	public EntrevistaIndividual obtenerEiAlumno(Long idBecado){
		EntrevistaIndividual entrevista =  dao.obtenerInformeCesacion(idBecado);
		return entrevista;
	}
	

	public void guardarInformeCesacion(InformeCesacion informe){
		daoInforme.guardar(informe);
		daoInforme.flush();
	}
	

	public void eliminarInformeCesacion(InformeCesacion informe){
		daoInforme.eliminar(informe);
		daoInforme.flush();
	}
	
	public InformeCesacion obtenerInformeCesacion(long id){
		return daoInforme.obtener(id);
	}
	
	public List<InformeCesacion> obtenerTodos(){
		return daoInforme.obtenerTodos();
	}
	
	public List<InformeCesacion> obtenerGrupo(List<Long> ids){
		return daoInforme.obtenerGrupo("id", ids);
	}
	
	public List<InformeCesacion> obtenerConstruccion(){
		return daoInforme.obtenerInformesConstruccion(srvCiclo.obtenerCicloActual());
	}
	
	public List<InformeCesacion> obtenerSupervision(){
		return daoInforme.obtenerInformesSupervision(srvCiclo.obtenerCicloActual());
	}
	
	public List<InformeCesacion> obtenerCorreccion(){
		return daoInforme.obtenerInformesCorreccion(srvCiclo.obtenerCicloActual());
	}
	
	public List<InformeCesacion> obtenerRevision(){
		return daoInforme.obtenerInformesRevision(srvCiclo.obtenerCicloActual());
	}
	
	public List<InformeCesacion> obtenerFinalizados(){
		return daoInforme.obtenerInformesFinalizados(srvCiclo.obtenerCicloActual());
	}

	public InformeCesacion obtenerInformeCesacionPorAlumno(Long idPerfilAlumno,	CicloPrograma cicloActual) {
		return daoInforme.obtenerInformeCesacionPorAlumno(idPerfilAlumno,cicloActual);
	}
	
	public List<Informe> obtenerRevisionPorEA(PerfilEA perfilEA) {
		return daoInforme.obtenerRevisionPorEA(perfilEA,srvCiclo.obtenerCicloActual());
	}
	
	public List<Informe> obtenerSupervisionPorRR(PerfilRR perfilRR) {
		return daoInforme.obtenerSupervisionPorRR(perfilRR,srvCiclo.obtenerCicloActual());
	}

}
