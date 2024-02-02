package org.cimientos.intranet.dao.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.PeriodoDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.Periodo;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * PeriodoDaoImpl
 * @author msagarduy
 *
 */
@Repository
public class PeriodoDaoImpl extends SpringHibernateDao<Periodo> implements
		PeriodoDao {

	/**
	 * @param sessionFactory
	 */
	@Autowired
	public PeriodoDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<Periodo> getObjetoManejado() {
		return Periodo.class;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PeriodoDao#obtenerPeriodoSiExiste(java.lang.String, java.lang.String)
	 */
	@Override
	public Periodo obtenerPeriodoSiExiste(String nombre, String id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.eq("nombre", nombre));
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}

		final List<Periodo> periodos = getHibernateTemplate().findByCriteria(criteria);

		if (periodos != null && !periodos.isEmpty()){
			return periodos.get(0);
		} else {
			return null;

		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PeriodoDao#obtenerPorNombre(java.lang.String)
	 */
	@Override
	public Periodo obtenerPorNombre(String nombre) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("nombre", nombre));
		List<Periodo> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (Periodo) result.get(0);	
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PeriodoDao#obtenerPorCiclos(java.util.List)
	 */
	@Override
	public List<Periodo> obtenerPorPeriodos(List<String> nombresPeriodos) 
	{
		StringBuffer nombrePeriodo = new StringBuffer();
		for (String string : nombresPeriodos) 
		{
			nombrePeriodo.append("'");
			nombrePeriodo.append(string).append("'");
			nombrePeriodo.append(",");
		}
		nombrePeriodo.deleteCharAt(nombrePeriodo.lastIndexOf(","));
		String  sqlQuery = "SELECT p.nombre FROM periodo as p \n" + 
	    " WHERE p.nombre IN ("+ nombrePeriodo.toString() + 
	    ") AND p.ciclo_id IS NOT NULL ";
		SQLQuery q = getSession().createSQLQuery(sqlQuery);
		List<Periodo> result = q.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result;		
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PeriodoDao#obtenerPorPeriodoExistente(org.cimientos.intranet.modelo.CicloPrograma, java.util.List)
	 */
	@Override
	public List<Periodo> obtenerPorPeriodoExistente(CicloPrograma ciclo,
			List<String> periodos) 
	{
		StringBuffer nombrePeriodo = new StringBuffer();
		for (String string : periodos) 
		{
			nombrePeriodo.append("'");
			nombrePeriodo.append(string).append("'");
			nombrePeriodo.append(",");
		}
		nombrePeriodo.deleteCharAt(nombrePeriodo.lastIndexOf(","));
		String  sqlQuery = "SELECT p.nombre FROM periodo as p \n" + 
	    " WHERE p.nombre IN ("+ nombrePeriodo.toString() + 
	    ") AND p.ciclo_id IS NOT NULL AND p.ciclo_id != " + ciclo.getId(); 
		SQLQuery q = getSession().createSQLQuery(sqlQuery);
		List<Periodo> result = q.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result;		
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PeriodoDao#buscarPeriodosPorCiclo(java.lang.Long)
	 */
	@Override
	public List<Periodo> buscarPeriodosPorCiclo(Long idCiclo) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("ciclo", "ciclo");
		criteria.add(Restrictions.eq("ciclo.id", idCiclo));
		criteria.addOrder(Order.asc("orden"));
		final List<Periodo> periodos = getHibernateTemplate().findByCriteria(criteria);
		return periodos;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PeriodoDao#obtenerPeriodoPorFecha(java.util.Date)
	 */
	@Override
	public Periodo obtenerPeriodoPorFecha(Date date) {
		String sql = "select  *from periodo  where fecha_inicio <= ?  and  ?<= fecha_fin ";
		//String sql = "select  *from periodo  where fecha_inicio >= ?  and  ?<= fecha_fin ";
		SQLQuery query = getSession().createSQLQuery(sql).addEntity(getObjetoManejado());
		query.setDate(0, date);
		query.setDate(1, date);
		List<Periodo> list = query.list();
		if(list.isEmpty()){
			Periodo periodo  = new Periodo();
			periodo.setNombre("Fecha fuera de un Periodo");
			return periodo  ;
		}else{
			return (Periodo) list.get(0);
		}
		
	}
	

	
	

	@Override
	public String obtenerDeBecaAlumno(Long idAlumno) {
		String  sql =
			"select p.nombre from periodo p " +
			"inner join ( beca b inner join perfil_alumno pa on pa.beca_id = b.id ) on b.periodo_pago = p.id " +
			"where pa.id = " + idAlumno;

		Query query = getSession().createSQLQuery(sql);
		
		List<String> result = query.list();
		if(result.isEmpty()){
			return "";
		}else{
			return result.get(0);
		}
		
	}	
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PeriodoDao#obtenerPeriodoPorFecha(java.util.Date)
	 */
	@Override
	public Periodo obtenerPeriodoPorFechaFP(Date date) {
		DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.le("fechaInicio", date));
		criteria.add(Restrictions.ge("fechaFin", date));
		List<Periodo> list = getHibernateTemplate().findByCriteria(criteria);
		if(list.isEmpty()){
			return null  ;
		}else{
			return (Periodo) list.get(0);
		}
		
	}
	
	
	@Override
	public List<Periodo> buscarPeriodosBeca(Periodo periodoDesde, Periodo periodoHasta) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.ge("fechaInicio", periodoDesde.getFechaInicio()));
		criteria.add(Restrictions.le("fechaFin", periodoHasta.getFechaFin()));
		criteria.addOrder(Order.asc("orden"));
		final List<Periodo> periodos = getHibernateTemplate().findByCriteria(criteria);
		return periodos;
	}
}
