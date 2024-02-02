/**
 * 
 */
package org.cimientos.intranet.dao;

import java.util.Date;
import java.util.List;

import org.cimientos.intranet.dao.base.Dao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.web.controller.PagoDTO;
import org.displaytag.properties.SortOrderEnum;

/**
 * @author msagarduy
 * 
 */
public interface PagoDao extends Dao<Pago>{

	public List<Pago> obtenerPagosDeBecados(String inicio, String fin);
	
	public List<Pago> obtenerPagosSuspendidos(Long idAlumno);
	
	public List<Pago> obtenerPagosCriteria(Date inicio, Date fin, String tipoPago);

	public List<Pago> obtenerFallidosRealizados();
	
	public boolean existePeriodo(PerfilAlumno p, Periodo periodo);

	public List<Pago> obtenerPagosPorAlumno(Long idAlumno, List<Long> list);

	/**
	 * Obtiene los pagos de becas por banco con estado aprobado y no aprobado
	 * @param banco
	 * @return lista de pagos
	 */
	public List<PagoDTO> obtenerPagosBecasPorBanco(Banco banco);

	/**
	 * Obtiene todos los pagos de becas con estado aprobado y no aprobado
	 * @return lista de pagos
	 */
	public List<Pago> obtenerPagosBecas();

	/**
	 * @param bancoSeleccionado
	 * @param sortCriterion 
	 * @param sortDirection 
	 * @param maxResults 
	 * @param firstResult 
	 * @param idEstadoCuenta 
	 * @param zonaId 
	 * @param periodoId 
	 * @param ra 
	 * @param becado 
	 * @return
	 */
	public List<PagoDTO> obtenerPagosRealizadosPorBanco(Banco bancoSeleccionado, String becado, String ra, CicloPrograma ciclo, Long periodoId, 
								List<Long > zonaId, Long idEstadoCuenta, int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion);

	/**
	 * @param idsAlumnos
	 * @return
	 */
	public List<Pago> obtenerPagosPorAlumnos(List<Long> idsAlumnos);

	/**
	 * @param idBecado
	 * @param fechaExportacion
	 * @return
	 */
	public List<Pago> obtenerPagosPorBecadoYFechaExportacion(Long idBecado,
			Date fechaExportacion);

	public List<Pago> obtenerTodosPagosPorEa(Long idEA, List<Long> periodosIds);

	/**
	 * @param pagos
	 */
	public void guardarPagos(List<Pago> pagos);

	public Integer obtenerCantidadPagosFiltradosAExportar(Banco bancoSeleccionado, String becado, String ra, CicloPrograma ciclo, Long periodoId,
			List<Long > zonaId, Long estadoPagoId);

	public Integer obtenerCantidadPagosBecadosFiltradosAExportar(
			Banco bancoSeleccionado, String becado, String ra, List<Long > zonaId, List<Long > idPeriodo, List<Integer> estadoCuentaId);

	public List<PagoDTO> obtenerPagosBecasFiltradasPorBanco(Banco bancoSeleccionado, String becado, String ra, 
			List<Long > zonaId, List<Long > idPeriodo,
			List<Integer> idEstadoCuenta, int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion);

	
	public List<Pago> obtenerPagosPorAlumno(Long idAlumno);

	/**
	 * @param pagosSeleccionados
	 * @return
	 */
	public Double obtenerTotalPagos(List<Long> pagosSeleccionados);
	
	public Double obtenerMontoTotalPagosBecadosFiltradosAExportar(
			Banco bancoSeleccionado, String becado, String ra, List<Long > zonaId, List<Long > idPeriodo, List<Integer> estadoCuentaId);
	
	public List<Long> obtenerIdsPagosBecasFiltrados(Banco bancoSeleccionado, String becado, String ra, 
			List<Long > zonaId, List<Long > idPeriodo, List<Integer> idEstadoCuenta);
	
	public Double obtenerMontoTotalPagosBecadosFiltradosAnteriores(
			Banco bancoSeleccionado, String becado, String ra, CicloPrograma ciclo, Long periodoId,
			List<Long > zonaId, Long estadoPagoId);

	public int obtenerCantidadPagosInconclusos();

	public void actualzarPagosRA(Long idAlumno, Long idRA);
	
	public Double obtenerTotalPagosPeriodo(List<Long> pagosSeleccionados, List<Long> periodosSeleccionados);
	
	public List<Pago> obtenerPagosPorAlumnosPeriodo(List<Long> idsAlumnos, List<Long> periodosSeleccionados);

	public List<Pago> obtenerPagosPorAlumnoDecreciente(Long idAlumno, List<Long> periodosIds);
	
	public List<Pago> obtenerPagoPorAlumnoPorPeriodo(Long idAlumno, Long idPeriodo);
	
	public List<Pago> obtenerPagosPorAlumnoPeriodo(Long idAlumno, List<Long> periodosSeleccionados);

	public Integer obtenerCantidadListaPagosBecados(Banco bancoSeleccionado, String becado,String ra, CicloPrograma ciclo, List<Long> periodoId, 
			List<Long> zonaId, List<Integer> estadoPagoId, List<Integer> estadoCuentaId);
	
	public List<Pago> obtenerPagosBecadosPorBanco(Banco bancoSeleccionado, String becado, String ra, CicloPrograma ciclo, List<Long> periodoId, 
			List<Long > zonaId, List<Integer> idEstadoPago, List<Integer> idEstadoCuenta, int firstResult, int maxResults, SortOrderEnum sortDirection, 
			String sortCriterion);
	
	public Double obtenerMontoTotalListaPagosBecados(Banco bancoSeleccionado, String becado, String ra, CicloPrograma ciclo, List<Long> periodoId,
			List<Long> zonaId, List<Integer> estadoPagoId, List<Integer> estadoCuentaId);
}
