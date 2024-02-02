package org.cimientos.intranet.servicio;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.cimientos.intranet.dao.PagoDao;
import org.cimientos.intranet.dao.PeriodoDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.utils.Formateador;
import org.cimientos.intranet.web.controller.PagoDTO;
import org.displaytag.properties.SortOrderEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cimientos.intranet.enumerativos.EstadoPago;

/**
 * @author msagarduy
 * 
 */
@Service
@Transactional
public class PagoSrv {

	@Autowired
	private PagoDao dao;
	
	@Autowired
	private PeriodoDao periodoDao;
	
	
	public List<Long> obtenerIdsPagos(Long[] pagoString){
		 List<Pago> pagos = dao.obtenerGrupo("id", Arrays.asList(pagoString));
		 List<Long> ids = new ArrayList<Long>();
		 for (Pago pago : pagos) {
			ids.add(pago.getId());
		}
		 return ids;
	}
	/**
	 * @param inicio
	 * @param fin
	 * @return
	 */
	public List<Pago> obtenerListaPagosFallidosRealizadosBecados(){
		return dao.obtenerFallidosRealizados();
	}
	
	/**
	 * @param inicio
	 * @param fin
	 * @return
	 */
	public List<Pago> obtenerListaEstadoPagoEntrevistadores(Date inicio, Date fin){
		return dao.obtenerPagosCriteria(inicio, fin, "becado");
	}
	
	/**
	 * @param inicio
	 * @param fin
	 * @return
	 */
	public List<Pago> obtenerListaAprobadosNoAprobados(Date inicio, Date fin){
		List<Pago> pagos = dao.obtenerPagosCriteria(inicio, fin, "ea");
		List<Pago> pagosAprobadosNoAprobados = new ArrayList<Pago>();
		for (Pago pago : pagos) {
			if (pago.getEstadoPago() == EstadoPago.APROBADO || pago.getEstadoPago() == EstadoPago.NO_APROBADO)
			{
				pagosAprobadosNoAprobados.add(pago);
			}
		}
		return pagosAprobadosNoAprobados;
	}
	
	/**
	 * @param idProperty
	 * @param ids
	 * @return
	 */
	public List<Pago> obtenerGrupo(String idProperty, List<Long> ids){
		return dao.obtenerGrupo("id", ids);
	}
	
	/**
	 * @param pago
	 */
	public void agregarPago(Pago pago){
		dao.guardar(pago);
		dao.flush();
	}
	
	/**
	 * @param pago
	 */
	public void eliminarPago(Pago pago){
		dao.eliminar(pago);
		dao.flush();
	}
	
	/**
	 * @param id
	 * @return
	 */
	public Pago obtenerPorId(long id){
		return dao.obtener(id);
	}
	
	/**
	 * @return
	 */
	public List<Pago> obtenerTodos(){
		return dao.obtenerTodos();
	}
	
	/**
	 * Retorna true si ya existe un pago para ese periodo para ese alumno 
	 * @param p
	 * @param periodo
	 * @return
	 */
	public boolean existePeriodo(PerfilAlumno p, Periodo periodo) {
		return dao.existePeriodo(p,periodo);
	}

	/**
	 * Retorna todos los pago de un alumno
	 * @param idAlumno
	 * @param list 
	 * @return
	 */
	public List<Pago> obtenerPagosPorAlumno(Long idAlumno, List<Long> list) {
		return dao.obtenerPagosPorAlumno(idAlumno, list);
	}
	
	/**
	 * @param bancoSeleccionado
	 * @return
	 */
	public List<PagoDTO> obtenerPagosBecasPorBanco(Banco banco) {
		List<PagoDTO> pagosDto = dao.obtenerPagosBecasPorBanco(banco);
		for (PagoDTO pago : pagosDto) {
			List<Periodo> periodos = periodoDao.obtenerGrupo("id",Formateador.toListOfLongs( pago.getIdPeriodos()));
			pago.setListaPeriodos(periodos);
		}
		return pagosDto;
	}
	/**
	 * @return
	 */
	public List<Pago> obtenerPagosBecas() {
		return dao.obtenerPagosBecas();
	}
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
	public List<PagoDTO> obtenerPagosFiltradosRealizadosPorBanco(Banco bancoSeleccionado, String becado, String ra, 
												CicloPrograma ciclo, Long periodoId, List<Long > zonaId, Long idEstadoCuenta, 
												int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {
		List<PagoDTO> pagosDto = dao.obtenerPagosRealizadosPorBanco(bancoSeleccionado, becado, ra, ciclo, periodoId, zonaId, idEstadoCuenta, firstResult, maxResults, sortDirection, sortCriterion);
		for (PagoDTO pago : pagosDto) {
			List<Periodo> periodos = periodoDao.obtenerGrupo("id",Formateador.toListOfLongs( pago.getIdPeriodos()));
			pago.setListaPeriodos(periodos);
		}
		return pagosDto;
	}
	
	
	public int obtenerCantidadPagosFiltradosAExportar(Banco bancoSeleccionado,
			String becado, String ra, CicloPrograma ciclo, Long periodoId, List<Long > zonaId, Long estadoPagoId) {
		
		Integer count = dao.obtenerCantidadPagosFiltradosAExportar(bancoSeleccionado, becado, ra, ciclo, periodoId, zonaId, estadoPagoId);
		
		return count;
	}
	
	/**
	 * @param listOfLongs
	 * @return
	 */
	public List<Pago> obtenerPagosPorAlumnos(List<Long> idsAlumnos) {
		return dao.obtenerPagosPorAlumnos(idsAlumnos);
	}
	/**
	 * @param parseLong
	 * @param fechaExportacion
	 * @return
	 */
	public List<Pago> obtenerPagosPorBecadoYFechaExportacion(Long idBecado,	Date fechaExportacion) {
		return dao.obtenerPagosPorBecadoYFechaExportacion(idBecado, fechaExportacion);
	}
	
	/**
	 * Retorna todos los pagos de los alumnos de el EA pasado. Se utiliza en el panel del RR
	 * @param idEA
	 * @param periodosIds
	 * @return
	 */
	public List<Pago> obtenerTodosPagosPorEa(Long idEA, List<Long> periodosIds) {
		return dao.obtenerTodosPagosPorEa(idEA, periodosIds);
	}

	public List<Pago> obtenerPagosSuspendidosPorAlumno(Long idAlumno) {
		return dao.obtenerPagosSuspendidos(idAlumno);
	}
	/**
	 * @param pagos
	 */
	public void guardarPagos(List<Pago> pagos) {
		dao.guardarPagos(pagos);
		dao.flush();
	}
	public int obtenerCantidadPagosBecadosFiltradosAExportar(
			Banco bancoSeleccionado, String becado, String ra, List<Long > zonaId, List<Long> idPeriodo, List<Integer> estadoCuentaId) {
		
		Integer count = dao.obtenerCantidadPagosBecadosFiltradosAExportar(bancoSeleccionado, becado, ra, zonaId, idPeriodo, estadoCuentaId);
		
		return count;
	}
	public List<PagoDTO> obtenerPagosBecadosFiltradosRealizadosPorBanco(Banco bancoSeleccionado, String becado, String ra, 
			List<Long > zonaId, List<Long > idPeriodo, List<Integer> idEstadoCuenta, int firstResult, int maxResults, SortOrderEnum sortDirection, 
			String sortCriterion) {
		
		List<PagoDTO> pagosDto = dao.obtenerPagosBecasFiltradasPorBanco(bancoSeleccionado, becado, ra, zonaId, idPeriodo, 
											idEstadoCuenta, firstResult, maxResults, sortDirection, sortCriterion);
		
		for (PagoDTO pago : pagosDto) {
			List<Periodo> periodos = periodoDao.obtenerGrupo("id",Formateador.toListOfLongs( pago.getIdPeriodos()));
			pago.setListaPeriodos(periodos);
		}
	return pagosDto;
	}
	
	
	public Boolean tienePagosAprobados(Long idAlumno){
		List<Pago> pagos = dao.obtenerPagosPorAlumno(idAlumno);
		Boolean tienePagosAprobados = false;
		for (Pago pago : pagos) 
		{
			if((pago.getEstadoPago().equals(EstadoPago.REALIZADO) 
				|| pago.getEstadoPago().equals(EstadoPago.SUSPENDIDO)
				|| pago.getEstadoPago().equals(EstadoPago.NO_APLICA)))
			{
				tienePagosAprobados = false;
			}
			else 
			{
				tienePagosAprobados = true;
				break;
			}
		}
		return tienePagosAprobados;
	}
	/**
	 * @param pagosSeleccionados
	 * @return
	 */
	public Double obtenerTotalPagos(List<Long> pagosSeleccionados) {
		return dao.obtenerTotalPagos(pagosSeleccionados);
	}
	
	/**
	 * Obtiene el monto total de los pagos filtrados
	 * @param bancoSeleccionado
	 * @param becado
	 * @param ra
	 * @param zonaId
	 * @param estadoCuentaId
	 * @return
	 */
	public Double obtenerMontoTotalPagosBecadosFiltradosAExportar(
			Banco bancoSeleccionado, String becado, String ra, List<Long > zonaId, List<Long > idPeriodo, List<Integer> estadoCuentaId){
		return dao.obtenerMontoTotalPagosBecadosFiltradosAExportar(bancoSeleccionado, becado, ra, zonaId, idPeriodo, estadoCuentaId);
	}
	
	
	/**
	 * @param bancoSeleccionado
	 * @param becado
	 * @param ra
	 * @param zonaId
	 * @param idEstadoCuenta
	 * @return
	 */
	public List<Long> obtenerIdsPagosBecasFiltrados(Banco bancoSeleccionado, String becado, String ra, 
						List<Long > zonaId, List<Long> idPeriodo, List<Integer> idEstadoCuenta) {
		return dao.obtenerIdsPagosBecasFiltrados(bancoSeleccionado, becado, ra, zonaId, idPeriodo, idEstadoCuenta);
	}
	
	/**
	 * Obtiene el monto total de los pagos filtrados para pagos anteriores
	 * @param bancoSeleccionado
	 * @param becado
	 * @param ra
	 * @param periodoId
	 * @param zonaId
	 * @param estadoPagoId
	 * @return
	 */
	public Double obtenerMontoTotalPagosBecadosFiltradosAnteriores(
			Banco bancoSeleccionado, String becado, String ra, CicloPrograma ciclo, Long periodoId,
			List<Long > zonaId, Long estadoPagoId){
		return dao.obtenerMontoTotalPagosBecadosFiltradosAnteriores(bancoSeleccionado, becado, ra, ciclo, periodoId, zonaId, estadoPagoId);
	}
	
	/**
	 * Calcula la cantidad de pagos inconclusos, es decir, los pagos que estan es estado aprobado. Se utiliza para saber
	 * si se puede cerrar un ciclo
	 * @return
	 */
	public int obtenerCantidadPagosInconclusos() {
		return dao.obtenerCantidadPagosInconclusos();
	}
	

	public void actualzarPagosRA(Long idAlumno, Long idRA) {
		dao.actualzarPagosRA(idAlumno,idRA);
	}
	
	
	public Double obtenerTotalPagosPeriodo(List<Long> pagosSeleccionados, List<Long>periodosSeleccionados) {
		return dao.obtenerTotalPagosPeriodo(pagosSeleccionados,periodosSeleccionados);
	}
	
	public List<Pago> obtenerPagosPorAlumnosPeriodo(List<Long> idsAlumnos, List<Long> periodosSeleccionados){
		return dao.obtenerPagosPorAlumnosPeriodo(idsAlumnos, periodosSeleccionados);
	}
	
	public void clearObjetoCache(){
		dao.clear();
	}
	
	public void guardarPago(Pago pago){
		dao.guardar(pago);
		dao.flush();
	}
	
	public List<Pago> obtenerPagosPorAlumnoDecreciente(Long idAlumno, List<Long> list) {
		return dao.obtenerPagosPorAlumnoDecreciente(idAlumno, list);
	}
	
	public List<Pago> obtenerPagoPorAlumnoPorPeriodo(Long idAlumno, Long idPeriodo){
		return dao.obtenerPagoPorAlumnoPorPeriodo(idAlumno, idPeriodo);
	}
	
	public int obtenerCantidadListaPagosBecados(Banco bancoSeleccionado,
			String becado, String ra, CicloPrograma ciclo, List<Long> periodoId, List<Long> zonaId, List<Integer> estadoPagoId, 
			List<Integer> estadoCuentaId) {
		
		Integer count = dao.obtenerCantidadListaPagosBecados(bancoSeleccionado, becado, ra, ciclo, periodoId, zonaId, estadoPagoId, estadoCuentaId);
		
		return count;
	}
	
	public List<PagoDTO> obtenerPagosBecadosPorBanco(Banco bancoSeleccionado, String becado, String ra, 
			CicloPrograma ciclo, List<Long> periodoId, List<Long> zonaId, List<Integer> idEstadoPago, List<Integer> idEstadoCuenta, 
			int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {
		List<Pago> pagos = dao.obtenerPagosBecadosPorBanco(bancoSeleccionado, becado, ra, ciclo, periodoId, zonaId, idEstadoPago, 
				idEstadoCuenta, firstResult, maxResults, sortDirection, sortCriterion);
		return this.cargarPagoBecado(pagos);
	}
	
	public Double obtenerMontoTotalListaPagosBecados(Banco bancoSeleccionado, String becado, String ra, CicloPrograma ciclo, List<Long> periodoId,
			List<Long> zonaId, List<Integer> estadoPagoId, List<Integer> estadoCuentaId){
		return dao.obtenerMontoTotalListaPagosBecados(bancoSeleccionado, becado, ra, ciclo, periodoId, zonaId, estadoPagoId, estadoCuentaId);
	}
	
	private List<PagoDTO> cargarPagoBecado(List<Pago> pagos){
		List<PagoDTO> pagoBecados = new ArrayList<PagoDTO>();
		PagoDTO pagoBecado = null;
		for(Pago pago : pagos){
			pagoBecado = new PagoDTO();
			pagoBecado.setId(pago.getId());
			pagoBecado.setBecado(pago.getBecado());
			pagoBecado.setEstadoPago(pago.getEstadoPago());
			pagoBecado.setExtra(pago.getExtra());
			pagoBecado.setFechaExportacion(pago.getFechaExportacion());
			pagoBecado.setMonto(pago.getMonto());
			pagoBecado.setPeriodo(pago.getPeriodo());
			pagoBecado.setResponsable(pago.getRa());
			pagoBecado.setMotivo(pago.getMotivo());
			pagoBecado.setCicloNombre(pago.getPeriodo().getCiclo().getNombre());
			pagoBecados.add(pagoBecado);
		}
		return pagoBecados;
	}
	

	/**
	 * @param idBecas
	 * @param ciclo
	 * Dada un pago, se modifica el estado del mismo segun el parametro estado
	 */
	public void modificarEstadoPago(Pago pagoBecado, EstadoPago estadoNuevo) {

		if(estadoNuevo.equals(EstadoPago.REALIZADO) || estadoNuevo.equals(EstadoPago.FALLIDO) || estadoNuevo.equals(EstadoPago.CORREGIDO))
			pagoBecado.setFechaExportacion(new Date());
		else
			if(estadoNuevo.equals(EstadoPago.APROBADO))
				pagoBecado.setFechaExportacion(null);
		
		pagoBecado.setEstadoPago(estadoNuevo);		
		this.agregarPago(pagoBecado);
	}
	
	public List<Pago> obtenerPagosPorAlumnoPeriodo(Long idAlumno, List<Long> periodosSeleccionados){
		return dao.obtenerPagosPorAlumnoPeriodo(idAlumno, periodosSeleccionados);
	}
}
