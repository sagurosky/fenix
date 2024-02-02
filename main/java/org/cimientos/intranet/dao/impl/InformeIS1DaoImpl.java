package org.cimientos.intranet.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.cimientos.intranet.dao.InformeIS1Dao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.informe.InformeIS1;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InformeIS1DaoImpl extends SpringHibernateDao<InformeIS1> implements InformeIS1Dao{

	@Autowired
	public InformeIS1DaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	protected Class<InformeIS1> getObjetoManejado() {
		return InformeIS1.class;
	}


	@Override
	public List<InformeIS1> obtenerInformesRevision(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.REVISION));
		return criteria.list();
	}

	@Override
	public List<InformeIS1> obtenerInformesCorreccion(CicloPrograma ciclo) {
		DetachedCriteria criteria = DetachedCriteria.forClass(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.CORRECTORA));
		return getHibernateTemplate().findByCriteria(criteria);
	}

	@Override
	public List<InformeIS1> obtenerInformesFinalizados(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));		
		criteria.add(Restrictions.eq("estado", EstadoInforme.FINALIZADO));
		return criteria.list();
	}
	
	@Override
	public  List<InformeIS1> obtenerInformesAEnviar(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		List<EstadoInforme> estadosEnviables = new ArrayList<EstadoInforme>();
		estadosEnviables.add(EstadoInforme.FINALIZADO);
		estadosEnviables.add(EstadoInforme.ENVIADO);
		estadosEnviables.add(EstadoInforme.NO_ENVIADO);
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));		
		criteria.add(Restrictions.in("estado",estadosEnviables));
		return criteria.list();
	}

	@Override
	public List<Informe> obtenerRevisionPorEA(CicloPrograma ciclo,PerfilEA perfilEA) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("estado", EstadoInforme.REVISION));
		criteria.add(Restrictions.eq("eaPerfil", perfilEA));
		return criteria.list();
	}

	@Override
	public List<InformeIS1> obtenerInformesSupervisor(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("estado", EstadoInforme.SUPERVISOR));
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		return criteria.list();
	}
	
	@Override
	public InformeIS1 obtenerInformePorAlumno(Long idAlumno,CicloPrograma cicloActual) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("cicloActual", cicloActual));
		criteria.add(Restrictions.eq("becado.id", idAlumno));
		List<InformeIS1> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);		
		}
		
	}

	@Override
	public List<Informe> obtenerSupervisorPorRR(CicloPrograma ciclo,PerfilRR perfilRR) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("estado", EstadoInforme.CONSTRUCCION));
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("rrPerfil", perfilRR));
		return criteria.list();
	}

	@Override
	public Boolean verSiAlumnoTieneIS1(Long idAlumno) {
		String sql = "select * from informeis1 where becado = " +idAlumno;
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

}
