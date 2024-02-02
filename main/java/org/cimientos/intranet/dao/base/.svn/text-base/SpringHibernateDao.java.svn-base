package org.cimientos.intranet.dao.base;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateSystemException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

@SuppressWarnings("unchecked")
@Repository
public abstract class SpringHibernateDao<T> extends HibernateDaoSupport
		implements Dao<T> {

	@Autowired
	public SpringHibernateDao(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public void eliminar(List<T> objetos) throws DataAccessException {
		for (T objeto : objetos) {
			eliminar(objeto);
		}

	}


	public void eliminar(T objeto) throws DataAccessException {
		getHibernateTemplate().delete(objeto);
	}

	protected abstract Class<T> getObjetoManejado();


	public void guardar(List<T> objetos) throws DataAccessException {
		getHibernateTemplate().saveOrUpdateAll(objetos);
	}

	
	public void guardar(T objeto)  {
		try {
			getHibernateTemplate().saveOrUpdate(objeto);			
		} catch (HibernateSystemException e) {
			//El objeto ya esta en memoria estonces lo tiene que mergear para que no genere conflictos
			getHibernateTemplate().merge(objeto);
		}
		
	}


	public T obtener(Serializable id) {
		final T entity = (T) getHibernateTemplate()
				.get(getObjetoManejado(), id);
		return entity;
	}


	protected List<T> obtenerPorConsulta(String hql) throws DataAccessException {
		final List<T> entities = getHibernateTemplate().find(hql);
		return entities;
	}


	public List<T> obtenerTodos() throws DataAccessException {
		return getHibernateTemplate().loadAll(getObjetoManejado());
	}

	
	
	@Override
	public List<T> obtenerGrupo(String idProperty,List<? extends Serializable> ids)
			throws DataAccessException {
		DetachedCriteria criteria =DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.in(idProperty, ids));
		return getHibernateTemplate().findByCriteria(criteria);
	}

	/**
	 *  Metodo usado para commitear los cambios dentro de un mismo request ya
	 *   que se mantiene abierta la session de hibernate hasta que se termina
	 *   de renderizar la vista.
	 */
	@Override
	public void flush() {
		getHibernateTemplate().flush();
	}

	@Override
	public void clear() {
		getHibernateTemplate().clear();
		
	}
	
	
}
