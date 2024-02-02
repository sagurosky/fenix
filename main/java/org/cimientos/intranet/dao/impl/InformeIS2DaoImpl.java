package org.cimientos.intranet.dao.impl;


import java.util.List;

import org.cimientos.intranet.dao.InformeIS2Dao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.InformeIS2;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InformeIS2DaoImpl extends SpringHibernateDao<InformeIS2> implements InformeIS2Dao{

	@Autowired
	public InformeIS2DaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}
	
	@Override
	protected Class<InformeIS2> getObjetoManejado() {
		return InformeIS2.class;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<InformeIS2> obtenerInformesConstruccion(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.CONSTRUCCION));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InformeIS2> obtenerInformesSupervision(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));		
		criteria.add(Restrictions.eq("estado", EstadoInforme.SUPERVISOR));
	
		return criteria.list();
		
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InformeIS2> obtenerInformesCorreccion(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.CORRECTORA));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InformeIS2> obtenerInformesFinalizados(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.FINALIZADO));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InformeIS2> obtenerInformesRevision(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.REVISION));
	
		return criteria.list();
	}

	@Override
	public InformeIS2 obtenerInformePorAlumno(Long idAlumno, CicloPrograma cicloActual) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("cicloActual", cicloActual));
		criteria.add(Restrictions.eq("becado.id", idAlumno));
		List<InformeIS2> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);		
		}
	}

	@Override
	public Object obtenerTodosInformesPorEA(Long idEA, CicloPrograma cicloActual) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", cicloActual));
		criteria.add(Restrictions.eq("eaPerfil.id", idEA));
		return criteria.list();
	}	
	
	@Override
	public Boolean verSiAlumnoTieneIS2(Long idAlumno) {
		String sql = "select * from informeis2 where becado = " +idAlumno;
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
	public InformeIS2 obtenerInformeIS2(Long idAlumno, CicloPrograma ciclo) {
		DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.add(Restrictions.eq("becado.id", idAlumno));
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		final List<InformeIS2> informesIs2 = getHibernateTemplate().findByCriteria(criteria);

		if (informesIs2 != null && !informesIs2.isEmpty()){
			return informesIs2.get(0);
		} else {
			return null;

		}
	}

}
