package org.cimientos.intranet.dao.impl;

import java.util.List;

import org.cimientos.intranet.dao.InformeCesacionDao;
import org.cimientos.intranet.dao.base.SpringHibernateDao;
import org.cimientos.intranet.modelo.CicloPrograma;
import org.cimientos.intranet.modelo.informe.EstadoInforme;
import org.cimientos.intranet.modelo.informe.Informe;
import org.cimientos.intranet.modelo.informe.InformeCesacion;
import org.cimientos.intranet.modelo.perfilEA.PerfilEA;
import org.cimientos.intranet.modelo.perfilRR.PerfilRR;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InformeCesacionDaoImpl extends SpringHibernateDao<InformeCesacion> implements InformeCesacionDao{

	@Autowired
	public InformeCesacionDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	protected Class<InformeCesacion> getObjetoManejado() {
		return InformeCesacion.class;
	}

	@Override
	public List<InformeCesacion> obtenerInformesConstruccion(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.CONSTRUCCION));
		return criteria.list();
	}

	@Override
	public List<InformeCesacion> obtenerInformesSupervision(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("estado", EstadoInforme.SUPERVISOR));
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		return criteria.list();
	}

	@Override
	public List<InformeCesacion> obtenerInformesCorreccion(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.CORRECTORA));
		return criteria.list();
	}

	@Override
	public List<InformeCesacion> obtenerInformesFinalizados(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.FINALIZADO));
		return criteria.list();
	}

	@Override
	public List<InformeCesacion> obtenerInformesRevision(CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.REVISION));
		return criteria.list();
	}

	@Override
	public InformeCesacion obtenerInformeCesacionPorAlumno(Long idPerfilAlumno,	CicloPrograma cicloActual) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.add(Restrictions.eq("cicloActual", cicloActual));
		criteria.add(Restrictions.eq("becado.id", idPerfilAlumno));
		List<InformeCesacion> result = criteria.list();
		if(result.isEmpty()){
			return null;
		}else{
			return result.get(0);		
		}
	}
	
	@Override
	public List<Informe> obtenerRevisionPorEA(PerfilEA perfilEA,CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.REVISION));
		criteria.add(Restrictions.eq("eaPerfil", perfilEA));
		return criteria.list();
	}

	@Override
	public List<Informe> obtenerSupervisionPorRR(PerfilRR perfilRR,CicloPrograma ciclo) {
		Criteria criteria = getSession().createCriteria(getObjetoManejado());
		criteria.createAlias("cicloActual", "cicloActual");
		criteria.add(Restrictions.eq("cicloActual", ciclo));
		criteria.add(Restrictions.eq("estado", EstadoInforme.CONSTRUCCION));
		criteria.add(Restrictions.eq("rrPerfil", perfilRR));
		return criteria.list();
	}

}
