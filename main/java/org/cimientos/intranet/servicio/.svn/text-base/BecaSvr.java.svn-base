package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.cimientos.intranet.dao.BecaDao;
import org.cimientos.intranet.modelo.Beca;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.EstadoBeca;
import org.cimientos.intranet.modelo.EstadoCuenta;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.perfil.AlumnoPanelEA;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.modelo.seleccion.EntrevistaSeleccion;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.cimientos.intranet.utils.PeriodoHelper;
import org.displaytag.properties.SortOrderEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.googlecode.ehcache.annotations.Cacheable;

/**
 * @author plabaronnie
 * Clase utilizada para el manejo de la logica de negocios del objeto Beca
 */
@Service
@Transactional
public class BecaSvr {
	@Autowired
	BecaDao dao;
	
	@Autowired
	private AlumnoSrv alumnoSrv;

	@Autowired
	private AlumnoPanelEASrv alumnoPanelSrv;
	
	@Autowired
	private EntrevistaSeleccionSrv entrevistaSeleccionSrv;
	
	@Autowired
	private CicloProgramaSrv cicloSrv;
	/**
	 * registra o actualiza un beca
	 * 
	 * @param beca
	 */
	public void guardarBeca(Beca beca) {
		if(beca.getId() == null){
			beca.setCantidadAsignada(0);
		}
		dao.guardar(beca);
		dao.flush();
	}
	
	/**
	 * elimina un beca
	 * 
	 * @param beca
	 */
	public void eliminarBeca(Beca beca){
		dao.eliminar(beca);
		dao.flush();
	}
	
	
	/**
	 * retorna un beca en base a su id
	 * 
	 * @param id
	 * @return el beca encontrado por id
	 */
	public Beca obtenerPorId(long id) {
		return dao.obtener(id);
	}
	
	
	/**
	 * retorna todos los becas
	 * 
	 * @return la lista de todos los becas persistidos
	 */
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.Beca")
	public List<Beca> obtenerTodos() {
		return dao.obtenerBecasActivas();
	}

	/**
	 * Asigna a cada alumno la beca y la beca la lista de becados
	 * 
	 * @param becaSeleccionada la beca a asignar
	 * @param becados los becados a asignar a la beca
	 * @param periodo del cual se saca la fecha de alta beca
	 */
	public void asignarAlumnosBeca(Beca becaSeleccionada,List<PerfilAlumno> becados, Periodo periodo){
		EntrevistaSeleccion entrevistaSeleccion = null;
		Integer cantidad = becaSeleccionada.getCantidadAsignada();
		List<Periodo> periodos = cicloSrv.obtenerCicloActual().getPeriodos();
		for (PerfilAlumno perfilAlumno : becados){
			entrevistaSeleccion = entrevistaSeleccionSrv.obtenerEntrevistaSeleccionPorAlumnoAprobado(perfilAlumno);	
			if(perfilAlumno.getPeriodoDeBaja()!= null){ //es un chico que se quiere reincorporar					
				if(periodos.contains(perfilAlumno.getPeriodoDeBaja())){// se dio de baja en este ciclo
					if(periodo.getOrden() > perfilAlumno.getPeriodoDeBaja().getOrden()){ //fecha de alta en el periodo seleccionado
						perfilAlumno.setFechaAltaBeca(periodo.getFechaInicio());
						entrevistaSeleccion.setNombrePeriodo(periodo.getNombre());
					}
					else{// tengo que asignarle la beca en el siguiente periodo al de baja
						Periodo periodoAAsignar = PeriodoHelper.obtenerPeriodoPorOrden(periodos,perfilAlumno.getPeriodoDeBaja().getOrden()+1);
						perfilAlumno.setFechaAltaBeca(periodoAAsignar.getFechaInicio());
						entrevistaSeleccion.setNombrePeriodo(periodoAAsignar.getNombre());
					}
				}
				else{ //se dio de baja en otro ciclo
					perfilAlumno.setFechaAltaBeca(periodo.getFechaInicio());
					entrevistaSeleccion.setNombrePeriodo(periodo.getNombre());
				}				
				entrevistaSeleccionSrv.guardarEntrevista(entrevistaSeleccion);
				perfilAlumno.setPeriodoDeBaja(null);
				perfilAlumno.setMotivoBaja(null);
				perfilAlumno.setFechaBaja(null);
			}
			else{ // es un chico nuevo
				perfilAlumno.getResponsable1().setEstadoCuenta(EstadoCuenta.NO_SOLICITADA);
				perfilAlumno.setFechaAltaBeca(periodo.getFechaInicio());
				entrevistaSeleccion.setNombrePeriodo(periodo.getNombre());
			}
			perfilAlumno.setBeca(becaSeleccionada);
			perfilAlumno.setEstadoAlumno(EstadoAlumno.ALTA_BECADO);
			alumnoSrv.modificarAlumno(perfilAlumno);
			cantidad ++; 
		}
		becaSeleccionada.getBecados().addAll(becados);
		becaSeleccionada.setCantidadAsignada(cantidad);
		
		dao.guardar(becaSeleccionada);
		dao.flush();
	}

	/**
	 * retorna las becas cuyo cupo aun no esta completo
	 * 
	 * @return la lista de las becas con cupo
	 */
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.Beca")
	public List<Beca> obtenerBecasConCupo() {
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(new Date());
		int anioActual = calendar.get(Calendar.YEAR);
		return dao.obtenerBecasConCupo(anioActual);
	}

	/**
	 * Asigna a cada alumno la beca y a la beca la lista de becados.
	 * Cambia el estado del alumno 
	 * @param becaSeleccionada
	 * @param becados
	 */
	public void renovarAlumnosBeca(Beca becaSeleccionada,List<PerfilAlumno> becados) {
		AlumnoPanelEA alumnoPanel = null;		
		for (PerfilAlumno perfilAlumno : becados) {
			//primero se guarda la beca y el boletin del año anterior en el historial
			Beca becaAnterior = perfilAlumno.getBeca();
			perfilAlumno.getHistorialBeca().add(becaAnterior);
			
			//Verifica si el ea de cada alumno no ha cambiado de zona (despues de la asig del becado). 
			//Si es asi se lo agrega al historial de eas y se le setea el ea en null
			List<ZonaCimientos> zonasEa = perfilAlumno.getEa().getZona();
			ZonaCimientos zonaAlumno = perfilAlumno.getEscuela().getLocalidad().getZona();
			if(!zonasEa.contains(zonaAlumno)){
				//por si ya existe dicho ea en el historial de eas
				if(!perfilAlumno.getHistorialEa().contains(perfilAlumno.getEa())){
					perfilAlumno.getHistorialEa().add(perfilAlumno.getEa());
				}
				perfilAlumno.setEa(null);
				alumnoPanel = alumnoPanelSrv.obtenerAlumnoPanelPorIdPerfilAlumno(perfilAlumno.getId());
				alumnoPanel.setIdPerfilEA(null);
				alumnoPanelSrv.modificarAlumnoPanelEA(alumnoPanel);
			}
			
			//recien despues setea la beca renovada
			perfilAlumno.setBeca(becaSeleccionada);

			//La fecha de alta beca para las renovaciones es siempre el dia de inicio del primer periodo del ciclo
			perfilAlumno.setFechaAltaBeca(becaSeleccionada.getCiclo().getPeriodos().get(0).getFechaInicio());
			perfilAlumno.setEstadoAlumno(EstadoAlumno.PENDIENTE_RENOVACION_CON_ASIGNACION);
			becaSeleccionada.setCantidadAsignada(becaSeleccionada.getCantidadAsignada() + 1);
		}
		becaSeleccionada.getBecados().addAll(becados);
		dao.guardar(becaSeleccionada);
		dao.flush();		
	}

	/**
	 * @param becaSeleccionada
	 * @return
	 */
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.Beca")
	public Beca obtenerMismaBecaCicloAnterior(Beca becaSeleccionada) {
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(becaSeleccionada.getCiclo().getFechaInicio());
		int anioCicloAnterior = calendar.get(Calendar.YEAR) - 1;
		return dao.buscarBecaCorrespondienteCicloAnterior(becaSeleccionada.getPadrino(), 
				becaSeleccionada.getZona(), anioCicloAnterior);
	}
	
	/**
	 * Obtener becas  por periodo.
	 *
	 * @param periodo the periodo
	 * @return the list
	 * @since 29-dic-2010
	 * @author cfigueroa
	 */
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.Beca")
	public List<Beca> obtenerPorPeriodo(Periodo periodo) {
		return dao.obtenerBecasPorPeriodo(periodo);
	}
	
	/**
	 * Obtener becas ultimo anio escolar por zona.
	 *
	 * @param idPeriodo the id periodo
	 * @param idZona the id zona
	 * @return the integer
	 * @since 29-dic-2010
	 * @author cfigueroa
	 */
	public Integer obtenerBecasUltimoAnioEscolarPorZona(Long idPeriodo , Long idZona){
		return dao.cantidadBecasUltimoAnioEscolarPorZona(idPeriodo ,idZona);
	}
	
	/**
	 * Obtener becas cesadas por zona.
	 *
	 * @param idPeriodo the id periodo
	 * @param idZona the id zona
	 * @return the integer
	 * @since 29-dic-2010
	 * @author cfigueroa
	 */
	public Integer obtenerBecasCesadasPorZona(Long idPeriodo , Long idZona){
		return dao.cantidadBecasCesadasPorZona( idPeriodo , idZona);
	}
	
	/**
	 * Obtiene todas las becas cuyo ciclo es el actual.
	 * @return la lista de becas con ciclo actual
	 */
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.Beca")
	public List<Beca> obtenerBecasCicloActual(){
		return dao.obtenerBecasCicloActual();
	}

	/**
	 * Obtiene todas las becas cuyo ciclo es el actual y tienen becados asignados.
	 * @return la lista de becas con ciclo actual
	 */
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.Beca")
	public List<Beca> obtenerBecasCicloActualParaReasignacion(){
		return dao.obtenerBecasCicloActualParaReasignacion();
	}

	/**
	 * @param becaSeleccionada
	 * @param becados
	 */
	public void reasignarAlumnosBeca(Beca becaSeleccionada,	List<PerfilAlumno> becados) {
		//se agregaron estas validaciones porque no refrescaba la grilla con las cantidades 
		for (PerfilAlumno perfilAlumno : becados) {
			if(perfilAlumno.getBeca() != null){
				perfilAlumno.getBeca().setCantidadAsignada(perfilAlumno.getBeca().getCantidadAsignada() -1);
				perfilAlumno.getBeca().getBecados().remove(perfilAlumno);
				alumnoSrv.agregarAlumno(perfilAlumno);
				
			}
			if(!becaSeleccionada.getBecados().contains(perfilAlumno)){
				becaSeleccionada.setCantidadAsignada(becaSeleccionada.getCantidadAsignada() + 1);
				perfilAlumno.setBeca(becaSeleccionada);
				becaSeleccionada.getBecados().add(perfilAlumno);
			}
		}
		dao.guardar(becaSeleccionada);
		dao.flush();
		
	}


	/**
	 * Cantida becas por estados.
	 *
	 * @param estadoBecas the estado becas
	 * @return the integer
	 * @since 04-may-2011
	 * @author cfigueroa
	 */
	public Integer cantidadBecasPorEstados(List<EstadoBeca> estadoBecas) {
		return dao.cantidadBecasPorEstados(estadoBecas);
	}	

	/**
	 * @param ciclo
	 * @param idTipo
	 * @param idEstado
	 * @param idPeriodo
	 * @param tipoBecaId
	 * @param padrinoId
	 * @param zonaId
	 * @param total - se utiliza para saber si se quiere paginar o no. Para el clonar becas se pasa en 'true' para que traiga todos los resultados
	 * @param becaClonada 
	 * @return
	 */
	public int obtenerCantidadEntrevistasAExportar(CicloPrograma ciclo,
			Integer idTipo, Integer idEstado, Long idPeriodo,
			Integer tipoBecaId, Long padrinoId, Long zonaId,boolean total, Boolean becaClonada) {
		
		return dao.obtenerCantidadBecasAExportar(ciclo, idTipo, idEstado,  
				idPeriodo, tipoBecaId, padrinoId, zonaId,total, becaClonada);
	}

	/**
	 * @param ciclo
	 * @param idTipo
	 * @param idEstado
	 * @param idPeriodo
	 * @param tipoBecaId
	 * @param padrinoId
	 * @param zonaId
	 * @param total - se utiliza para saber si se quiere paginar o no. Para el clonar becas se pasa en 'true' para que traiga todos los resultados
	 * @param becaClonada 
	 * @param i
	 * @param totalRows
	 * @param sortDirection
	 * @param sortCriterion
	 * @return
	 */
	public List<Beca> obtenerBecasAExportar(CicloPrograma ciclo,
			Integer idTipo, Integer idEstado, Long idPeriodo,
			Integer tipoBecaId, Long padrinoId, Long zonaId, boolean total, Boolean becaClonada, int pagesize,
			int totalRows, SortOrderEnum sortDirection, String sortCriterion) {
		return dao.obtenerBecasAExportar(ciclo, idTipo, idEstado,  idPeriodo, tipoBecaId, padrinoId, zonaId, total, becaClonada,
				pagesize,totalRows, sortDirection, sortCriterion);
	}

	
	/**
	 * Dada una lista de id de becas, las clona en estado estimas para el primer periodo del proximo ciclo
	 * @param idBecas
	 * @param ciclo 
	 */
	public void clonarBecas(List<Long> idBecas, CicloPrograma ciclo) {
		List<Beca> becas = dao.obtenerGrupo("id", idBecas);
		List<Beca> clones = new ArrayList<Beca>();
		Beca b = null;
		for (Beca beca : becas) {
			b = new Beca();
			b.setActivo(true);
			b.setCantidad(beca.getCantidad());
			b.setCantidadAsignada(0);
			b.setCiclo(ciclo);
			b.setPeriodoPago(ciclo.getPeriodos().get(0));
			b.setComentarios(beca.getComentarios());
			b.setEstado(EstadoBeca.PLANIFICADA);
			b.setFechaAlta(new Date());
			b.setPadrino(beca.getPadrino());
			b.setTipo(beca.getTipo());
			b.setZona(beca.getZona());
			beca.setClonada("SI - " + ciclo.getNombre());
			clones.add(b);
		}
		dao.guardar(clones);
		dao.guardar(becas);
	}

	/**
	 * Recupera todas las becas que esten en condiciones de hacer una reasignacion automatica. Son aquellas que tienen mayor o igual cantidad
	 * disponible que alumnos a renovar
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<Beca> obtenerBecasCicloActualPorFecha(Date fecha) {
		return dao.obtenerBecasCicloActualPorFecha(fecha);
	}
	
	public List<Beca> obtenerBecaPorCicloPorZona(ZonaCimientos zona, Long ciclo){
		return dao.buscarBecaPorCicloPorZona(zona, ciclo);
	}
}
