package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.EscuelaSeleccionDAO;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.escuela.EscuelaSeleccion;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * The Class EscuelaSeleccionDAOImpl.
 */
@Repository
public class EscuelaSeleccionDAOImpl extends SpringHibernateDao<EscuelaSeleccion> implements
		EscuelaSeleccionDAO {
	
	/**
	 * Instantiates a new escuela seleccion dao impl.
	 *
	 * @param sessionFactory the session factory
	 * @since 29-abr-2011
	 * @author cfigueroa
	 */
	@Autowired
	public EscuelaSeleccionDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}
	
	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.base.SpringHibernateDao#getObjetoManejado()
	 */
	@Override
	protected Class<EscuelaSeleccion> getObjetoManejado() {
		return EscuelaSeleccion.class;
	}
	
	@Override
	public List<EscuelaSeleccion> obtenerEscuelaPornombreYZona(String texto, int maxResults,
			ZonaCimientos zona) {
		
		Criteria criteria = getSession().createCriteria( getObjetoManejado());
		criteria.setMaxResults(maxResults);
		criteria.add(Restrictions.like("nombre", "%"+texto+"%"));
		criteria.add(Restrictions.eq("zonaCimientos", zona));
		criteria.addOrder(Order.asc("nombre"));
		return criteria.list();
		
	}
	


}
