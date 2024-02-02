package org.cimientos.intranet.dao.impl;


import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.cimientos.intranet.dao.PagoDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.EstadoCuenta;
import org.cimientos.intranet.modelo.Pago;
import org.cimientos.intranet.modelo.Periodo;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.perfil.EstadoAlumno;
import org.cimientos.intranet.modelo.perfil.PerfilAlumno;
import org.cimientos.intranet.servicio.AlumnoSrv;
import org.cimientos.intranet.servicio.PeriodoSrv;
import org.cimientos.intranet.utils.ConstantesDisplayTagSorting;
import org.cimientos.intranet.web.controller.PagoDTO;
import org.displaytag.properties.SortOrderEnum;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.hibernate.type.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cimientos.intranet.enumerativos.EstadoPago;

/**
 * @author msagarduy
 * 
 */
@Repository
public class PagoDaoImpl extends SpringHibernateDao<Pago> implements PagoDao
{
	private static final Logger log = Logger.getLogger(PagoDaoImpl.class);

	 @Autowired
	 private AlumnoSrv srvAlumno;
	 
	 @Autowired
	 private PeriodoSrv srvPeriodo;
	 
	 
	 
	/**
	 * @param sessionFactory
	 */
	@Autowired
	public PagoDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<Pago> getObjetoManejado() {
		return Pago.class;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PagoDao#obtenerPagosDeBecados(java.lang.Long)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Pago> obtenerPagosDeBecados(String inicio, String fin) {
		
		List<Pago> pagos = new LinkedList<Pago>();
		String sql = "SELECT pa.id, pe.id FROM persona as p \n"
				+ "JOIN perfilalumno AS pa ON p.idPersona = pa.id \n"
				+ "JOIN beca as b ON b.id = pa.beca_id \n"
				+ "JOIN periodo as pe ON b.periodoPago_id = pe.id \n"
				+ "WHERE (pa.estadoAlumno = 0) AND (pe.fechaInicio ='" + inicio 
				+ "' AND pe.fechaFin =' " +fin  +"') \n"
				+ "GROUP BY pa.id";
		Query query = getSession().createSQLQuery(sql);
		PerfilAlumno becado = null;
		Periodo periodo = null;
		List<Object[]> rs = query.list();
		for (Object[] row : rs) {
			Long idBecado = ((BigInteger) row[0]).longValue();
			Long idPeriodo = ((BigInteger) row[1]).longValue();
			becado = srvAlumno.obtenerAlumno(idBecado);
			periodo = srvPeriodo.obtenerPeriodo(idPeriodo);
		
			pagos.add(new Pago(becado,periodo));
		}
		return pagos;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pago> obtenerPagosCriteria(Date inicio, Date fin, String tipoPago) {
		
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("periodo", "periodo");
		
		criteria.add(Restrictions.or(Restrictions.or(Restrictions.and((Restrictions.ge("periodo.fechaInicio", inicio)),(Restrictions.le("periodo.fechaInicio", fin))),
				(Restrictions.and((Restrictions.ge("periodo.fechaFin", inicio)),(Restrictions.le("periodo.fechaFin", fin))))),
				Restrictions.or(Restrictions.and((Restrictions.le("periodo.fechaInicio", inicio)),(Restrictions.ge("periodo.fechaFin", fin))),
						(Restrictions.and((Restrictions.ge("periodo.fechaInicio", inicio)),(Restrictions.le("periodo.fechaFin", fin)))))));
			
		criteria.add(Restrictions.isNull(tipoPago));
		final List<Pago> pagos = getHibernateTemplate().findByCriteria(criteria);
		return pagos;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Pago> obtenerFallidosRealizados() 
	{
		String sql = "SELECT * FROM pago as p \n"
				+ "WHERE (p.estadoPago = 1) OR (p.estadoPago = 3) AND (p.ea_idPerfilEA is null) \n" 
				+ "GROUP BY p.periodo_id";	
		List<Pago> pagos = new LinkedList<Pago>();
		Query query = getSession().createSQLQuery(sql);
		PerfilAlumno becado = null;
		Double monto = null;
		Double extra = null;
		Periodo periodo = null;
		List<Object[]> rs = query.list();
		for (Object[] row : rs) {
			Long idBecado = ((BigInteger) row[5]).longValue();
			Long idPeriodo = ((BigInteger) row[7]).longValue();
			monto = ((Float) row[3]).doubleValue();
			extra = ((Double) row[8]).doubleValue();
			becado = srvAlumno.obtenerAlumno(idBecado);
			periodo = srvPeriodo.obtenerPeriodo(idPeriodo);
			Pago pago = new Pago(becado, periodo);
			pago.setMonto(monto);
			pago.setExtra(extra);
			pagos.add(pago);
		}
		return pagos;
		
	}
	
	@Override
	public boolean existePeriodo(PerfilAlumno p, Periodo periodo) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("periodo", "periodo");
		criteria.createAlias("becado", "becado");
		criteria.add(Restrictions.eq("periodo", periodo)).add(Restrictions.eq("becado", p));
		return !getHibernateTemplate().findByCriteria(criteria).isEmpty();
	}

	@Override
	public List<Pago> obtenerPagosPorAlumno(Long idAlumno, List<Long> periodosIds) {
		List<EstadoPago> estados = new ArrayList<EstadoPago>();
		estados.add(EstadoPago.APROBADO);
		estados.add(EstadoPago.SUSPENDIDO);
		estados.add(EstadoPago.NO_APLICA);
		estados.add(EstadoPago.FALLIDO);
		estados.add(EstadoPago.CORREGIDO);
		estados.add(EstadoPago.REALIZADO);
		final Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("becado", "becado");
		criteria.add(Restrictions.eq("becado.id", idAlumno));
		criteria.add(Restrictions.isNull("ea"));
		criteria.add(Restrictions.in("periodo.id", periodosIds));
		criteria.add(Restrictions.in("estadoPago", estados));
		return criteria.list();
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PagoDao#obtenerPagosBecasPorBanco(org.cimientos.intranet.modelo.banco.Banco)
	 */
	@Override
	public List<PagoDTO> obtenerPagosBecasPorBanco(Banco banco) {
		EstadoPago[] estados = new EstadoPago[]{EstadoPago.APROBADO, EstadoPago.CORREGIDO};
		final Criteria criteria = getCriteriaPagosBecas(estados);
		criteria.createAlias("becado", "becado");
		criteria.createAlias("ra", "responsable");
		if(banco != null){
			criteria.createAlias("responsable.sucursalBanco", "sucursal");
			criteria.add(Restrictions.eq("sucursal.banco", banco));
			criteria.add(Restrictions.eq("responsable.estadoCuenta", EstadoCuenta.ACTIVA));
		}
		criteria.setProjection(Projections.projectionList()
				.add(Projections.sum("monto").as("monto"))
				.add(Projections.sum("extra").as("extra"))
				.add(Projections.groupProperty("becado").as("becado"))
				.add(Projections.sqlProjection("group_concat(periodo) as idPeriodos", new String[]{"idPeriodos"},new Type[]{Hibernate.STRING}) )
				.add(Projections.groupProperty("ra").as("responsable")));

		List<PagoDTO> pagos = criteria.setResultTransformer(Transformers.aliasToBean(PagoDTO.class)).list();
		
		return pagos;
	}

	
	@Override
	public Integer obtenerCantidadPagosFiltradosAExportar(
			Banco bancoSeleccionado, String becado, String ra, CicloPrograma ciclo, Long periodoId,
			List<Long > zonaId, Long estadoPagoId) {
		DetachedCriteria criteria = getCriteriaPagosAnterioresFiltradoAExportar(true,bancoSeleccionado, becado, ra, ciclo, periodoId, zonaId, estadoPagoId);
		criteria.setResultTransformer(Transformers.aliasToBean(PagoDTO.class));
		List results = getHibernateTemplate().findByCriteria(criteria);
		return results.size();
	}

	
	private DetachedCriteria getCriteriaPagosAnterioresFiltradoAExportar(Boolean isObtenerCantidad,Banco banco, String becado, String ra, 
																		CicloPrograma ciclo, Long periodoId, List<Long > zonaId, Long estadoPagoId){
		EstadoPago[] estados = new EstadoPago[]{EstadoPago.REALIZADO, EstadoPago.FALLIDO};
		final DetachedCriteria criteria = getCriteriaPagosBecasRefactor(isObtenerCantidad,estados);
		
		criteria.createAlias("becado", "becado");
		criteria.createAlias("ra", "responsable");
		
		criteria.createAlias("periodo", "periodo");
		criteria.createAlias("periodo.ciclo", "ciclo");
		
		criteria.setProjection(Projections.projectionList()
				.add(Projections.sum("monto").as("monto"))
				.add(Projections.sum("extra").as("extra"))
				.add(Projections.groupProperty("becado").as("becado"))
				.add(Projections.sqlProjection("group_concat(periodo) as idPeriodos", new String[]{"idPeriodos"},new Type[]{Hibernate.STRING}) )
				.add(Projections.groupProperty("ra").as("responsable"))
				.add(Projections.groupProperty("fechaExportacion").as("fechaExportacion"))
				.add(Projections.property("estadoPago").as("estado"))
				/*.add(Projections.property("ciclo.nombre").as("cicloNombre"))*/		/*!!!*/
				.add(Projections.groupProperty("motivo").as("motivo")));
		
		//ObjetoManejado: Pago
		
		//Filtro BANCO
		if(banco != null){
			criteria.createAlias("responsable.sucursalBanco", "sucursal");
			criteria.add(Restrictions.eq("sucursal.banco", banco));
		}
		
		//Filtro BECADO
		if((becado != null ) && (!"".equals(becado))){
			criteria.createAlias("becado.datosPersonales","datosBecado");
			for ( String split : becado.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("datosBecado.nombre", "%"+split+"%"), Restrictions.like("datosBecado.apellido", "%"+split+"%")));
		
		}
		
		//Filtro RA
		if(ra != null && (!"".equals(ra))){
			for ( String split : ra.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("responsable.nombre", "%"+split+"%"), Restrictions.like("responsable.apellido", "%"+split+"%")));
		
		}
		
		//Filtro ZONA // becado.escuela.localidad.zona
		if(zonaId != null){
			criteria.createAlias("becado.escuela", "escuela");
			criteria.createAlias("escuela.localidad", "localidad");
			criteria.createAlias("localidad.zona", "zona");
//			criteria.add(Restrictions.eq("zona.id", zonaId));
			criteria.add(Restrictions.in("zona.id", zonaId));
		}
		

		//Filtro CICLO
		if(ciclo != null){
			criteria.add(Restrictions.eq("ciclo.id", ciclo.getId()));
		}
		
		//Filtro PERIODO
		if(periodoId != null){
			criteria.add(Restrictions.eq("periodo.id", periodoId));
		}
		
		//Filtro ESTADOPAGO
		if(estadoPagoId != null){
			Integer estadoId = estadoPagoId.intValue();
				if (EstadoPago.APROBADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estadoPago",EstadoPago.APROBADO));	
				}else if (EstadoPago.CORREGIDO.getId() == estadoId){
					criteria.add(Restrictions.eq("estadoPago",EstadoPago.CORREGIDO));
				}else if (EstadoPago.FALLIDO.getId() == estadoId){
					criteria.add(Restrictions.eq("estadoPago",EstadoPago.FALLIDO));
				}else if (EstadoPago.NO_APLICA.getId() == estadoId){
					criteria.add(Restrictions.eq("estadoPago",EstadoPago.NO_APLICA));
				}else if (EstadoPago.NO_APROBADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estadoPago",EstadoPago.NO_APROBADO));
				}else if (EstadoPago.REALIZADO.getId() == estadoId){
					criteria.add(Restrictions.eq("estadoPago",EstadoPago.REALIZADO));
				}else if (EstadoPago.SUSPENDIDO.getId() == estadoId){
					criteria.add(Restrictions.eq("estadoPago",EstadoPago.SUSPENDIDO));
				}
		}
		
		return criteria;
	}
	
	
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PagoDao#obtenerPagosBecas()
	 */
	@Override
	public List<Pago> obtenerPagosBecas() {
		EstadoPago[] estados = new EstadoPago[]{EstadoPago.APROBADO, EstadoPago.FALLIDO};
		final Criteria criteria = getCriteriaPagosBecas(estados);
		return criteria.list();
	}
	
	/**
	 * Retorna la Criteria de pagos de becas y en estado aprobado y no aprobado.
	 * @return
	 */
	private Criteria getCriteriaPagosBecas(EstadoPago[] estados){
		final Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.isNull("ea"));
		if(estados != null && estados.length > 0){
			criteria.add(Restrictions.in("estadoPago", estados));
		}
		
		//filtrar por ciclo
		criteria.add(Restrictions.sqlRestriction(" {alias}.periodo in " +
				" ( select p.id from periodo p inner join ciclo_programa c on c.id = p.ciclo_id " +
				" where c.estado = 1 ) " ));
		return criteria;
	}
	
	
	private DetachedCriteria getCriteriaPagosBecasRefactor(Boolean isObtenerCantidad, EstadoPago[] estadosPago){
		final DetachedCriteria criteria = DetachedCriteria.forClass(Pago.class);		
		criteria.add(Restrictions.isNull("ea"));		
		if(estadosPago != null && estadosPago.length > 0){
			criteria.add(Restrictions.in("estadoPago", estadosPago));
		}
		
		//filtrar por ciclo
//		criteria.add(Restrictions.sqlRestriction(" {alias}.periodo in " +
//				" ( select p.id from periodo p " +
//				" inner join ciclo_programa c on c.id = p.ciclo_id ) " ));
		
//				" where c.estado = 1 ) " ));
		return criteria;
	}
	
	private Long casteo(Object id) {
		if(id instanceof BigDecimal){
			return ((BigDecimal)id).longValue();
		}else{
			return ((BigInteger)id).longValue();
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PagoDao#obtenerPagosRealizadosPorBanco(org.cimientos.intranet.modelo.banco.Banco)
	 */
	@Override
	public List<PagoDTO> obtenerPagosRealizadosPorBanco(Banco banco, String becado, String ra, CicloPrograma ciclo, Long periodoId, 
											List<Long > zonaId, Long idEstadoPago, int firstResult, int maxResults, SortOrderEnum sortDirection, String sortCriterion) {
		
		DetachedCriteria criteria = getCriteriaPagosAnterioresFiltradoAExportar(false,banco, becado, ra, ciclo, periodoId, zonaId, idEstadoPago);
		criteria.setResultTransformer(Transformers.aliasToBean(PagoDTO.class));
		if (StringUtils.isNotBlank(sortCriterion)) {
			this.setPagosBecasSortCriteria(criteria, sortDirection, sortCriterion, 
					banco, becado, ra, zonaId, null);
		}
		
		List<PagoDTO> pagos = getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
		
		return pagos;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PagoDao#obtenerPagosPorAlumnos(java.util.List)
	 */
	@Override
	public List<Pago> obtenerPagosPorAlumnos(List<Long> idsAlumnos) {
		EstadoPago[] estados = new EstadoPago[]{EstadoPago.APROBADO, EstadoPago.CORREGIDO};
		final Criteria criteria = getCriteriaPagosBecas(estados);
		criteria.add(Restrictions.in("becado.id", idsAlumnos));
		return criteria.list();
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PagoDao#obtenerPagosPorBecadoYFechaExportacion(java.lang.Long, java.lang.String)
	 */
	@Override
	public List<Pago> obtenerPagosPorBecadoYFechaExportacion(Long idBecado,
			Date fechaExportacion) {
		Calendar diaDespues = GregorianCalendar.getInstance();
		diaDespues.setTime(fechaExportacion);
		diaDespues.add(Calendar.DAY_OF_MONTH, 1);
		final Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("becado", "becado");
		criteria.add(Restrictions.eq("becado.id", idBecado));
		criteria.add(Restrictions.ge("fechaExportacion", fechaExportacion));
		criteria.add(Restrictions.lt("fechaExportacion", diaDespues.getTime()));
		return criteria.list();
	}

	@Override
	public List<Pago> obtenerTodosPagosPorEa(Long idEA, List<Long> periodosIds) {
		List<EstadoAlumno> estados = new ArrayList<EstadoAlumno>();
		estados.add(EstadoAlumno.CESADO);
		estados.add(EstadoAlumno.NO_INCORPORADO);
		estados.add(EstadoAlumno.NO_RENOVADO);
		estados.add(EstadoAlumno.EGRESADO);
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("becado", "becado");
		criteria.add(Restrictions.in("periodo.id", periodosIds));
		criteria.add(Restrictions.eq("becado.ea.id", idEA));
		criteria.add(Restrictions.isNull("ea"));
		criteria.add(Restrictions.not(Restrictions.in("becado.estadoAlumno", estados)));
		return criteria.list();
	}

	@Override
	public List<Pago> obtenerPagosSuspendidos(Long idAlumno) {
		final Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("becado", "becado");
		criteria.add(Restrictions.eq("becado.id", idAlumno));
		criteria.add(Restrictions.isNull("ea"));
		criteria.add(Restrictions.eq("estadoPago", EstadoPago.SUSPENDIDO));
		List<Pago> result = criteria.list();
		return result;

	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PagoDao#guardarPagos(java.util.List)
	 */
	@Override
	public void guardarPagos(List<Pago> pagos) {
		getHibernateTemplate().saveOrUpdateAll(pagos);
	}

	@Override
	public Integer obtenerCantidadPagosBecadosFiltradosAExportar(
			Banco bancoSeleccionado, String becado, String ra, List<Long > zonaId, List<Long > idPeriodo, List<Integer> estadoCuentaId) {
		DetachedCriteria criteria = getCriteriaPagoBecadosFiltradosAExportar(true,bancoSeleccionado, becado, ra, zonaId, idPeriodo, estadoCuentaId);
		criteria.setResultTransformer(Transformers.aliasToBean(PagoDTO.class));
		List results = getHibernateTemplate().findByCriteria(criteria);

		return results.size();
	}
	
	private DetachedCriteria getCriteriaPagoBecadosFiltradosAExportar(Boolean isObtenerCantidad, Banco bancoSeleccionado, 
			String becado, String ra,
			List<Long > zonaId, List<Long> idPeriodo, List<Integer> idEstadoCuenta){
		
		EstadoPago[] estados = new EstadoPago[]{EstadoPago.APROBADO, EstadoPago.CORREGIDO};

		DetachedCriteria criteria = getCriteriaPagosBecasRefactor(isObtenerCantidad, estados);
		
		criteria.createAlias("becado", "becado");
		criteria.createAlias("ra", "responsable");

		criteria.setProjection(Projections.projectionList()
				.add(Projections.sqlProjection("sum(monto + extra) as montoTotal", new String[] {"montoTotal"} , new Type[] {Hibernate.DOUBLE}))
				.add(Projections.groupProperty("becado").as("becado"))
				.add(Projections.sqlProjection("group_concat(periodo) as idPeriodos", new String[]{"idPeriodos"},new Type[]{Hibernate.STRING}))
				.add(Projections.groupProperty("ra").as("responsable")));
				
		//Filtro BANCO
		//si selecciono un banco quiere decir que quiere exportar los pagos de ese banco por lo tanto solo le dejo que exporte
		//los que tienen estadocuenta en ACTIVA
		if(bancoSeleccionado != null){
			criteria.createAlias("responsable.sucursalBanco", "sucursal");
			criteria.add(Restrictions.eq("sucursal.banco", bancoSeleccionado));
			criteria.add(Restrictions.eq("responsable.estadoCuenta", EstadoCuenta.ACTIVA));
		}
		
		//Filtro BECADO
		if((becado != null ) && (!"".equals(becado))){
			criteria.createAlias("becado.datosPersonales","datosBecado");
			for ( String split : becado.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("datosBecado.nombre", "%"+split+"%"), Restrictions.like("datosBecado.apellido", "%"+split+"%")));
		
		}
		
		//Filtro RA
		if(ra != null && (!"".equals(ra))){
			for ( String split : ra.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("responsable.nombre", "%"+split+"%"), Restrictions.like("responsable.apellido", "%"+split+"%")));
		
		}
		
		//Filtro ZONA // becado.escuela.localidad.zona
		if(zonaId != null && zonaId.size()>0){
			criteria.createAlias("becado.escuela", "escuela");
			criteria.createAlias("escuela.localidad", "localidad");
			criteria.createAlias("localidad.zona", "zona");
//			criteria.add(Restrictions.eq("zona.id", zonaId));
			criteria.add(Restrictions.in("zona.id", zonaId));
		}
		
		//Filtro ESTADOCUENTA
		if((idEstadoCuenta != null) && (idEstadoCuenta.size()>0) && bancoSeleccionado == null){
//			criteria.add(Restrictions.eq("responsable.estadoCuenta", EstadoCuenta.getEstadoCuenta(idEstadoCuenta.intValue())));
			criteria.add(Restrictions.in("responsable.estadoCuenta", EstadoCuenta.getEstadosCuenta(idEstadoCuenta)));
		}
		
		//Filtro PERIODO 
		if (idPeriodo != null && idPeriodo.size()>0) {
			criteria.add(Restrictions.in("periodo.id", idPeriodo));
		}
		
		return criteria;
	}

	/**
	 * 05/May/2011
	 **/
	@Override
	public List<PagoDTO> obtenerPagosBecasFiltradasPorBanco(Banco bancoSeleccionado, String becado, String ra, List<Long > zonaId, 
							List<Long > idPeriodo, List<Integer> idEstadoCuenta, int firstResult, int maxResults, 
							SortOrderEnum sortDirection, String sortCriterion) {
		
		List<PagoDTO> pagos = null;
		DetachedCriteria criteria = getCriteriaPagoBecadosFiltradosAExportar(false,bancoSeleccionado, becado, ra, 
																				zonaId, idPeriodo, idEstadoCuenta);
		criteria.setResultTransformer(Transformers.aliasToBean(PagoDTO.class));
		
		if (StringUtils.isNotBlank(sortCriterion)) {
			this.setPagosBecasSortCriteria(criteria, sortDirection, sortCriterion, 
					bancoSeleccionado, becado, ra, zonaId, idEstadoCuenta);
		}

		pagos = getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
				
		return pagos;
	}
	
	
	/**
	 * Setea el orden del criteria teniendo en cuenta los parametros sortDirection y sortCriterion.
	 * Verifica que en el caso de que la consulta ya incluya un filtro con esa property no se vuelva
	 * a crear el alias.
	 * @param criteria
	 * @param sortDirection
	 * @param sortCriterion
	 */
	private void setPagosBecasSortCriteria(DetachedCriteria criteria,
			SortOrderEnum sortDirection, String sortCriterion, Banco bancoSeleccionado, String becado, String ra, List<Long> zonaId,
			List<Integer> idEstadoCuenta) {
		
		String sortBy = sortCriterion;
		
		if(ConstantesDisplayTagSorting.PagoBecaSorting.PAGO_BECADO_APELLIDO.equals(sortCriterion)){
			if(StringUtils.isBlank(becado)){
				criteria.createAlias("becado.datosPersonales", "datosBecado");
			}
			sortBy = "datosBecado.apellido";
		}else if(ConstantesDisplayTagSorting.PagoBecaSorting.PAGO_ZONA.equals(sortCriterion)){
			if(zonaId == null || zonaId.size()==0){
				criteria.createAlias("becado.escuela", "escuela");
				criteria.createAlias("escuela.localidad", "localidad");
				criteria.createAlias("localidad.zona", "zona");
			}
			sortBy = "zona.nombre";
		}else if(ConstantesDisplayTagSorting.PagoBecaSorting.PAGO_BANCO.equals(sortCriterion)){
			if(bancoSeleccionado == null){
				criteria.createAlias("responsable.sucursalBanco", "sucursal");
				criteria.createAlias("sucursal.banco", "banco");
			}
			sortBy = "banco.nombre";
		}
		
		if (sortDirection.equals(SortOrderEnum.ASCENDING)) {
            criteria.addOrder(Order.asc(sortBy));
        }
        if (sortDirection.equals(SortOrderEnum.DESCENDING)) {
            criteria.addOrder(Order.desc(sortBy));
        }
		
	}

	@Override
	public List<Pago> obtenerPagosPorAlumno(Long idAlumno) {
		final Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("becado", "becado");
		criteria.add(Restrictions.eq("becado.id", idAlumno));
		criteria.add(Restrictions.isNull("ea"));
		List<Pago> result = criteria.list();
		return result;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PagoDao#obtenerTotalPagos(java.util.List)
	 */
	@Override
	public Double obtenerTotalPagos(List<Long> idsAlumnos) {
		EstadoPago[] estados = new EstadoPago[]{EstadoPago.APROBADO, EstadoPago.CORREGIDO};
		final Criteria criteria = getCriteriaPagosBecas(estados);
		criteria.add(Restrictions.in("becado.id", idsAlumnos)); 
		criteria.setProjection(Projections.sum("montoTotal"));
		criteria.setProjection(Projections.sqlProjection("sum(monto + extra) as montoTotal", new String[] {"montoTotal"} , new Type[] {Hibernate.DOUBLE}));
		Double totalSum = (Double) criteria.uniqueResult();
		return totalSum;
	}
	
	@Override
	public Double obtenerMontoTotalPagosBecadosFiltradosAExportar(
			Banco bancoSeleccionado, String becado, String ra, List<Long > zonaId, List<Long > idPeriodo, List<Integer> estadoCuentaId) {
		DetachedCriteria criteria = getCriteriaPagoBecadosFiltradosAExportar(false,bancoSeleccionado, becado, ra, zonaId, idPeriodo, estadoCuentaId);
		criteria.setProjection(Projections.sqlProjection("sum(monto + extra) as montoTotal", new String[] {"montoTotal"} , new Type[] {Hibernate.DOUBLE}));
		List results = getHibernateTemplate().findByCriteria(criteria);
		if(results != null && !results.isEmpty() &&  results.get(0) != null){
			return (Double) results.get(0);
		}
		return 0d;
	}
	
	@Override
	public List<Long> obtenerIdsPagosBecasFiltrados(Banco bancoSeleccionado, String becado, String ra, 
						List<Long> zonaId, List<Long > idPeriodo, List<Integer> idEstadoCuenta) {
		DetachedCriteria criteria = getCriteriaPagoBecadosFiltradosAExportar(false,bancoSeleccionado, becado, ra, 
													zonaId, idPeriodo, idEstadoCuenta);
		criteria.setProjection(Projections.distinct(Projections.property("becado.id")));
		List results = getHibernateTemplate().findByCriteria(criteria);
		return (List<Long>) results;
	}
	
	@Override
	public Double obtenerMontoTotalPagosBecadosFiltradosAnteriores(
			Banco bancoSeleccionado, String becado, String ra, CicloPrograma ciclo,  Long periodoId,
			List<Long > zonaId, Long estadoPagoId) {
		DetachedCriteria criteria = getCriteriaPagosAnterioresFiltradoAExportar(false,bancoSeleccionado, becado, ra, ciclo, periodoId, zonaId, estadoPagoId);
		criteria.setProjection(Projections.sqlProjection("sum(monto + extra) as montoTotal", new String[] {"montoTotal"} , new Type[] {Hibernate.DOUBLE}));
		List results = getHibernateTemplate().findByCriteria(criteria);
		if(results != null && !results.isEmpty() &&  results.get(0) != null){
			return (Double) results.get(0);
		}
		return 0d;
	}

	@Override
	public int obtenerCantidadPagosInconclusos() {
		final Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("estadoPago", EstadoPago.APROBADO));
		criteria.add(Restrictions.isNull("ea"));
		return criteria.list().size();
	}

	@Override
	public void actualzarPagosRA(Long idAlumno, Long idRA) {
		String sql = "update pago set ra = " + idRA + " where becado = " + idAlumno + " and estado_pago in (0,1,4)";		
		Query query = getSession().createSQLQuery(sql);
		query.executeUpdate();
	}
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PagoDao#obtenerTotalPagos(java.util.List)
	 */
	@Override
	public Double obtenerTotalPagosPeriodo(List<Long> idsAlumnos, List<Long> idsPeriodos) {
		EstadoPago[] estados = new EstadoPago[]{EstadoPago.APROBADO, EstadoPago.CORREGIDO};
		final Criteria criteria = getCriteriaPagosBecas(estados);
		criteria.add(Restrictions.in("becado.id", idsAlumnos)); 
		criteria.add(Restrictions.in("periodo.id", idsPeriodos)); 
		criteria.setProjection(Projections.sum("montoTotal"));
		criteria.setProjection(Projections.sqlProjection("sum(monto + extra) as montoTotal", new String[] {"montoTotal"} , new Type[] {Hibernate.DOUBLE}));
		Double totalSum = (Double) criteria.uniqueResult();
		return totalSum;
	}
	
	@Override
	public List<Pago> obtenerPagosPorAlumnosPeriodo(List<Long> idsAlumnos, List<Long> idsPeriodos) {
		EstadoPago[] estados = new EstadoPago[]{EstadoPago.APROBADO, EstadoPago.CORREGIDO};
		final Criteria criteria = getCriteriaPagosBecas(estados);
		criteria.add(Restrictions.in("becado.id", idsAlumnos)); 
		criteria.add(Restrictions.in("periodo.id", idsPeriodos)); 
		return criteria.list();
	}
	
	@Override
	public List<Pago> obtenerPagosPorAlumnoDecreciente(Long idAlumno, List<Long> periodosIds) {
		List<EstadoPago> estados = new ArrayList<EstadoPago>();
		estados.add(EstadoPago.APROBADO);
		estados.add(EstadoPago.SUSPENDIDO);
		estados.add(EstadoPago.NO_APLICA);
		estados.add(EstadoPago.FALLIDO);
		estados.add(EstadoPago.CORREGIDO);
		estados.add(EstadoPago.REALIZADO);
		final Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("becado", "becado");
		criteria.add(Restrictions.eq("becado.id", idAlumno));
		criteria.add(Restrictions.isNull("ea"));
		criteria.add(Restrictions.in("periodo.id", periodosIds));
		criteria.add(Restrictions.in("estadoPago", estados));
		criteria.addOrder(Order.desc("periodo.id"));
		return criteria.list();
	}
	
	@Override
	public List<Pago> obtenerPagoPorAlumnoPorPeriodo(Long idAlumno, Long idPeriodo) {
		List<EstadoPago> estados = new ArrayList<EstadoPago>();
		estados.add(EstadoPago.APROBADO);
		estados.add(EstadoPago.SUSPENDIDO);
		estados.add(EstadoPago.NO_APLICA);
		estados.add(EstadoPago.FALLIDO);
		estados.add(EstadoPago.CORREGIDO);
		estados.add(EstadoPago.REALIZADO);
		final Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("becado", "becado");
		criteria.add(Restrictions.eq("becado.id", idAlumno));
		criteria.add(Restrictions.eq("periodo.id", idPeriodo));
		criteria.add(Restrictions.in("estadoPago", estados));
		criteria.addOrder(Order.desc("periodo.id"));
		List<Pago> result = criteria.list();
		if(!result.isEmpty())
			return result;
		else
			return null;
	}	
	
	@Override
	public Integer obtenerCantidadListaPagosBecados(Banco bancoSeleccionado, String becado, String ra, CicloPrograma ciclo, 
			List<Long> periodoId, List<Long> zonaId, List<Integer> estadoPagoId, List<Integer> estadoCuentaId) {
		DetachedCriteria criteria = getCriteriaListaPagosBecados(true,bancoSeleccionado, becado, ra, ciclo, periodoId, zonaId, estadoPagoId, estadoCuentaId);
//		criteria.setResultTransformer(Transformers.aliasToBean(PagoBecadoDTO.class));
		List results = getHibernateTemplate().findByCriteria(criteria);
		return results.size();
	}
	
	private DetachedCriteria getCriteriaListaPagosBecados(Boolean isObtenerCantidad,Banco banco, String becado, String ra, 
			CicloPrograma ciclo, List<Long> periodoId, List<Long> zonaId, List<Integer> estadoPagoId, List<Integer> estadoCuentaId){
		EstadoPago[] estadosPago = new EstadoPago[]{EstadoPago.REALIZADO, EstadoPago.FALLIDO, EstadoPago.APROBADO, EstadoPago.CORREGIDO};
		final DetachedCriteria criteria = getCriteriaPagosBecasRefactor(isObtenerCantidad,estadosPago);		
		criteria.createAlias("becado", "becado");
		criteria.createAlias("ra", "responsable");		
		criteria.createAlias("periodo", "periodo");
		criteria.createAlias("periodo.ciclo", "ciclo");		
		
		//Filtro BANCO
		if(banco != null){
			criteria.createAlias("responsable.sucursalBanco", "sucursal");
			criteria.add(Restrictions.eq("sucursal.banco", banco));
		}
		
		//Filtro BECADO
		if((becado != null ) && (!"".equals(becado))){
			criteria.createAlias("becado.datosPersonales","datosBecado");
			for ( String split : becado.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("datosBecado.nombre", "%"+split+"%"), Restrictions.like("datosBecado.apellido", "%"+split+"%")));
		
		}
		
		//Filtro RA
		if(ra != null && (!"".equals(ra))){
			for ( String split : ra.split(" "))
				criteria.add(Restrictions.or(Restrictions.like("responsable.nombre", "%"+split+"%"), Restrictions.like("responsable.apellido", "%"+split+"%")));
		
		}
		
		//Filtro ZONA // becado.escuela.localidad.zona
		if(zonaId != null && zonaId.size() > 0){
			criteria.createAlias("becado.escuela", "escuela");
			criteria.createAlias("escuela.localidad", "localidad");
			criteria.createAlias("localidad.zona", "zona");
			criteria.add(Restrictions.in("zona.id", zonaId));
		}
		
		
		//Filtro CICLO
		if(ciclo != null){
			criteria.add(Restrictions.eq("ciclo.id", ciclo.getId()));
		}
		
		//Filtro PERIODO
		if(periodoId != null && periodoId.size() > 0){
			criteria.add(Restrictions.in("periodo.id", periodoId));
		}
		
		if(estadoCuentaId != null && estadoCuentaId.size() > 0){
			criteria.add(Restrictions.in("responsable.estadoCuenta", EstadoCuenta.getEstadosCuenta(estadoCuentaId)));
		}
		
		//Filtro ESTADOPAGO
		if(estadoPagoId != null && estadoPagoId.size() > 0){
			criteria.add(Restrictions.in("estadoPago",EstadoPago.getEstadosPago(estadoPagoId)));
		}		
		
		return criteria;
	}
	
	@Override
	public List<Pago> obtenerPagosBecadosPorBanco(Banco banco, String becado, String ra,  CicloPrograma ciclo, List<Long> periodoId, 
											List<Long> zonaId, List<Integer> idEstadoPago, List<Integer> idEstadoCuenta, int firstResult, 
											int maxResults, SortOrderEnum sortDirection, String sortCriterion) {
		
		DetachedCriteria criteria = getCriteriaListaPagosBecados(false,banco, becado, ra, ciclo, periodoId, zonaId, idEstadoPago, idEstadoCuenta);
//		criteria.setResultTransformer(Transformers.aliasToBean(PagoBecadoDTO.class));
		if (StringUtils.isNotBlank(sortCriterion)) {
			this.setPagosBecasSortCriteria(criteria, sortDirection, sortCriterion, 
					banco, becado, ra, zonaId, null);
		}
		
		List<Pago> pagos = getHibernateTemplate().findByCriteria(criteria, firstResult, maxResults);
		
		return pagos;
	}
	
	@Override
	public Double obtenerMontoTotalListaPagosBecados(Banco bancoSeleccionado, String becado, String ra,  CicloPrograma ciclo, 
			List<Long> periodoId, List<Long> zonaId, List<Integer> estadoPagoId, List<Integer> estadoCuentaId) {
		DetachedCriteria criteria = getCriteriaListaPagosBecados(false,bancoSeleccionado, becado, ra, ciclo, periodoId, zonaId, estadoPagoId, 
				estadoCuentaId);
		criteria.setProjection(Projections.sqlProjection("sum(monto + extra) as montoTotal", new String[] {"montoTotal"} , 
				new Type[] {Hibernate.DOUBLE}));
		List results = getHibernateTemplate().findByCriteria(criteria);
		if(results != null && !results.isEmpty() &&  results.get(0) != null){
			return (Double) results.get(0);
		}
		return 0d;
	}
	
	@Override
	public List<Pago> obtenerPagosPorAlumnoPeriodo(Long idAlumno, List<Long> idsPeriodos) {
		EstadoPago[] estados = new EstadoPago[]{EstadoPago.APROBADO, EstadoPago.CORREGIDO};
		final Criteria criteria = getCriteriaPagosBecas(estados);
		criteria.add(Restrictions.eq("becado.id", idAlumno)); 
		criteria.add(Restrictions.in("periodo.id", idsPeriodos)); 
		return criteria.list();
	}
}
