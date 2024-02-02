package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.cimientos.intranet.dao.AlumnoPanelEADao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.InformeIS1;
import org.cimientos.intranet.modelo.informe.InformeIS2;
import org.cimientos.intranet.modelo.informe.InformeIS3;
import org.cimientos.intranet.modelo.perfil.AlumnoPanelEA;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.utils.ConstantesPaneles;
import org.cimientos.intranet.utils.PeriodoHelper;
import org.cimientos.intranet.web.controller.EntrevistaController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author msagarduy
 *
 */
@Service
@Transactional
public class AlumnoPanelEAFebreroSrv {

	@Autowired
	private AlumnoPanelEADao alumnoPanelEaDao;
	
	@Autowired
	private AlumnoSrv srvAlumno;
	
	@Autowired
	private CicloProgramaSrv srvCiclo;
	
	@Autowired
	private InformeSrv srvInforme;
	
	@Autowired
	private InformeIS1Srv srvInformeIS1;
	
	@Autowired
	private InformeIS2Srv srvInformeIS2;
	
	@Autowired
	private InformeIS3Srv srvInformeIS3;
	
	@Autowired
	private EntrevistaController entrevistaController;
	
	private static final String INFORME_IS1 = "informeis1";
	private static final String INFORME_IS2 = "informeis2";
	private static final String INFORME_IS3 = "informeis3";
	

	public void agregarAlumnoPanelEA(AlumnoPanelEA alumno){
		this.alumnoPanelEaDao.guardar(alumno);
	}
	

	public void modificarAlumnoPanelEA(AlumnoPanelEA alumno){
		this.alumnoPanelEaDao.guardar(alumno);
		this.alumnoPanelEaDao.flush();
	}
	

	public void modificarTodosAlumnosPanel(List<AlumnoPanelEA> alumnos){
		this.alumnoPanelEaDao.guardar(alumnos);
		this.alumnoPanelEaDao.flush();
	}
	
	public AlumnoPanelEA obtenerPorId(long idAlumno){
		return this.alumnoPanelEaDao.obtener(idAlumno);
	}
	
	/**
	 * Obtiene la lista de AlumnoPanelEA correspondiente a los ids pasados como parametro
	 * 
	 * @param list la lista de ids de los AlumnoPanelEA
	 * @return la lista de AlumnoPanelEA
	 */
	public List<AlumnoPanelEA> obtenerAlumnosPorIds(List<Long> list) {
		return this.alumnoPanelEaDao.obtenerPorIdPerfilAlumno(list);
	}
	
	public List<AlumnoPanelEA> obtenerAlumnosPorEa(long idEa){
		return this.alumnoPanelEaDao.obtenerAlumnosPorEa(idEa);
	}


	public void desactivarAlumnosCierreCiclo() {
		this.alumnoPanelEaDao.desactivarAlumnosCierreCiclo();
	}
	

	public AlumnoPanelEA obtenerAlumnoPanelPorIdPerfilAlumno(Long idAlumno){
		return this.alumnoPanelEaDao.obtenerAlumnoPanelPorIdPerfilAlumno(idAlumno);
	}


	public void activarAlumnos(List<PerfilAlumno> alumnos) {
		AlumnoPanelEA alumnoPanel;
		CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
		List<AlumnoPanelEA> alumnosPanel = new ArrayList<AlumnoPanelEA>();
		for (PerfilAlumno perfilAlumno : alumnos){
			alumnoPanel = this.alumnoPanelEaDao.obtenerAlumnoPanelPorIdPerfilAlumno(perfilAlumno.getId());
			if (alumnoPanel != null){
				alumnoPanel.setActivo(true);
				alumnoPanel.setFechaAltaBeca(perfilAlumno.getFechaAltaBeca());
				alumnoPanel.setEntrevistasRealizadas(0);
				//alumnoPanel.setEstadoAlumno(perfilAlumno.getEstadoAlumno().getValor());
				////System.out.println("estado: " +alumnoPanel.getEstadoAlumno());
				alumnoPanel.setColorEntrevistas(ConstantesPaneles.RED);
				alumnoPanel.setPagosRealizados(0);
				alumnoPanel.setCantidadPagos(0);
				alumnoPanel.setColorPagos(ConstantesPaneles.RED);
				alumnoPanel.setTotalEntrevistasCiclo(cicloActual.getPeriodos().size());
				if(perfilAlumno.getEstadoAlumno().equals(EstadoAlumno.RENOVADO) ||
						perfilAlumno.getEstadoAlumno().equals(EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION) ||
						perfilAlumno.getEstadoAlumno().equals(EstadoAlumno.PENDIENTE)){
					Boolean tieneIS1 = srvInforme.verSiAlumnoTieneInformePorTipo(perfilAlumno.getId(), INFORME_IS1);
					Boolean tieneIS2 = srvInforme.verSiAlumnoTieneInformePorTipo(perfilAlumno.getId(), INFORME_IS2);
					Boolean tieneIS3 = srvInforme.verSiAlumnoTieneInformePorTipo(perfilAlumno.getId(), INFORME_IS3);
					Boolean tieneBoletin = srvAlumno.verSiAlumnoTieneBoletin(perfilAlumno.getId());

					if(tieneIS1){
						alumnoPanel.setColorIS1(ConstantesPaneles.GREEN);
					}
					else{
						alumnoPanel.setColorIS1(ConstantesPaneles.RED);
					}

					if(tieneIS2){
						alumnoPanel.setColorIS2(ConstantesPaneles.GREEN);
					}
					else{
						alumnoPanel.setColorIS2(ConstantesPaneles.RED);
					}

					if(tieneIS3){
						alumnoPanel.setColorIS3(ConstantesPaneles.GREEN);
					}
					else{
						alumnoPanel.setColorIS3(ConstantesPaneles.RED);
					}

					if(tieneBoletin){						
						if(entrevistaController.boletinFinalizado(perfilAlumno.getBoletin()))
							alumnoPanel.setColorBoletin(ConstantesPaneles.GREEN);
						else
							alumnoPanel.setColorBoletin(ConstantesPaneles.RED);
					}
					else{
						alumnoPanel.setColorBoletin(ConstantesPaneles.GRAY);
					}
				}
				else if (perfilAlumno.getEstadoAlumno().equals(EstadoAlumno.ALTA_BECADO)){
					alumnoPanel.setColorIS1(ConstantesPaneles.GRAY);
					alumnoPanel.setColorIS2(ConstantesPaneles.GRAY);
					alumnoPanel.setColorIS3(ConstantesPaneles.GRAY);
					alumnoPanel.setZona(perfilAlumno.getBeca().getZona().getNombre());
					Boolean tieneBoletin = srvAlumno.verSiAlumnoTieneBoletin(perfilAlumno.getId());

					if(tieneBoletin){
						if(entrevistaController.boletinFinalizado(perfilAlumno.getBoletin()))
							alumnoPanel.setColorBoletin(ConstantesPaneles.GREEN);
						else
							alumnoPanel.setColorBoletin(ConstantesPaneles.RED);
					}
					else{
						alumnoPanel.setColorBoletin(ConstantesPaneles.GRAY);
					}
					alumnoPanel.setColorBoletin(ConstantesPaneles.GRAY);
				}
			}
			else{
				alumnoPanel = new AlumnoPanelEA();
				alumnoPanel.setActivo(true);
				alumnoPanel.setFechaAltaBeca(perfilAlumno.getFechaAltaBeca());
				alumnoPanel.setColorBoletin(ConstantesPaneles.GRAY);
				alumnoPanel.setColorEntrevistas(ConstantesPaneles.RED);
				if(perfilAlumno.getResponsable1().getNroCuenta() != null){
					alumnoPanel.setColorRA(ConstantesPaneles.GREEN);
					alumnoPanel.setCuentaRA(perfilAlumno.getResponsable1().getNroCuenta());
				}
				else{
					alumnoPanel.setColorRA(ConstantesPaneles.RED);
				}
				alumnoPanel.setColorPagos(ConstantesPaneles.RED);
				alumnoPanel.setColorIS1(ConstantesPaneles.GRAY);
				alumnoPanel.setColorIS2(ConstantesPaneles.RED);
				alumnoPanel.setColorIS3(ConstantesPaneles.RED);
				alumnoPanel.setEntrevistasRealizadas(0);
				alumnoPanel.setCantidadPagos(0);
				alumnoPanel.setPagosRealizados(0);
				alumnoPanel.setEscuela(perfilAlumno.getEscuela().getNombre());
				alumnoPanel.setAnio(perfilAlumno.getAnioEscolar());
				alumnoPanel.setDni(perfilAlumno.getDatosPersonales().getDni());
				alumnoPanel.setEntrevistasFinalizadas(false);
				alumnoPanel.setRenovacionPendiente(false);
				alumnoPanel.setIdPerfilAlumno(perfilAlumno.getId());
				alumnoPanel.setNombreApellido(perfilAlumno.getDatosPersonales().getApellido()+ "," + perfilAlumno.getDatosPersonales().getNombre());
				alumnoPanel.setTotalEntrevistasCiclo(cicloActual.getPeriodos().size());
				alumnoPanel.setZona(perfilAlumno.getBeca().getZona().getNombre());	
			}
			alumnosPanel.add(alumnoPanel);
		}
		this.alumnoPanelEaDao.guardar(alumnosPanel);
	}
	

	public List<AlumnoPanelEA> actualizarPagosEntrevistas(Long idEA){
		CicloPrograma cicloActual = srvCiclo.obtenerCicloActual();
		Periodo periodoActual = PeriodoHelper.getPeriodoActual(cicloActual.getPeriodos(), new Date());
		AlumnoPanelEA alumnoPanel = null;
		InformeIS1 informeis1 = null;
		InformeIS2 informeis2 = null;
		InformeIS3 informeis3 = null;
		String colorIS1 = null;
		String colorIS2 = null;
		String colorIS3 = null;
		List<AlumnoPanelEA> alumnos = obtenerAlumnosPorEa(idEA);
		for (AlumnoPanelEA alumnoPanelEa : alumnos){
			Periodo periodoAltaBeca = PeriodoHelper.getPeriodoActual(cicloActual.getPeriodos(), alumnoPanelEa.getFechaAltaBeca());
			alumnoPanel = this.alumnoPanelEaDao.obtener(alumnoPanelEa.getId());
			if(periodoActual.getOrden() >= periodoAltaBeca.getOrden()){
				informeis1 = srvInformeIS1.obtenerInformePorAlumno(alumnoPanel.getIdPerfilAlumno(),cicloActual);
				informeis2 = srvInformeIS2.obtenerInformePorIdAlumno(alumnoPanel.getIdPerfilAlumno(),cicloActual);
				informeis3 = srvInformeIS3.obtenerInformePorAlumno(alumnoPanel.getIdPerfilAlumno(), cicloActual);
				colorIS1 = obtenerColorIS1(informeis1, alumnoPanel.getIdPerfilAlumno());
				colorIS2 = obtenerColorIS2(informeis2, alumnoPanel, alumnoPanel.getFechaAltaBeca(), cicloActual.getFecha1IS2(), 
						cicloActual.getFecha2IS2(), cicloActual.getFechalimite1(), cicloActual.getFechalimite2());
				colorIS3 = obtenerColorIs3(informeis3);
				alumnoPanel.setColorIS1(colorIS1);
				alumnoPanel.setColorIS2(colorIS2);
				alumnoPanel.setColorIS3(colorIS3);
				alumnoPanel.setEntrevistas(periodoActual.getOrden() - (periodoAltaBeca.getOrden() -1));
				alumnoPanel.setPagos(periodoActual.getOrden() - (periodoAltaBeca.getOrden() -1));
				alumnoPanel.setTotalEntrevistasCiclo(cicloActual.getPeriodos().size() - (periodoAltaBeca.getOrden() - 1));
				//System.out.println(cicloActual.getPeriodos().size());
				if(alumnoPanel.getEntrevistas() > alumnoPanel.getEntrevistasRealizadas())
					alumnoPanel.setColorEntrevistas(ConstantesPaneles.RED);
				//TODO ver como actualizar el color de los pagos, ya que no alcanza con que la cantidad de pagos realizados sea menor a 
				// la cantidad de pagos para ponerlo en rojo. Ver bien las condiciones de pagos para cambiar el color!
			}
			else{
				alumnoPanel.setColorIS1(ConstantesPaneles.GRAY);
				alumnoPanel.setColorIS2(ConstantesPaneles.GRAY);
				alumnoPanel.setColorIS3(ConstantesPaneles.GRAY);
				alumnoPanel.setEntrevistas(0);
				alumnoPanel.setPagos(0);
				alumnoPanel.setTotalEntrevistasCiclo(0);
				alumnoPanel.setColorEntrevistas(ConstantesPaneles.GRAY);
				alumnoPanel.setColorPagos(ConstantesPaneles.GRAY);
			}
				
			modificarAlumnoPanelEA(alumnoPanel);
		}
		return alumnos;
	}



	/**
	 * Retorna el color correspondiente para el semaforo del IS1 dependiendo del estado del informe
	 * @param informeIS1
	 * @return
	 */
	private String obtenerColorIS1(InformeIS1 informe, long idAlumno){
		
		if(informe != null){
			if(informe.getEstado().equals(EstadoInforme.REVISION))
				return ConstantesPaneles.YELLOW;
			else
				return ConstantesPaneles.GREEN;
		}
		else{
			if(isHabilitableIS1(idAlumno))
				return ConstantesPaneles.RED;
			else
				return ConstantesPaneles.GRAY;
		}
	}
	
	/**
	 * Retorna el color correspondiente para el semaforo del is3 dependiendo del estado del informe
	 * @param informeis3
	 * @return
	 */
	private String obtenerColorIs3(InformeIS3 informeis3) {
			if(informeis3 != null){
				return (informeis3.getEstado().equals(EstadoInforme.CONSTRUCCION)?ConstantesPaneles.YELLOW:ConstantesPaneles.GREEN);
			}
			else
				return ConstantesPaneles.RED;
		}

	
	/**
	 * @param informe
	 * @param alumnoPanel
	 * @param fechaAltaBeca
	 * @param fecha1IS2
	 * @param fecha2IS2
	 * @param fechaLimite1
	 * @param fechaLimite2
	 * @return color del semaforo dependiendo del caso
	 */
	public String obtenerColorIS2(InformeIS2 informe, AlumnoPanelEA alumnoPanel, Date fechaAltaBeca, Date fecha1IS2,
			Date fecha2IS2, Date fechaLimite1, Date fechaLimite2){
		if(isHabilitableIS2(fechaAltaBeca, fecha1IS2, fecha2IS2, fechaLimite1, fechaLimite2)){
			if(informe != null){
				if(informe.getEstado().equals(EstadoInforme.CONSTRUCCION))
					return ConstantesPaneles.YELLOW;
				else
					return ConstantesPaneles.GREEN;
				
			}
			else
				return ConstantesPaneles.RED;
		}
		else
			return ConstantesPaneles.GRAY;
		
	}
	/**
	 * @param fechaAltaBeca
	 * @param fecha1IS2
	 * @param fecha2IS2
	 * @param fechaLimite1
	 * @param fechaLimite2
	 * @return true si puede habilitarse el is2.
	 */
	public Boolean isHabilitableIS2(Date fechaAltaBeca, Date fecha1IS2, Date fecha2IS2, Date fechaLimite1, Date fechaLimite2){
		Date fechaActual = new Date();
		Boolean isHabilitable = false;
		if(isEntreFechas(fechaActual, fechaAltaBeca, fecha1IS2, fechaLimite1))
			isHabilitable = true;
		
		else if(isEntreFechas(fechaActual, fechaAltaBeca, fecha2IS2, fechaLimite2))
			isHabilitable = true;
		
		if(isEntreFechas(fechaActual, fechaAltaBeca, fecha1IS2, fechaLimite1) || isEntreFechas(fechaActual, fechaAltaBeca, fecha2IS2, fechaLimite2))
			isHabilitable = true;
		
		return isHabilitable;
	}
	
	
	/**
	 * @param fechaActual
	 * @param fechaAltaBeca
	 * @param fechaIS2
	 * @param fechaLimite
	 * @return true si esta entre las fechas limites y pactadas del ciclo actual false en caso contrario
	 */
	public Boolean isEntreFechas(Date fechaActual, Date fechaAltaBeca, Date fechaIS2,Date fechaLimite){
		Boolean isEntreFechas = false;
		if(fechaActual.after(fechaIS2)){
			if(fechaAltaBeca.before(fechaLimite)){
				isEntreFechas = true;
			}
		}
		return isEntreFechas;
	}
	
	public Boolean isHabilitableIS1(long idAlumno){
		Boolean isHabilitable = false;
		PerfilAlumno alumno = srvAlumno.obtenerAlumno(idAlumno);
		if(alumno.getEstadoAlumno().equals(EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION)
				|| alumno.getEstadoAlumno().equals(EstadoAlumno.RENOVADO))
			isHabilitable = true;
				
		return isHabilitable;
	}
	
}
