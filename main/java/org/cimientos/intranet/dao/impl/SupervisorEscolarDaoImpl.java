package org.cimientos.intranet.dao.impl;

import org.cimientos.intranet.dao.SupervisorEscolarDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.supervisorescolar.SupervisorEscolar;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author nlopez
 *
 */

@Repository
public class SupervisorEscolarDaoImpl extends SpringHibernateDao<SupervisorEscolar> implements SupervisorEscolarDao{

	
	@Autowired
	public SupervisorEscolarDaoImpl( SessionFactory sessionFactory ){
		super( sessionFactory );
	}
	
	@Override
	protected Class<SupervisorEscolar> getObjetoManejado(){
		return SupervisorEscolar.class;
	}
}
