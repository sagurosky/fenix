package org.cimientos.intranet.dao.impl;

import org.cimientos.intranet.dao.NotaMateriaDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.NotaMateria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author msagarduy
 * @param 
 */
@Repository
public class NotaMateriaDaoImpl extends SpringHibernateDao<NotaMateria> implements NotaMateriaDao{

	/**
	 * @param sessionFactory
	 */
	@Autowired
	public NotaMateriaDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<NotaMateria> getObjetoManejado() {
		return NotaMateria.class;
	}

}
