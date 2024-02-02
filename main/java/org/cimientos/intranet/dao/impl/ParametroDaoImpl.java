package org.cimientos.intranet.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.cimientos.intranet.dao.ParametroDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.Parametro;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;


/**
 * @author msagarduy
 * Clase que implementa los m�todos de la Interfaz ParametroDao.
 * Extiende de SpringHibernateDao
 * 
 */
public class ParametroDaoImpl extends SpringHibernateDao<Parametro> implements ParametroDao {

	private static final Logger logger = Logger.getLogger(ParametroDaoImpl.class);

	private Map<Integer, Map<Long, Parametro>> cache;

	/**
	 * @param sessionFactory
	 * Constructor de la clase ParametroDaoImpl
	 */
	@Autowired
	public ParametroDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		cache = new HashMap<Integer, Map<Long, Parametro>>();
	}
	
	
	/**
	 * Recupera la lista de parametros buscados
	 * @param Lista de parametros para la busqueda.
	 * @return Mapa de parametros
	 */
	private Map<Long, Parametro> crearMapa(List<Parametro> datos) {
		Map<Long, Parametro> resultado = new HashMap<Long, Parametro>();
		for (Parametro dato : datos) {
			resultado.put(dato.getId(), dato);
		}
		return resultado;
	}

	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#eliminar(java.lang.Object)
	 */
	@Override
	public void eliminar(Parametro objeto) throws DataAccessException {
		int tipo = objeto.getTipo();
		super.eliminar(objeto);
		cache.get(tipo).remove(objeto.getId());
	}

	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#eliminar(java.util.List)
	 */
	@Override
	public void eliminar(List<Parametro> objetos) throws DataAccessException {
		for (Parametro dato : objetos) {
			eliminar(dato);
		}
	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<Parametro> getObjetoManejado() {
		return Parametro.class;
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#guardar(java.lang.Object)
	 */
	@Override
	public void guardar(Parametro objeto) throws DataAccessException {
		int tipo = objeto.getTipo();
		super.guardar(objeto);
		cache.get(tipo).put(objeto.getId(), objeto);

	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#guardar(java.util.List)
	 */
	@Override
	public void guardar(List<Parametro> objetos) throws DataAccessException {
		for (Parametro dato : objetos) {
			guardar(dato);
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ParametroDao#obtenerParametroDelTipo(int)
	 */
	@Override
	public List<Parametro> obtenerParametroDelTipo(int tipo) {
		return new ArrayList<Parametro>(cache.get(tipo).values());
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#obtenerTodos()
	 */
	@Override
	public List<Parametro> obtenerTodos() throws DataAccessException {
		List<Parametro> resultado = new LinkedList<Parametro>();
		for (Map<Long, Parametro> coleccion : cache.values()) {
			resultado.addAll(coleccion.values());
		}
		return resultado;
	}

	@PostConstruct
	private void refrescarCache() {

		logger.debug("Creando Cache de datos");

		Session session = getSession();
		Criteria criteria = session.createCriteria(Parametro.class);
		criteria = session.createCriteria(Parametro.class);
		criteria.add(Restrictions.eq("tipo", Parametro.AREA));
		List<Parametro> areas = criteria.list();
		cache.put(Parametro.AREA, crearMapa(areas));
		logger.debug(areas.size());

		criteria = session.createCriteria(Parametro.class);
		criteria.add(Restrictions.eq("tipo", Parametro.PUESTO));
		List<Parametro> puestos = criteria.list();
		cache.put(Parametro.PUESTO, crearMapa(puestos));
		logger.debug(puestos.size());
	
		
		criteria = session.createCriteria(Parametro.class);
		criteria.add(Restrictions.eq("tipo", Parametro.MONTO_BECA));
		List<Parametro> montoBeca = criteria.list();
		cache.put(Parametro.MONTO_BECA, crearMapa(montoBeca));
		logger.debug(montoBeca.size());
		logger.info("Cache Completo" + cache);
		
		criteria = session.createCriteria(Parametro.class);
		criteria.add(Restrictions.eq("tipo", Parametro.ADICIONAL));
		List<Parametro> adicionales = criteria.list();
		cache.put(Parametro.ADICIONAL, crearMapa(adicionales));
		logger.debug(adicionales.size());
		logger.info("Cache Completo" + cache);
		
		criteria = session.createCriteria(Parametro.class);
		criteria.add(Restrictions.eq("tipo", Parametro.ADICIONAL_INGRESO));
		List<Parametro> adicionalesIngreso = criteria.list();
		cache.put(Parametro.ADICIONAL_INGRESO, crearMapa(adicionalesIngreso));
		logger.debug(adicionalesIngreso.size());
		logger.info("Cache Completo" + cache);
		
		criteria = session.createCriteria(Parametro.class);
		criteria.add(Restrictions.eq("tipo", Parametro.EXTRA));
		List<Parametro> extras = criteria.list();
		cache.put(Parametro.EXTRA, crearMapa(extras));
		logger.debug(extras.size());
		logger.info("Cache Completo" + cache);

		criteria = session.createCriteria(Parametro.class);
		criteria.add(Restrictions.eq("tipo", Parametro.MATERIA));
		List<Parametro> materias = criteria.list();
		cache.put(Parametro.MATERIA, crearMapa(materias));
		logger.debug(materias.size());
		logger.info("Cache Completo" + cache);
	}
	

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.DatoDao#buscarParametrosDelTipo(int, int, java.lang.String)
	 */
	@Override
	public List<Parametro> buscarParametroDelTipo(int tipo, int cantidadMax, String valor) {
		return null;
	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ParametroDao#obtenerId(java.lang.String)
	 */
	@Override
	public long obtenerId(String valor) {
		return 0;
	}


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ParametroDao#obtenerParametroPorIgualValor(java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Parametro obtenerParametroPorIgualValor(String valor) {
		Criteria criteria = getSession().createCriteria(Parametro.class);
		criteria.add(Restrictions.eq("valor", valor));
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


	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.ParametroDao#obtener(java.lang.Long)
	 */
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
