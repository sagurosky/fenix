package org.cimientos.intranet.dao.impl;

import org.cimientos.intranet.dao.TrimestreDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.Trimestre;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TrimestreDaoImpl extends SpringHibernateDao<Trimestre> implements TrimestreDao
{

	@Autowired
	public TrimestreDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	protected Class<Trimestre> getObjetoManejado() {
		return Trimestre.class;
	}

}
