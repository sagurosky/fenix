package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.ViaticoDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.viatico.Viatico;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * The Class ViaticoDaoImpl.
 *
 * @author nlopez
 */
@Repository
public class ViaticoDaoImpl extends SpringHibernateDao<Viatico> implements ViaticoDao 
{

	/**
	 * Instantiates a new viatico dao impl.
	 *
	 * @param sessionFactory the session factory
	 * @since 28-dic-2010
	 * @author nlopez
	 */
	@Autowired
	public ViaticoDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<Viatico> getObjetoManejado() {
		return Viatico.class;
	}
	
	@Override
	public List<Viatico> obtenerViaticosPorEA(PerfilEA perfilEA) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("ea", perfilEA));
		List<Viatico> viaticos = criteria.list();
		return viaticos;
	}

	@Override
	public List<Viatico> obtenerViaticosPorRR(PerfilRR perfilRR) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("ea", "ea");
		criteria.add(Restrictions.eq("ea.rr", perfilRR));
		List<Viatico> viaticos = criteria.list();
		return viaticos;
	}

}
