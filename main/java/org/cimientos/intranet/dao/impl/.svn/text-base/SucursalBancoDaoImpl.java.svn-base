package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.SucursalBancoDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.banco.Banco;
import org.cimientos.intranet.modelo.sucursalBanco.SucursalBanco;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SucursalBancoDaoImpl  extends SpringHibernateDao<SucursalBanco> implements SucursalBancoDao{

	@Autowired
	public SucursalBancoDaoImpl(SessionFactory sessionFactory) {
		
		super(sessionFactory);
	
	}

	@Override
	protected Class<SucursalBanco> getObjetoManejado() {
		
		return SucursalBanco.class;
	}

	@SuppressWarnings("unchecked")
	@Override
	public SucursalBanco obtenerPorBarrio(String barrio) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("barrio", barrio));
		List<SucursalBanco> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (SucursalBanco) result.get(0);	
		}
	}


	@SuppressWarnings("unchecked")
	@Override
	public SucursalBanco obtenerSucursalSiExiste(String direccion, String id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(SucursalBanco.class);
		criteria.add(Restrictions.eq("direccion", direccion));
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}

		final List<SucursalBanco> sucursales = getHibernateTemplate().findByCriteria(criteria);

		if (sucursales != null && !sucursales.isEmpty()){
			return sucursales.get(0);
		} else {
			return null;

		}
	}
	@SuppressWarnings("unchecked")
	@Override
	public SucursalBanco obtenerPorDireccion(String direccion) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("direccion", direccion));
		List<SucursalBanco> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (SucursalBanco) result.get(0);	
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SucursalBanco> obtenerPorSucursales(List<String> direccionSucursales) {
		StringBuffer sucursalDireccion = new StringBuffer();
		for (String string : direccionSucursales) 
		{
			sucursalDireccion.append("'");
			sucursalDireccion.append(string).append("'");
			sucursalDireccion.append(",");
		}
		sucursalDireccion.deleteCharAt(sucursalDireccion.lastIndexOf(","));
		String  sqlQuery = "SELECT l.direccion FROM sucursalbanco as l \n" + 
	    " WHERE l.direccion IN ("+ sucursalDireccion.toString() + 
	    ") AND l.Banco_id IS NOT NULL "; 
		SQLQuery q = getSession().createSQLQuery(sqlQuery);
		List<SucursalBanco> result = q.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result;		
		}
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<SucursalBanco> obtenerPorBancoExistente(Banco banco, List<String> sucursales) 
	{
		StringBuffer sucursalDireccion = new StringBuffer();
		for (String string : sucursales) 
		{
			sucursalDireccion.append("'");
			sucursalDireccion.append(string).append("'");
			sucursalDireccion.append(",");
		}
		sucursalDireccion.deleteCharAt(sucursalDireccion.lastIndexOf(","));
		String  sqlQuery = "SELECT l.direccion FROM sucursalbanco as l \n" + 
	    " WHERE l.direccion IN ("+ sucursalDireccion.toString() + 
	    ") AND l.Banco_id IS NOT NULL AND l.Banco_id != " + banco.getId(); 
		SQLQuery q = getSession().createSQLQuery(sqlQuery);
		List<SucursalBanco> result = q.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result;		
		}
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SucursalBanco> obtenerSucursalesSinAsignar() {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		
		criteria.add(Restrictions.isNull("banco"));
		return criteria.list();
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.SucursalBancoDao#buscarSucursalesPorBanco(java.lang.Long)
	 */
	@Override
	public List<SucursalBanco> buscarSucursalesPorBanco(Long idBanco) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("banco", "banco");
		criteria.add(Restrictions.eq("banco.id", idBanco));
		final List<SucursalBanco> sucursales = getHibernateTemplate().findByCriteria(criteria);
		return sucursales;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.SucursalBancoDao#obtenerSucursalPorZona(java.lang.Long)
	 */
	@Override
	public List<SucursalBanco> obtenerSucursalPorZona(Long idZona) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("zona", "zona");
		criteria.add(Restrictions.eq("zona.id", idZona));
		return criteria.list();
	}

	@Override
	public Boolean comprobarExistencia(SucursalBanco sucursal) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("activo",true));
		criteria.add(Restrictions.eq("direccion", sucursal.getDireccion()));
		criteria.add(Restrictions.eq("zona", sucursal.getZona()));
		List<SucursalBanco> result = criteria.list();
		if(result.isEmpty()){
			return false;
		}else{
			return true;		
		}
	}

}
