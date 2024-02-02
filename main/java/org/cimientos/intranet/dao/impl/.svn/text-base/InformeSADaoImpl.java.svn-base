package org.cimientos.intranet.dao.impl;

import org.cimientos.intranet.dao.InformeSADao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.InformeSA;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InformeSADaoImpl extends SpringHibernateDao<InformeSA> implements InformeSADao{

	@Autowired
	public InformeSADaoImpl(SessionFactory sessionFactory) {
	
		super(sessionFactory);
	
	}

	@Override
	protected Class<InformeSA> getObjetoManejado() {
		
		return InformeSA.class;
	}

}
