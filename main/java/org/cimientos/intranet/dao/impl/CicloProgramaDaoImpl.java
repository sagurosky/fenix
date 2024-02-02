package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.CicloProgramaDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.EstadoCiclo;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 * CicloProgramaDaoImpl
 * @author msagarduy
 *
 */
@Repository
public class CicloProgramaDaoImpl extends SpringHibernateDao<CicloPrograma>
		implements CicloProgramaDao {

	/**
	 * @param sessionFactory
	 */
	@Autowired
	public CicloProgramaDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<CicloPrograma> getObjetoManejado() {
		return CicloPrograma.class;
	}

	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.CicloProgramaDao#obtenerCicloSiExiste(java.lang.String, java.lang.String)
	 */
	@Override
	public CicloPrograma obtenerCicloSiExiste(String nombre, String id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.eq("nombre", nombre));
		Boolean activo = true;
		criteria.add(Restrictions.eq("activo", activo) );
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}

		final List<CicloPrograma> localidades = getHibernateTemplate().findByCriteria(criteria);

		if (localidades != null && !localidades.isEmpty()){
			return localidades.get(0);
		} else {
			return null;

		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.CicloProgramaDao#obtenerPorNombre(java.lang.String)
	 */
	@Override
	public CicloPrograma obtenerPorNombre(String nombre) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("nombre", nombre));
		Boolean activo = true;
		criteria.add(Restrictions.eq("activo", activo) );
		List<CicloPrograma> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (CicloPrograma) result.get(0);	
		}
	}
	
		/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.CicloProgramaDao#obtenerCicloPorAnio(java.lang.String)
	 */
	@Override
	public CicloPrograma obtenerCicloPorAnio(String anio) {
		Query query = getSession().createQuery("from CicloPrograma ciclo where EXTRACT(YEAR FROM ciclo.fechaInicio) <= :anio and EXTRACT(YEAR FROM ciclo.fechaFin) = :anio ");
		query.setString("anio", anio);
		List<CicloPrograma> cicloProgramas = query.list();
		if(cicloProgramas.isEmpty()){
			return new CicloPrograma();
		}else{
			return cicloProgramas.get(0);
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.CicloProgramaDao#obtenerCicloActual()
	 */
	@Override
	public CicloPrograma obtenerCicloActual() {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("estado", EstadoCiclo.ACTUAL));
		List<CicloPrograma> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (CicloPrograma) result.get(0);	
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.CicloProgramaDao#obtenerCiclosPorEstados(org.cimientos.intranet.modelo.EstadoCiclo[])
	 */
	@Override
	public List<CicloPrograma> obtenerCiclosPorEstados(EstadoCiclo[] estados) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.in("estado", estados));
		return criteria.list();
	}
	
	@Override
	public CicloPrograma obtenerCicloPorOrden(int orden) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("orden", orden));
		List<CicloPrograma> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (CicloPrograma) result.get(0);	
		}
	}

	@Override
	public CicloPrograma obtenerSiguienteCiclo() {
		String sql = "select *from ciclo_programa c "+
					 " where  EXTRACT(YEAR FROM c.fecha_fin ) = (select SUM(EXTRACT(YEAR FROM ciclo.fecha_inicio)+1) as anio from ciclo_programa ciclo where estado=1 )";
		SQLQuery sqlQuery = getSession().createSQLQuery(sql);
		sqlQuery.setFirstResult(0);
		sqlQuery.addScalar("id", Hibernate.LONG);
		sqlQuery.addScalar("nombre", Hibernate.STRING);
		sqlQuery.setResultTransformer(Transformers.aliasToBean(CicloPrograma.class));
		List<CicloPrograma> list = sqlQuery.list();
		if(list.isEmpty()){
			return null;
		}else{
			return (CicloPrograma)list.get(0);
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#obtenerTodos()
	 * Se sobreescribio este metodo para que muestre los cilclos ordenados por nombre
	 * Suponiendo que el nombre de los ciclos empiezan con el año
	 * 
	 */
	@Override
	public List<CicloPrograma> obtenerTodos() throws DataAccessException {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.addOrder(Order.desc("nombre"));
		return criteria.list();
	}

	@Override
	public List<CicloPrograma> obtenerCiclosClonarBecas() {
		CicloPrograma ciclo2010 = obtenerCicloPorAnio("2010");
		return buscarCiclosDesde(ciclo2010);
	}

	@Override
	public List<CicloPrograma> obtenerCiclosConvocatoria() {
		CicloPrograma ciclo = obtenerCicloPorAnio("2006");
		return buscarCiclosDesde(ciclo);
	}

	@Override
	public List<CicloPrograma> obtenerCiclosConvocatoriaDesde(String anio) {
		CicloPrograma ciclo = obtenerCicloPorAnio(anio);
		return buscarCiclosDesde(ciclo);
	}

	private List<CicloPrograma> buscarCiclosDesde(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.ge("fechaInicio", ciclo.getFechaInicio()));
		criteria.addOrder(Order.desc("nombre"));
		return criteria.list();
	}
}
