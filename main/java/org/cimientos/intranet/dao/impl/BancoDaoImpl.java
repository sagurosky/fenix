package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.cimientos.intranet.dao.BancoDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.banco.Banco;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BancoDaoImpl extends SpringHibernateDao<Banco> implements BancoDao {

	@Autowired
	public BancoDaoImpl(SessionFactory sessionFactory) {
		
		super(sessionFactory);
	
	}
	
	@Override
	protected Class<Banco> getObjetoManejado() {
		
		return Banco.class;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public Banco obtenerPorNombre(String nombre) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("nombre", nombre));
		List<Banco> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (Banco) result.get(0);	
		}
	}


	@SuppressWarnings("unchecked")
	@Override
	public Banco obtenerBancoSiExiste(String nombre, String id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(Banco.class);
		criteria.add(Restrictions.eq("nombre", nombre));
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}

		final List<Banco> bancos = getHibernateTemplate().findByCriteria(criteria);

		if (bancos != null && !bancos.isEmpty()){
			return bancos.get(0);
		} else {
			return null;

		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Banco> obtenerBancosPorNombre(String texto) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.like("nombre", "%"+texto+"%"));
		criteria.addOrder(Order.asc("nombre"));
		return criteria.list();
	}

	
}
