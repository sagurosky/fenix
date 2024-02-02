package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.PerfilRRDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.cimientos.intranet.modelo.persona.Persona;
import org.cimientos.intranet.modelo.ubicacion.ZonaCimientos;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * PerfilRRDaoImpl
 * @author Nicolas Lopez
 *
 */
@Repository
public class PerfilRRDaoImpl extends SpringHibernateDao<PerfilRR> implements PerfilRRDao{
	
	/**
	 * @param sessionFactory
	 */
	@Autowired
	public PerfilRRDaoImpl(SessionFactory sessionFactory){		
		super(sessionFactory);		
	}
	
	@Override
	protected Class<PerfilRR> getObjetoManejado() {
		return PerfilRR.class;
	}

	@Override
	public boolean existeRRPorPersona(Persona persona) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("datosPersonales", persona));
		return !criteria.list().isEmpty();
	}

	@Override
	public void initEas(PerfilRR perfilRR) {
		getHibernateTemplate().lock(perfilRR, LockMode.READ);
		perfilRR.getEas().size();
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilRRDao#obtenerEasConZona()
	 */
	@Override
	public List<PerfilRR> obtenerEasConZona() {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.isNotEmpty("zona"));
		criteria.add(Restrictions.eq("activo", true));
		return criteria.list();
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.PerfilRRDao#obtenerRRsPorNombreYZona(org.cimientos.intranet.modelo.ubicacion.ZonaCimientos, java.lang.String)
	 */
	@Override
	public List<PerfilRR> obtenerRRsPorNombreYZona(ZonaCimientos zona,
			String texto) {
		Long[] idzonas = new Long[]{zona.getId()};
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("datosPersonales", "persona");
		Disjunction disjunction = Restrictions.disjunction(); 
		disjunction.add(Restrictions.like("persona.apellido", "%"+texto+"%")); 
		disjunction.add(Restrictions.like("persona.nombre", "%"+texto+"%")); 
		criteria.add(disjunction);
		criteria.add(Restrictions.eq("activo", true));
		criteria.createCriteria("zona")
	        .add( Restrictions.in("id", idzonas) );
		List<PerfilRR> lista = criteria.list();
		if(lista.size()>0){
			return lista;
		}else{
			return null;
		}
	}

	@Override
	public List<PerfilRR> obtenerRRsPorNombre(String texto) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("datosPersonales", "persona");
		Disjunction disjunction = Restrictions.disjunction(); 
		disjunction.add(Restrictions.like("persona.apellido", "%"+texto+"%")); 
		disjunction.add(Restrictions.like("persona.nombre", "%"+texto+"%")); 
		criteria.add(disjunction);
		criteria.add(Restrictions.eq("activo", true));

		List<PerfilRR> lista = criteria.list();
		if(lista.size()>0){
			return lista;
		}else{
			return null;
		}
	}
}
