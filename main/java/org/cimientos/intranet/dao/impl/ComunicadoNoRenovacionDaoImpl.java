package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.ComunicadoNoRenovacionDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.ComunicadoNoRenovacion;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComunicadoNoRenovacionDaoImpl  extends SpringHibernateDao<ComunicadoNoRenovacion> implements ComunicadoNoRenovacionDao
{

	@Autowired
	public ComunicadoNoRenovacionDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	protected Class<ComunicadoNoRenovacion> getObjetoManejado() {
		return ComunicadoNoRenovacion.class;
	}

	@Override
	public ComunicadoNoRenovacion obtenerComunicadoNoRenovacionPorAlumno(Long idPerfilAlumno, CicloPrograma cicloActual) 
	{
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("cicloActual", cicloActual));
		criteria.add(Restrictions.eq("becado.id", idPerfilAlumno));
		criteria.addOrder(Order.desc("fechaAlta"));
		List<ComunicadoNoRenovacion> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);		
		}
		
	}

}
