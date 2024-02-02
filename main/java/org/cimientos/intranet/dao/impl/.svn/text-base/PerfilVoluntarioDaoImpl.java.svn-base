package org.cimientos.intranet.dao.impl;

import org.cimientos.intranet.dao.PerfilVoluntarioDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.perfilvoluntario.PerfilVoluntario;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * The Class PerfilVoluntarioDaoImpl.
 * @author cfigueroa
 */
@Repository
public class PerfilVoluntarioDaoImpl extends SpringHibernateDao<PerfilVoluntario> implements PerfilVoluntarioDao{

	/**
	 * Instantiates a new voluntario dao impl.
	 *
	 * @param sessionFactory the session factory
	 * @since 20-oct-2010
	 * @author cfigueroa
	 */
	@Autowired
	public PerfilVoluntarioDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<PerfilVoluntario> getObjetoManejado() {
		return PerfilVoluntario.class;
	}

	

}
