package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.ProvinciaDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.ubicacion.Provincia;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProvinciaDaoImpl extends SpringHibernateDao<Provincia> implements ProvinciaDao
{

	@Autowired
	public ProvinciaDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	protected Class<Provincia> getObjetoManejado() {
		return Provincia.class;
	}

	@Override
	public Provincia obtenerPorDescripcion(String descripcion) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("descripcion", descripcion));
		List<Provincia> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (Provincia) result.get(0);	
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ProvinciaDao#obtenerProvinciaSiExiste(java.lang.String, java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Provincia obtenerProvinciaSiExiste(String descripcion, String id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(Provincia.class);
		criteria.add(Restrictions.eq("descripcion", descripcion));
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}

		final List<Provincia> provincias = getHibernateTemplate().findByCriteria(criteria);

		if (provincias != null && !provincias.isEmpty()){
			return provincias.get(0);
		} else {
			return null;

		}
	}
	
	
	@Override
	public List<Provincia> obtenerProvinciasTexto(String texto) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.like("descripcion", "%"+texto+"%")).add(Restrictions.eq("activo", true));
		criteria.addOrder(Order.asc("descripcion"));
		List<Provincia> lista = criteria.list();
		if(lista.size()>0){
			return lista;
		}else{
			return null;
		}
		
	}

}
