package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.cimientos.intranet.dao.PeriodoDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.utils.PeriodoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author msagarduy
 * 
 */
@Service
@Transactional
public class PeriodoSrv {

	@Autowired
	private PeriodoDao dao;
	
	/**
	 * Persiste un periodo en la base de datos.
	 * 
	 * @param periodo
	 */
	public void agregarPeriodo(Periodo periodo) {
		dao.guardar(periodo);
		dao.flush();
	}

	/**
	 * Elimina un periodo de la base de datos.
	 * 
	 * @param periodo
	 */
	public void eliminarPeriodo(Periodo periodo) {
		dao.eliminar(periodo);
		dao.flush();
	}

	/**
	 * Recupera un periodo por id de la base de datos.
	 * 
	 * @param id
	 * @return periodo
	 */
	public Periodo obtenerPeriodo(long id) {
		return dao.obtener(id);
	}

	/**
	 * Recupera todos los periodos persistidos.
	 * 
	 * @return una Lista de periodos que representa a todos los objetos persistidos.
	 */
	public List<Periodo> obtenerTodos() {
		return dao.obtenerTodos();
	}
	
	public boolean obtenerPorNombre(String nombre){
		Periodo periodo = dao.obtenerPorNombre(nombre);
		return periodo != null;
	}
	
	/**
	 * Recupera la lista de los periodos en base a la lista de ids de periodos.
	 * @param periodosIds
	 * @return la lista de periodos en base a los ids de los mismos
	 */
	public List<Periodo> obtenerGrupo(List<Long> periodosIds){
		return dao.obtenerGrupo("id", periodosIds);
	}
	
	/**
	 * Retorna true si existen periodos asociados a un ciclo y false en caso contrario
	 * @param nombresPeriodos
	 * @return 
	 */
	public boolean obtenerPeriodo(List<String> nombresPeriodos){
		List<Periodo> periodo = dao.obtenerPorPeriodos(nombresPeriodos);
		return periodo != null;
	}
	
	public List<String> obtenerNombresPeriodos(List<Long> periodosIds){
		 List<Periodo> periodos = dao.obtenerGrupo("id", periodosIds);
		 List<String> nombres = new ArrayList<String>();
		 for (Periodo periodo : periodos) {
			nombres.add(periodo.getNombre());
		}
		 return nombres;
	}
	
	/**
	 * Retorna true si existen periodos asociados al ciclo existente y false en caso contrario
	 * @param ciclo
	 * @param nombresPeriodos
	 * @return
	 */
	public boolean obtenerPeriodoConCicloExistente(CicloPrograma ciclo, List<String> nombresPeriodos){
		List<Periodo> periodo = dao.obtenerPorPeriodoExistente(ciclo, nombresPeriodos);
		return periodo != null;
	}
	
	/**
	 * retorna true si existe y false en caso contrario
	 * @param nombre
	 * @param id
	 * @return
	 */
	public boolean buscarPeriodoPorNombre(String nombre, String id)	{
		Periodo periodoExiste =  dao.obtenerPeriodoSiExiste(nombre, id);
		return periodoExiste != null;
	}
	
	public List<Periodo> buscarPeriodosPorCiclo(Long idCiclo){
		return dao.buscarPeriodosPorCiclo(idCiclo);
	}

	public List<Periodo> buscarPeriodosPorCiclo(List<Long> idCiclo){
		List<Periodo> valor = new ArrayList<Periodo>();
		
		for(Long item:idCiclo){
			valor.addAll(dao.buscarPeriodosPorCiclo(item));
		}
		
		return valor;
	}

	/**
	 * Reordena los periodos de un ciclo y los guarda
	 * @param periodos
	 */
	public void reordenarPeriodos(List<Periodo> periodos) {
		PeriodoHelper.reordenarPeriodos(periodos);
		dao.guardar(periodos);
	}
	
	/**
	 * Obtener periodo por fecha.
	 *
	 * @param date the date
	 * @return the periodo
	 * @since 18-feb-2011
	 * @author cfigueroa
	 */
	public Periodo obtenerPeriodoPorFecha(Date date){
		return dao.obtenerPeriodoPorFecha(date);
	}

	public String obtenerDeBecaAlumno(Long idAlumno) {
		return dao.obtenerDeBecaAlumno(idAlumno);
	}
	
	public Periodo obtenerPeriodoPorFechaFP(Date date){
		return dao.obtenerPeriodoPorFechaFP(date);
	}
	
	public List<Periodo> obtenerPeriodosBeca(Periodo periodoDesde, Periodo periodoHasta){
		return dao.buscarPeriodosBeca(periodoDesde, periodoHasta);
	}

}
