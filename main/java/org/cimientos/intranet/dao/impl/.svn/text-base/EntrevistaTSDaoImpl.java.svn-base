package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.EntrevistaTSDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.entrevistaTS.EntrevistaTS;
import org.cimientos.intranet.modelo.perfilTS.PerfilTS;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EntrevistaTSDaoImpl extends SpringHibernateDao<EntrevistaTS> implements EntrevistaTSDao{

	@Autowired
	public EntrevistaTSDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	protected Class<EntrevistaTS> getObjetoManejado() {
		return EntrevistaTS.class;
	}

	public List<EntrevistaTS> obtenerPorTS(Long idTS){
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("perfilTS.idPerfilTS",idTS));
		List<EntrevistaTS> lista = (List<EntrevistaTS>) criteria.list();
		if(lista.isEmpty()){
			return null;
		}else{
			return lista;	
		}
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EntrevistaTSDao#obtenerEntrevistaTSPorAlumno(java.lang.Long)
	 */
	@Override
	public EntrevistaTS obtenerEntrevistaTSPorAlumno(Long idAlumno) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("perfilAlumno","perfilAlumno");
		criteria.add(Restrictions.eq("perfilAlumno.id", idAlumno));
		List<EntrevistaTS> list = criteria.list();
		if(list.isEmpty()){
			return new EntrevistaTS();
		}
		return list.get(0);
	}

	/* (non-Javadoc)
	 * @see org.cimientos.intranet.dao.EntrevistaTSDao#obtnerEntrevistaTSPorCiclo(java.lang.String)
	 */
	@Override
	public List<EntrevistaTS>  obtnerEntrevistaTSPorCiclo(String nombreCiclo,PerfilTS perfilTS) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("perfilTS", "perfilTS");
		criteria.add(Restrictions.eq("perfilTS", perfilTS));
		criteria.add(Restrictions.eq("nombreCiclo", nombreCiclo));
		List<EntrevistaTS> list  = criteria.list();
		return list;
	}
	
}
