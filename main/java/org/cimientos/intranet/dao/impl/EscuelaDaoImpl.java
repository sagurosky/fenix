package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.EscuelaDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.escuela.Escuela;
import org.cimientos.intranet.modelo.escuela.EscuelaSeleccion;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cimientos.intranet.enumerativos.EstadoEscuela;
import com.googlecode.ehcache.annotations.Cacheable;

/**
 * The Class EscuelaDaoImpl.
 */
@Repository
public class EscuelaDaoImpl extends SpringHibernateDao<Escuela> implements EscuelaDao {

	/**
	 * Instantiates a new escuela dao impl.
	 *
	 * @param sessionFactory the session factory
	 * @since 17-nov-2010
	 * @author cfigueroa
	 */
	@Autowired
	public EscuelaDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.escuela.Escuela")
	protected Class<Escuela> getObjetoManejado() {
		return Escuela.class;
	}
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	public List<Escuela> obtenerEscuelasPorEstado(EstadoEscuela estadoEscuela) {
		 DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		 criteria.add(Restrictions.eq("estadoEscuela", estadoEscuela));
		return getHibernateTemplate().findByCriteria(criteria);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EscuelaDao#getPorNombreConAjax(java.lang.String, int)
	 */
	@Override
	public List<Escuela> getPorNombreConAjax(String texto, int cantidadMax) {
		String text ="";
		for ( String split : texto.split(" "))
				text= text + "%" +split;
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("localidad", "localidad");
		criteria.createAlias("zonaCimientos", "zonaCimientos");
		criteria.setMaxResults(cantidadMax);
		criteria.add(Restrictions.or(Restrictions.like("localidad.nombre", text+"%"),
					 Restrictions.or(Restrictions.like("nombre", text+"%"),
					 Restrictions.like("zonaCimientos.nombre", text+"%"))));
		criteria.addOrder(Order.asc("nombre"));
		criteria.add(Restrictions.eq("activo", true));
		return criteria.list();
	}

	@Override
	@Cacheable(cacheName = "org.cimientos.intranet.modelo.escuela.Escuela")
	public List<Escuela> obtenerEscuelasActivas() {
		return getSession().createCriteria(getObjetoManejado()).add(Restrictions.eq("activo", true)).list();
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EscuelaDao#getPorEAyNombre(java.lang.String, int, java.lang.Long)
	 */
	@Override
	public List<Escuela> getPorEAyNombre(String texto, int cantidadMax,
			PerfilEA ea) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("localidad", "localidad");
		criteria.add(Restrictions.in("localidad.zona", ea.getZona()));
		criteria.setMaxResults(cantidadMax);
		criteria.add(Restrictions.like("nombre", "%"+texto+"%"));
		criteria.addOrder(Order.asc("nombre"));
		return criteria.list();
	}

	@Override
	public void guardarEscuelaSeleccion(Escuela escuela) {
		Criteria criteria = getSession().createCriteria(EscuelaSeleccion.class);
		criteria.add(Restrictions.eq("id",escuela.getId()));
		List<EscuelaSeleccion> list = criteria.list();
		if(list.isEmpty()){
			EscuelaSeleccion escuelaSeleccion = new EscuelaSeleccion(escuela);
			this.getHibernateTemplate().save(escuelaSeleccion);
		}
	}
	@Override
	public void guardarEscuelaSeleccion(EscuelaSeleccion escuela) {
			this.getHibernateTemplate().save(escuela);
		
	}

	@Override
	public List<Escuela> obtenerEscuelasPorZona(ZonaCimientos zona) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("localidad", "localidad");
		criteria.add(Restrictions.eq("localidad.zona", zona));
		return criteria.list();
	}
}
