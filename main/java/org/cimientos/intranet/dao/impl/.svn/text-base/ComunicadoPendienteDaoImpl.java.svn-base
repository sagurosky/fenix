package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.ComunicadoPendienteDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.ComunicadoPendiente;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComunicadoPendienteDaoImpl extends SpringHibernateDao<ComunicadoPendiente> implements ComunicadoPendienteDao
{

	@Autowired
	public ComunicadoPendienteDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	protected Class<ComunicadoPendiente> getObjetoManejado() {
		return ComunicadoPendiente.class;
	}

	@Override
	public ComunicadoPendiente obtenerComunicadoPendientePorAlumno(Long idPerfilAlumno, CicloPrograma cicloActual) 
	{
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("cicloActual", cicloActual));
		criteria.add(Restrictions.eq("becado.id", idPerfilAlumno));
		criteria.addOrder(Order.desc("fechaAlta"));
		List<ComunicadoPendiente> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);		
		}
	}

}
