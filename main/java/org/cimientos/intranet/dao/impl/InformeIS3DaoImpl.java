package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.InformeIS3Dao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.InformeIS3;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InformeIS3DaoImpl extends SpringHibernateDao<InformeIS3> implements InformeIS3Dao{

	@Autowired
	public InformeIS3DaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		
	}
	
	@Override
	protected Class<InformeIS3> getObjetoManejado() {
		return InformeIS3.class;
	}

	@Override
	public InformeIS3 obtenerInformePorAlumno(Long id, CicloPrograma cicloActual) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("cicloActual", cicloActual));
		criteria.add(Restrictions.eq("becado.id", id));
		List<InformeIS3> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);		
		}
	}

	@Override
	public Boolean verSiAlumnoTieneIS3(Long idAlumno) {
		String sql = "select * from informeis3 where becado = " +idAlumno;
		Query query = getSession().createSQLQuery(sql);
		if(!query.list().isEmpty())
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	@Override
	public InformeIS3 obtenerInformePorIdEntrevista(Long idEntrevista) 
	{
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("ei.id", idEntrevista));
		List<InformeIS3> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);		
		}
	}

}
