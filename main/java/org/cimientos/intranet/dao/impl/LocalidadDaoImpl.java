package org.cimientos.intranet.dao.impl;


import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.LocalidadDao;
import org.cimientos.intranet.dao.base.HQLHelper;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.ubicacion.Localidad;
import org.cimientos.intranet.modelo.ubicacion.Provincia;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
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
 * LocalidadDaoImpl
 * @author msagarduy
 *
 */

@Repository
public class LocalidadDaoImpl extends SpringHibernateDao<Localidad> implements LocalidadDao 
{

	/**
	 * Instancia una session Factory
	 *
	 * @param sessionFactory the session factory
	 * @author msagarduy
	 */
	@Autowired
	public LocalidadDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<Localidad> getObjetoManejado() {
		return Localidad.class;
	}


	@Override
	public List<Localidad> obtenerActivos() {
		DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));
		criteria.addOrder(Order.asc("nombre"));
		return getHibernateTemplate().findByCriteria(criteria);
	}
	
	@Override
	public Localidad obtenerPorNombre(String nombre) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("nombre", nombre)).add(Restrictions.eq("activo", true));
		List<Localidad> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (Localidad) result.get(0);	
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.LocalidadDao#obtenerLocalidadSiExiste(java.lang.String, java.lang.String)
	 */
	@Override
	public Localidad obtenerLocalidadSiExiste(String nombre, String id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(Localidad.class);
		criteria.add(Restrictions.eq("nombre", nombre)).add(Restrictions.eq("activo", true));
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}

		final List<Localidad> localidades = getHibernateTemplate().findByCriteria(criteria);

		if (localidades != null && !localidades.isEmpty()){
			return localidades.get(0);
		} else {
			return null;

		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.LocalidadDao#obtenerPorLocalidades(java.util.List)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Localidad> obtenerPorLocalidades(List<String> nombresLocalidades) {
		StringBuffer nombreLocalidad = new StringBuffer();
		for (String string : nombresLocalidades) 
		{
			nombreLocalidad.append("'");
			nombreLocalidad.append(string).append("'");
			nombreLocalidad.append(",");
		}
		nombreLocalidad.deleteCharAt(nombreLocalidad.lastIndexOf(","));
		String  sqlQuery = "SELECT l.nombre FROM localidad as l \n" + 
	    " WHERE l.activo = true AND l.nombre IN ("+ nombreLocalidad.toString() + 
	    ") AND l.provincia_id IS NOT NULL "; 
		SQLQuery q = getSession().createSQLQuery(sqlQuery);
		List<Localidad> result = q.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result;		
		}
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Localidad> obtenerPorLocalidadesZona(List<String> nombresLocalidades) {
		StringBuffer nombreLocalidad = new StringBuffer();
		for (String string : nombresLocalidades) 
		{
			nombreLocalidad.append("'");
			nombreLocalidad.append(string).append("'");
			nombreLocalidad.append(",");
		}
		nombreLocalidad.deleteCharAt(nombreLocalidad.lastIndexOf(","));
		String  sqlQuery = "SELECT l.nombre FROM localidad as l \n" +
	    " WHERE l.activo = true AND l.nombre IN ("+ nombreLocalidad.toString() + 
	    ") AND l.zona_id IS NOT NULL "; 
		SQLQuery q = getSession().createSQLQuery(sqlQuery);
		List<Localidad> result = q.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result;		
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Localidad> obtenerPorZonaExistente(ZonaCimientos zona,
			List<String> localidades) {
		StringBuffer nombreLocalidad = new StringBuffer();
		for (String string : localidades) 
		{
			nombreLocalidad.append("'");
			nombreLocalidad.append(string).append("'");
			nombreLocalidad.append(",");
		}
		nombreLocalidad.deleteCharAt(nombreLocalidad.lastIndexOf(","));
		String  sqlQuery = "SELECT l.nombre FROM localidad as l \n" + 
	    " WHERE l.activo = true AND l.nombre IN ("+ nombreLocalidad.toString() + 
	    ") AND l.zona_id IS NOT NULL AND l.zona_id != " + zona.getId(); 
		SQLQuery q = getSession().createSQLQuery(sqlQuery);
		List<Localidad> result = q.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result;		
		}
	}


	
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.LocalidadDao#obtenerPorProvinciaExistente(org.cimientos.intranet.modelo.ubicacion.Provincia, java.util.List)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Localidad> obtenerPorProvinciaExistente(Provincia provincia, List<String> localidades) 
	{
		StringBuffer nombreLocalidad = new StringBuffer();
		for (String string : localidades) 
		{
			nombreLocalidad.append("'");
			nombreLocalidad.append(string).append("'");
			nombreLocalidad.append(",");
		}
		nombreLocalidad.deleteCharAt(nombreLocalidad.lastIndexOf(","));
		String  sqlQuery = "SELECT l.nombre FROM localidad as l \n" + 
	    " WHERE l.activo = true AND l.nombre IN ("+ nombreLocalidad.toString() + 
	    ") AND l.provincia_id IS NOT NULL AND l.provincia_id != " + provincia.getId(); 
		SQLQuery q = getSession().createSQLQuery(sqlQuery);
		List<Localidad> result = q.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result;		
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.LocalidadDao#buscarLocalidades(java.lang.String, int)
	 */
	@Override
	public List<Localidad> buscarLocalidades(String texto, int cantidadMaxima) {		
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.setMaxResults(cantidadMaxima);
		criteria.add(Restrictions.like("nombre", "%"+texto+"%")).add(Restrictions.eq("activo", true));
		criteria.addOrder(Order.asc("nombre"));
		return criteria.list();
			
	}

	@Override
	public List<Localidad> obtenerLocalidadesSinZona() {
		
		List<Localidad> localidades = new ArrayList<Localidad>();
		String query = "select localidad.id, localidad.nombre " +
					   "from Localidad localidad " +
					   "where localidad.zona is null and localidad.activo = true";
			
		Query hqlquery = getSession().createQuery(query);
			
		localidades = HQLHelper.find(hqlquery, getObjetoManejado());
		return localidades;
		}

	
	
	@Override
	public List<Localidad> obtenerLocalidadesSinProvincia() {
		
		List<Localidad> localidades = new ArrayList<Localidad>();
		String query = "select localidad.id, localidad.nombre " +
					   "from Localidad localidad " +
					   "where localidad.provincia is null and localidad.activo = true";
			
		Query hqlquery = getSession().createQuery(query);
			
		localidades = HQLHelper.find(hqlquery, getObjetoManejado());
		return localidades;
	}

	
}
