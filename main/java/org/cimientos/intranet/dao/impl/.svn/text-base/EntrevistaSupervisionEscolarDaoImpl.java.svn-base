package org.cimientos.intranet.dao.impl;

import org.cimientos.intranet.dao.EntrevistaSupervisionEscolarDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.pbe.evento.entrevistas.EntrevistaSupervisionEscolar;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EntrevistaSupervisionEscolarDaoImpl extends SpringHibernateDao<EntrevistaSupervisionEscolar> implements EntrevistaSupervisionEscolarDao{

	@Autowired
	public EntrevistaSupervisionEscolarDaoImpl(SessionFactory sessionFactory) {
	
		super(sessionFactory);
	
	}

	@Override
	protected Class<EntrevistaSupervisionEscolar> getObjetoManejado() {
		
		return EntrevistaSupervisionEscolar.class;
	}

	

	
}
