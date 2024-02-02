package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.ZonaCimientosDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author msagarduy
 *
 */
@Repository
public class ZonaCimientosDaoImpl extends SpringHibernateDao<ZonaCimientos>
		implements ZonaCimientosDao {

	/**
	 * @param sessionFactory
	 */
	@Autowired
	public ZonaCimientosDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}
	
	@Override
	public List<ZonaCimientos> obtenerActivos() {
		DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));
		criteria.addOrder(Order.asc("nombre"));
		return getHibernateTemplate().findByCriteria(criteria);
	}
	

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<ZonaCimientos> getObjetoManejado() {
		return ZonaCimientos.class;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ZonaCimientosDao#obtenerPorNombre(java.lang.String)
	 */
	@Override
	public ZonaCimientos obtenerPorNombre(String nombre) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("nombre", nombre));
		List<ZonaCimientos> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (ZonaCimientos) result.get(0);	
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ZonaCimientosDao#obtenerZonaSiExiste(java.lang.String, java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public ZonaCimientos obtenerZonaSiExiste(String nombre, String id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(ZonaCimientos.class);
		criteria.add(Restrictions.eq("nombre", nombre));
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}

		final List<ZonaCimientos> zonas = getHibernateTemplate().findByCriteria(criteria);

		if (zonas != null && !zonas.isEmpty()){
			return zonas.get(0);
		} else {
			return null;

		}
	}

	@Override
	public List<ZonaCimientos> buscarLocalidades(String texto) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.like("nombre", "%"+texto+"%")).add(Restrictions.eq("activo", true));
		criteria.addOrder(Order.asc("nombre"));
		List<ZonaCimientos> lista = criteria.list();
		if(lista.size()>0){
			return lista;
		}else{
			return null;
		}
		
	}

	@Override
	public List<Escuela> buscarEscuelasZona(long idZona, String texto) {
		Criteria criteria = getSession().createCriteria(Escuela.class);
		criteria.createAlias("zonaCimientos", "zona");
		criteria.add(Restrictions.eq("zona.id", idZona));
		criteria.add(Restrictions.like("nombre", "%"+texto+"%")).add(Restrictions.eq("activo", true));
		criteria.addOrder(Order.asc("nombre"));
		return criteria.list();
	
	}

	@Override
	public List<ZonaCimientos> buscarTodasLocalidades(String texto) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.like("nombre", "%"+texto+"%"));
		criteria.addOrder(Order.asc("nombre"));
		List<ZonaCimientos> lista = criteria.list();
		if(lista.size()>0){
			return lista;
		}else{
			return null;
		}
	}	

}
