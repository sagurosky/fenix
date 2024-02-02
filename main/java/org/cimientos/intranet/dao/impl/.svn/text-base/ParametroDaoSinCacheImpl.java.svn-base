package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.cimientos.intranet.dao.ParametroDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.Parametro;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


/**
 * @author msagarduy
 * Clase que implementa los metodos de la interfaz ParametroDao. 
 * Utilizada para generar consultas a la DB.
 * Extiende {@link SpringHibernateDao}
 * 
 */
@Repository
public class ParametroDaoSinCacheImpl extends SpringHibernateDao<Parametro> implements ParametroDao {

	private static final Logger logger = Logger
			.getLogger(ParametroDaoSinCacheImpl.class);

	/**
	 * @param sessionFactory Objeto para abrir una sesion a la DB.
	 * Constructor de la clase.
	 */
	@Autowired
	public ParametroDaoSinCacheImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		logger.info("Iniciando ParametroDao - SIN CACHE -");
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<Parametro> getObjetoManejado() {
		return Parametro.class;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ParametroDao#obtenerParametroDelTipo(int)
	 */
	@Override
	public List<Parametro> obtenerParametroDelTipo(int tipo) {
		Criteria criteria = getSession().createCriteria(Parametro.class);
		criteria.add(Restrictions.eq("activo", true));
		List<Parametro> datos = (List<Parametro>) criteria.add(
				Restrictions.eq("tipo", tipo)).list();
		return datos;
	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#guardar(java.lang.Object)
	 */
	@Override
	public void guardar(Parametro objeto) throws DataAccessException {
		super.guardar(objeto);	
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ParametroDao#buscarParametroDelTipo(int, int, java.lang.String)
	 */
	@Override
	public List<Parametro> buscarParametroDelTipo(int tipo, int cantidadMax , String valor) {
		Criteria criteria = getSession().createCriteria(Parametro.class);
		if(cantidadMax > 0){
			criteria.setMaxResults(cantidadMax);
		}
		criteria.add(Restrictions.like("valor", "%"+valor+"%"));
		criteria.add(Restrictions.eq("activo", true));
		List<Parametro> datos = (List<Parametro>) criteria.add(
				Restrictions.eq("tipo", tipo)).list();
		return datos;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ParametroDao#obtenerId(java.lang.String)
	 */
	@Override
	public long obtenerId(String valor) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Parametro.class);
		criteria.add(Restrictions.eq("valor", valor));
		return ((Parametro) getHibernateTemplate().findByCriteria(criteria).get(0)).getId();
	}
	
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ParametroDao#buscarUnPerfil(java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	public Parametro buscarUnPerfil(String valor) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("valor", valor));
		List<Parametro> parametros = criteria.list();
		
		if (parametros != null && parametros.size() > 0){
			return parametros.get(0);
		} else {
			return null;
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ParametroDao#obtenerParametroPorIgualValor(java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Parametro obtenerParametroPorIgualValor(String valor) {
		Criteria criteria = getSession().createCriteria(Parametro.class);
		criteria.add(Restrictions.eq("valor", valor)).
		add(Restrictions.eq("activo", true));
		List<Parametro> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return (Parametro) result.get(0);	
		}
	}
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ParametroDao#obtenerParametroSiExiste(java.lang.String, java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Parametro obtenerParametroSiExiste(String valor, String id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(Parametro.class);
		criteria.add(Restrictions.eq("valor", valor));
		if(StringUtils.isNotEmpty(id)&& StringUtils.isNumeric(id)){
			criteria.add(Restrictions.ne("id", Long.valueOf(id)));
		}

		final List<Parametro> parametros = getHibernateTemplate().findByCriteria(criteria);

		if (parametros != null && !parametros.isEmpty()){
			return parametros.get(0);
		} else {
			return null;

		}
		

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Parametro obtener(Long id) {
		final DetachedCriteria criteria = DetachedCriteria.forClass(Parametro.class);
		criteria.add(Restrictions.eq("id", Long.valueOf(id)));

		final List<Parametro> parametros = getHibernateTemplate().findByCriteria(criteria);

		if (parametros != null && !parametros.isEmpty()){
			return parametros.get(0);
		} else {
			return null;

		}
		

	}


}
