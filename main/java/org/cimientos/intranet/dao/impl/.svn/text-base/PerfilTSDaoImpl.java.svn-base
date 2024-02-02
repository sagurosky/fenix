package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.PerfilTSDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.cimientos.intranet.modelo.persona.Persona;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


/**
 * PerfilTsDaoImpl
 * @author Nicolas Lopez
 *
 */

@Repository
public class PerfilTSDaoImpl extends SpringHibernateDao<PerfilTS> implements PerfilTSDao {

	/**
	 * @param sessionFactory
	 */
	@Autowired
	public PerfilTSDaoImpl(SessionFactory sessionFactory){		
		super(sessionFactory);		
	}
	
	@Override
	protected Class<PerfilTS> getObjetoManejado() {
		return PerfilTS.class;
	}

	@Override
	public boolean existeTSPorPersona(Persona persona) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("datosPersonales", persona));
		return !criteria.list().isEmpty();
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#obtenerTodos()
	 */
	@Override
	public List<PerfilTS> obtenerTodos() throws DataAccessException {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("activo",true));
		List<PerfilTS> list = criteria.list();
		return list;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilTSDao#obtenerTSPorNombre(java.lang.String, int)
	 */
	@Override
	public List<PerfilTS> obtenerTSPorNombre(String texto, int maxResults) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("datosPersonales","persona");
		Disjunction disjunction = Restrictions.disjunction();
		disjunction.add(Restrictions.like("persona.nombre", "%"+texto+"%"));
		disjunction.add(Restrictions.like("persona.apellido", "%"+texto+"%"));
		criteria.add(disjunction);
		return criteria.list();
	}
}
