package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.EventoGenericoDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.evento.eventoGenerico.EventoGenerico;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author plabaronnie
 *
 */
@Repository
public class EventoGenericoDaoImpl extends SpringHibernateDao<EventoGenerico> implements EventoGenericoDao{

	/**
	 * @param sessionFactory
	 */
	@Autowired
	public EventoGenericoDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<EventoGenerico> getObjetoManejado() {
		return EventoGenerico.class;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EventoGenericoDao#obtenerActivos()
	 */
	@Override
	public List<EventoGenerico> obtenerActivos() {
		DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));
		return getHibernateTemplate().findByCriteria(criteria);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EventoGenericoDao#obtenerEventosGenericosPorEA(org.cimientos.intranet.modelo.perfilEA.PerfilEA)
	 */
	@Override
	public List<EventoGenerico> obtenerEventosGenericosPorEA(PerfilEA ea) {
		DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		Boolean activo = true;
		criteria.add(org.hibernate.criterion.Property.forName("activo").eq(activo));
		criteria.add(Restrictions.eq("ea", ea));
		criteria.addOrder(Order.desc("fechaEvento"));
		return getHibernateTemplate().findByCriteria(criteria);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EventoGenerico> obtenerEventosGenericosPorRR(PerfilRR rr) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("ea", "ea");
		criteria.add(Restrictions.eq("ea.rr", rr));
		criteria.addOrder(Order.desc("fechaEvento"));
		List<EventoGenerico> eventos = criteria.list();
		return eventos;
		
	}
	public List<EventoGenerico> obtenerEventosGenericosTodos() {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());		
		criteria.addOrder(Order.desc("fechaEvento"));
		List<EventoGenerico> eventos = criteria.list();
		return eventos;
		
	}

}
